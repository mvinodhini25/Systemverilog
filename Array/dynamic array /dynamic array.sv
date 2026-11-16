// Code your testbench here
// or browse Examples
module array_;
  int array[];
  initial begin
    array = new[5];
    
    foreach(array[i]) begin
      array[i] = (i+1)*10;
      $display("array[%0d] = %0d",i,array[i]);
    end
    $display("array = %0p",array);
  end
endmodule
