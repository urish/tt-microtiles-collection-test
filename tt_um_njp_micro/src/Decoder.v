// Decode each instruction with a 4-to-1 decoder
// Produce the control signals C0 to C12 from a control truth table
// For execution commands (register enables) AND with T2

module Decoder(input [3:0] opcode, input flag, T2, output C0, C1, C2, C3, C4, C5, C6, C7, C8, C9, C10, C11, C12);
  
  reg [15:0] Z;
  
  always @ *
  begin
    Z = 0;
    case (opcode)
        4'b0000 : Z = 16'h0001;
        4'b0001 : Z = 16'h0002;
        4'b0010 : Z = 16'h0004;
        4'b0011 : Z = 16'h0008;
        4'b0100 : Z = 16'h0010;
        4'b0101 : Z = 16'h0020;
        4'b0110 : Z = 16'h0040;
        4'b0111 : Z = 16'h0080;
        4'b1000 : Z = 16'h0100;
        4'b1001 : Z = 16'h0200;
        4'b1010 : Z = 16'h0400;
        4'b1011 : Z = 16'h0800;
        4'b1100 : Z = 16'h1000;
        4'b1101 : Z = 16'h2000;
        4'b1110 : Z = 16'h4000;
        4'b1111 : Z = 16'h8000;
      endcase
  end
  
  assign C0 = Z[0] & T2;                                                                      // enable A register
  assign C1 = Z[1] & T2;                                                                      // enable B register
  assign C2 = Z[2] & T2;                                                                      // enable output register
  assign C3 = Z[4];                                                                           // steer A/B to shifter
  assign C4 = Z[3] | Z[4] | Z[6];                                                             // shifter confic c1
  assign C5 = Z[3] | Z[4] | Z[5];                                                             // shifter config c0 
  assign C6 = (Z[3] | Z[4] | Z[5] | Z[6]) & T2;                                               // enable shifter
  assign C7 = Z[7];                                                                           // steer A/shifter to ALU
  assign C8 = flag & Z[11] & Z[12] & Z[13] & Z[14] & Z[15];                                   // ALU config bit co
  assign C9 = Z[10] & Z[12] & Z[12] & Z[14];                                                  // ALU config bit c1
  assign C10 = Z[10] & Z[12] & Z[14];                                                         // ALU config bit c2
  assign C11 = (((Z[7] | Z[8]) & flag) | Z[9] | Z[10] | Z[11] | Z[12] | Z[13] | Z[14]) & T2;  // enable accumulator
  assign C12 = Z[15] & T2;                                                                    // enable output register 
endmodule
