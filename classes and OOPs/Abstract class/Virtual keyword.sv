// Code your design here
virtual class BaseClass;
	int data;

	function new();
		data = 32'hc0de_c0de;
	endfunction
endclass

class ChildClass extends BaseClass;
  int id;
	function new();
      super.new();
		id = 32'hfade_fade;
	endfunction
endclass

module tb;
	ChildClass child;
	initial begin
		child = new();
		$display ("data=0x%0h", child.data);
	end
endmodule
/* OUTPUT :
data=0xc0dec0de */SS
