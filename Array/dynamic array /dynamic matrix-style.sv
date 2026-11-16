module array_;
  logic [7:0] matrix[][4];
  initial begin
    matrix = new[3];
    
    foreach(matrix[i]) begin
      foreach(matrix[i][j]) begin
        matrix[i][j] = $urandom_range(0,255);
        $write("%0d ",matrix[i][j]);
      end
      $display(" ");
    end
  end
endmodule
