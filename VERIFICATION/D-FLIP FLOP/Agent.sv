class agent;
  mailbox gen2drv;
  mailbox mon2scr;
  
  generator gen;
  driver drv;
  monitor mon;
  
  function new(virtual ifc vif, mailbox mon2scr);
    this.mon2scr = mon2scr;
    gen2drv = new();
    
    gen = new(gen2drv);
    drv = new(gen2drv,vif);
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
