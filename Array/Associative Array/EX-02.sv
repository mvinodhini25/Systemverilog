module array_;
  int data[int];
  initial begin
    data = '{0:100,1:200,5:300};
    $display("%0p",data);
  end
endmodule
