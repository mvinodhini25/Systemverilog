class generator;
  transaction trans;
  mailbox gen2drv;
  
  function new(mailbox gen2drv);
    this.gen2drv = gen2drv;
  endfunction
  
  task run();
    repeat(20) begin
      trans = new();
      
      if(!trans.randomize())
        $fatal("Randomization is failed");
      
      $display("trans.reset = %0b, trans.wr = %0b, trans.rd = %0b, trans.data_in = %0d, trans.addr = %0d",trans.reset, trans.wr, trans.rd, trans.data_in, trans.addr);
      $display("Randomization is passed");
      gen2drv.put(trans);
    end
  endtask
  
endclass
