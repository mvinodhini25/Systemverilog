QUES : typedef struct (packed vs unpacked): Define an instruction type 
instr_t as a packed struct with opcode[3:0], rs[2:0], rt[2:0], imm[5:0]. 
State its total width and how to assign a 16-bit vector to it. Then 
explain what changes if the struct is unpacked (which member types become allowed, 
and can it be used directly as a vector?).
----------------------------------------------------------------------------------\
module type_def;
  typedef struct packed{
    logic [3:0]opcode;
    logic [2:0]rs;
    logic [2:0]rt;
    logic [5:0]imm;
  }instr_t;
  
  instr_t instr;
  
  initial begin
    instr = 16'd34;
    
    $display("opcode = %0d",instr.opcode);
    $display("rs = %0d",instr.rs);
    $display("rt = %0d",instr.rt);
    $display("imm = %0d",instr.imm);
    $display("instr = %0p",instr);
  end
endmodule

/*  OUTPUT :
opcode = 0
rs = 0
rt = 0
imm = 34
instr = '{opcode:'h0, rs:'h0, rt:'h0, imm:'h22}   */
