class pass_by_ref;
int refr = 2;

int val = 2;
function automatic int check_refer (ref int r);
$display("\n ------PASS BY REFERENCE ------------\n");
  $display("Initial Value of REFR=%0d",r); 
  r++;
  $display("Value of REFR after incrementing %0d",r);
endfunction
  
function int check_val(int v);
$display("\n -------PASS BY VALUE---------\n");
  $display("Initial Value of VAL %0d",v);
  v++;
  $display("Value of VAL after incrementing %0d",v);
endfunction

endclass
pass_by_ref h1;

module test;
initial
begin
h1 = new();
h1.check_refer(h1.refr);
h1.check_val(h1.val);
$display("\n --------In MEMORY--------\n");
  $display("Value of REFR after incrementing %0d",h1.refr);
  $display("Value of VAL after incrementing %0d",h1.val);

end
endmodule
------------------------------------------------------------

 ------PASS BY REFERENCE ------------

Initial Value of REFR=2
Value of REFR after incrementing 3

 -------PASS BY VALUE---------

Initial Value of VAL 2
Value of VAL after incrementing 3

 --------In MEMORY--------

Value of REFR after incrementing 3
Value of VAL after incrementing 2
