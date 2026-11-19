class transaction #(
    parameter DATA_WIDTH = 8,
    parameter DEPTH = 4
);
    rand bit wr_en;
    rand bit rd_en;
    rand bit [DATA_WIDTH-1:0] data_in;
    bit wr_rst;
    bit rd_rst;
    bit full;
    bit empty;
    bit [DATA_WIDTH-1:0] data_out;

    constraint c1 {
        data_in inside {[0:80]};
    }

    constraint c2 {
        wr_en != rd_en;
    }

    function void display();
        $display(
            "wr_rst = %0d, rd_rst = %0d, wr_en = %0d, rd_en = %0d, data_in = %0d, full = %0d, empty = %0d, data_out = %0d",
            wr_rst, rd_rst, wr_en, rd_en,
            data_in, full, empty, data_out
        );
    endfunction

endclass
