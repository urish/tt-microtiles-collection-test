module braille_converter (
    input clk,                    // System clock
    input reset,                  // System reset
    input [7:0] mem_dout,         // Memory data input (ASCII characters)
    output reg [7:0] braille_out, // 6-bit Braille code output
    output reg braille_valid,     // Data valid signal
    output reg [7:0] mem_addr,    // Memory address for reading data
    output reg [7:0] braille_size // size of output braille code
);

// Internal registers and counters
reg [7:0] ascii_size;              // Size of the data to convert
reg [7:0] current_ascii_size;      // Internal register to track size calculation
reg [7:0] current_braille_size;
reg indi;                    // Indicator for capital letters/digits
reg size_done;               // Flag to indicate size calculation is complete

// Braille conversion function (abbreviated)
function [7:0] ascii_to_braille;
    input [7:0] ascii;
    begin
        case (ascii)
	    // Mapping for uppercase letters A-Z
            8'd65: ascii_to_braille = 8'b00100000; // A -> 0x20
            8'd66: ascii_to_braille = 8'b00101000; // B -> 0x28
            8'd67: ascii_to_braille = 8'b00110000; // C -> 0x30
            8'd68: ascii_to_braille = 8'b00110100; // D -> 0x34
            8'd69: ascii_to_braille = 8'b00100100; // E -> 0x24
            8'd70: ascii_to_braille = 8'b00111000; // F -> 0x38
            8'd71: ascii_to_braille = 8'b00111100; // G -> 0x3C
            8'd72: ascii_to_braille = 8'b00101100; // H -> 0x2C
            8'd73: ascii_to_braille = 8'b00011000; // I -> 0x18
            8'd74: ascii_to_braille = 8'b00011100; // J -> 0x1C
            8'd75: ascii_to_braille = 8'b00100010; // K -> 0x22
            8'd76: ascii_to_braille = 8'b00101010; // L -> 0x2A
            8'd77: ascii_to_braille = 8'b00110010; // M -> 0x32
            8'd78: ascii_to_braille = 8'b00110110; // N -> 0x36
            8'd79: ascii_to_braille = 8'b00100110; // O -> 0x26
            8'd80: ascii_to_braille = 8'b00111010; // P -> 0x3A
            8'd81: ascii_to_braille = 8'b00111110; // Q -> 0x3E
            8'd82: ascii_to_braille = 8'b00101110; // R -> 0x2E
            8'd83: ascii_to_braille = 8'b00011010; // S -> 0x1A
            8'd84: ascii_to_braille = 8'b00011110; // T -> 0x1E
            8'd85: ascii_to_braille = 8'b00100011; // U -> 0x23
            8'd86: ascii_to_braille = 8'b00101011; // V -> 0x2B
            8'd87: ascii_to_braille = 8'b00011101; // W -> 0x1D
            8'd88: ascii_to_braille = 8'b00110011; // X -> 0x33
            8'd89: ascii_to_braille = 8'b00110111; // Y -> 0x37
            8'd90: ascii_to_braille = 8'b00100111; // Z -> 0x27

            // Mapping for lowercase letters a-z
            8'd97: ascii_to_braille = 8'b00100000; // a -> 0x20
            8'd98: ascii_to_braille = 8'b00101000; // b -> 0x28
            8'd99: ascii_to_braille = 8'b00110000; // c -> 0x30
            8'd100: ascii_to_braille = 8'b00110100; // d -> 0x34
            8'd101: ascii_to_braille = 8'b00100100; // e -> 0x24
            8'd102: ascii_to_braille = 8'b00111000; // f -> 0x38
            8'd103: ascii_to_braille = 8'b00111100; // g -> 0x3C
            8'd104: ascii_to_braille = 8'b00101100; // h -> 0x2C
            8'd105: ascii_to_braille = 8'b00011000; // i -> 0x18
            8'd106: ascii_to_braille = 8'b00011100; // j -> 0x1C
            8'd107: ascii_to_braille = 8'b00100010; // k -> 0x22
            8'd108: ascii_to_braille = 8'b00101010; // l -> 0x2A
            8'd109: ascii_to_braille = 8'b00110010; // m -> 0x32
            8'd110: ascii_to_braille = 8'b00110110; // n -> 0x36
            8'd111: ascii_to_braille = 8'b00100110; // o -> 0x26
            8'd112: ascii_to_braille = 8'b00111010; // p -> 0x3A
            8'd113: ascii_to_braille = 8'b00111110; // q -> 0x3E
            8'd114: ascii_to_braille = 8'b00101110; // r -> 0x2E
            8'd115: ascii_to_braille = 8'b00011010; // s -> 0x1A
            8'd116: ascii_to_braille = 8'b00011110; // t -> 0x1E
            8'd117: ascii_to_braille = 8'b00100011; // u -> 0x23
            8'd118: ascii_to_braille = 8'b00101011; // v -> 0x2B
            8'd119: ascii_to_braille = 8'b00011101; // w -> 0x1D
            8'd120: ascii_to_braille = 8'b00110011; // x -> 0x33
            8'd121: ascii_to_braille = 8'b00110111; // y -> 0x37
            8'd122: ascii_to_braille = 8'b00100111; // z -> 0x27

            // Mapping for digits 0-9
            8'd48: ascii_to_braille = 8'b00001111; // 0 -> 0x0F
            8'd49: ascii_to_braille = 8'b00100000; // 1 -> 0x20
            8'd50: ascii_to_braille = 8'b00101000; // 2 -> 0x28
            8'd51: ascii_to_braille = 8'b00110000; // 3 -> 0x30
            8'd52: ascii_to_braille = 8'b00110100; // 4 -> 0x34
            8'd53: ascii_to_braille = 8'b00100100; // 5 -> 0x24
            8'd54: ascii_to_braille = 8'b00111000; // 6 -> 0x38
            8'd55: ascii_to_braille = 8'b00111100; // 7 -> 0x3C
            8'd56: ascii_to_braille = 8'b00101100; // 8 -> 0x2C
            8'd57: ascii_to_braille = 8'b00011000; // 9 -> 0x18

            // Mapping for common punctuation marks
            8'd32: ascii_to_braille = 8'b00000000; // Space -> 0x00
            8'd33: ascii_to_braille = 8'b00001110; // ! -> 0x0E
            8'd34: ascii_to_braille = 8'b00001010; // " -> 0x0A
            8'd35: ascii_to_braille = 8'b00010111; // # -> 0x2F
            8'd36: ascii_to_braille = 8'b00111001; // $ -> 0x39
            8'd37: ascii_to_braille = 8'b00110101; // % -> 0x35
            8'd38: ascii_to_braille = 8'b00101101; // & -> 0x2D
            8'd39: ascii_to_braille = 8'b00001000; // ' -> 0x08
            8'd40: ascii_to_braille = 8'b00011011; // ( -> 0x1B
            8'd41: ascii_to_braille = 8'b00011111; // ) -> 0x1F
            8'd42: ascii_to_braille = 8'b00100101; // * -> 0x25
            8'd43: ascii_to_braille = 8'b00010110; // + -> 0x16
            8'd44: ascii_to_braille = 8'b00000010; // , -> 0x02
            8'd45: ascii_to_braille = 8'b00001001; // - -> 0x09
            8'd46: ascii_to_braille = 8'b00000011; // . -> 0x03
            8'd47: ascii_to_braille = 8'b00010011; // / -> 0x13
            8'd58: ascii_to_braille = 8'b00010010; // : -> 0x12
            8'd59: ascii_to_braille = 8'b00011010; // ; -> 0x1A
            8'd60: ascii_to_braille = 8'b00010001; // < -> 0x
            default: ascii_to_braille = 8'b00000000; // Default (space)
        endcase
    end
endfunction

always @(posedge clk or negedge reset) begin
    if (!reset) begin
        // Resetting the internal variables
        mem_addr <= 0;
        current_ascii_size <= 0;
        ascii_size <= 0;
	current_braille_size <= 0;
	braille_size <= 0;
        braille_valid <= 0;
        size_done <= 0;
        indi <= 0;
	braille_out <= 0;
    end else begin
        if (!size_done) begin
            // Size calculation phase
            if (mem_dout == 8'd0 || mem_addr == 8'd255) begin
                // Finalize size when a zero character is detected
                ascii_size <= current_ascii_size;
	        braille_size <= current_braille_size;
                size_done <= 1;
	        braille_valid <= 1;
                mem_addr <= 0; // Reset mem_addr for the conversion phase
            end else begin
                // Accumulate size based on the type of character
                if (mem_dout >= 8'd65 && mem_dout <= 8'd90 || // Capital letters
                    mem_dout >= 8'd48 && mem_dout <= 8'd57) begin // Digits
                    //current_ascii_size <= current_ascii_size + 1;
	            current_braille_size <= current_braille_size + 2;
                end else begin
                    //current_ascii_size <= current_ascii_size + 1; // Lowercase or other characters
	            current_braille_size <= current_braille_size + 1;
                end
	            current_ascii_size <= current_ascii_size + 1;
                    mem_addr <= mem_addr + 1;
            end
        end else begin
            // Braille conversion phase
            braille_valid <= 0; // Reset valid signal at each clock cycle
            
            if (mem_addr < ascii_size) begin
                if (indi == 1) begin
                    // Output Braille for the current character (A-Z, 0-9)
                    braille_out <= ascii_to_braille(mem_dout);
                    mem_addr <= mem_addr + 1;
                    braille_valid <= 1;
                    indi <= 0;
                end else if (mem_dout >= 65 && mem_dout <= 90) begin
                    // Capital letter (A-Z) indicator
                    braille_out <= 8'b00000001;
                    braille_valid <= 1;
                    indi <= 1;
                end else if (mem_dout >= 48 && mem_dout <= 57) begin
                    // Digit (0-9) indicator
                    braille_out <= 8'b00010111;
                    braille_valid <= 1;
                    indi <= 1;
                end else begin
                    // Output Braille for the current character
                    braille_out <= ascii_to_braille(mem_dout);
                    mem_addr <= mem_addr + 1;
                    braille_valid <= 1;
                end
	    end
	    else begin
		    braille_out <= 0;
		    mem_addr <= mem_addr;
	    end
        end
    end
end

endmodule
