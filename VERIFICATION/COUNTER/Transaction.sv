class transaction;
  rand bit reset;
  bit [2:0]count;
  
  function void display();
    $display("reset = %0b, count = %0d",reset, count);
  endfunction
  
endclass
