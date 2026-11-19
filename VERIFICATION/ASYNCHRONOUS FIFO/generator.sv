
class generator;

    transaction trans;
    mailbox #(transaction) gen2drv;

    function new(mailbox #(transaction) gen2drv);
        this.gen2drv = gen2drv;
    endfunction

    task run();
        for (int i = 0; i < 8; i++) begin
            trans = new();
            if (!trans.randomize())
                $fatal(1, "Randomization failed");

            if (i < 4) begin
                trans.wr_en = 1'b1;
                trans.rd_en = 1'b0;
            end
            else begin
                trans.wr_en = 1'b0;
                trans.rd_en = 1'b1;
            end
            $display("\nGENERATOR: Transaction %0d", i+1);
            trans.display();

            gen2drv.put(trans);

        end
    endtask

endclass
