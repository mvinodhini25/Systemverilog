Declare:

int a [5];

Store:

10 20 30 40 50

Display the elements in reverse order:

50 40 30 20 10
---------------------------------------
// Code your testbench here
// or browse Examples
module array_;
  int a[5];
  initial begin
    a = '{10,20,30,40,50};
    $display("a=%0p",a);
    a.reverse();
    $display("a=%0p",a);
  end
endmodule
