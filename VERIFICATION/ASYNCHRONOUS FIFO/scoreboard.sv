class scoreboard #(
    parameter DEPTH = 4,
    parameter DATA_WIDTH = 8
);

  mailbox #(transaction #(DATA_WIDTH, DEPTH)) mon2scr;

  bit [DATA_WIDTH-1:0] fifo_queue[$];

  bit [DATA_WIDTH-1:0] expected_data;
  bit expected_full;
  bit expected_empty;

  int error_count = 0;
  int pass_count = 0;

  transaction #(DATA_WIDTH, DEPTH) trans;

  function new(
    mailbox #(transaction #(DATA_WIDTH, DEPTH)) mon2scr
  );
    this.mon2scr = mon2scr;
  endfunction

  task run();
    repeat(8) begin
      mon2scr.get(trans);

      $display("\nSCOREBOARD TRANSACTION");
      trans.display();

      if (trans.wr_en) begin
        if (fifo_queue.size() < DEPTH) begin
          fifo_queue.push_back(trans.data_in);

          $display("WRITE PASS | Data = %0d", trans.data_in);
          pass_count++;
        end
        else begin
          $error("WRITE FAIL | FIFO is FULL");
          error_count++;
        end
      end

      if (trans.rd_en) begin
        if (fifo_queue.size() > 0) begin
          expected_data = fifo_queue.pop_front();

          if (expected_data === trans.data_out) begin
            $display("DATA PASS | Expected = %0d | Actual = %0d",
                     expected_data, trans.data_out);
            pass_count++;
          end
          else begin
            $error("DATA FAIL | Expected = %0d | Actual = %0d",
                   expected_data, trans.data_out);
            error_count++;
          end
        end
        else begin
          $error("READ FAIL | FIFO is EMPTY");
          error_count++;
        end
      end

      expected_full  = (fifo_queue.size() == DEPTH);
      expected_empty = (fifo_queue.size() == 0);

      if (trans.wr_en) begin
        if (expected_full === trans.full) begin
          $display("FULL PASS | Expected = %0b | Actual = %0b",
                   expected_full, trans.full);
          pass_count++;
        end
        else begin
          $error("FULL FAIL | Expected = %0b | Actual = %0b",
                 expected_full, trans.full);
          error_count++;
        end
      end
      
      if (trans.rd_en) begin
        if (expected_empty === trans.empty) begin
          $display("EMPTY PASS | Expected = %0b | Actual = %0b",
                   expected_empty, trans.empty);
          pass_count++;
        end
        else begin
          $error("EMPTY FAIL | Expected = %0b | Actual = %0b",
                 expected_empty, trans.empty);
          error_count++;
        end
      end
      $display("--------------------------------");
    end
    $display("\n================================");
    $display("TOTAL PASS = %0d", pass_count);
    $display("TOTAL FAIL = %0d", error_count);
    $display("================================");

    $display("FIFO SIZE = %0d | FULL = %0b | EMPTY = %0b",
             fifo_queue.size(), expected_full, expected_empty);
  endtask

endclass
