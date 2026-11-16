Declare:

int data [6];

Initialize the array with six values and use a foreach loop to display:
------------------------------------------------------------------------
// Code your testbench here
// or browse Examples
module array_;
  int data[6];
  initial begin
    foreach(data[i])begin
      data[i] = i+2;
      $display("data[%0d] = %0d",i,data[i]);
    end
  end
endmodule
