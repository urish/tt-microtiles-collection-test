// Timing Generator - ring counter reset to 1000

module TimingGenerator(input timing_clk, timing_rst, output reg T0, T1, T2, T3);
  always @ (posedge timing_clk) begin
    if (timing_rst) begin T0 <= 1'b1; T1 <= 1'b0; T2 <= 1'b0; T3 <= 1'b0;
    end
    else begin T3 <= T2; T2 <= T1; T1 <= T0; T0 <= T3;
    end
end
endmodule
