// Datapath Unit

module DataPath(input sys_rst, sys_clk, input [3:0] inputA, inputB, input enA, enB, ABsel, sr_c1, sr_c0, enSR, SRsel, alu_c2, alu_c1, alu_c0, enACC, clrACC, enDPO, output [7:0] SMP_out, output flag);
  
  wire rstACC;
  wire [3:0] dataA, dataB, dataC;
  wire [7:0] dataC8bit, shift_out, ALU_X, ALU_Y, ALU_out, ACC_out;
  
  assign rstACC = sys_rst | clrACC;   // Enable an instruction to clear the accumulator register as well as the system reset
  assign dataC8bit = {4'b0000,dataC}; // Pad dataC to eight bits
  
  RegFour AReg(.reg_clk(sys_clk), .reg_rst(sys_rst), .reg_en(enA), .data_in(inputA), .data_out(dataA));
  RegFour BReg(.reg_clk(sys_clk), .reg_rst(sys_rst), .reg_en(enB), .data_in(inputB), .data_out(dataB));
  Mux2to1V1 ABMux(.A(dataA), .B(dataB), .sel(ABsel), .Y(dataC));
  UniversalShiftReg Shifter(.srdata_in(dataC8bit),  .sr_clk(sys_clk), .sr_rst(sys_rst), .sr_en(enSR), .sr_c1(sr_c1), .sr_c0(sr_c0), .srdata_out(shift_out), .flag(flag) );
  Mux2to1V2 ShifterMux(.A(dataC), .B(shift_out), .sel(SRsel), .Y(ALU_Y));
  ALU ALU(.X(ACC_out), .Y(ALU_Y), .F(ALU_out), .alu_c2(alu_c2), .alu_c1(alu_c1), .alu_c0(alu_c0));
  RegEight ACC_Reg(.reg_clk(sys_clk), .reg_rst(rstACC), .reg_en(enACC), .data_in(ALU_out), .data_out(ACC_out));
  RegEight DPO_Reg(.reg_clk(sys_clk), .reg_rst(sys_rst), .reg_en(enDPO), .data_in(ACC_out), .data_out(SMP_out));
  
endmodule
