class generator;
  transaction trans;
  mailbox gen2drv;
  
  function new(mailbox gen2drv);
    this.gen2drv = gen2drv;
  endfunction
  
  task run();
    repeat(4) begin
      trans = new();
      
      if(!trans.gen2drv)
        $fatal("Randomization is failed");
      
      $display("reset = %0b, d = %0d",reset, d);
      $display("RAndomization is passed");
      gen2drv.put(trans);
    end
  endtask
  
endclass
