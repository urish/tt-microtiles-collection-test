// Eight bit register
// Active High synchronous reset

module RegEight(output reg [7:0] data_out, input [7:0] data_in, input reg_clk, reg_rst, reg_en);

  always @ (posedge reg_clk) begin
    if (reg_rst)
      data_out <= 8'b00000000;
    else if (reg_en)
      data_out <= data_in;
end
endmodule
