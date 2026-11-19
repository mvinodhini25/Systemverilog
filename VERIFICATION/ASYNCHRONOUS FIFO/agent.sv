class agent;

  generator gen;
  driver drv;
  monitor #(8,4) mon;

  mailbox #(transaction #(8,4)) gen2drv;
  mailbox #(transaction #(8,4)) mon2scr;

  function new(virtual ifc #(8,4) vif,mailbox #(transaction #(8,4)) mon2scr);

    gen2drv = new();

    this.mon2scr = mon2scr;

    gen = new(gen2drv);
    drv = new(gen2drv, vif);
    mon = new(vif, this.mon2scr);

  endfunction

  task run();
    fork
      gen.run();
      drv.run();
      mon.run();
    join
  endtask

endclass
