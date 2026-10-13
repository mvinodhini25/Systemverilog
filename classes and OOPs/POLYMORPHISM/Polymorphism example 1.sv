Create a base class Bird with a method fly() that prints “Bird is flying”. 
Create subclasses Sparrow and Penguin. Sparrow should print “Sparrow flies 
high”, and Penguin should print “Penguins cannot fly”. Create a Bird 
reference (or variable) pointing to each subclass object and call fly(). 
What happens.
----------------------------------------------------------------------------
class Bird;
  virtual function void fly();
    $display("Bird id flying");
  endfunction
endclass

class Sparrow extends Bird;
  function void fly();
    $display("Sparrow flies high");
  endfunction
endclass

class Penquins extends Bird;
  function void fly();
    $display("Penquins cannot fly");
  endfunction
endclass

module tb;
  Bird B;
  Sparrow S;
  Penquins P;
  
  initial begin
    S = new();
    B = S;
    B.fly();
    P = new();
    B = P;
    B.fly();
  end
endmodule
/*   Sparrow flies high
Penquins cannot fly   */
