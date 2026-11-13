module memory (
    input logic clk,
    input logic reset,
    input logic wr,
    input logic rd,
    input logic [7:0] data_in,
  input logic [2:0] addr,
    output logic [7:0] data_out
);

    logic [7:0] mem [0:7];
    integer i;

    always_ff @(posedge clk) begin
        if (reset) begin
            for (i = 0; i < 8; i = i + 1)
                mem[i] <= 8'b0;

            data_out <= 8'b0;
        end
        else if (wr && !rd) begin
            mem[addr] <= data_in;
        end
        else if (rd && !wr) begin
            data_out <= mem[addr];
        end
    end

endmodule
