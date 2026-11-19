class driver;

  mailbox #(transaction) gen2drv;
  mailbox #(transaction) wr_mbx;
  mailbox #(transaction) rd_mbx;

  virtual ifc vif;

  function new(mailbox #(transaction) gen2drv,
               virtual ifc vif);

    this.gen2drv = gen2drv;
    this.vif = vif;

    wr_mbx = new();
    rd_mbx = new();

  endfunction

  task write();
    transaction trans;
    repeat(4) begin
      wr_mbx.get(trans);
      
      @(negedge vif.wr_clk);
      if(!vif.wr_rst) begin
        vif.wr_en = 1'b1;
        vif.data_in = trans.data_in;

        @(negedge vif.wr_clk);
        vif.wr_en = 1'b0;
      end
    end
  endtask


  task read();
    transaction trans;
    repeat(4) begin
      rd_mbx.get(trans);

      @(negedge vif.rd_clk);
      if(!vif.rd_rst) begin
        vif.rd_en = 1'b1;

        @(negedge vif.rd_clk);
        vif.rd_en = 1'b0;
      end
    end
  endtask


  task distribution();
    transaction trans;
    repeat(8) begin
      gen2drv.get(trans);

      if(trans.wr_en)
        wr_mbx.put(trans);

      if(trans.rd_en)
        rd_mbx.put(trans);
    end
  endtask

  task reset();

    vif.wr_rst = 1'b1;
    vif.rd_rst = 1'b1;

    vif.wr_en = 1'b0;
    vif.rd_en = 1'b0;

    repeat(2) @(negedge vif.wr_clk);
    repeat(2) @(negedge vif.rd_clk);

    vif.wr_rst = 1'b0;
    vif.rd_rst = 1'b0;

    repeat(2) @(negedge vif.wr_clk);
    repeat(2) @(negedge vif.rd_clk);

endtask
  
task run();
        reset();
        distribution();
        write();
        read();

endtask

endclass
