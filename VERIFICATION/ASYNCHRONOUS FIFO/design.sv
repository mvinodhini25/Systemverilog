module fifo #(
    parameter DATA_WIDTH = 8,
    parameter DEPTH = 4,
    parameter ADDR_WIDTH = $clog2(DEPTH)
)(
//WRITE
  input logic wr_clk,
  input logic wr_rst,
  input logic wr_en,
  input logic [DATA_WIDTH-1:0]data_in,
  output logic full,
//READ
  input logic rd_clk,
  input logic rd_rst,
  input logic rd_en,
  output reg empty,
  output reg[DATA_WIDTH-1:0] data_out
);

  reg [DATA_WIDTH-1:0]mem[DEPTH-1:0];
  
  localparam PTR_WIDTH = ADDR_WIDTH + 1;
  
//WRITE
  reg [PTR_WIDTH-1:0]wr_ptr,wr_gray, wr_ff1,wr_ff2;
  wire[PTR_WIDTH-1:0] wr_ptr_nxt, wr_gray_nxt;


//READ
reg [PTR_WIDTH-1:0]rd_ptr, rd_gray, rd_ff1, rd_ff2;
wire [PTR_WIDTH-1:0]rd_ptr_nxt, rd_gray_nxt;

//WRITE
  assign wr_ptr_nxt = wr_ptr + ((wr_en && !full)?1'b1:1'b0);
assign wr_gray_nxt = wr_ptr_nxt ^ (wr_ptr_nxt>>1);

always@(posedge wr_clk or posedge wr_rst) begin
if(wr_rst) begin
rd_ff1 <= '0;
rd_ff2 <= '0;
end
else begin
rd_ff1 <= rd_gray;
rd_ff2 <= rd_ff1;
end
end
always@(posedge wr_clk or posedge wr_rst) begin
if(wr_rst) begin
wr_ptr <= '0;
wr_gray <= '0;
end
else begin
if(wr_en && !full)begin
  mem[wr_ptr[ADDR_WIDTH-1:0]] <= data_in;
end
wr_ptr <= wr_ptr_nxt;
wr_gray <= wr_gray_nxt;
end
end

//READ
  assign rd_ptr_nxt = rd_ptr + ((rd_en && !empty)?1'b1:1'b0);
assign rd_gray_nxt = rd_ptr_nxt ^ (rd_ptr_nxt>>1);

always@(posedge rd_clk or posedge rd_rst) begin
if(rd_rst) begin
wr_ff1 <= '0;
wr_ff2 <= '0;
end
else begin
wr_ff1 <= wr_gray;
wr_ff2 <= wr_ff1;
end
end

always@(posedge rd_clk or posedge rd_rst) begin
if(rd_rst) begin
rd_ptr <= '0;
rd_gray <= '0;
data_out <= 8'd0;
end
else begin
if(rd_en && !empty)begin
  data_out <= mem[rd_ptr[ADDR_WIDTH-1:0]];
end
rd_ptr <= rd_ptr_nxt;
rd_gray <= rd_gray_nxt;
end
end

wire full_next;
wire empty_next;

assign full_next =
    (wr_gray_nxt == {~rd_ff2[PTR_WIDTH-1:PTR_WIDTH-2],rd_ff2[PTR_WIDTH-3:0]});

assign empty_next =
    (rd_gray_nxt == wr_ff2);

always @(posedge wr_clk or posedge wr_rst) begin
    if (wr_rst)
        full <= 1'b0;
    else
        full <= full_next;
end

always @(posedge rd_clk or posedge rd_rst) begin
    if (rd_rst)
        empty <= 1'b1;
    else
        empty <= empty_next;
end

endmodule                                  
