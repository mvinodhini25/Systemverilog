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
    repeat(8) begin
      @(posedge vif.clk);
      #1;
      trans = new();
      trans.a = vif.a;
      trans.b = vif.b;
      trans.cin = vif.cin;
      trans.sum = vif.sum;
      trans.carry = vif.carry;
      trans.display();
      mon2scr.put(trans);
    end
  endtask
endclass
