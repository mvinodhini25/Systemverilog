module tb;
  int array[9] = '{4, 7, 2, 5, 7, 1, 6, 3, 1};
  int res[$];
  
  initial begin
   res = array.find_last with (item <= 7 & item > 3);
    $display ("find_last       : %p", res);
    res = array.find with (item == 7 );
    $display ("find_last       : %p", res);
    res = array.find_first with (item <= 2);
    $display ("find_last       : %p", res);
  end
endmodule
