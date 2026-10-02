Write a test bench to test the Associative array data type and its predefined

methods by using the following statements
a. declare a 64-bit integer type sparse array assoc & an index idx
b. initialize idx to 1
c. fill array assoc by 1-bit left shift of idx value in a loop which runs 64 times
so that the array is filled as a sparse array
d. use first, next, last, prev methods to get the values of these elements

ANSWER :

module associative_array_tb;
  bit [63:0] assoc [bit [63:0]];
  bit [63:0] idx;

  initial begin
    idx = 64'd1;

    repeat (64) begin
      assoc[idx] = idx;
      idx = idx << 1;
    end

    $display("Associative Array:");
    foreach (assoc[i])
      $display("Index = %0d, Value = %0d", i, assoc[i]);

    if (assoc.first(idx))
      $display("\nfirst(): Index = %0d, Value = %0d", idx, assoc[idx]);

    if (assoc.next(idx))
      $display("next():  Index = %0d, Value = %0d", idx, assoc[idx]);

    if (assoc.last(idx))
      $display("last():  Index = %0d, Value = %0d", idx, assoc[idx]);

    if (assoc.prev(idx))
      $display("prev():  Index = %0d, Value = %0d", idx, assoc[idx]);

  end

endmodule
