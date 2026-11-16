module array_;
  int a[];
  initial begin
    a = new[3];
    a = '{10,20,30};
    $display("elements of a is %0p,\nsize of a is %0d",a,a.size());
    a = new[5](a);
    $display("elements of a is %0p,\nsize of a is %0d",a,a.size());
    a[3] = 40;
    a[4] = 50;
    $display("elements of a is %0p,\nsize of a is %0d",a,a.size());
    a.delete();
    $display("elements of a is %0p,\nsize of a is %0d",a,a.size());
  end
endmodule
