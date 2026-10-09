Write a program for:

logic [7:0] mem [2][3];

Use nested foreach loops to:

Assign $random values.
Display every element in hexadecimal.
Display the row and column index.
Find and display the largest value.
------------------------------------------
// Code your testbench here
// or browse Examples
module array_;
  logic [7:0] mem[2][4];
  int i,j;
  logic [7:0]a;
  initial begin
    foreach(mem[i])begin
    	foreach(mem[i][j]) begin
          mem[i][j] = $random;
          $display("mem[%0d][%0d] = %0h",i,j,mem[i][j]);
    	end
    end
   
    foreach(mem[i,j])begin
      $write("%0h ",mem[i][j]);
      if(j==3)
        $display("");
    end
    
    a = mem[0][0];
    foreach(mem[i])
     foreach (mem[i,j]) begin
      if (mem[i][j] > a)
        a = mem[i][j];
    end

    $display("largest value = %0h", a);

  end
endmodule
