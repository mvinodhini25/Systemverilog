module array_;
  int a[];
  initial begin
    a = new[7];
    $display("size of array is %0d",a.size());
  end
endmodule
