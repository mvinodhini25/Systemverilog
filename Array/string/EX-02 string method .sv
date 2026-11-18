QUES : toupper(), tolower(): Predict the output and explain the pitfall. 
Then write the correct way to convert s to uppercase.
-------------------------------------------------------------------------
module string_;
  string a = "Hello";
  
  initial begin
    $display("Original string %0s",a);
    a = a.toupper();
    $display("Upper string %0s",a);
    a = a.tolower();
    $display("Lower string %0s",a);
  end
endmodule

/* OUTPUT : 
Original string Hello
Upper string HELLO
Lower string hello */
