// Eight bit shift register, control lines c1 c0
// 00 no change, 01 shift right, 10 shift left, 11 parallel load
// For a right shift, the lost LSB is captured as a 'flag' bit

module UniversalShiftReg(input [7:0] srdata_in, input sr_clk, sr_rst, sr_en, sr_c1, sr_c0, output reg [7:0] srdata_out, output reg flag);
  
  always @ (posedge sr_clk) begin
    if (sr_rst) begin srdata_out <= 8'b00000000; flag <= 0; end
    else if (sr_en) begin 
      case ({sr_c1, sr_c0})
      // no change
      0: srdata_out <= srdata_out;
      // shift right with zero fill and catch the flag bit
      1: begin srdata_out <= {1'b0, srdata_out[7:1]}; flag <= srdata_out[0];
         end
      // shift left with zero fill
      2: srdata_out <= {srdata_out[6:0],1'b0};
      // parallel load
      3: srdata_out <= srdata_in;
      default srdata_out <= 8'b00000000;
      endcase
    end
  end
endmodule
