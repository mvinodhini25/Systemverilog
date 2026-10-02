Write a test bench to test predefined array locator methods by using the following

statements
a. declare queues q, tq, dynamic array d, fixed array f
b. initialize q to (1,3,5,7), d to (9,1,8,3,4,4), f to (1,6,2,6,8,6)
c. display sum, product of elements of array q
d. display min, max values stored in array q
e. display the unique elements from array f
f. find elements in array d with condition item > 3
g. find indexes of those elements in array d which have condition item > 3
h. find indexes of those elements in array d which have condition item > 99
i. find the first index in array d which matches with condition item==8
j. find the last element in array d which matches with condition item==4
k. find the last index in array d which matches with condition item==4

l. find the sum of elements in array d with condition item > 7
m. find the sum of elements in array d with condition ((item > 7) * item)
n. find the sum of elements in array d with condition item < 8
o. find the sum of elements in array d with condition ((item < 8)? item:0)

ANSWER :
// Code your design here
module array_;
  int q[$];
  int tq[$];
  int d[];
  int f[6];
  int a;
  
  initial begin
    q = '{1,3,5,7};
    d = '{9,1,8,3,4,4};
    f = '{1,6,2,6,8,6};
    
    #1;
    a = q.sum();
    $display("sum=%0d",a);
    
    a = q.product();
    $display("product=%0d",a);
    
    tq = q.min();
    $display("product=%0p",tq);
    
    tq = q.max();
    $display("product=%0p",tq);
    
    tq = f.unique();
    $display("%0p",tq);
    
    tq = d.find(item) with (item>3);
    $display("find item>3 = %0p",tq);
    
    tq = d.find_index(item) with (item>3);
    $display("find_index item>3 = %0p",tq);
    
    tq = d.find_index(item) with (item>99);
    $display("find_index item>99 = %0p",tq);
    
    tq = d.find_index(item) with (item==8);
    $display("find_index item==8 = %0p",tq);
    
    tq = d.find_last(item) with (item==4);
    $display("find_last item==4 = %0p",tq);
    
    tq = d.find_last_index(item) with (item==4);
    $display("find_last_index item==4 = %0p",tq);
    
    a = d.sum() with (item>7);
    $display("sum item>7 = %0d",a);
    
    a = d.sum() with ((item>7)*item);
    $display("sum (item>7)*item = %0d",a);
    
    a = d.sum() with(item<8);
    $display("sum item<8 = %0d",a);

    a = d.sum()with ((item<8)?item:0);
    $display("sum item<8)?item:0 = %0d",a);
  end 
endmodule
    
