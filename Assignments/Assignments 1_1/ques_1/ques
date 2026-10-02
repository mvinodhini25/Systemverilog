Write a test bench to test the dynamic array data type and its predefined methods by
using the following statements
a. declare two dynamic arrays d1, d of type int
b. initialize d array elements with (9,1,8,3,4,4)
c. allocate six elements in array d1
d. initialize array d1 with index as its value
e. display d1 and its size
f. delete array d1
g. reverse, sort, reverse sort, and shuffle the array d


ANSWER :

// Code your design here
module dynamic_array_tb;
  int d1[];
  int d[];

  initial begin
    d = '{9, 1, 8, 3, 4, 4};
    $display("Original array d = %p", d);
 
    d1 = new[6];

    foreach (d1[i])
      d1[i] = i;


    $display("d1 = %p", d1);
    $display("Size of d1 = %0d", d1.size());

    d1.delete();

    $display("After deleting d1:");
    $display("Size of d1 = %0d", d1.size());

    $display("\nOriginal d = %p", d);

 
    d.reverse();
    $display("After reverse = %p", d);

    d.sort();
    $display("After sort = %p", d);

    d.rsort();
    $display("After reverse sort = %p", d);

    d.shuffle();
    $display("After shuffle = %p", d);

  end

endmodule
