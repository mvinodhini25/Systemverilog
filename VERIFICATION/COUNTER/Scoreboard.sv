class scoreboard;
  transaction trans;
  mailbox mon2scr;
  bit [2:0]ex_count;
  
  function new(mailbox mon2scr);
    this.mon2scr = mon2scr;
  endfunction
  
  task run();
    repeat(8) begin
      mon2scr.get(trans);
      
      if(trans.reset)
        ex_count = 0;
      else 
        ex_count = ex_count + 1;
      
      $display("count = %0d",ex_count);
      if(ex_count == trans.count)
        
        $display("Verification is passed");
      else
        $display("Verification is failed");
      
    end
  endtask
  
endclass
