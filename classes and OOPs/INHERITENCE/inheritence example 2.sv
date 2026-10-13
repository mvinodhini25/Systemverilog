class Employee;
  string name;
  logic [7:0]salary;
  
  function new(string name, logic [7:0]salary);
    this.name = name;
    this.salary = salary;
  endfunction
  
  function void display();
    $display("Name = %0s, Salary = %0d",name,salary);
  endfunction
  
endclass

class Manager extends Employee;
  string department;
  
  function new(string department);
    super.new("Arun",147);
    this.department = department;
  endfunction
  
  function void display();
    super.display();
    $display("Department = %0s",department);
  endfunction
  
endclass

module tb;
  Manager M;
  Employee E;
  initial begin
    M = new("VLSI");
    E = new("Arun",250);
    E.display();  
    M.display(); 
  end
endmodule

/*Name = Arun, Salary = 250
Name = Arun, Salary = 147
Department = VLSI  */
