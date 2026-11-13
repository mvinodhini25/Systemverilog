class transaction;
  rand bit reset;
  rand bit wr;
  rand bit rd;
  rand bit [7:0] data_in;
  rand bit [2:0] addr;
  bit [7:0]data_out;
  
  constraint operation {
    !(wr && rd);
}
  
  function void display();
    $display("reset = %0b, wr = %0d, rd = %0d, data_in = %0d, addr = %0d, data_out = %0d",reset, wr, rd,  data_in, addr, data_out);
  endfunction
  
endclass
