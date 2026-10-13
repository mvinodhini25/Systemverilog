class parent;
  bit [2:0] data;
  
  function new (bit [2:0] data);
    this.data = data;
  endfunction
  
  function void display();
    $display("data is %0d",data);
  endfunction
  
endclass

class child extends parent;
  logic [2:0]addr;
  
  function new (logic [2:0]addr);
    super.new(data);
    this.addr = addr;
  endfunction
  
  function void display();
    super.display();
    $display("addr is %0d",addr);
  endfunction
  
endclass

module tb;
  child c;
  parent p;
  initial begin
    c = new(3'd5); 
    p = new(3'd6);
    c.display(); 
    p.display(); 
  end
endmodule 
/*  Compiler version X-2025.06-SP1_Full64; Runtime version X-2025.06-SP1_Full64;  Oct 13 03:29 2026
data is 0
addr is 5
data is 6   */
