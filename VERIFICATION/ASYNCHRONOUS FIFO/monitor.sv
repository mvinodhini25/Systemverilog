class monitor #(
    parameter DATA_WIDTH = 8,
    parameter DEPTH = 4
);

    transaction #(DATA_WIDTH, DEPTH) wr_trans;
    transaction #(DATA_WIDTH, DEPTH) rd_trans;

    virtual ifc #(DATA_WIDTH, DEPTH) vif;

    mailbox #(transaction #(DATA_WIDTH, DEPTH)) mon2scr;
    mailbox #(transaction #(DATA_WIDTH, DEPTH)) wr_mbx;
    mailbox #(transaction #(DATA_WIDTH, DEPTH)) rd_mbx;

    int wr_count = 0;
    int rd_count = 0;

    function new(
        virtual ifc #(DATA_WIDTH, DEPTH) vif,
        mailbox #(transaction #(DATA_WIDTH, DEPTH)) mon2scr
    );
        this.vif = vif;
        this.mon2scr = mon2scr;

        wr_mbx = new();
        rd_mbx = new();
    endfunction

task write_monitor();
    while (wr_count < 4) begin
        @(posedge vif.wr_clk);
        if (!vif.wr_rst && vif.wr_en) begin
            wr_trans = new();

            wr_trans.wr_en   = 1'b1;
            wr_trans.rd_en   = 1'b0;
            wr_trans.data_in = vif.data_in;
            #1;
            wr_trans.full  = vif.full;
            wr_trans.empty = vif.empty;

            wr_mbx.put(wr_trans);
            wr_count++;

            $display("MONITOR: WRITE captured = %0d, DATA = %0d",
                     wr_count, wr_trans.data_in);
        end
    end
endtask


    task read_monitor();
       while (rd_count < 4) begin
            @(posedge vif.rd_clk);
            if (!vif.rd_rst && vif.rd_en) begin
                rd_trans = new();

                rd_trans.wr_en = 1'b0;
                rd_trans.rd_en = 1'b1;

                #1;
                rd_trans.data_out = vif.data_out;
                rd_trans.full     = vif.full;
                rd_trans.empty    = vif.empty;

                rd_mbx.put(rd_trans);

                rd_count++;

                $display("MONITOR: READ captured = %0d, DATA = %0d",
                         rd_count, rd_trans.data_out);
            end
        end
    endtask


    task distribution();
        fork
            begin
                repeat(4) begin
                    wr_mbx.get(wr_trans);
                    mon2scr.put(wr_trans);
                end
            end

            begin
                repeat(4) begin
                    rd_mbx.get(rd_trans);
                    mon2scr.put(rd_trans);
                end
            end
        join

    endtask


    task run();

        fork
            distribution();
            write_monitor();
            read_monitor();
        join

        $display("Monitor completed");
        $display("Write count = %0d", wr_count);
        $display("Read count  = %0d", rd_count);

    endtask

endclass
