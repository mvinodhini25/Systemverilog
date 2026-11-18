QUES : first(), last(), num(): For typedef enum {IDLE, LOAD, RUN, DONE} state_t;
state_t s;, what values do s.first(), s.last() and s.num() return? Does calling 
these methods change s?
---------------------------------------------------------------------------------
  module enum_;
  typedef enum {IDLE, LOAD, RUN, DONE}state_t;
  initial begin
    state_t s;
    
    $display("first element %0s",s.first().name());
    $display("last element %0s",s.last().name());
    $display("no of element %0d",s.num());
    $display("prev element %0s",s.prev().name());
    $display("next element %0s",s.next().name());
  end

endmodule
  
  /* OUTPUT :
  first element IDLE
  last element DONE
  no of element 4
  prev element DONE
  next element LOAD  */
