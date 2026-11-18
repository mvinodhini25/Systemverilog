module r;
int aa[string];
initial begin
  aa["one"] = 1;
  aa["two"] = 2;
  aa["one"] = 11;
  $display("%0d %0d", aa.num(), aa["one"]);
end
endmodule
-----------------------------------------------
// OUTPUT : 2 11
