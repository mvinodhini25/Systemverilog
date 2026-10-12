
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

  fulladder f1 (
    .a     (vif.a),
    .b     (vif.b),
    .cin   (vif.cin),
    .sum   (vif.sum),
    .carry (vif.carry)
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
