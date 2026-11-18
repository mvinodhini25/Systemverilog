QUES : Basic and array typedefs: Write typedefs for word_t (32-bit unsigned logic vector), 
mem_t (256 entries of word_t), q_t (queue of int) and map_t (associative array of string 
indexed by int). Declare one variable of each.
------------------------------------------------------------------------------------------
  module type_def;
  typedef logic [31:0] word_t;
  typedef word_t mem_t [256];
  typedef int q_t[$];
  typedef string map_t[int];
  
  initial begin
  word_t word;
  mem_t mem;
  q_t q;
  map_t map;
  
  word = 32'd78;
  
  mem[0] = 32'd89;
  mem[1] = 32'd23;
  mem[2] = 32'd972;
  
  q.push_back(10);
  q.push_back(20);
  q.push_back(30);
  
  map[10] = "heyy";
  map[20] = "hello";
  
  $display("word = %0d",word);
  
  $display("mem[0] = %0p",mem[0]);
  $display("mem[1] = %0p",mem[1]);
  $display("mem[2] = %0p",mem[2]);
  
  $display("queue = %0p",q);
  
   foreach (map[key]) begin
  $display("map[%0d] = %s", key, map[key]);
end
  end
endmodule

/* OUTPUT :
word = 78
mem[0] = 89
mem[1] = 23
mem[2] = 972
queue = '{10, 20, 30} 
map[10] = heyy
map[20] = hello   */
