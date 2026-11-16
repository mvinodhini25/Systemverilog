module array_;
  logic [7:0] data[];
  bit [7:0]a;
  initial begin
    data = new[8];
    data = '{1,2,3,12,5,6,0,8};
   
    a = 0;
    foreach(data[i])begin
      if(data[i]>a)
        a = data[i];
    end
    $display("largest number is %0d",a);
  end
endmodule
