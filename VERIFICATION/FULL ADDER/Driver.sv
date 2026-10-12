class driver;
  transaction trans;
  mailbox gen2driv;
  virtual ifc vif;
  
  function new(mailbox gen2driv, virtual ifc vif);
    this.gen2driv = gen2driv;
    this.vif = vif;
  endfunction
  
  task run();
    repeat(8) begin
      gen2driv.get(trans);
      @(negedge vif.clk);
      vif.a = trans.a;
      vif.b = trans.b;
      vif.cin = trans.cin;
    end
  endtask
  
endclass
