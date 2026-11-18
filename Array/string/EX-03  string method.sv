QUES : String-to-number conversions (atoi(), atohex(), atooct(), atobin(), atoreal()): 
Give the value returned by each call below, and explain what happens when the string 
contains a non-numeric character."65".atoi();  "A5".atohex();  "17".atooct();  "1010".atobin();  
"3.14".atoreal();
-----------------------------------------------------------------------------------------------
module string_;
  int d;
  string a;
  string b;
  
  initial begin
    a = "65";
    b = "A5";
    
    d = a.atoi();
    $display("integer value for A is %0d",d);
     d = b.atohex();
    $display("hexa value for A is %0d",d);
    
    a = "17";
    d = a.atooct();
    $display("hexa value for A is %0d",d);
    b = "1010";
    d = b.atobin();
    $display("hexa value for A is %0d",d);
    a = "3.14";
    d = a.atoreal();
    $display("hexa value for A is %0d",d);
  end
endmodule

/* OUTPUT :
integer value for A is 65
hexa value for A is 165s

hexa value for A is 15
hexa value for A is 10
hexa value for A is 3   */
