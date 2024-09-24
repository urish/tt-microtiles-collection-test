module ControlUnit(input sys_clk, sys_rst, flag, output C0, C1, C2, C3, C4, C5, C6, C7, C8, C9, C10, C11, C12);
  
  wire [4:0] addr;
  wire [3:0] data, opcode;
  wire T0, T1, T2, T3;
  
  TimingGenerator P1(.timing_clk(sys_clk), .timing_rst(sys_rst), .T0(T0), .T1(T1), .T2(T2), .T3(T3));

  ProgramCounter P2(.cnt_clk(sys_clk), .cnt_rst(sys_rst), .cnt_en(T3), .cnt(addr));
  
  MicroCodeROM P3(.data(data), .addr(addr));
  
  RegFour P4(.reg_clk(sys_clk), .reg_rst(sys_rst), .reg_en(T0), .data_in(data), .data_out(opcode));
  
  Decoder P5(.opcode(opcode), .flag(flag), .T2(T2), .C0(C0), .C1(C1), .C2(C2), .C3(C3), .C4(C4), .C5(C5), .C6(C6), .C7(C7), .C8(C8), .C9(C9), .C10(C10), .C11(C11), .C12(C12));
  
endmodule
