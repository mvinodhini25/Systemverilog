
class scoreboard;

    transaction trans;
    mailbox mon2scr;

    bit [7:0] ex_data_out;
    logic [7:0] mem [0:7];

    integer i;

    function new(mailbox mon2scr);
        this.mon2scr = mon2scr;
    endfunction

    task run();

      repeat (20) begin

            mon2scr.get(trans);

            if (trans.reset) begin

                for (i = 0; i < 8; i = i + 1)
                    mem[i] = 0;

                ex_data_out = 0;

            end

            else begin

                if (trans.wr && !trans.rd) begin
                    mem[trans.addr] = trans.data_in;
                end

                else if (trans.rd && !trans.wr) begin
                    ex_data_out = mem[trans.addr];
                end

            end

            $display("ex_data_out = %0d", ex_data_out);

            if (ex_data_out == trans.data_out)
                $display("Verification is passed");
            else
                $display("Verification is failed");

        end

    endtask

endclass
