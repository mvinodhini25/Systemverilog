Write a test bench to test queue data type and its predefined methods by using the

following statements
a. declare an int j and queue q of type int
b. initialize int j as 1 and queue q as (0, 2, 5)
c. insert int j at index 1 in queue q and display q
d. delete index 1 element from queue q and display q
e. push an element (7) in the front in queue q and display q
f. push an element (9) at the back in queue q and display q
g. pop an element from the back of queue q, display q, element
h. pop an element from front of queue q, display q, element
i. reverse, sort, reverse sort, and shuffle the queue


ANSWER :
// Code your design here
module array_;
  int j;
  int q[$];
  int i;
  
  initial begin
    j = 1;
    q = '{0,2,5};
    #1;
    
    q.insert(j,1);
    $display("%0p",q);
    
    q.delete(1);
    $display("%0p",q);
    
    q.push_front(7);
    $display("%0p",q);
    
    q.push_back(9);
    $display("%0p",q);
    
    q.pop_front();
    $display("%0p",q);
    
    q.pop_back();
    $display("%0p",q);
    
    q.reverse();
    $display("%0p",q);
    
    q.sort();
    $display("%0p",q);
    
    q.rsort();
    $display("%0p",q);
    
    q.shuffle();
    $display("%0p",q);
    
  end
endmodule
