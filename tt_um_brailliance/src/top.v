module braille_converter_top (
    input wire clk,
    input wire reset,
    input wire next,

    output wire [7:0] reader1_out
);

    wire [7:0] mem_dout;
    wire [7:0] mem_addr;
    wire [7:0] braille_size;
    wire [7:0] braille_out;
    wire braille_valid;

    // Instantiate the Braille Converter
    braille_converter cvt (
        .clk(clk),
        .reset(reset),
        .mem_dout(mem_dout),

	.mem_addr(mem_addr),
        .braille_out(braille_out),
	.braille_size(braille_size),
	.braille_valid(braille_valid)
    );

    // Instantiate the Memory Module
    memory mem (
	.reset(reset),
        .mem_addr(mem_addr),

        .mem_dout(mem_dout)
    );

    // Instantiate the Reader Module
    reader rdr (
        .clk(clk),
        .reset(reset),
        .braille_out(braille_out),
        .braille_size(braille_size),
        .braille_valid(braille_valid),
        .next(next),

        .reader1_out(reader1_out)
    );

endmodule
