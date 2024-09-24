module universal_bcd_decoder (
	input wire A, B, C, D, V0, V1, V2,
	input wire X6, X7, X9, RBI, LT, BI, AL,
	output wire Qa, Qb, Qc, Qd, Qe, Qf, Qg, RBO
);

	wire [2:0] version = {V2, V1, V0};
	wire [3:0] value = {D, C, B, A};

	reg [6:0] data;
	assign Qa = ((data[0] | ~LT) & BI) ^ ~AL;
	assign Qb = ((data[1] | ~LT) & BI) ^ ~AL;
	assign Qc = ((data[2] | ~LT) & BI) ^ ~AL;
	assign Qd = ((data[3] | ~LT) & BI) ^ ~AL;
	assign Qe = ((data[4] | ~LT) & BI) ^ ~AL;
	assign Qf = ((data[5] | ~LT) & BI) ^ ~AL;
	assign Qg = ((data[6] | ~LT) & BI) ^ ~AL;
	assign RBO = ((value != 0) | RBI | ~LT) & BI;

	always @(version or value or RBI or X6 or X7 or X9) begin
		casez ({version, value})
			// decimal digits
			7'b???0000: data = (RBI ? 7'h3F : 7'h00);
			7'b???0001: data = 7'h06;
			7'b???0010: data = 7'h5B;
			7'b???0011: data = 7'h4F;
			7'b???0100: data = 7'h66;
			7'b???0101: data = 7'h6D;
			7'b???0110: data = (X6 ? 7'h7D : 7'h7C);
			7'b???0111: data = (X7 ? 7'h27 : 7'h07);
			7'b???1000: data = 7'h7F;
			7'b???1001: data = (X9 ? 7'h6F : 7'h67);
			// RCA / blanking version
			7'b000101?: data = 7'h00;
			7'b00011??: data = 7'h00;
			// TI version
			7'b0011010: data = 7'h58;
			7'b0011011: data = 7'h4C;
			7'b0011100: data = 7'h62;
			7'b0011101: data = 7'h69;
			7'b0011110: data = 7'h78;
			7'b0011111: data = 7'h00;
			// NatSemi version
			7'b0101010: data = 7'h5C;
			7'b0101011: data = 7'h63;
			7'b0101100: data = 7'h01;
			7'b0101101: data = 7'h40;
			7'b0101110: data = 7'h08;
			7'b0101111: data = 7'h00;
			// Toshiba version
			7'b0111010: data = 7'h3F;
			7'b0111011: data = 7'h06;
			7'b0111100: data = 7'h5B;
			7'b0111101: data = 7'h4F;
			7'b0111110: data = 7'h66;
			7'b0111111: data = 7'h6D;
			// lines version
			7'b1001010: data = 7'h08;
			7'b1001011: data = 7'h48;
			7'b1001100: data = 7'h49;
			7'b1001101: data = 7'h41;
			7'b1001110: data = 7'h01;
			7'b1001111: data = 7'h00;
			// Electronika version
			7'b1011010: data = 7'h40;
			7'b1011011: data = 7'h38;
			7'b1011100: data = 7'h39;
			7'b1011101: data = 7'h31;
			7'b1011110: data = 7'h79;
			7'b1011111: data = 7'h00;
			// Code B version
			7'b1101010: data = 7'h40;
			7'b1101011: data = 7'h79;
			7'b1101100: data = 7'h76;
			7'b1101101: data = 7'h38;
			7'b1101110: data = 7'h73;
			7'b1101111: data = 7'h00;
			// hexadecimal version
			7'b1111010: data = 7'h77;
			7'b1111011: data = 7'h7C;
			7'b1111100: data = 7'h39;
			7'b1111101: data = 7'h5E;
			7'b1111110: data = 7'h79;
			7'b1111111: data = 7'h71;
		endcase
	end

endmodule
