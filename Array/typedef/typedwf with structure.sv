QUES : typedef struct (packed vs unpacked): Define an instruction type instr_t as 
a packed struct with opcode[3:0], rs[2:0], rt[2:0], imm[5:0]. State its total 
width and how to assign a 16-bit vector to it. Then explain what changes if the 
struct is unpacked (which member types become allowed, and can it be used directly 
as a vector?).
-----------------------------------------------------------------------------------
module type_def;
  typedef struct{
    logic [3:0]opcode;
    logic [2:0]rs;
    logic [2:0]rt;
    logic [5:0]imm;
  }instr_t;
  
  instr_t instr;
  
  initial begin
    instr.opcode = 4'd13;
    instr.rs = 3'd5;
    instr.rt = 3'd6;
    instr.imm = 6'd32;
    
    $display("opcode = %0d",instr.opcode);
    $display("rs = %0d",instr.rs);
    $display("rt = %0d",instr.rt);
    $display("imm = %0d",instr.imm);
    $display("instr = %0p",instr);
  end
endmodule
/* OUTPUT :
opcode = 13
rs = 5
rt = 6
imm = 32
instr = '{opcode:'hd, rs:'h5, rt:'h6, imm:'h20}  */
