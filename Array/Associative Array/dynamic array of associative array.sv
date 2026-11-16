module array_;
  int fruits[][string];
  int i, fruit;
  initial begin
    fruits = new[2];
    
    fruits[0] = '{"apple":1, "grape":2};
    fruits[1] = '{"melon":3, "cherry":4};
    
    foreach(fruits[i]) begin
      foreach(fruits[i][fruit]) begin
        $display("fruits[%0d][%0s] = %0d",i,fruit,fruits[i][fruit]);
      end
      end
  end      
endmodule
