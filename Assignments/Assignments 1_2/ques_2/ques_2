Write a snippet in SV to insert one queue into another queue. (Do
it with & without using array methods)
------------------------------------------------------------------
ANSWER : 
module dynamic;
  int q1[$];
  int q2[$];
  int q3[$];
  int q4[$];
  
  initial begin
    q1 = '{10,20,30};
    q2 = '{40,50,60};
    q3 = q1;
    
    foreach(q2[i])
      q1.insert($size(q1),q2[i]);
    $display("after inserting = %0p",q1);
    
    q4 = {q3,q2};
    $display("w/o inserting method = %0p",q4);
  end
endmodule
