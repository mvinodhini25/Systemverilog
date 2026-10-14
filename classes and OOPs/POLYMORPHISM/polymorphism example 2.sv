Create a base class Payment with a method pay(amount). Create subclasses 
CreditCard, UPI, and Cash, each printing a different message such as 
“Paid 500 using UPI”. Store one object of each in a list and loop through it, 
calling pay(500) on every object. Explain why the loop doesn’t need to know 
the exact type of each object.
----------------------------------------------------------------------------
class payment;
  virtual function void pay( int amount);
    $display("payment is not specify");
  endfunction
endclass

class Creditcard extends payment;
  function void pay(int amount);
    $display("Paid %0d using Creditcard",amount);
  endfunction
endclass

class UPI extends payment;
  function void pay(int amount);
    $display("paid %0d using UPI",amount);
  endfunction
endclass

class Cash extends payment;
  function void pay(int amount);
    $display("paid %0d using Cash",amount);
  endfunction
endclass

module tb;
  payment pay_ment[3];
  
  Creditcard Cr;
  UPI U;
  Cash Ca;
  
  initial begin
    Cr = new(); 
    U = new(); 
    Ca = new(); 
  
    pay_ment[0] = Cr;
    pay_ment[1] = U;
    pay_ment[2] = Ca;
    
    foreach(pay_ment[i]) begin
      pay_ment[i].pay(500);
    end
  end
endmodule
/* OUTPUT : 
Paid 500 using Creditcard
paid 500 using UPI
paid 500 using Cash  */
