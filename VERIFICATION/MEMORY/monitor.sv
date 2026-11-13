class monitor;
  transaction trans;
  mailbox mon2scr;
  virtual ifc vif;
  
  function new(virtual ifc vif, mailbox mon2scr);
    this.vif = vif;
    this.mon2scr = mon2scr;
  endfunction
  
  task run();
    @(negedge vif.clk);
    repeat(20) begin
      @(posedge vif.clk);
      trans = new();
      trans.reset = vif.reset;
      trans.wr = vif.wr;
      trans.rd = vif.rd;
      trans.data_in = vif.data_in;
      trans.addr = vif.addr;
      #1;
      trans.data_out = vif.data_out;
      mon2scr.put(trans);
      trans.display();
    end
  endtask
  
endclass
