Create a class Vehicle with a method start(), a class Car that inherits from Vehicle, 
and a class ElectricCar that inherits from Car. Each class should override start() and 
print a different message. Make ElectricCar.start() also call Car.start() using super. 
What is the output when you call start() on an ElectricCar object?
-----------------------------------------------------------------------------------------  

class vehicle;
  
  function void start();
    $display("VEHICLE");
  endfunction
  
endclass

class car extends vehicle;
  
  function void start();
    $display("CAR");
  endfunction
  
endclass

class electricCar extends car;
  
  function void start();
    super.start();
    $display("ELECTRIC_CAR");
  endfunction
  
endclass

module tb;
  car C;
  electricCar E;
  
  initial begin                   
    E = new();
    E.start();
  end
  
endmodule   

  /* CAR
ELECTRIC_CAR  */
