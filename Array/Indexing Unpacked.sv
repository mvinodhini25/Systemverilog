Given:

logic [7:0] data [4];

Assign:

data[0] = 8'h11
data[1] = 8'h22
data[2] = 8'h33
data[3] = 8'h44

Display all four elements.

Concept: packed element + unpacked array.
--------------------------------------------
// Code your testbench here
// or browse Examples
module array_;
  logic [7:0] data[4];
  initial begin
    data[0] = 8'h11;
    data[1] = 8'h22;
    data[2] = 8'h33;
    data[3] = 8'h44;
    $display("data = %0p",data);
  end
endmodule
