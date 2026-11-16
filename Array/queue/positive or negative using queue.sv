module array_;
  int a[$];
  int positive[$];
  int negative[$];
  int i;
  initial begin
    a = '{10, -5, 20, -15, 30, -8, 40};
    $display("a is %0p",a);
    foreach(a[i]) begin
    if(a[i]>=0)
      positive.push_back(a[i]);
    else
      negative.push_back(a[i]);
    end
    $display("positive number is %0p",positive);
    $display("negative number is %0p",negative);
  end
endmodule
