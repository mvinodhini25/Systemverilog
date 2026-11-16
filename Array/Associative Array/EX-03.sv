Ques: Declare:

int marks[string];

Store marks for:

"siva"      = 85
"Arun"      = 92
"Priya"     = 78
"Rahul"     = 88

Display each student's name and mark. 
---------------------------------------------------------
// Code your testbench here
// or browse Examples
/*module array_;
  int marks[string];
  initial begin
    marks = '{"Siva":85,"Arun":92,"Priya":78,"Rahul":88};
    $display("%0p",marks);
  end
endmodule*/

module array_;
  int marks[string];
  string name;
  initial begin
    marks = '{"Siva":85,"Arun":92,"Priya":78,"Rahul":88};
    foreach(marks[name]) begin
      $display("%0s = %0d",name,marks[name]);
    end
  end
endmodule
