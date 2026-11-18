QUES : Number-to-string conversions (itoa(), hextoa(), octtoa(), bintoa(), realtoa()):
Write a snippet that converts int n = 255; into decimal, hex, octal and binary strings 
using these methods. Then rewrite it using $sformatf and state which approach you would prefer
-----------------------------------------------------------------------------------------------
module string_;
  int a;
  string d;
  
  initial begin
    a = 65;
    
    d.itoa(a);
    $display("integer value for decimal num 65 is %0s",d);
    d.hextoa(a);
    $display("hexa value for decimal num 65 is %0s",d);
    d.octtoa(a);
    $display("oct value for decimal num 65 is %0s",d);
    d.bintoa(a);
    $display("binary value for decimal num 65  is %0s",d);
    d.realtoa(a);
    $display("real value for decimal num 65 is %0s",d);
  end
endmodule
/* OUTPUT :
integer value for decimal num 65 is 65
hexa value for decimal num 65 is 41
oct value for decimal num 65 is 101
binary value for decimal num 65  is 1000001
real value for decimal num 65 is 65  */
