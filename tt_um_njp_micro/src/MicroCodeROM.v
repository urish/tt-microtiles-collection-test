module MicroCodeROM(input [4:0] addr, output reg [3:0]data);

  always @ (*)  // every time there is a change of address .....

	case(addr)
	5'b00000 : data = 4'b0000;  // case statement uses address to 
	5'b00001 : data = 4'b0001;  // give data value.
	5'b00010 : data = 4'b0100;  // 5 bit binary address followed by 
	5'b00011 : data = 4'b0101;  // 4 bit binary data.
	5'b00100 : data = 4'b0111;
	5'b00101 : data = 4'b0101;
	5'b00110 : data = 4'b0011;
	5'b00111 : data = 4'b0110;
	5'b01000 : data = 4'b1000;
	5'b01001 : data = 4'b0100;
	5'b01010 : data = 4'b0101;
	5'b01011 : data = 4'b0101;
	5'b01100 : data = 4'b0101;
	5'b01101 : data = 4'b0011;
	5'b01110 : data = 4'b0110;
	5'b01111 : data = 4'b0110;
	5'b10000 : data = 4'b1000;
	5'b10001 : data = 4'b0100;
	5'b10010 : data = 4'b0101;
	5'b10011 : data = 4'b0101;
	5'b10100 : data = 4'b0101;
	5'b10101 : data = 4'b0101;
	5'b10110 : data = 4'b0011;
	5'b10111 : data = 4'b0110;
	5'b11000 : data = 4'b0110;
	5'b11001 : data = 4'b0110;
	5'b11010 : data = 4'b1000;
	5'b11011 : data = 4'b0010;
	5'b11100 : data = 4'b1111;
	5'b11101 : data = 4'b1111;
	5'b11110 : data = 4'b1111;
	5'b11111 : data = 4'b1111;
    endcase
endmodule
