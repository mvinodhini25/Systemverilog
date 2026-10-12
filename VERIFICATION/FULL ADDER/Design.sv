module fulladder(
  input logic a,
  input logic b,
  input logic cin,
  output logic sum,
  output logic carry
);
  
  assign sum = a^b^cin;
  assign carry = (a&b)|((a^b)&cin);
  
endmodule
