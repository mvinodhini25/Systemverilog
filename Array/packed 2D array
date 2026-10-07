Declare:

logic [3:0][7:0] data;

Write a program to:

Assign different 8-bit values to each 4-bit element.
Display data[0], data[1], data[2], and data[3].
Display data[2][5].
Display data[1][7:4].
-------------------------------------------------------
// Code your testbench here
// or browse Examples
module array_;
  logic [3:0][7:0] data;
  initial begin 
    data[0] = 8'b10100111;
    data[1] = 8'b00011011;
    data[2] = 8'b01011010;
    data[3] = 8'b11001010;
    $display("data[0] = %0b", data[0]);
    $display("data[1] = %0b", data[1]);
    $display("data[2] = %0b", data[2]);
    $display("data[3] = %0b", data[3]);
    $display("data[2][5] = %0d",data[2][5]);
    $display("data[1][7:4] = %0d",data[1][7:4]);
  end
endmodule
