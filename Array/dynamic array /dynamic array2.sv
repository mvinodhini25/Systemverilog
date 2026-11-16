module array_;
  int a[];
  int b[];
  initial begin
    a = '{10,20,30,40};
    $display("a is %0p",a);
    b = a;
    $display("b is %0p",b);
    b.reverse();
    $display("b is %0p",b);
  end
endmodule
