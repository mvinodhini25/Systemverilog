interface ifc #(
    parameter DATA_WIDTH = 8,
    parameter DEPTH = 4,
    parameter ADDR_WIDTH = $clog2(DEPTH)
);

    logic wr_clk, rd_clk;
    logic wr_rst, rd_rst;
    logic wr_en, rd_en;

    logic [DATA_WIDTH-1:0] data_in;
    logic [DATA_WIDTH-1:0] data_out;

    logic full, empty;

endinterface
