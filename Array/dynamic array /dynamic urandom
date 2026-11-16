module array_;
  int unsigned array[];
  initial begin
    array = new[5];
    
    foreach(array[i]) begin
      array[i] = $urandom;
      $display("array[%0d] = %0d",i,array[i]);
    end
    $display("array = %0p",array);
  end
endmodule
