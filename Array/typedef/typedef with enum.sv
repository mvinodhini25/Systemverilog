QUES : typedef enum: Create typedef enum logic [1:0] {ADD, SUB, AND_OP, OR_OP}
alu_op_t;. State the base type, the default values assigned, and why a 4-state 
base type is useful for detecting uninitialized values.
----------------------------------------------------------------------------------
  module type_def;
  typedef enum logic [1:0] {ADD, SUB, AND_OP, OR_OP} alu_op_t;
  
  initial begin
     alu_op_t op;
    op = ADD;
    $display("ADD = %0d",op);
    op = SUB;
    $display("SUB = %0d",op);
    op = AND_OP;
    $display("AND_OP = %0d",op);
    op = OR_OP;
    $display("OR_OP = %0d",op);
    op = ADD;
    $display("Name = %0s", op.name());
    
    op = alu_op_t'('hA);
    $display("unknown value = %0d",op);
    $display("Name = %0s", op.name());
  end
endmodule

/* ADD = 0
SUB = 1
AND_OP = 2
OR_OP = 3
Name = ADD
unknown value = 2
Name = AND_OP   */
