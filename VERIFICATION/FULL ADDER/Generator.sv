class generator;
  transaction trans;
  mailbox gen2driv;
  
  function new(mailbox gen2driv);
    this.gen2driv = gen2driv;
  endfunction
  
  task run();
    repeat(8) begin
      trans = new();
      
      if(!trans.randomize())
        $fatal(1,"randomization is failed");
      
      $display("randomization is passed");
      $display("Randomized inputs: a=%0b, b=%0b, cin=%0b",
         trans.a, trans.b, trans.cin);
      gen2driv.put(trans);
      
    end
  endtask
endclass
