`default_nettype none
module dff (
    input wire clk,    // Clock signal
    input wire d,      // Data input
    output reg q = 1,      // Output signal
    output reg q_bar = 0   // Inverted output signal
);

    // On the rising edge of the clock, capture the input
    always @(posedge clk) begin
        q <= d;
        q_bar <= ~d;
    end

endmodule

