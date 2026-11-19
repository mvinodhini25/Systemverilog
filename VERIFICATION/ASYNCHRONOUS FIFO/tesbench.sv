`include "interface"
`include "transaction"
`include "generator"
`include "driver"
`include "monitor"
`include "agent"
`include "scoreboard"
`include "environment"

module tb;

    parameter DATA_WIDTH = 8;
    parameter DEPTH = 4;
    parameter ADDR_WIDTH = $clog2(DEPTH);

  ifc #(DATA_WIDTH, DEPTH, ADDR_WIDTH) vif();
  
  environment env;

    fifo #(
        .DATA_WIDTH(DATA_WIDTH),
        .DEPTH(DEPTH),
        .ADDR_WIDTH(ADDR_WIDTH)
    ) dut (
    // Write side
    .wr_clk  (vif.wr_clk),
    .wr_rst  (vif.wr_rst),
    .wr_en   (vif.wr_en),
    .data_in (vif.data_in),
    .full    (vif.full),

    // Read side
    .rd_clk  (vif.rd_clk),
    .rd_rst  (vif.rd_rst),
    .rd_en   (vif.rd_en),
    .empty   (vif.empty),
    .data_out(vif.data_out)
);

  initial vif.wr_clk = 0;
  always #5 vif.wr_clk = ~vif.wr_clk;
  initial vif.rd_clk = 0;
  always #7 vif.rd_clk = ~vif.rd_clk;

  initial begin
    env = new(vif);
    env.run();

    $display("All transactions completed");
    $finish;
  end

  
endmodule
