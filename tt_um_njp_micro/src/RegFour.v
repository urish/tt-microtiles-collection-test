// Four bit register
// Active High synchronous reset

module RegFour(output reg [3:0] data_out, input [3:0] data_in, input reg_clk, reg_rst, reg_en);

  always @ (posedge reg_clk) begin
    if (reg_rst)
      data_out <= 4'b0000;
    else if (reg_en)
      data_out <= data_in;
  end
  
endmodule
