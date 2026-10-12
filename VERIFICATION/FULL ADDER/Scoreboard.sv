class scoreboard;
  transaction trans;
  mailbox mon2scr;
  bit ex_sum;
  bit ex_carry;
  
  function new(mailbox mon2scr);
    this.mon2scr = mon2scr;
  endfunction
  
  task run();
    repeat(8) begin
      mon2scr.get(trans);
      ex_sum = trans.a^trans.b^trans.cin;
      ex_carry = (trans.a&trans.b)|((trans.a^trans.b)&trans.cin);
      
      if(ex_sum == trans.sum && ex_carry == trans.carry)
        $display("verification is passed");
      else
        $display("verification is failed");
    end
  endtask
  
endclass
