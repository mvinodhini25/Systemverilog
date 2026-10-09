Declare:

int matrix [2][3];

Store:

1 2 3
4 5 6

Display the matrix using nested for loops.
------------------------------------------
// Code your testbench here
// or browse Examples
------------------------------------------
//using for loop
------------------------------------------
module array_;
  int matrix[2][3];
  int i,j;
  initial begin
    matrix[0][0] = 1;
    matrix[0][1] = 2;
    matrix[0][2] = 3;

    matrix[1][0] = 4;
    matrix[1][1] = 5;
    matrix[1][2] = 6;
    for(i=0;i<2;i++)begin
      for(j=0;j<3;j++) begin
        $write(" %0d",matrix[i][j]);
      end
      $display(" ");
    end
  end
endmodule
----------------------------------------------
//using foreach loop
----------------------------------------------
module array_;
  int matrix[2][3];
  int i,j;
  initial begin
    matrix[0][0] = 1;
    matrix[0][1] = 2;
    matrix[0][2] = 3;

    matrix[1][0] = 4;
    matrix[1][1] = 5;
    matrix[1][2] = 6;
    foreach(matrix[i,j])begin
        	$write(" %0d",matrix[i][j]);
    if(j==2)
      $display(" ");
    end 
  end
endmodule
