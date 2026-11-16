module array_;
  int data[int];
  int i;
  
  initial begin
    data[0] = 100;
    data[1] = 200;
    data[2] = 300;
    
    foreach(data[i]) begin
      $display("data[%0d] = %0d",i,data[i]);
    end
    $display("data = %0p",data);
  end
endmodule
