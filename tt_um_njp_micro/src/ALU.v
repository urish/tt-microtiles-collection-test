// ALU for instructions specified

module ALU(output reg [7:0] F, input [7:0] X, input [7:0] Y, input alu_c2, alu_c1, alu_c0);
  always @ *
    case ({alu_c2, alu_c1, alu_c0})
      3'b000 : F = X + Y;   // Addition
      3'b001 : F = X - Y;   // Subtraction
      3'b100 : F = ~X;      // Invert
      3'b101 : F = X & Y;   // AND
      3'b110 : F = X | Y;   // OR
      3'b111 : F = X ^ Y;   // XOR
      default  F = 0;
    endcase
endmodule
