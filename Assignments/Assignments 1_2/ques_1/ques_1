Sort the contents of a dynamic array which contains 10 elements
in it. (Do it with & without array methods)
----------------------------------------------------------------
ANSWER :

module dynamic;
  int a[];
  int b[];
  int temp;
  
  initial begin 
    a = new[10];
    a = '{70, 20, 90, 10, 50, 100, 30, 80, 40, 60};
    b = a;
    
    a.sort();
    $display("After sorting = %0p",a);
    $display("After sorting = %0p",b);
    
    for(int i = 0;i<$size(a);i++) begin
      for(int j = 0;j<$size(a)-1-i;j++) begin
        if(b[j]>b[j+1]) begin
          temp = b[j];
          b[j] = b[j+1];
          b[j+1] = temp;
        end
      end
    end
     $display("w/o sorting method %0p",b);
  end 
endmodule
