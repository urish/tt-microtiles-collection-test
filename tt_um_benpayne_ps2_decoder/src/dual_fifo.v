module dual_port_fifo #(
    parameter DEPTH = 2,   // 2^Number of buffers
    parameter WIDTH = 8    // Data width
) (
    input wire clk,               // Clock signal
    input wire rst,               // Reset signal
    input wire wr_en,             // Write enable pulse signal
    input wire rd_en,             // Read enable pulse signal
    input wire [WIDTH-1:0] data_in, // Data input
    output reg [WIDTH-1:0] data_out, // Data output
    output wire empty,            // FIFO empty flag
    output wire full              // FIFO full flag
);

    // Internal signals
    reg [WIDTH-1:0] mem [0:(1<<DEPTH)-1]; // FIFO memory
    reg [DEPTH-1:0] wr_ptr;  // Write pointer
    reg [DEPTH-1:0] rd_ptr;  // Read pointer
    reg [DEPTH:0] count;     // Number of stored elements, upper bit means full

    // FIFO empty and full flags
    assign empty = (count == 0);
    assign full = (count[DEPTH]);

    // Synchronous write operation
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            wr_ptr <= 0;
        end else if (wr_en && !full) begin
            mem[wr_ptr] <= data_in;
            wr_ptr <= wr_ptr + 1;
        end
    end

    // Synchronous read operation
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            rd_ptr <= 0;
            data_out <= 0;
        end else if (rd_en && !empty) begin
            data_out <= mem[rd_ptr];
            rd_ptr <= rd_ptr + 1;
        end
    end

    // Counter for tracking the number of elements in the FIFO
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            count <= 0;
        end else begin
            case ({wr_en && !full, rd_en && !empty})
                2'b01: count <= count - 1; // Read only
                2'b10: count <= count + 1; // Write only
                2'b11: count <= count;     // Simultaneous read and write
                default: count <= count;   // No operation
            endcase
        end
    end
endmodule