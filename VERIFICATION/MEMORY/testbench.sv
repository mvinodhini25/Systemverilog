`include "interface"
`include "transaction"
`include "generator"
`include "driver"
`include "monitor"
`include "agent"
`include "scoreboard"
`include "environment"

module tb;
  environment env;
  ifc vif();

 memory d1(
    .clk(vif.clk),
    .reset(vif.reset),
    .wr(vif.wr),
   .rd(vif.rd),
   .data_in(vif.data_in),
   .addr(vif.addr),
   .data_out(vif.data_out)
  );

  initial vif.clk = 0;
  always #5 vif.clk = ~vif.clk;

  initial begin
    env = new(vif);
    env.run();

    $display("All transactions completed");
    $finish;
  end
  
endmodule
