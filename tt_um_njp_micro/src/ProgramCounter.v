// Five bit program counter can address a 32 line program

module ProgramCounter(input cnt_clk, cnt_rst, cnt_en, output reg [4:0] cnt);

  always @ (posedge cnt_clk) begin
    if (cnt_rst) cnt <= 5'b00000;
    else if (cnt_en)
    cnt <= cnt + 5'b00001;
  end

endmodule
