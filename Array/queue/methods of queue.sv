module array_;
  int q[$];
  int a[$];
  initial begin
    q = '{10,20,30,40,50};
    q.push_front(10);
    q.push_front(20);
    $display("%0p",q);
    q.push_back(30);
    q.push_back(40);
    $display("%0p",q);
    q.pop_front();
    q.pop_back();
    $display("%0p",q);
    q.insert(2,99);
    $display("%0p",q);
    q.delete(3);
    $display("%0p",q);
    q[2] = 100;
    $display("%0p",q);
    q.reverse();
    $display("%0p",q);
    q.sort();
    $display("%0p",q);
    a = q.min();
    $display("%0p",a);
    a = q.max();
    $display("%0p",a);
    a = q.find(x) with (x == 30);
    $display("%0p",a);
  end
endmodule
