QUES : len(), getc(), putc(): Given string s = "Verilog";,predict 
the output of the code below. Then explain what getc() 
returns for an out-of-range index and what putc() does in that case.
--------------------------------------------------------------------
  module string_;
  string a = "Verilog";
  int b;
  
  initial begin
    $display("origianl string %0s",a);
    b = a.len();
    $display("length of string %0d",b);
    $display("get the 3 index %0c",a.getc(3));
    a.putc(1,"i");
    $display("string name %0s",a);
  end
endmodule

/* OUTPUT : 
origianl string Verilog
length of string 7
get the 3 index i
string name Virilog */
