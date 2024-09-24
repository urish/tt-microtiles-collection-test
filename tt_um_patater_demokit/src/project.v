/*
 * Copyright 2024 Jaeden Amero
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_patater_demokit (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

  // VGA signals
  wire hsync;
  wire vsync;
  // Should we reg for the colors? No need, palette has reg for it.
  wire [1:0] R;
  wire [1:0] G;
  wire [1:0] B;
  wire display_on;
  wire [9:0] hpos;
  wire [9:0] vpos;
  wire [5:0] rrggbb;
  wire [7:0] waggle_color;

  wire [7:0] color;

  // TinyVGA PMOD
  assign uo_out = {hsync, B[0], G[0], R[0], vsync, B[1], G[1], R[1]};

  // All output pins must be assigned. If not used, assign to 0.
  assign uio_out = 0;
  assign uio_oe  = 0;

  hvsync_generator hvsync_gen(
     .clk(clk),
     .reset(~rst_n),
     .hsync(hsync),
     .vsync(vsync),
     .display_on(display_on),
     .hpos(hpos),
     .vpos(vpos)
  );

  palette palette_inst (
    .color(color),
    .rrggbb(rrggbb)
  );

  waggle waggle_demo (
    .vsync(vsync),
    .rst_n(rst_n),
    .frame(frame[7:0]),
    .hpos(hpos),
    .vpos(vpos),
    .dual(ui_in[0]),
    .h(ui_in[1]),
    .p0_off(ui_in[4:2]),
    .p1_off(ui_in[7:5]),
    .color(waggle_color)
  );

  // List all unused inputs to prevent warnings
  wire _unused = &{ena, ui_in[7:3], uio_in, 1'b0};

  assign color = waggle_color;

  assign R = display_on ? rrggbb[5:4] : 2'b00;
  assign G = display_on ? rrggbb[3:2] : 2'b00;
  assign B = display_on ? rrggbb[1:0] : 2'b00;

  reg [9:0] frame;
  always @(posedge vsync or negedge rst_n) begin
    if (~rst_n) begin
      frame <= 0;
    end else begin
      frame <= frame + 1;
    end
  end

endmodule

module waggle (vsync, rst_n, frame, hpos, vpos, h, dual, p0_off, p1_off, color);
  input wire vsync;
  input wire rst_n;
  input wire [7:0] frame;
  input wire [9:0] hpos;
  input wire [9:0] vpos;
  input wire h;
  input wire dual;
  input wire [2:0] p0_off;
  input wire [2:0] p1_off;
  output wire [7:0] color;

  wire signed [9:0] xsine_out;
  wire signed [9:0] ysine_out;

  wire [9:0] u;
  wire [9:0] v;
  // List all unused inputs to prevent warnings
  wire _unused = &{u[9:8], v[9:8]};

  reg [9:0] xpos;
  reg [9:0] ypos;
  reg [9:0] p0;
  reg [9:0] p1;

  always @(posedge vsync or negedge rst_n) begin
    if (~rst_n) begin
      xpos <= 0;
      ypos <= 0;
      p0 <= 0;
      p1 <= 0;
    end else begin
      p0 <= p0 + (10'd2 << p0_off);
      p1 <= p1 + (10'd3 << p1_off);
      xpos <= xpos + 10'd1;
      ypos <= ypos + 10'd2;
    end
  end

  sine xsine(
    .x(xsine_in),
    .y(ysine_in),
    .xout(xsine_out),
    .yout(ysine_out)
  );

  wire signed [9:0] xsine_in;
  wire signed [9:0] ysine_in;
  wire signed [9:0] xasine;
  wire signed [9:0] yasine;

  assign xsine_in = vpos + p0;
  assign xasine = xsine_out >>> 2;
  assign u = hpos + (dual ? (vpos[0] ? -xasine : xasine) : xasine) - xpos;

  assign ysine_in = (h ? hpos : vpos) + p1;
  assign yasine = ysine_out >>> 2;
  assign v = vpos + yasine - ypos;

  // Color with palette shift
  assign color = (u[7:0] ^ v[7:0]) + (frame << 1);

endmodule

module sine (x, y, xout, yout);
  input wire[9:0] x;
  input wire[9:0] y;
  output wire[9:0] xout;
  output wire[9:0] yout;

  reg [9:0] sine_lut[255:0];

  wire [1:0] xquadrant;
  wire [1:0] yquadrant;
  wire [7:0] xaddr;
  wire [7:0] yaddr;

  assign xquadrant = x[9:8];
  assign yquadrant = y[9:8];

  // Mirror quadrants 1 and 3
  assign xaddr = (xquadrant == 2'd1 || xquadrant == 2'd3) ? 8'd255 - x[7:0] :
                 x[7:0];
  assign yaddr = (yquadrant == 2'd1 || yquadrant == 2'd3) ? 8'd255 - y[7:0] :
                 y[7:0];

  // Negate quadrants 2 and 3
  assign xout = (xquadrant == 2'd2 || xquadrant == 2'd3) ? -sine_lut[xaddr] :
                sine_lut[xaddr];
  assign yout = (yquadrant == 2'd2 || yquadrant == 2'd3) ? -sine_lut[yaddr] :
                sine_lut[yaddr];

  initial begin
    sine_lut[0] = 10'd0;
    sine_lut[1] = 10'd1;
    sine_lut[2] = 10'd3;
    sine_lut[3] = 10'd5;
    sine_lut[4] = 10'd7;
    sine_lut[5] = 10'd9;
    sine_lut[6] = 10'd11;
    sine_lut[7] = 10'd13;
    sine_lut[8] = 10'd15;
    sine_lut[9] = 10'd17;
    sine_lut[10] = 10'd19;
    sine_lut[11] = 10'd21;
    sine_lut[12] = 10'd23;
    sine_lut[13] = 10'd25;
    sine_lut[14] = 10'd27;
    sine_lut[15] = 10'd29;
    sine_lut[16] = 10'd31;
    sine_lut[17] = 10'd33;
    sine_lut[18] = 10'd35;
    sine_lut[19] = 10'd37;
    sine_lut[20] = 10'd39;
    sine_lut[21] = 10'd41;
    sine_lut[22] = 10'd43;
    sine_lut[23] = 10'd45;
    sine_lut[24] = 10'd46;
    sine_lut[25] = 10'd48;
    sine_lut[26] = 10'd50;
    sine_lut[27] = 10'd52;
    sine_lut[28] = 10'd54;
    sine_lut[29] = 10'd56;
    sine_lut[30] = 10'd58;
    sine_lut[31] = 10'd60;
    sine_lut[32] = 10'd62;
    sine_lut[33] = 10'd64;
    sine_lut[34] = 10'd66;
    sine_lut[35] = 10'd68;
    sine_lut[36] = 10'd70;
    sine_lut[37] = 10'd72;
    sine_lut[38] = 10'd73;
    sine_lut[39] = 10'd75;
    sine_lut[40] = 10'd77;
    sine_lut[41] = 10'd79;
    sine_lut[42] = 10'd81;
    sine_lut[43] = 10'd83;
    sine_lut[44] = 10'd85;
    sine_lut[45] = 10'd87;
    sine_lut[46] = 10'd89;
    sine_lut[47] = 10'd91;
    sine_lut[48] = 10'd92;
    sine_lut[49] = 10'd94;
    sine_lut[50] = 10'd96;
    sine_lut[51] = 10'd98;
    sine_lut[52] = 10'd100;
    sine_lut[53] = 10'd102;
    sine_lut[54] = 10'd104;
    sine_lut[55] = 10'd105;
    sine_lut[56] = 10'd107;
    sine_lut[57] = 10'd109;
    sine_lut[58] = 10'd111;
    sine_lut[59] = 10'd113;
    sine_lut[60] = 10'd115;
    sine_lut[61] = 10'd116;
    sine_lut[62] = 10'd118;
    sine_lut[63] = 10'd120;
    sine_lut[64] = 10'd122;
    sine_lut[65] = 10'd124;
    sine_lut[66] = 10'd126;
    sine_lut[67] = 10'd127;
    sine_lut[68] = 10'd129;
    sine_lut[69] = 10'd131;
    sine_lut[70] = 10'd133;
    sine_lut[71] = 10'd135;
    sine_lut[72] = 10'd136;
    sine_lut[73] = 10'd138;
    sine_lut[74] = 10'd140;
    sine_lut[75] = 10'd142;
    sine_lut[76] = 10'd143;
    sine_lut[77] = 10'd145;
    sine_lut[78] = 10'd147;
    sine_lut[79] = 10'd149;
    sine_lut[80] = 10'd150;
    sine_lut[81] = 10'd152;
    sine_lut[82] = 10'd154;
    sine_lut[83] = 10'd156;
    sine_lut[84] = 10'd157;
    sine_lut[85] = 10'd159;
    sine_lut[86] = 10'd161;
    sine_lut[87] = 10'd162;
    sine_lut[88] = 10'd164;
    sine_lut[89] = 10'd166;
    sine_lut[90] = 10'd167;
    sine_lut[91] = 10'd169;
    sine_lut[92] = 10'd171;
    sine_lut[93] = 10'd172;
    sine_lut[94] = 10'd174;
    sine_lut[95] = 10'd176;
    sine_lut[96] = 10'd177;
    sine_lut[97] = 10'd179;
    sine_lut[98] = 10'd181;
    sine_lut[99] = 10'd182;
    sine_lut[100] = 10'd184;
    sine_lut[101] = 10'd185;
    sine_lut[102] = 10'd187;
    sine_lut[103] = 10'd189;
    sine_lut[104] = 10'd190;
    sine_lut[105] = 10'd192;
    sine_lut[106] = 10'd193;
    sine_lut[107] = 10'd195;
    sine_lut[108] = 10'd196;
    sine_lut[109] = 10'd198;
    sine_lut[110] = 10'd199;
    sine_lut[111] = 10'd201;
    sine_lut[112] = 10'd203;
    sine_lut[113] = 10'd204;
    sine_lut[114] = 10'd206;
    sine_lut[115] = 10'd207;
    sine_lut[116] = 10'd209;
    sine_lut[117] = 10'd210;
    sine_lut[118] = 10'd211;
    sine_lut[119] = 10'd213;
    sine_lut[120] = 10'd214;
    sine_lut[121] = 10'd216;
    sine_lut[122] = 10'd217;
    sine_lut[123] = 10'd219;
    sine_lut[124] = 10'd220;
    sine_lut[125] = 10'd222;
    sine_lut[126] = 10'd223;
    sine_lut[127] = 10'd224;
    sine_lut[128] = 10'd226;
    sine_lut[129] = 10'd227;
    sine_lut[130] = 10'd229;
    sine_lut[131] = 10'd230;
    sine_lut[132] = 10'd231;
    sine_lut[133] = 10'd233;
    sine_lut[134] = 10'd234;
    sine_lut[135] = 10'd235;
    sine_lut[136] = 10'd237;
    sine_lut[137] = 10'd238;
    sine_lut[138] = 10'd239;
    sine_lut[139] = 10'd241;
    sine_lut[140] = 10'd242;
    sine_lut[141] = 10'd243;
    sine_lut[142] = 10'd244;
    sine_lut[143] = 10'd246;
    sine_lut[144] = 10'd247;
    sine_lut[145] = 10'd248;
    sine_lut[146] = 10'd249;
    sine_lut[147] = 10'd251;
    sine_lut[148] = 10'd252;
    sine_lut[149] = 10'd253;
    sine_lut[150] = 10'd254;
    sine_lut[151] = 10'd255;
    sine_lut[152] = 10'd257;
    sine_lut[153] = 10'd258;
    sine_lut[154] = 10'd259;
    sine_lut[155] = 10'd260;
    sine_lut[156] = 10'd261;
    sine_lut[157] = 10'd262;
    sine_lut[158] = 10'd263;
    sine_lut[159] = 10'd264;
    sine_lut[160] = 10'd266;
    sine_lut[161] = 10'd267;
    sine_lut[162] = 10'd268;
    sine_lut[163] = 10'd269;
    sine_lut[164] = 10'd270;
    sine_lut[165] = 10'd271;
    sine_lut[166] = 10'd272;
    sine_lut[167] = 10'd273;
    sine_lut[168] = 10'd274;
    sine_lut[169] = 10'd275;
    sine_lut[170] = 10'd276;
    sine_lut[171] = 10'd277;
    sine_lut[172] = 10'd278;
    sine_lut[173] = 10'd279;
    sine_lut[174] = 10'd280;
    sine_lut[175] = 10'd281;
    sine_lut[176] = 10'd282;
    sine_lut[177] = 10'd283;
    sine_lut[178] = 10'd284;
    sine_lut[179] = 10'd284;
    sine_lut[180] = 10'd285;
    sine_lut[181] = 10'd286;
    sine_lut[182] = 10'd287;
    sine_lut[183] = 10'd288;
    sine_lut[184] = 10'd289;
    sine_lut[185] = 10'd290;
    sine_lut[186] = 10'd290;
    sine_lut[187] = 10'd291;
    sine_lut[188] = 10'd292;
    sine_lut[189] = 10'd293;
    sine_lut[190] = 10'd294;
    sine_lut[191] = 10'd294;
    sine_lut[192] = 10'd295;
    sine_lut[193] = 10'd296;
    sine_lut[194] = 10'd297;
    sine_lut[195] = 10'd297;
    sine_lut[196] = 10'd298;
    sine_lut[197] = 10'd299;
    sine_lut[198] = 10'd299;
    sine_lut[199] = 10'd300;
    sine_lut[200] = 10'd301;
    sine_lut[201] = 10'd301;
    sine_lut[202] = 10'd302;
    sine_lut[203] = 10'd303;
    sine_lut[204] = 10'd303;
    sine_lut[205] = 10'd304;
    sine_lut[206] = 10'd305;
    sine_lut[207] = 10'd305;
    sine_lut[208] = 10'd306;
    sine_lut[209] = 10'd306;
    sine_lut[210] = 10'd307;
    sine_lut[211] = 10'd307;
    sine_lut[212] = 10'd308;
    sine_lut[213] = 10'd308;
    sine_lut[214] = 10'd309;
    sine_lut[215] = 10'd309;
    sine_lut[216] = 10'd310;
    sine_lut[217] = 10'd310;
    sine_lut[218] = 10'd311;
    sine_lut[219] = 10'd311;
    sine_lut[220] = 10'd312;
    sine_lut[221] = 10'd312;
    sine_lut[222] = 10'd313;
    sine_lut[223] = 10'd313;
    sine_lut[224] = 10'd313;
    sine_lut[225] = 10'd314;
    sine_lut[226] = 10'd314;
    sine_lut[227] = 10'd314;
    sine_lut[228] = 10'd315;
    sine_lut[229] = 10'd315;
    sine_lut[230] = 10'd315;
    sine_lut[231] = 10'd316;
    sine_lut[232] = 10'd316;
    sine_lut[233] = 10'd316;
    sine_lut[234] = 10'd317;
    sine_lut[235] = 10'd317;
    sine_lut[236] = 10'd317;
    sine_lut[237] = 10'd317;
    sine_lut[238] = 10'd318;
    sine_lut[239] = 10'd318;
    sine_lut[240] = 10'd318;
    sine_lut[241] = 10'd318;
    sine_lut[242] = 10'd318;
    sine_lut[243] = 10'd318;
    sine_lut[244] = 10'd319;
    sine_lut[245] = 10'd319;
    sine_lut[246] = 10'd319;
    sine_lut[247] = 10'd319;
    sine_lut[248] = 10'd319;
    sine_lut[249] = 10'd319;
    sine_lut[250] = 10'd319;
    sine_lut[251] = 10'd319;
    sine_lut[252] = 10'd319;
    sine_lut[253] = 10'd319;
    sine_lut[254] = 10'd319;
    sine_lut[255] = 10'd319;
  end

endmodule

module palette (color, rrggbb);
  input wire [7:0] color;
  output wire [5:0] rrggbb;

  reg [5:0] palette;

  always @(color) begin
    case(1)
      color < 14: palette = 6'b110000;
      color >= 14 && color < 28: palette = 6'b110100;
      color >= 28 && color < 43: palette = 6'b111000;
      color >= 43 && color < 57: palette = 6'b111100;
      color >= 57 && color < 71: palette = 6'b101100;
      color >= 71 && color < 85: palette = 6'b011100;
      color >= 85 && color < 100: palette = 6'b001100;
      color >= 100 && color < 114: palette = 6'b001101;
      color >= 114 && color < 128: palette = 6'b001110;
      color >= 128 && color < 142: palette = 6'b001111;
      color >= 142 && color < 156: palette = 6'b001011;
      color >= 156 && color < 171: palette = 6'b000111;
      color >= 171 && color < 185: palette = 6'b000011;
      color >= 185 && color < 199: palette = 6'b010011;
      color >= 199 && color < 213: palette = 6'b100011;
      color >= 213 && color < 228: palette = 6'b110011;
      color >= 228 && color < 242: palette = 6'b110010;
      color >= 242: palette = 6'b110001;
    endcase
  end

  assign rrggbb = palette;
endmodule
