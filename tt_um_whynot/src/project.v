`define BASIC 1
`define SPLIT_INOUTS
/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

// for tinytapeout we target ice40, but then replace SB_IO cells
// by a custom implementation
`define ICE40 1
`define SIM_SB_IO 1

module tt_um_whynot (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

  // https://tinytapeout.com/specs/pinouts/

  // register reset
  reg rst_n_q;
  always @(posedge clk) begin
    rst_n_q <= rst_n;
  end

  M_main main(

    .in_ui(ui_in),
    .out_uo(uo_out),

    .inout_uio_i(uio_in),
    .inout_uio_o(uio_out),
    .inout_uio_oe(uio_oe),

    .in_run(1'b1),
    .reset(~rst_n_q),
    .clock(clk)
  );

  //              vvvvv inputs when in reset to allow PMOD external takeover
  // assign uio_oe = rst_n ? {1'b1,1'b1,main_uio_oe[3],main_uio_oe[2],1'b1,main_uio_oe[1],main_uio_oe[0],1'b1} : 8'h00;

endmodule

module M_vga_M_main_demo_vga (
out_vga_hs,
out_vga_vs,
out_active,
out_vblank,
out_vga_x,
out_vga_y,
reset,
out_clock,
clock
);
output  [0:0] out_vga_hs;
output  [0:0] out_vga_vs;
output  [0:0] out_active;
output  [0:0] out_vblank;
output  [11:0] out_vga_x;
output  [10:0] out_vga_y;
input reset;
output out_clock;
input clock;
assign out_clock = clock;

reg signed [10:0] _d_xcount;
reg signed [10:0] _q_xcount;
reg signed [9:0] _d_ycount;
reg signed [9:0] _q_ycount;
reg  [0:0] _d_active_h;
reg  [0:0] _q_active_h;
reg  [0:0] _d_active_v;
reg  [0:0] _q_active_v;
reg  [0:0] _d_vga_hs;
reg  [0:0] _q_vga_hs;
reg  [0:0] _d_vga_vs;
reg  [0:0] _q_vga_vs;
reg  [0:0] _d_active;
reg  [0:0] _q_active;
reg  [0:0] _d_vblank;
reg  [0:0] _q_vblank;
reg  [11:0] _d_vga_x;
reg  [11:0] _q_vga_x;
reg  [10:0] _d_vga_y;
reg  [10:0] _q_vga_y;
assign out_vga_hs = _q_vga_hs;
assign out_vga_vs = _q_vga_vs;
assign out_active = _q_active;
assign out_vblank = _q_vblank;
assign out_vga_x = _q_vga_x;
assign out_vga_y = _q_vga_y;



`ifdef FORMAL
initial begin
assume(reset);
end
`endif
always @* begin
_d_xcount = _q_xcount;
_d_ycount = _q_ycount;
_d_active_h = _q_active_h;
_d_active_v = _q_active_v;
_d_vga_hs = _q_vga_hs;
_d_vga_vs = _q_vga_vs;
_d_active = _q_active;
_d_vblank = _q_vblank;
_d_vga_x = _q_vga_x;
_d_vga_y = _q_vga_y;
// _always_pre
// __block_1
_d_active_h = _q_xcount==0 ? 1:_q_xcount==640 ? 0:_q_active_h;

_d_active_v = _q_ycount==0 ? 1:_q_ycount==480 ? 0:_q_active_v;

_d_active = _d_active_h&&_d_active_v;

_d_vga_x = _d_active_h ? _q_xcount:0;

_d_vga_y = _d_active_v ? _q_ycount:0;

_d_vga_hs = _q_xcount==-144 ? 0:_q_xcount==-49 ? 1:_q_vga_hs;

_d_vga_vs = _q_ycount==-35 ? 0:_q_ycount==-34 ? 1:_q_vga_vs;

_d_vblank = _q_ycount[9+:1];

if (_q_xcount==640) begin
// __block_2
// __block_4
_d_xcount = $signed(-159);

if (_q_ycount==480) begin
// __block_5
// __block_7
_d_ycount = $signed(-44);

// __block_8
end else begin
// __block_6
// __block_9
_d_ycount = _q_ycount+1;

// __block_10
end
// 'after'
// __block_11
// __block_12
end else begin
// __block_3
// __block_13
_d_xcount = _q_xcount+1;

// __block_14
end
// 'after'
// __block_15
// __block_16
// _always_post
// pipeline stage triggers
end

always @(posedge clock) begin
_q_xcount <= (reset) ? 0 : _d_xcount;
_q_ycount <= (reset) ? 0 : _d_ycount;
_q_active_h <= (reset) ? 0 : _d_active_h;
_q_active_v <= (reset) ? 0 : _d_active_v;
_q_vga_hs <= _d_vga_hs;
_q_vga_vs <= _d_vga_vs;
_q_active <= _d_active;
_q_vblank <= _d_vblank;
_q_vga_x <= _d_vga_x;
_q_vga_y <= _d_vga_y;
end

endmodule

// ==== defines ====
`undef  _c___block_1_next_sample
`define _c___block_1_next_sample (1'((_q_clock_count[0+:9]==0)))
`undef  _c___block_1_sum
`define _c___block_1_sum (9'(_w_squ_wave))
`undef  _c___block_1_next_inc
`define _c___block_1_next_inc (1'(`_c___block_1_next_sample&&(_q_rythm_count[0+:8]==8'd0)))
`undef  _c___block_1_next_note
`define _c___block_1_next_note (1'(_q_rythm_count[8+:5]==5'd25))
`undef  _c___block_1_smpl
`define _c___block_1_smpl (7'($unsigned($signed(_t_audio8)+$signed(8'd64))))
// ===============

module M_music_M_main_demo_zic (
out_audio8,
out_audio1,
reset,
out_clock,
clock
);
output signed [7:0] out_audio8;
output  [0:0] out_audio1;
input reset;
output out_clock;
input clock;
assign out_clock = clock;
reg signed [7:0] _t_audio8;
reg  [0:0] _t_audio1;
wire signed [7:0] _w_squ_wave;

reg  [4:0] _d_idx;
reg  [4:0] _q_idx;
reg  [8:0] _d_clock_count;
reg  [8:0] _q_clock_count;
reg  [12:0] _d_rythm_count;
reg  [12:0] _q_rythm_count;
reg  [12:0] _d_qpos;
reg  [12:0] _q_qpos;
reg  [5:0] _d_squ_env;
reg  [5:0] _q_squ_env;
assign out_audio8 = _t_audio8;
assign out_audio1 = _t_audio1;


assign _w_squ_wave = _q_qpos[12+:1] ? _q_squ_env[3+:3]:-_q_squ_env[3+:3];

`ifdef FORMAL
initial begin
assume(reset);
end
`endif
always @* begin
_d_idx = _q_idx;
_d_clock_count = _q_clock_count;
_d_rythm_count = _q_rythm_count;
_d_qpos = _q_qpos;
_d_squ_env = _q_squ_env;
// _always_pre
// __block_1


_t_audio8 = ($signed(`_c___block_1_sum)>>>1);

_d_qpos = `_c___block_1_next_sample ? (_q_qpos+_c_keys[_q_idx]):_q_qpos;



_d_idx = `_c___block_1_next_note ? (_q_idx+1):_q_idx;

_d_squ_env = `_c___block_1_next_note ? {6{|_c_keys[_d_idx]}}:(`_c___block_1_next_inc ? ((_q_squ_env!=0) ? _q_squ_env-1:0):_q_squ_env);

_d_rythm_count = `_c___block_1_next_note ? 0:(`_c___block_1_next_sample ? _q_rythm_count+1:_q_rythm_count);


_t_audio1 = _q_clock_count[0+:7]<`_c___block_1_smpl ? 1'b1:1'b0;

_d_clock_count = (_q_clock_count+1);

// __block_2
// _always_post
// pipeline stage triggers
end
// ==== wires ====
wire  [4:0] _c_keys[31:0];
assign _c_keys[0] = 10;
assign _c_keys[1] = 10;
assign _c_keys[2] = 21;
assign _c_keys[3] = 10;
assign _c_keys[4] = 10;
assign _c_keys[5] = 18;
assign _c_keys[6] = 10;
assign _c_keys[7] = 10;
assign _c_keys[8] = 15;
assign _c_keys[9] = 10;
assign _c_keys[10] = 10;
assign _c_keys[11] = 15;
assign _c_keys[12] = 10;
assign _c_keys[13] = 10;
assign _c_keys[14] = 15;
assign _c_keys[15] = 15;
assign _c_keys[16] = 10;
assign _c_keys[17] = 10;
assign _c_keys[18] = 21;
assign _c_keys[19] = 10;
assign _c_keys[20] = 10;
assign _c_keys[21] = 18;
assign _c_keys[22] = 10;
assign _c_keys[23] = 10;
assign _c_keys[24] = 15;
assign _c_keys[25] = 10;
assign _c_keys[26] = 10;
assign _c_keys[27] = 15;
assign _c_keys[28] = 0;
assign _c_keys[29] = 0;
assign _c_keys[30] = 0;
assign _c_keys[31] = 0;
// ===============

always @(posedge clock) begin
_q_idx <= (reset) ? 0 : _d_idx;
_q_clock_count <= (reset) ? 0 : _d_clock_count;
_q_rythm_count <= (reset) ? 0 : _d_rythm_count;
_q_qpos <= (reset) ? 0 : _d_qpos;
_q_squ_env <= (reset) ? 0 : _d_squ_env;
end

endmodule

// ==== defines ====
`undef  _c___block_1_pidA
`define _c___block_1_pidA (5'(_c_doomhead[_q_addr]))
`undef  _c___block_1_palA
`define _c___block_1_palA (12'(_c_sub666[`_c___block_1_pidA]))
`undef  _c___block_1_i
`define _c___block_1_i (5'((_t___block_1_ru[3+:5]+_q_frame[3+:5])))
`undef  _c___block_1_clip
`define _c___block_1_clip (1'(`_c___block_1_i<5'd24))
`undef  _c___block_1_j
`define _c___block_1_j (5'(_t___block_1_rv[3+:5]))
`undef  _c___block_1_bval4
`define _c___block_1_bval4 (4'({_t___block_1_q4[0+:1],_t___block_1_p4[0+:1],_t___block_1_q4[1+:1],_t___block_1_p4[1+:1]}^{4{_q_frame[0+:1]}}))
`undef  _c___block_1_frame_tick
`define _c___block_1_frame_tick (1'(_q_prev_vs&~_w_vga_vga_vs))
`undef  _c___block_1_tri
`define _c___block_1_tri (8'({_d_frame[1+:8]^{8{_d_frame[9+:1]}}}))
`undef  _c___block_1_line_tick
`define _c___block_1_line_tick (1'(_q_prev_hs&~_w_vga_vga_hs))
// ===============

module M_vga_demo_M_main_demo (
out_video_r,
out_video_g,
out_video_b,
out_video_hs,
out_video_vs,
out_audio8,
out_audio1,
reset,
out_clock,
clock
);
output  [1:0] out_video_r;
output  [1:0] out_video_g;
output  [1:0] out_video_b;
output  [0:0] out_video_hs;
output  [0:0] out_video_vs;
output  [7:0] out_audio8;
output  [0:0] out_audio1;
input reset;
output out_clock;
input clock;
assign out_clock = clock;
wire  [0:0] _w_vga_vga_hs;
wire  [0:0] _w_vga_vga_vs;
wire  [0:0] _w_vga_active;
wire  [0:0] _w_vga_vblank;
wire  [11:0] _w_vga_vga_x;
wire  [10:0] _w_vga_vga_y;
wire signed [7:0] _w_zic_audio8;
wire  [0:0] _w_zic_audio1;
reg  [8:0] _t___block_1_ru;
reg  [8:0] _t___block_1_rv;
reg  [17:0] _t___block_1_pal;
reg  [3:0] _t___block_1_p4;
reg  [1:0] _t___block_1_q4;
reg  [5:0] _t___block_1_l_r;
reg  [5:0] _t___block_1_l_g;
reg  [5:0] _t___block_1_l_b;
reg  [1:0] _t_video_r;
reg  [1:0] _t_video_g;
reg  [1:0] _t_video_b;
reg  [0:0] _t_video_hs;
reg  [0:0] _t_video_vs;

reg  [0:0] _d_prev_vs;
reg  [0:0] _q_prev_vs;
reg  [0:0] _d_prev_hs;
reg  [0:0] _q_prev_hs;
reg  [9:0] _d_frame;
reg  [9:0] _q_frame;
reg signed [7:0] _d_u;
reg signed [7:0] _q_u;
reg  [11:0] _d_uT;
reg  [11:0] _q_uT;
reg signed [7:0] _d_v;
reg signed [7:0] _q_v;
reg  [11:0] _d_vT;
reg  [11:0] _q_vT;
reg  [9:0] _d_addr;
reg  [9:0] _q_addr;
assign out_video_r = _t_video_r;
assign out_video_g = _t_video_g;
assign out_video_b = _t_video_b;
assign out_video_hs = _t_video_hs;
assign out_video_vs = _t_video_vs;
assign out_audio8 = _w_zic_audio8;
assign out_audio1 = _w_zic_audio1;
M_vga_M_main_demo_vga vga (
.out_vga_hs(_w_vga_vga_hs),
.out_vga_vs(_w_vga_vga_vs),
.out_active(_w_vga_active),
.out_vblank(_w_vga_vblank),
.out_vga_x(_w_vga_vga_x),
.out_vga_y(_w_vga_vga_y),
.reset(reset),
.clock(clock));
M_music_M_main_demo_zic zic (
.out_audio8(_w_zic_audio8),
.out_audio1(_w_zic_audio1),
.reset(reset),
.clock(clock));



`ifdef FORMAL
initial begin
assume(reset);
end
`endif
always @* begin
_d_prev_vs = _q_prev_vs;
_d_prev_hs = _q_prev_hs;
_d_frame = _q_frame;
_d_u = _q_u;
_d_uT = _q_uT;
_d_v = _q_v;
_d_vT = _q_vT;
_d_addr = _q_addr;
// _always_pre
// __block_1


_t___block_1_ru = _q_u-$signed(_q_vT>>4);

_t___block_1_rv = $signed(_q_uT>>4)+_q_v;




_d_addr = (`_c___block_1_i+{`_c___block_1_j,4'b0}+{`_c___block_1_j,3'b0})&{10{`_c___block_1_clip}};

_t___block_1_pal = `_c___block_1_palA;

_t___block_1_p4 = {_w_vga_vga_y[0+:2],_w_vga_vga_x[0+:2]};

_t___block_1_q4 = _t___block_1_p4[0+:2]^_t___block_1_p4[2+:2];


_t___block_1_l_r = `_c___block_1_pidA==0 ? 0:_t___block_1_pal[8+:4]+`_c___block_1_bval4;

_t___block_1_l_g = `_c___block_1_pidA==0 ? 0:_t___block_1_pal[4+:4]+`_c___block_1_bval4;

_t___block_1_l_b = `_c___block_1_pidA==0 ? 0:_t___block_1_pal[0+:4]+`_c___block_1_bval4;

_t_video_r = _w_vga_active ? _t___block_1_l_r[3+:2]:0;

_t_video_g = _w_vga_active ? _t___block_1_l_g[3+:2]:0;

_t_video_b = _w_vga_active ? _t___block_1_l_b[3+:2]:0;

_t_video_hs = _w_vga_vga_hs;

_t_video_vs = _w_vga_vga_vs;


_d_prev_vs = _w_vga_vga_vs;

_d_frame = `_c___block_1_frame_tick ? (_q_frame+1):_q_frame;



_d_prev_hs = _w_vga_vga_hs;

_d_u = ~_w_vga_vga_hs ? 0:(_q_u+1);

_d_uT = ~_w_vga_vga_hs ? 0:(_q_uT+$signed(`_c___block_1_tri));

_d_v = ~_w_vga_vga_vs ? 0:(`_c___block_1_line_tick ? (_q_v+1):_q_v);

_d_vT = ~_w_vga_vga_vs ? 0:(`_c___block_1_line_tick ? (_q_vT+$signed(`_c___block_1_tri)):_q_vT);

// __block_2
// _always_post
// pipeline stage triggers
end
// ==== wires ====
wire  [11:0] _c_sub666[15:0];
assign _c_sub666[0] = 12'd2662;
assign _c_sub666[1] = 12'd1073;
assign _c_sub666[2] = 12'd1602;
assign _c_sub666[3] = 12'd1874;
assign _c_sub666[4] = 12'd800;
assign _c_sub666[5] = 12'd2403;
assign _c_sub666[6] = 12'd2932;
assign _c_sub666[7] = 12'd3188;
assign _c_sub666[8] = 12'd3734;
assign _c_sub666[9] = 12'd4060;
assign _c_sub666[10] = 12'd4025;
assign _c_sub666[11] = 12'd3461;
assign _c_sub666[12] = 12'd3477;
assign _c_sub666[13] = 12'd4094;
assign _c_sub666[14] = 12'd3508;
assign _c_sub666[15] = 12'd2673;
wire  [3:0] _c_doomhead[695:0];
assign _c_doomhead[0] = 4'd0;
assign _c_doomhead[1] = 4'd0;
assign _c_doomhead[2] = 4'd0;
assign _c_doomhead[3] = 4'd0;
assign _c_doomhead[4] = 4'd0;
assign _c_doomhead[5] = 4'd1;
assign _c_doomhead[6] = 4'd2;
assign _c_doomhead[7] = 4'd2;
assign _c_doomhead[8] = 4'd2;
assign _c_doomhead[9] = 4'd2;
assign _c_doomhead[10] = 4'd3;
assign _c_doomhead[11] = 4'd3;
assign _c_doomhead[12] = 4'd3;
assign _c_doomhead[13] = 4'd3;
assign _c_doomhead[14] = 4'd3;
assign _c_doomhead[15] = 4'd2;
assign _c_doomhead[16] = 4'd2;
assign _c_doomhead[17] = 4'd2;
assign _c_doomhead[18] = 4'd1;
assign _c_doomhead[19] = 4'd0;
assign _c_doomhead[20] = 4'd0;
assign _c_doomhead[21] = 4'd0;
assign _c_doomhead[22] = 4'd0;
assign _c_doomhead[23] = 4'd0;
assign _c_doomhead[24] = 4'd0;
assign _c_doomhead[25] = 4'd0;
assign _c_doomhead[26] = 4'd0;
assign _c_doomhead[27] = 4'd4;
assign _c_doomhead[28] = 4'd2;
assign _c_doomhead[29] = 4'd1;
assign _c_doomhead[30] = 4'd2;
assign _c_doomhead[31] = 4'd2;
assign _c_doomhead[32] = 4'd5;
assign _c_doomhead[33] = 4'd6;
assign _c_doomhead[34] = 4'd6;
assign _c_doomhead[35] = 4'd7;
assign _c_doomhead[36] = 4'd7;
assign _c_doomhead[37] = 4'd6;
assign _c_doomhead[38] = 4'd6;
assign _c_doomhead[39] = 4'd5;
assign _c_doomhead[40] = 4'd3;
assign _c_doomhead[41] = 4'd2;
assign _c_doomhead[42] = 4'd1;
assign _c_doomhead[43] = 4'd2;
assign _c_doomhead[44] = 4'd4;
assign _c_doomhead[45] = 4'd0;
assign _c_doomhead[46] = 4'd0;
assign _c_doomhead[47] = 4'd0;
assign _c_doomhead[48] = 4'd0;
assign _c_doomhead[49] = 4'd0;
assign _c_doomhead[50] = 4'd4;
assign _c_doomhead[51] = 4'd2;
assign _c_doomhead[52] = 4'd3;
assign _c_doomhead[53] = 4'd5;
assign _c_doomhead[54] = 4'd5;
assign _c_doomhead[55] = 4'd6;
assign _c_doomhead[56] = 4'd7;
assign _c_doomhead[57] = 4'd7;
assign _c_doomhead[58] = 4'd5;
assign _c_doomhead[59] = 4'd6;
assign _c_doomhead[60] = 4'd5;
assign _c_doomhead[61] = 4'd5;
assign _c_doomhead[62] = 4'd5;
assign _c_doomhead[63] = 4'd5;
assign _c_doomhead[64] = 4'd5;
assign _c_doomhead[65] = 4'd3;
assign _c_doomhead[66] = 4'd3;
assign _c_doomhead[67] = 4'd1;
assign _c_doomhead[68] = 4'd1;
assign _c_doomhead[69] = 4'd4;
assign _c_doomhead[70] = 4'd0;
assign _c_doomhead[71] = 4'd0;
assign _c_doomhead[72] = 4'd0;
assign _c_doomhead[73] = 4'd0;
assign _c_doomhead[74] = 4'd4;
assign _c_doomhead[75] = 4'd3;
assign _c_doomhead[76] = 4'd3;
assign _c_doomhead[77] = 4'd3;
assign _c_doomhead[78] = 4'd5;
assign _c_doomhead[79] = 4'd5;
assign _c_doomhead[80] = 4'd6;
assign _c_doomhead[81] = 4'd3;
assign _c_doomhead[82] = 4'd6;
assign _c_doomhead[83] = 4'd5;
assign _c_doomhead[84] = 4'd5;
assign _c_doomhead[85] = 4'd3;
assign _c_doomhead[86] = 4'd3;
assign _c_doomhead[87] = 4'd3;
assign _c_doomhead[88] = 4'd3;
assign _c_doomhead[89] = 4'd2;
assign _c_doomhead[90] = 4'd1;
assign _c_doomhead[91] = 4'd4;
assign _c_doomhead[92] = 4'd4;
assign _c_doomhead[93] = 4'd4;
assign _c_doomhead[94] = 4'd0;
assign _c_doomhead[95] = 4'd0;
assign _c_doomhead[96] = 4'd0;
assign _c_doomhead[97] = 4'd4;
assign _c_doomhead[98] = 4'd4;
assign _c_doomhead[99] = 4'd2;
assign _c_doomhead[100] = 4'd3;
assign _c_doomhead[101] = 4'd2;
assign _c_doomhead[102] = 4'd5;
assign _c_doomhead[103] = 4'd5;
assign _c_doomhead[104] = 4'd5;
assign _c_doomhead[105] = 4'd5;
assign _c_doomhead[106] = 4'd5;
assign _c_doomhead[107] = 4'd5;
assign _c_doomhead[108] = 4'd1;
assign _c_doomhead[109] = 4'd5;
assign _c_doomhead[110] = 4'd2;
assign _c_doomhead[111] = 4'd1;
assign _c_doomhead[112] = 4'd2;
assign _c_doomhead[113] = 4'd1;
assign _c_doomhead[114] = 4'd4;
assign _c_doomhead[115] = 4'd4;
assign _c_doomhead[116] = 4'd4;
assign _c_doomhead[117] = 4'd4;
assign _c_doomhead[118] = 4'd4;
assign _c_doomhead[119] = 4'd0;
assign _c_doomhead[120] = 4'd0;
assign _c_doomhead[121] = 4'd4;
assign _c_doomhead[122] = 4'd4;
assign _c_doomhead[123] = 4'd1;
assign _c_doomhead[124] = 4'd1;
assign _c_doomhead[125] = 4'd2;
assign _c_doomhead[126] = 4'd5;
assign _c_doomhead[127] = 4'd1;
assign _c_doomhead[128] = 4'd5;
assign _c_doomhead[129] = 4'd2;
assign _c_doomhead[130] = 4'd2;
assign _c_doomhead[131] = 4'd5;
assign _c_doomhead[132] = 4'd2;
assign _c_doomhead[133] = 4'd1;
assign _c_doomhead[134] = 4'd2;
assign _c_doomhead[135] = 4'd1;
assign _c_doomhead[136] = 4'd4;
assign _c_doomhead[137] = 4'd2;
assign _c_doomhead[138] = 4'd4;
assign _c_doomhead[139] = 4'd4;
assign _c_doomhead[140] = 4'd4;
assign _c_doomhead[141] = 4'd4;
assign _c_doomhead[142] = 4'd4;
assign _c_doomhead[143] = 4'd0;
assign _c_doomhead[144] = 4'd0;
assign _c_doomhead[145] = 4'd4;
assign _c_doomhead[146] = 4'd1;
assign _c_doomhead[147] = 4'd1;
assign _c_doomhead[148] = 4'd3;
assign _c_doomhead[149] = 4'd3;
assign _c_doomhead[150] = 4'd1;
assign _c_doomhead[151] = 4'd5;
assign _c_doomhead[152] = 4'd1;
assign _c_doomhead[153] = 4'd2;
assign _c_doomhead[154] = 4'd3;
assign _c_doomhead[155] = 4'd2;
assign _c_doomhead[156] = 4'd2;
assign _c_doomhead[157] = 4'd5;
assign _c_doomhead[158] = 4'd5;
assign _c_doomhead[159] = 4'd5;
assign _c_doomhead[160] = 4'd3;
assign _c_doomhead[161] = 4'd3;
assign _c_doomhead[162] = 4'd2;
assign _c_doomhead[163] = 4'd1;
assign _c_doomhead[164] = 4'd4;
assign _c_doomhead[165] = 4'd1;
assign _c_doomhead[166] = 4'd4;
assign _c_doomhead[167] = 4'd0;
assign _c_doomhead[168] = 4'd0;
assign _c_doomhead[169] = 4'd4;
assign _c_doomhead[170] = 4'd1;
assign _c_doomhead[171] = 4'd1;
assign _c_doomhead[172] = 4'd3;
assign _c_doomhead[173] = 4'd5;
assign _c_doomhead[174] = 4'd3;
assign _c_doomhead[175] = 4'd1;
assign _c_doomhead[176] = 4'd5;
assign _c_doomhead[177] = 4'd1;
assign _c_doomhead[178] = 4'd3;
assign _c_doomhead[179] = 4'd5;
assign _c_doomhead[180] = 4'd5;
assign _c_doomhead[181] = 4'd6;
assign _c_doomhead[182] = 4'd5;
assign _c_doomhead[183] = 4'd5;
assign _c_doomhead[184] = 4'd5;
assign _c_doomhead[185] = 4'd5;
assign _c_doomhead[186] = 4'd5;
assign _c_doomhead[187] = 4'd2;
assign _c_doomhead[188] = 4'd1;
assign _c_doomhead[189] = 4'd1;
assign _c_doomhead[190] = 4'd4;
assign _c_doomhead[191] = 4'd0;
assign _c_doomhead[192] = 4'd0;
assign _c_doomhead[193] = 4'd4;
assign _c_doomhead[194] = 4'd1;
assign _c_doomhead[195] = 4'd2;
assign _c_doomhead[196] = 4'd5;
assign _c_doomhead[197] = 4'd6;
assign _c_doomhead[198] = 4'd6;
assign _c_doomhead[199] = 4'd5;
assign _c_doomhead[200] = 4'd5;
assign _c_doomhead[201] = 4'd6;
assign _c_doomhead[202] = 4'd6;
assign _c_doomhead[203] = 4'd6;
assign _c_doomhead[204] = 4'd6;
assign _c_doomhead[205] = 4'd6;
assign _c_doomhead[206] = 4'd6;
assign _c_doomhead[207] = 4'd5;
assign _c_doomhead[208] = 4'd5;
assign _c_doomhead[209] = 4'd6;
assign _c_doomhead[210] = 4'd6;
assign _c_doomhead[211] = 4'd5;
assign _c_doomhead[212] = 4'd1;
assign _c_doomhead[213] = 4'd1;
assign _c_doomhead[214] = 4'd4;
assign _c_doomhead[215] = 4'd0;
assign _c_doomhead[216] = 4'd0;
assign _c_doomhead[217] = 4'd4;
assign _c_doomhead[218] = 4'd1;
assign _c_doomhead[219] = 4'd3;
assign _c_doomhead[220] = 4'd5;
assign _c_doomhead[221] = 4'd7;
assign _c_doomhead[222] = 4'd7;
assign _c_doomhead[223] = 4'd7;
assign _c_doomhead[224] = 4'd6;
assign _c_doomhead[225] = 4'd5;
assign _c_doomhead[226] = 4'd6;
assign _c_doomhead[227] = 4'd6;
assign _c_doomhead[228] = 4'd6;
assign _c_doomhead[229] = 4'd6;
assign _c_doomhead[230] = 4'd5;
assign _c_doomhead[231] = 4'd6;
assign _c_doomhead[232] = 4'd7;
assign _c_doomhead[233] = 4'd7;
assign _c_doomhead[234] = 4'd7;
assign _c_doomhead[235] = 4'd5;
assign _c_doomhead[236] = 4'd2;
assign _c_doomhead[237] = 4'd1;
assign _c_doomhead[238] = 4'd4;
assign _c_doomhead[239] = 4'd0;
assign _c_doomhead[240] = 4'd0;
assign _c_doomhead[241] = 4'd4;
assign _c_doomhead[242] = 4'd1;
assign _c_doomhead[243] = 4'd3;
assign _c_doomhead[244] = 4'd5;
assign _c_doomhead[245] = 4'd7;
assign _c_doomhead[246] = 4'd8;
assign _c_doomhead[247] = 4'd8;
assign _c_doomhead[248] = 4'd7;
assign _c_doomhead[249] = 4'd6;
assign _c_doomhead[250] = 4'd5;
assign _c_doomhead[251] = 4'd5;
assign _c_doomhead[252] = 4'd5;
assign _c_doomhead[253] = 4'd5;
assign _c_doomhead[254] = 4'd6;
assign _c_doomhead[255] = 4'd7;
assign _c_doomhead[256] = 4'd8;
assign _c_doomhead[257] = 4'd8;
assign _c_doomhead[258] = 4'd7;
assign _c_doomhead[259] = 4'd5;
assign _c_doomhead[260] = 4'd3;
assign _c_doomhead[261] = 4'd1;
assign _c_doomhead[262] = 4'd4;
assign _c_doomhead[263] = 4'd0;
assign _c_doomhead[264] = 4'd0;
assign _c_doomhead[265] = 4'd4;
assign _c_doomhead[266] = 4'd1;
assign _c_doomhead[267] = 4'd3;
assign _c_doomhead[268] = 4'd6;
assign _c_doomhead[269] = 4'd8;
assign _c_doomhead[270] = 4'd9;
assign _c_doomhead[271] = 4'd10;
assign _c_doomhead[272] = 4'd8;
assign _c_doomhead[273] = 4'd8;
assign _c_doomhead[274] = 4'd7;
assign _c_doomhead[275] = 4'd11;
assign _c_doomhead[276] = 4'd11;
assign _c_doomhead[277] = 4'd7;
assign _c_doomhead[278] = 4'd8;
assign _c_doomhead[279] = 4'd8;
assign _c_doomhead[280] = 4'd10;
assign _c_doomhead[281] = 4'd9;
assign _c_doomhead[282] = 4'd8;
assign _c_doomhead[283] = 4'd6;
assign _c_doomhead[284] = 4'd3;
assign _c_doomhead[285] = 4'd1;
assign _c_doomhead[286] = 4'd4;
assign _c_doomhead[287] = 4'd0;
assign _c_doomhead[288] = 4'd6;
assign _c_doomhead[289] = 4'd2;
assign _c_doomhead[290] = 4'd1;
assign _c_doomhead[291] = 4'd3;
assign _c_doomhead[292] = 4'd2;
assign _c_doomhead[293] = 4'd2;
assign _c_doomhead[294] = 4'd1;
assign _c_doomhead[295] = 4'd5;
assign _c_doomhead[296] = 4'd12;
assign _c_doomhead[297] = 4'd6;
assign _c_doomhead[298] = 4'd3;
assign _c_doomhead[299] = 4'd6;
assign _c_doomhead[300] = 4'd6;
assign _c_doomhead[301] = 4'd3;
assign _c_doomhead[302] = 4'd6;
assign _c_doomhead[303] = 4'd12;
assign _c_doomhead[304] = 4'd5;
assign _c_doomhead[305] = 4'd1;
assign _c_doomhead[306] = 4'd2;
assign _c_doomhead[307] = 4'd2;
assign _c_doomhead[308] = 4'd3;
assign _c_doomhead[309] = 4'd1;
assign _c_doomhead[310] = 4'd2;
assign _c_doomhead[311] = 4'd6;
assign _c_doomhead[312] = 4'd6;
assign _c_doomhead[313] = 4'd2;
assign _c_doomhead[314] = 4'd1;
assign _c_doomhead[315] = 4'd5;
assign _c_doomhead[316] = 4'd6;
assign _c_doomhead[317] = 4'd6;
assign _c_doomhead[318] = 4'd5;
assign _c_doomhead[319] = 4'd3;
assign _c_doomhead[320] = 4'd3;
assign _c_doomhead[321] = 4'd2;
assign _c_doomhead[322] = 4'd2;
assign _c_doomhead[323] = 4'd5;
assign _c_doomhead[324] = 4'd5;
assign _c_doomhead[325] = 4'd2;
assign _c_doomhead[326] = 4'd2;
assign _c_doomhead[327] = 4'd3;
assign _c_doomhead[328] = 4'd3;
assign _c_doomhead[329] = 4'd5;
assign _c_doomhead[330] = 4'd6;
assign _c_doomhead[331] = 4'd6;
assign _c_doomhead[332] = 4'd5;
assign _c_doomhead[333] = 4'd1;
assign _c_doomhead[334] = 4'd2;
assign _c_doomhead[335] = 4'd6;
assign _c_doomhead[336] = 4'd5;
assign _c_doomhead[337] = 4'd2;
assign _c_doomhead[338] = 4'd2;
assign _c_doomhead[339] = 4'd6;
assign _c_doomhead[340] = 4'd3;
assign _c_doomhead[341] = 4'd12;
assign _c_doomhead[342] = 4'd13;
assign _c_doomhead[343] = 4'd13;
assign _c_doomhead[344] = 4'd14;
assign _c_doomhead[345] = 4'd12;
assign _c_doomhead[346] = 4'd5;
assign _c_doomhead[347] = 4'd11;
assign _c_doomhead[348] = 4'd11;
assign _c_doomhead[349] = 4'd5;
assign _c_doomhead[350] = 4'd12;
assign _c_doomhead[351] = 4'd14;
assign _c_doomhead[352] = 4'd13;
assign _c_doomhead[353] = 4'd13;
assign _c_doomhead[354] = 4'd12;
assign _c_doomhead[355] = 4'd3;
assign _c_doomhead[356] = 4'd6;
assign _c_doomhead[357] = 4'd2;
assign _c_doomhead[358] = 4'd2;
assign _c_doomhead[359] = 4'd5;
assign _c_doomhead[360] = 4'd2;
assign _c_doomhead[361] = 4'd2;
assign _c_doomhead[362] = 4'd3;
assign _c_doomhead[363] = 4'd6;
assign _c_doomhead[364] = 4'd5;
assign _c_doomhead[365] = 4'd6;
assign _c_doomhead[366] = 4'd12;
assign _c_doomhead[367] = 4'd14;
assign _c_doomhead[368] = 4'd12;
assign _c_doomhead[369] = 4'd15;
assign _c_doomhead[370] = 4'd5;
assign _c_doomhead[371] = 4'd7;
assign _c_doomhead[372] = 4'd8;
assign _c_doomhead[373] = 4'd5;
assign _c_doomhead[374] = 4'd15;
assign _c_doomhead[375] = 4'd12;
assign _c_doomhead[376] = 4'd14;
assign _c_doomhead[377] = 4'd12;
assign _c_doomhead[378] = 4'd6;
assign _c_doomhead[379] = 4'd5;
assign _c_doomhead[380] = 4'd6;
assign _c_doomhead[381] = 4'd3;
assign _c_doomhead[382] = 4'd2;
assign _c_doomhead[383] = 4'd2;
assign _c_doomhead[384] = 4'd3;
assign _c_doomhead[385] = 4'd2;
assign _c_doomhead[386] = 4'd3;
assign _c_doomhead[387] = 4'd11;
assign _c_doomhead[388] = 4'd11;
assign _c_doomhead[389] = 4'd6;
assign _c_doomhead[390] = 4'd6;
assign _c_doomhead[391] = 4'd5;
assign _c_doomhead[392] = 4'd6;
assign _c_doomhead[393] = 4'd7;
assign _c_doomhead[394] = 4'd11;
assign _c_doomhead[395] = 4'd8;
assign _c_doomhead[396] = 4'd10;
assign _c_doomhead[397] = 4'd11;
assign _c_doomhead[398] = 4'd7;
assign _c_doomhead[399] = 4'd6;
assign _c_doomhead[400] = 4'd5;
assign _c_doomhead[401] = 4'd6;
assign _c_doomhead[402] = 4'd6;
assign _c_doomhead[403] = 4'd11;
assign _c_doomhead[404] = 4'd11;
assign _c_doomhead[405] = 4'd3;
assign _c_doomhead[406] = 4'd2;
assign _c_doomhead[407] = 4'd3;
assign _c_doomhead[408] = 4'd5;
assign _c_doomhead[409] = 4'd2;
assign _c_doomhead[410] = 4'd5;
assign _c_doomhead[411] = 4'd7;
assign _c_doomhead[412] = 4'd12;
assign _c_doomhead[413] = 4'd8;
assign _c_doomhead[414] = 4'd12;
assign _c_doomhead[415] = 4'd7;
assign _c_doomhead[416] = 4'd8;
assign _c_doomhead[417] = 4'd10;
assign _c_doomhead[418] = 4'd8;
assign _c_doomhead[419] = 4'd8;
assign _c_doomhead[420] = 4'd10;
assign _c_doomhead[421] = 4'd8;
assign _c_doomhead[422] = 4'd10;
assign _c_doomhead[423] = 4'd8;
assign _c_doomhead[424] = 4'd7;
assign _c_doomhead[425] = 4'd12;
assign _c_doomhead[426] = 4'd8;
assign _c_doomhead[427] = 4'd12;
assign _c_doomhead[428] = 4'd7;
assign _c_doomhead[429] = 4'd5;
assign _c_doomhead[430] = 4'd2;
assign _c_doomhead[431] = 4'd5;
assign _c_doomhead[432] = 4'd0;
assign _c_doomhead[433] = 4'd2;
assign _c_doomhead[434] = 4'd3;
assign _c_doomhead[435] = 4'd5;
assign _c_doomhead[436] = 4'd6;
assign _c_doomhead[437] = 4'd6;
assign _c_doomhead[438] = 4'd11;
assign _c_doomhead[439] = 4'd8;
assign _c_doomhead[440] = 4'd10;
assign _c_doomhead[441] = 4'd12;
assign _c_doomhead[442] = 4'd11;
assign _c_doomhead[443] = 4'd10;
assign _c_doomhead[444] = 4'd9;
assign _c_doomhead[445] = 4'd11;
assign _c_doomhead[446] = 4'd12;
assign _c_doomhead[447] = 4'd10;
assign _c_doomhead[448] = 4'd8;
assign _c_doomhead[449] = 4'd11;
assign _c_doomhead[450] = 4'd6;
assign _c_doomhead[451] = 4'd6;
assign _c_doomhead[452] = 4'd5;
assign _c_doomhead[453] = 4'd3;
assign _c_doomhead[454] = 4'd2;
assign _c_doomhead[455] = 4'd0;
assign _c_doomhead[456] = 4'd0;
assign _c_doomhead[457] = 4'd2;
assign _c_doomhead[458] = 4'd3;
assign _c_doomhead[459] = 4'd5;
assign _c_doomhead[460] = 4'd5;
assign _c_doomhead[461] = 4'd6;
assign _c_doomhead[462] = 4'd8;
assign _c_doomhead[463] = 4'd8;
assign _c_doomhead[464] = 4'd11;
assign _c_doomhead[465] = 4'd6;
assign _c_doomhead[466] = 4'd5;
assign _c_doomhead[467] = 4'd6;
assign _c_doomhead[468] = 4'd6;
assign _c_doomhead[469] = 4'd5;
assign _c_doomhead[470] = 4'd6;
assign _c_doomhead[471] = 4'd11;
assign _c_doomhead[472] = 4'd8;
assign _c_doomhead[473] = 4'd8;
assign _c_doomhead[474] = 4'd6;
assign _c_doomhead[475] = 4'd5;
assign _c_doomhead[476] = 4'd5;
assign _c_doomhead[477] = 4'd3;
assign _c_doomhead[478] = 4'd2;
assign _c_doomhead[479] = 4'd0;
assign _c_doomhead[480] = 4'd0;
assign _c_doomhead[481] = 4'd0;
assign _c_doomhead[482] = 4'd3;
assign _c_doomhead[483] = 4'd6;
assign _c_doomhead[484] = 4'd5;
assign _c_doomhead[485] = 4'd11;
assign _c_doomhead[486] = 4'd10;
assign _c_doomhead[487] = 4'd8;
assign _c_doomhead[488] = 4'd6;
assign _c_doomhead[489] = 4'd1;
assign _c_doomhead[490] = 4'd3;
assign _c_doomhead[491] = 4'd3;
assign _c_doomhead[492] = 4'd3;
assign _c_doomhead[493] = 4'd3;
assign _c_doomhead[494] = 4'd1;
assign _c_doomhead[495] = 4'd6;
assign _c_doomhead[496] = 4'd8;
assign _c_doomhead[497] = 4'd10;
assign _c_doomhead[498] = 4'd11;
assign _c_doomhead[499] = 4'd5;
assign _c_doomhead[500] = 4'd6;
assign _c_doomhead[501] = 4'd3;
assign _c_doomhead[502] = 4'd0;
assign _c_doomhead[503] = 4'd0;
assign _c_doomhead[504] = 4'd0;
assign _c_doomhead[505] = 4'd0;
assign _c_doomhead[506] = 4'd2;
assign _c_doomhead[507] = 4'd7;
assign _c_doomhead[508] = 4'd5;
assign _c_doomhead[509] = 4'd8;
assign _c_doomhead[510] = 4'd8;
assign _c_doomhead[511] = 4'd7;
assign _c_doomhead[512] = 4'd7;
assign _c_doomhead[513] = 4'd11;
assign _c_doomhead[514] = 4'd6;
assign _c_doomhead[515] = 4'd5;
assign _c_doomhead[516] = 4'd5;
assign _c_doomhead[517] = 4'd6;
assign _c_doomhead[518] = 4'd11;
assign _c_doomhead[519] = 4'd7;
assign _c_doomhead[520] = 4'd7;
assign _c_doomhead[521] = 4'd8;
assign _c_doomhead[522] = 4'd8;
assign _c_doomhead[523] = 4'd5;
assign _c_doomhead[524] = 4'd7;
assign _c_doomhead[525] = 4'd2;
assign _c_doomhead[526] = 4'd0;
assign _c_doomhead[527] = 4'd0;
assign _c_doomhead[528] = 4'd0;
assign _c_doomhead[529] = 4'd0;
assign _c_doomhead[530] = 4'd1;
assign _c_doomhead[531] = 4'd6;
assign _c_doomhead[532] = 4'd5;
assign _c_doomhead[533] = 4'd11;
assign _c_doomhead[534] = 4'd8;
assign _c_doomhead[535] = 4'd7;
assign _c_doomhead[536] = 4'd11;
assign _c_doomhead[537] = 4'd8;
assign _c_doomhead[538] = 4'd10;
assign _c_doomhead[539] = 4'd12;
assign _c_doomhead[540] = 4'd12;
assign _c_doomhead[541] = 4'd10;
assign _c_doomhead[542] = 4'd8;
assign _c_doomhead[543] = 4'd11;
assign _c_doomhead[544] = 4'd7;
assign _c_doomhead[545] = 4'd8;
assign _c_doomhead[546] = 4'd11;
assign _c_doomhead[547] = 4'd5;
assign _c_doomhead[548] = 4'd6;
assign _c_doomhead[549] = 4'd1;
assign _c_doomhead[550] = 4'd0;
assign _c_doomhead[551] = 4'd0;
assign _c_doomhead[552] = 4'd0;
assign _c_doomhead[553] = 4'd0;
assign _c_doomhead[554] = 4'd0;
assign _c_doomhead[555] = 4'd3;
assign _c_doomhead[556] = 4'd6;
assign _c_doomhead[557] = 4'd7;
assign _c_doomhead[558] = 4'd11;
assign _c_doomhead[559] = 4'd5;
assign _c_doomhead[560] = 4'd3;
assign _c_doomhead[561] = 4'd5;
assign _c_doomhead[562] = 4'd5;
assign _c_doomhead[563] = 4'd5;
assign _c_doomhead[564] = 4'd5;
assign _c_doomhead[565] = 4'd5;
assign _c_doomhead[566] = 4'd5;
assign _c_doomhead[567] = 4'd3;
assign _c_doomhead[568] = 4'd5;
assign _c_doomhead[569] = 4'd11;
assign _c_doomhead[570] = 4'd7;
assign _c_doomhead[571] = 4'd6;
assign _c_doomhead[572] = 4'd3;
assign _c_doomhead[573] = 4'd0;
assign _c_doomhead[574] = 4'd0;
assign _c_doomhead[575] = 4'd0;
assign _c_doomhead[576] = 4'd0;
assign _c_doomhead[577] = 4'd0;
assign _c_doomhead[578] = 4'd0;
assign _c_doomhead[579] = 4'd1;
assign _c_doomhead[580] = 4'd5;
assign _c_doomhead[581] = 4'd6;
assign _c_doomhead[582] = 4'd7;
assign _c_doomhead[583] = 4'd7;
assign _c_doomhead[584] = 4'd7;
assign _c_doomhead[585] = 4'd11;
assign _c_doomhead[586] = 4'd8;
assign _c_doomhead[587] = 4'd8;
assign _c_doomhead[588] = 4'd8;
assign _c_doomhead[589] = 4'd8;
assign _c_doomhead[590] = 4'd11;
assign _c_doomhead[591] = 4'd7;
assign _c_doomhead[592] = 4'd7;
assign _c_doomhead[593] = 4'd7;
assign _c_doomhead[594] = 4'd6;
assign _c_doomhead[595] = 4'd5;
assign _c_doomhead[596] = 4'd1;
assign _c_doomhead[597] = 4'd0;
assign _c_doomhead[598] = 4'd0;
assign _c_doomhead[599] = 4'd0;
assign _c_doomhead[600] = 4'd0;
assign _c_doomhead[601] = 4'd0;
assign _c_doomhead[602] = 4'd0;
assign _c_doomhead[603] = 4'd0;
assign _c_doomhead[604] = 4'd2;
assign _c_doomhead[605] = 4'd6;
assign _c_doomhead[606] = 4'd7;
assign _c_doomhead[607] = 4'd12;
assign _c_doomhead[608] = 4'd7;
assign _c_doomhead[609] = 4'd6;
assign _c_doomhead[610] = 4'd5;
assign _c_doomhead[611] = 4'd3;
assign _c_doomhead[612] = 4'd3;
assign _c_doomhead[613] = 4'd5;
assign _c_doomhead[614] = 4'd6;
assign _c_doomhead[615] = 4'd7;
assign _c_doomhead[616] = 4'd12;
assign _c_doomhead[617] = 4'd7;
assign _c_doomhead[618] = 4'd6;
assign _c_doomhead[619] = 4'd2;
assign _c_doomhead[620] = 4'd0;
assign _c_doomhead[621] = 4'd0;
assign _c_doomhead[622] = 4'd0;
assign _c_doomhead[623] = 4'd0;
assign _c_doomhead[624] = 4'd0;
assign _c_doomhead[625] = 4'd0;
assign _c_doomhead[626] = 4'd0;
assign _c_doomhead[627] = 4'd0;
assign _c_doomhead[628] = 4'd0;
assign _c_doomhead[629] = 4'd2;
assign _c_doomhead[630] = 4'd6;
assign _c_doomhead[631] = 4'd7;
assign _c_doomhead[632] = 4'd12;
assign _c_doomhead[633] = 4'd7;
assign _c_doomhead[634] = 4'd7;
assign _c_doomhead[635] = 4'd8;
assign _c_doomhead[636] = 4'd8;
assign _c_doomhead[637] = 4'd7;
assign _c_doomhead[638] = 4'd7;
assign _c_doomhead[639] = 4'd12;
assign _c_doomhead[640] = 4'd7;
assign _c_doomhead[641] = 4'd6;
assign _c_doomhead[642] = 4'd2;
assign _c_doomhead[643] = 4'd0;
assign _c_doomhead[644] = 4'd0;
assign _c_doomhead[645] = 4'd0;
assign _c_doomhead[646] = 4'd0;
assign _c_doomhead[647] = 4'd0;
assign _c_doomhead[648] = 4'd0;
assign _c_doomhead[649] = 4'd0;
assign _c_doomhead[650] = 4'd0;
assign _c_doomhead[651] = 4'd0;
assign _c_doomhead[652] = 4'd0;
assign _c_doomhead[653] = 4'd0;
assign _c_doomhead[654] = 4'd1;
assign _c_doomhead[655] = 4'd3;
assign _c_doomhead[656] = 4'd6;
assign _c_doomhead[657] = 4'd11;
assign _c_doomhead[658] = 4'd8;
assign _c_doomhead[659] = 4'd10;
assign _c_doomhead[660] = 4'd10;
assign _c_doomhead[661] = 4'd8;
assign _c_doomhead[662] = 4'd11;
assign _c_doomhead[663] = 4'd6;
assign _c_doomhead[664] = 4'd3;
assign _c_doomhead[665] = 4'd1;
assign _c_doomhead[666] = 4'd0;
assign _c_doomhead[667] = 4'd0;
assign _c_doomhead[668] = 4'd0;
assign _c_doomhead[669] = 4'd0;
assign _c_doomhead[670] = 4'd0;
assign _c_doomhead[671] = 4'd0;
assign _c_doomhead[672] = 4'd0;
assign _c_doomhead[673] = 4'd0;
assign _c_doomhead[674] = 4'd0;
assign _c_doomhead[675] = 4'd0;
assign _c_doomhead[676] = 4'd0;
assign _c_doomhead[677] = 4'd0;
assign _c_doomhead[678] = 4'd0;
assign _c_doomhead[679] = 4'd4;
assign _c_doomhead[680] = 4'd2;
assign _c_doomhead[681] = 4'd5;
assign _c_doomhead[682] = 4'd5;
assign _c_doomhead[683] = 4'd5;
assign _c_doomhead[684] = 4'd5;
assign _c_doomhead[685] = 4'd5;
assign _c_doomhead[686] = 4'd5;
assign _c_doomhead[687] = 4'd2;
assign _c_doomhead[688] = 4'd4;
assign _c_doomhead[689] = 4'd0;
assign _c_doomhead[690] = 4'd0;
assign _c_doomhead[691] = 4'd0;
assign _c_doomhead[692] = 4'd0;
assign _c_doomhead[693] = 4'd0;
assign _c_doomhead[694] = 4'd0;
assign _c_doomhead[695] = 4'd0;
// ===============

always @(posedge clock) begin
_q_prev_vs <= _d_prev_vs;
_q_prev_hs <= _d_prev_hs;
_q_frame <= (reset) ? 0 : _d_frame;
_q_u <= (reset) ? 0 : _d_u;
_q_uT <= (reset) ? 0 : _d_uT;
_q_v <= (reset) ? 0 : _d_v;
_q_vT <= (reset) ? 0 : _d_vT;
_q_addr <= _d_addr;
end

endmodule


module M_main (
in_ui,
out_uo,
inout_uio_oe,
inout_uio_i,
inout_uio_o,
in_run,
out_done,
reset,
out_clock,
clock
);
input  [7:0] in_ui;
output  [7:0] out_uo;
output  [7:0] inout_uio_oe;
input  [7:0] inout_uio_i;
output  [7:0] inout_uio_o;
input in_run;
output out_done;
input reset;
output out_clock;
input clock;
assign out_clock = clock;
wire  [1:0] _w_demo_video_r;
wire  [1:0] _w_demo_video_g;
wire  [1:0] _w_demo_video_b;
wire  [0:0] _w_demo_video_hs;
wire  [0:0] _w_demo_video_vs;
wire  [7:0] _w_demo_audio8;
wire  [0:0] _w_demo_audio1;

reg  [7:0] _d_uio_o;
reg  [7:0] _q_uio_o;
reg  [7:0] _d_uio_oenable;
reg  [7:0] _q_uio_oenable;
reg  [7:0] _d_uo;
reg  [7:0] _q_uo;
assign out_uo = _q_uo;
assign out_done = 0;
M_vga_demo_M_main_demo demo (
.out_video_r(_w_demo_video_r),
.out_video_g(_w_demo_video_g),
.out_video_b(_w_demo_video_b),
.out_video_hs(_w_demo_video_hs),
.out_video_vs(_w_demo_video_vs),
.out_audio8(_w_demo_audio8),
.out_audio1(_w_demo_audio1),
.reset(reset),
.clock(clock));


assign inout_uio_oe[0] = _q_uio_oenable[0];
assign inout_uio_o[0] = _q_uio_o[0];
assign inout_uio_oe[1] = _q_uio_oenable[1];
assign inout_uio_o[1] = _q_uio_o[1];
assign inout_uio_oe[2] = _q_uio_oenable[2];
assign inout_uio_o[2] = _q_uio_o[2];
assign inout_uio_oe[3] = _q_uio_oenable[3];
assign inout_uio_o[3] = _q_uio_o[3];
assign inout_uio_oe[4] = _q_uio_oenable[4];
assign inout_uio_o[4] = _q_uio_o[4];
assign inout_uio_oe[5] = _q_uio_oenable[5];
assign inout_uio_o[5] = _q_uio_o[5];
assign inout_uio_oe[6] = _q_uio_oenable[6];
assign inout_uio_o[6] = _q_uio_o[6];
assign inout_uio_oe[7] = _q_uio_oenable[7];
assign inout_uio_o[7] = _q_uio_o[7];

`ifdef FORMAL
initial begin
assume(reset);
end
`endif
always @* begin
_d_uio_o = _q_uio_o;
_d_uio_oenable = _q_uio_oenable;
_d_uo = _q_uo;
// _always_pre
// __block_1
_d_uo[7+:1] = _w_demo_video_hs;

_d_uo[3+:1] = _w_demo_video_vs;

_d_uo[4+:1] = _w_demo_video_r[0+:1];

_d_uo[0+:1] = _w_demo_video_r[1+:1];

_d_uo[5+:1] = _w_demo_video_g[0+:1];

_d_uo[1+:1] = _w_demo_video_g[1+:1];

_d_uo[6+:1] = _w_demo_video_b[0+:1];

_d_uo[2+:1] = _w_demo_video_b[1+:1];

_d_uio_oenable = {1'b1,7'b0};

_d_uio_o[7+:1] = _w_demo_audio1;

// __block_2
// _always_post
// pipeline stage triggers
end

always @(posedge clock) begin
_q_uio_o <= _d_uio_o;
_q_uio_oenable <= _d_uio_oenable;
_q_uo <= _d_uo;
end

endmodule
