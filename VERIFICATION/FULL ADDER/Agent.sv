class agent;
  generator gen;
  driver drv;
  monitor mon;
  
  mailbox gen2driv;
  mailbox mon2scr;
  
  function new(virtual ifc vif, mailbox mon2scr);
    gen2driv = new();
    this.mon2scr = mon2scr;
    
    gen = new(gen2driv);
    drv = new(gen2driv,vif);
    mon = new(vif,this.mon2scr);
  endfunction
  
  task run();
    fork
    gen.run();
    drv.run();
    mon.run();
    join
  endtask
  
endclass
