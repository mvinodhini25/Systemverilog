Write the SystemVerilog code to:

a) Declare a 2-state array, my_array, that holds four 12-bit values
b) initialize my_array so that:
i. my_array[0] = 12’h012
ii. my_array[1] = 12’h345,
iii. my_array[2] = 12’h678,
iv. my_array[3] = 12’h9AB;
c) Traverse my_array and print out bits [5:4] of each 12-bit element

I. Using a for loop
II. Using a foreach loop

ANSWER :
// Code your design here
module array_;
  bit [11:0]my_array[4];
  int i;
  initial begin
    my_array[0] = 12'h012;
    my_array[1] = 12'h345;
    my_array[2] = 12'h678;
    my_array[3] = 12'h9AB;
    
    $display("using FOR loop");
    for(i=0;i<4;i++) begin
      $display("my_array[%0d][5:4] = %0b",i,my_array[i][5:4]);
    end
    
    $display("using FOREACH loop");
    foreach(my_array[i]) begin
    	$display("my_array[%0d][5:4] = %0b",i,my_array[i][5:4]);  
    end
  end
endmodule
