module COUNTER(
  input logic clk,
  input logic reset,
  output logic [2:0]count
);
  
  always_ff@(posedge clk) begin
    if(reset)
      count <= 0;
    else
      count <= count + 1;
  end
  
endmodule
