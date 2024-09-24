module memory(
    input reset,
    input [7:0] mem_addr,        // 8-bit address to support 256 words, coming from size_calculator
    output reg [7:0] mem_dout    // Output data to size_calculator & braille_converter
);

// Memory array with 256 words, each 8 bits wide
reg [7:0] memory [0:255];

integer i;

// Initialize memory, synthesizable in FPGA but not in ASIC
//initial begin
//    $readmemh("input.txt", memory); // Read data from a hex file into memory
//end

// Memory Initialization
always @(negedge reset) begin
	memory[0] <= 8'h54;
	memory[1] <= 8'h65;
	memory[2] <= 8'h78;
	memory[3] <= 8'h74;
	memory[4] <= 8'h20;
	memory[5] <= 8'h74;
	memory[6] <= 8'h6f;
	memory[7] <= 8'h20;
	memory[8] <= 8'h42;
	memory[9] <= 8'h72;
	memory[10] <= 8'h61;
	memory[11] <= 8'h69;
	memory[12] <= 8'h6c;
	memory[13] <= 8'h6c;
	memory[14] <= 8'h65;
	for (i = 15; i < 256; i = i + 1) begin
		memory[i] = 8'h00;
	end
end
	
// Memory read operation
always @(*) begin
    mem_dout = memory[mem_addr];  // Read data from memory
end

endmodule
