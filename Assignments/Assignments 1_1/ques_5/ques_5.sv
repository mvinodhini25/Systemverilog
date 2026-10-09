5. Write a test bench to test string data type and its predefined methods by using the
following statements
a. declare a string data type and assign it to“SystemVerilog”
b. use the getc() method to display the ASCII value of the first character
of this string
c. use toupper() method to display the string in capital letter
d. concatenate the string with string “3.1a” and display
e. replace the last character in the string with character ‘b’ using len()
method and display
f. use substr() method to display substring from 2nd to 5th character

ANSWER :

// Code your design here
module string_;
  string s;
  int a;
  initial begin
    s = "Systemverilog";
    $display("string = %0s",s);
    a = s.getc(0);
    $display("ASCII value = %0d",a);
    s = s.toupper();
    $display("string = %0s",s);
    s = {s,"3.1a"};
    $display("string = %0s",s);
    s.putc(s.len()-1,"b");
    $display("string = %0s",s);
    s = s.substr(2,5);
    $display("string = %0s",s);
  end
endmodule
