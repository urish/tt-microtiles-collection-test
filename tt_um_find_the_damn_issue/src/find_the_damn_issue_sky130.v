module scl_counter
  (input  clk,
   input  rst_n,
   input  in_unnamed,
   input  in_unnamed_2,
   input  in_unnamed_3,
   input  [4:0] in_unnamed_4,
   output [4:0] out_m_value,
   output out_m_last,
   output out_const_0,
   output out_const_0_2,
   output out_const_0_3,
   output [4:0] out_const_xxxxx);
  reg [4:0] s_m_value_2;
  wire [4:0] s_m_value_plus_const_0_mux5;
  wire n9096_o;
  wire n9097_o;
  wire [4:0] n9100_o;
  wire n9101_o;
  wire n9102_o;
  wire [4:0] n9104_o;
  wire n9107_o;
  wire n9114_o;
  wire n9116_o;
  wire n9118_o;
  wire n9119_o;
  wire [4:0] n9120_o;
  wire [4:0] n9122_o;
  wire n9124_o;
  wire n9126_o;
  wire n9127_o;
  wire [4:0] n9129_o;
  wire [4:0] n9130_o;
  localparam n9134_o = 1'b0;
  localparam n9135_o = 1'b0;
  localparam n9136_o = 1'b0;
  localparam [4:0] n9137_o = 5'bX;
  wire n9139_o;
  reg [4:0] n9145_q;
  assign out_m_value = s_m_value_2;
  assign out_m_last = n9114_o;
  assign out_const_0 = n9134_o;
  assign out_const_0_2 = n9135_o;
  assign out_const_0_3 = n9136_o;
  assign out_const_xxxxx = n9137_o;
  /* find_the_damn_issue_sky130.vhd:5592:16  */
  always @*
    s_m_value_2 = n9145_q; // (isignal)
  initial
    s_m_value_2 = 5'b01111;
  /* find_the_damn_issue_sky130.vhd:5593:16  */
  assign s_m_value_plus_const_0_mux5 = n9130_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:5609:41  */
  assign n9096_o = ~in_unnamed_2;
  /* find_the_damn_issue_sky130.vhd:5609:35  */
  assign n9097_o = in_unnamed & n9096_o;
  /* find_the_damn_issue_sky130.vhd:5609:17  */
  assign n9100_o = n9097_o ? 5'b00001 : 5'b00000;
  /* find_the_damn_issue_sky130.vhd:5614:41  */
  assign n9101_o = ~in_unnamed;
  /* find_the_damn_issue_sky130.vhd:5614:35  */
  assign n9102_o = in_unnamed_2 & n9101_o;
  /* find_the_damn_issue_sky130.vhd:5614:17  */
  assign n9104_o = n9102_o ? 5'b11111 : n9100_o;
  /* find_the_damn_issue_sky130.vhd:5622:57  */
  assign n9107_o = s_m_value_2 == 5'b11111;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n9114_o = n9107_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:5627:34  */
  assign n9116_o = s_m_value_2 == 5'b11111;
  /* find_the_damn_issue_sky130.vhd:5627:67  */
  assign n9118_o = n9104_o == 5'b00001;
  /* find_the_damn_issue_sky130.vhd:5627:45  */
  assign n9119_o = n9116_o & n9118_o;
  /* find_the_damn_issue_sky130.vhd:5630:69  */
  assign n9120_o = s_m_value_2 + n9104_o;
  /* find_the_damn_issue_sky130.vhd:5627:17  */
  assign n9122_o = n9119_o ? 5'b00000 : n9120_o;
  /* find_the_damn_issue_sky130.vhd:5632:34  */
  assign n9124_o = s_m_value_2 == 5'b00000;
  /* find_the_damn_issue_sky130.vhd:5632:67  */
  assign n9126_o = n9104_o == 5'b11111;
  /* find_the_damn_issue_sky130.vhd:5632:45  */
  assign n9127_o = n9124_o & n9126_o;
  /* find_the_damn_issue_sky130.vhd:5632:17  */
  assign n9129_o = n9127_o ? 5'b11111 : n9122_o;
  /* find_the_damn_issue_sky130.vhd:5637:17  */
  assign n9130_o = in_unnamed_3 ? in_unnamed_4 : n9129_o;
  /* find_the_damn_issue_sky130.vhd:5648:27  */
  assign n9139_o = ~rst_n;
  /* find_the_damn_issue_sky130.vhd:5650:17  */
  always @(posedge clk or posedge n9139_o)
    if (n9139_o)
      n9145_q <= 5'b01111;
    else
      n9145_q <= s_m_value_plus_const_0_mux5;
endmodule

module analyze_phase
  (input  clk,
   input  rst_n,
   input  in_delayed_input,
   output [1:0] out_ret);
  reg s_delayed_input_delayed1;
  reg s_delayed_input_delayed1_2;
  reg s_delayed_input_delayed2;
  wire s_delayed_input_2;
  wire s_delayed_input_3;
  wire s_delayed_input_delayed1_3;
  wire n9038_o;
  wire n9039_o;
  wire n9040_o;
  wire [1:0] n9043_o;
  wire n9044_o;
  wire n9045_o;
  wire n9046_o;
  wire n9047_o;
  wire [1:0] n9049_o;
  wire n9050_o;
  wire n9051_o;
  wire n9052_o;
  wire n9053_o;
  wire [1:0] n9055_o;
  wire n9059_o;
  wire n9069_o;
  reg n9075_q;
  reg n9076_q;
  reg n9077_q;
  assign out_ret = n9055_o;
  /* find_the_damn_issue_sky130.vhd:5684:16  */
  always @*
    s_delayed_input_delayed1 = n9075_q; // (isignal)
  initial
    s_delayed_input_delayed1 = 1'b0;
  /* find_the_damn_issue_sky130.vhd:5685:16  */
  always @*
    s_delayed_input_delayed1_2 = n9076_q; // (isignal)
  initial
    s_delayed_input_delayed1_2 = 1'b0;
  /* find_the_damn_issue_sky130.vhd:5686:16  */
  always @*
    s_delayed_input_delayed2 = n9077_q; // (isignal)
  initial
    s_delayed_input_delayed2 = 1'b0;
  /* find_the_damn_issue_sky130.vhd:5687:16  */
  assign s_delayed_input_2 = in_delayed_input; // (signal)
  /* find_the_damn_issue_sky130.vhd:5688:16  */
  assign s_delayed_input_3 = in_delayed_input; // (signal)
  /* find_the_damn_issue_sky130.vhd:5689:16  */
  assign s_delayed_input_delayed1_3 = s_delayed_input_delayed1; // (signal)
  /* find_the_damn_issue_sky130.vhd:5711:33  */
  assign n9038_o = s_delayed_input_delayed1_3 != s_delayed_input_delayed1_2;
  /* find_the_damn_issue_sky130.vhd:5711:64  */
  assign n9039_o = s_delayed_input_delayed1_3 != s_delayed_input_delayed2;
  /* find_the_damn_issue_sky130.vhd:5711:48  */
  assign n9040_o = n9038_o & n9039_o;
  /* find_the_damn_issue_sky130.vhd:5711:17  */
  assign n9043_o = n9040_o ? 2'b00 : 2'b10;
  /* find_the_damn_issue_sky130.vhd:5716:39  */
  assign n9044_o = s_delayed_input_delayed1_3 != s_delayed_input_delayed1_2;
  /* find_the_damn_issue_sky130.vhd:5716:23  */
  assign n9045_o = ~n9044_o;
  /* find_the_damn_issue_sky130.vhd:5716:71  */
  assign n9046_o = s_delayed_input_delayed1_3 != s_delayed_input_delayed2;
  /* find_the_damn_issue_sky130.vhd:5716:55  */
  assign n9047_o = n9045_o & n9046_o;
  /* find_the_damn_issue_sky130.vhd:5716:17  */
  assign n9049_o = n9047_o ? 2'b01 : n9043_o;
  /* find_the_damn_issue_sky130.vhd:5721:33  */
  assign n9050_o = s_delayed_input_delayed2 != s_delayed_input_delayed1_2;
  /* find_the_damn_issue_sky130.vhd:5721:70  */
  assign n9051_o = s_delayed_input_delayed1_3 != s_delayed_input_delayed2;
  /* find_the_damn_issue_sky130.vhd:5721:54  */
  assign n9052_o = ~n9051_o;
  /* find_the_damn_issue_sky130.vhd:5721:48  */
  assign n9053_o = n9050_o & n9052_o;
  /* find_the_damn_issue_sky130.vhd:5721:17  */
  assign n9055_o = n9053_o ? 2'b00 : n9049_o;
  /* find_the_damn_issue_sky130.vhd:5731:27  */
  assign n9059_o = ~rst_n;
  /* find_the_damn_issue_sky130.vhd:5742:27  */
  assign n9069_o = ~rst_n;
  /* find_the_damn_issue_sky130.vhd:5734:17  */
  always @(posedge clk or posedge n9059_o)
    if (n9059_o)
      n9075_q <= 1'b0;
    else
      n9075_q <= s_delayed_input_2;
  /* find_the_damn_issue_sky130.vhd:5744:17  */
  always @(negedge clk or posedge n9069_o)
    if (n9069_o)
      n9076_q <= 1'b0;
    else
      n9076_q <= s_delayed_input_3;
  /* find_the_damn_issue_sky130.vhd:5734:17  */
  always @(posedge clk or posedge n9059_o)
    if (n9059_o)
      n9077_q <= 1'b0;
    else
      n9077_q <= s_delayed_input_delayed1_3;
endmodule

module detectsingleended
  (input  clk,
   input  rst_n,
   input  in_unnamed,
   input  in_unnamed_2,
   output out_singleended);
  reg s_unnamed_delayed1;
  reg s_unnamed_delayed1_2;
  wire s_unnamed_delayed1_3;
  wire s_unnamed_delayed1_4;
  wire s_unnamed_3;
  wire s_unnamed_4;
  wire s_unnamed_5;
  wire s_unnamed_6;
  wire n8999_o;
  wire n9000_o;
  wire n9001_o;
  wire n9002_o;
  wire n9003_o;
  wire n9004_o;
  wire n9005_o;
  wire n9013_o;
  reg n9022_q;
  reg n9023_q;
  reg n9024_q;
  reg n9025_q;
  assign out_singleended = n9005_o;
  /* find_the_damn_issue_sky130.vhd:5779:16  */
  always @*
    s_unnamed_delayed1 = n9022_q; // (isignal)
  initial
    s_unnamed_delayed1 = 1'b0;
  /* find_the_damn_issue_sky130.vhd:5780:16  */
  always @*
    s_unnamed_delayed1_2 = n9023_q; // (isignal)
  initial
    s_unnamed_delayed1_2 = 1'b0;
  /* find_the_damn_issue_sky130.vhd:5781:16  */
  assign s_unnamed_delayed1_3 = n9024_q; // (signal)
  /* find_the_damn_issue_sky130.vhd:5782:16  */
  assign s_unnamed_delayed1_4 = n9025_q; // (signal)
  /* find_the_damn_issue_sky130.vhd:5783:16  */
  assign s_unnamed_3 = in_unnamed; // (signal)
  /* find_the_damn_issue_sky130.vhd:5784:16  */
  assign s_unnamed_4 = in_unnamed_2; // (signal)
  /* find_the_damn_issue_sky130.vhd:5785:16  */
  assign s_unnamed_5 = s_unnamed_4; // (signal)
  /* find_the_damn_issue_sky130.vhd:5786:16  */
  assign s_unnamed_6 = s_unnamed_3; // (signal)
  /* find_the_damn_issue_sky130.vhd:5790:41  */
  assign n8999_o = ~s_unnamed_delayed1;
  /* find_the_damn_issue_sky130.vhd:5790:71  */
  assign n9000_o = ~s_unnamed_delayed1_2;
  /* find_the_damn_issue_sky130.vhd:5790:65  */
  assign n9001_o = n8999_o & n9000_o;
  /* find_the_damn_issue_sky130.vhd:5790:104  */
  assign n9002_o = ~s_unnamed_delayed1_3;
  /* find_the_damn_issue_sky130.vhd:5790:98  */
  assign n9003_o = n9001_o & n9002_o;
  /* find_the_damn_issue_sky130.vhd:5790:137  */
  assign n9004_o = ~s_unnamed_delayed1_4;
  /* find_the_damn_issue_sky130.vhd:5790:131  */
  assign n9005_o = n9003_o & n9004_o;
  /* find_the_damn_issue_sky130.vhd:5807:27  */
  assign n9013_o = ~rst_n;
  /* find_the_damn_issue_sky130.vhd:5810:17  */
  always @(posedge clk or posedge n9013_o)
    if (n9013_o)
      n9022_q <= 1'b0;
    else
      n9022_q <= s_unnamed_4;
  /* find_the_damn_issue_sky130.vhd:5810:17  */
  always @(posedge clk or posedge n9013_o)
    if (n9013_o)
      n9023_q <= 1'b0;
    else
      n9023_q <= s_unnamed_3;
  /* find_the_damn_issue_sky130.vhd:5799:17  */
  always @(negedge clk)
    n9024_q <= s_unnamed_5;
  /* find_the_damn_issue_sky130.vhd:5799:17  */
  always @(negedge clk)
    n9025_q <= s_unnamed_6;
endmodule

module delay_chain_with_taps_2
  (input  in_chain_input,
   input  [4:0] in_delay,
   output out_chain_output);
  wire s_chain_input_2;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_2;
  wire s_unnamed;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_3;
  wire s_unnamed_2;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_4;
  wire s_unnamed_3;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_5;
  wire s_unnamed_4;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_6;
  wire s_unnamed_5;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_7;
  wire s_unnamed_6;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_8;
  wire s_unnamed_7;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_9;
  wire s_unnamed_8;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_10;
  wire s_unnamed_9;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_11;
  wire s_unnamed_10;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_12;
  wire s_unnamed_11;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_13;
  wire s_unnamed_12;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_14;
  wire s_unnamed_13;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_15;
  wire s_unnamed_14;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_16;
  wire s_unnamed_15;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_17;
  wire s_unnamed_16;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_18;
  wire s_unnamed_17;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_19;
  wire s_unnamed_18;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_20;
  wire s_unnamed_19;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_21;
  wire s_unnamed_20;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_22;
  wire s_unnamed_21;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_23;
  wire s_unnamed_22;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_24;
  wire s_unnamed_23;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_25;
  wire s_unnamed_24;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_26;
  wire s_unnamed_25;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_27;
  wire s_unnamed_26;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_28;
  wire s_unnamed_27;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_29;
  wire s_unnamed_28;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_30;
  wire s_unnamed_29;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_31;
  wire s_unnamed_30;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_32;
  wire s_unnamed_31;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_33;
  wire s_unnamed_32;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_34;
  wire s_unnamed_33;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_35;
  wire s_unnamed_34;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_36;
  wire s_unnamed_35;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_37;
  wire s_unnamed_36;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_38;
  wire s_unnamed_37;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_39;
  wire s_unnamed_38;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_40;
  wire s_unnamed_39;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_41;
  wire s_unnamed_40;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_42;
  wire s_unnamed_41;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_43;
  wire s_unnamed_42;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_44;
  wire s_unnamed_43;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_45;
  wire s_unnamed_44;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_46;
  wire s_unnamed_45;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_47;
  wire s_unnamed_46;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_48;
  wire s_unnamed_47;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_49;
  wire s_unnamed_48;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_50;
  wire s_unnamed_49;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_51;
  wire s_unnamed_50;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_52;
  wire s_unnamed_51;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_53;
  wire s_unnamed_52;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_54;
  wire s_unnamed_53;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_55;
  wire s_unnamed_54;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_56;
  wire s_unnamed_55;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_57;
  wire s_unnamed_56;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_58;
  wire s_unnamed_57;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_59;
  wire s_unnamed_58;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_60;
  wire s_unnamed_59;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_61;
  wire s_unnamed_60;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_62;
  wire s_unnamed_61;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_63;
  wire s_unnamed_62;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_64;
  wire s_unnamed_63;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_65;
  wire s_unnamed_64;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_66;
  wire s_unnamed_65;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_67;
  wire s_unnamed_66;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_68;
  wire s_unnamed_67;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_69;
  wire s_unnamed_68;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_70;
  wire s_unnamed_69;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_71;
  wire s_unnamed_70;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_72;
  wire s_unnamed_71;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_73;
  wire s_unnamed_72;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_74;
  wire s_unnamed_73;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_75;
  wire s_unnamed_74;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_76;
  wire s_unnamed_75;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_77;
  wire s_unnamed_76;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_78;
  wire s_unnamed_77;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_79;
  wire s_unnamed_78;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_80;
  wire s_unnamed_79;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_81;
  wire s_unnamed_80;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_82;
  wire s_unnamed_81;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_83;
  wire s_unnamed_82;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_84;
  wire s_unnamed_83;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_85;
  wire s_unnamed_84;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_86;
  wire s_unnamed_85;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_87;
  wire s_unnamed_86;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_88;
  wire s_unnamed_87;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_89;
  wire s_unnamed_88;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_90;
  wire s_unnamed_89;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_91;
  wire s_unnamed_90;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_92;
  wire s_unnamed_91;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_93;
  wire s_unnamed_92;
  wire s_unnamed_93;
  wire s_unnamed_94;
  wire s_unnamed_95;
  wire s_unnamed_96;
  wire s_unnamed_97;
  wire s_unnamed_98;
  wire s_unnamed_99;
  wire s_unnamed_100;
  wire s_unnamed_101;
  wire s_unnamed_102;
  wire s_unnamed_103;
  wire s_unnamed_104;
  wire s_unnamed_105;
  wire s_unnamed_106;
  wire s_unnamed_107;
  wire s_unnamed_108;
  wire s_unnamed_109;
  wire s_unnamed_110;
  wire s_unnamed_111;
  wire s_unnamed_112;
  wire s_unnamed_113;
  wire s_unnamed_114;
  wire s_unnamed_115;
  wire s_unnamed_116;
  wire s_unnamed_117;
  wire s_unnamed_118;
  wire s_unnamed_119;
  wire s_unnamed_120;
  wire s_unnamed_121;
  wire s_unnamed_122;
  wire s_unnamed_123;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_2_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_3_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_4_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_5_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_6_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_7_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_8_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_9_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_10_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_11_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_12_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_13_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_14_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_15_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_16_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_17_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_18_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_19_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_20_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_21_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_22_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_23_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_24_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_25_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_26_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_27_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_28_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_29_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_30_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_31_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_32_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_33_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_34_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_35_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_36_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_37_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_38_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_39_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_40_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_41_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_42_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_43_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_44_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_45_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_46_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_47_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_48_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_49_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_50_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_51_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_52_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_53_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_54_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_55_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_56_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_57_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_58_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_59_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_60_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_61_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_62_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_63_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_64_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_65_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_66_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_67_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_68_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_69_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_70_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_71_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_72_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_73_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_74_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_75_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_76_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_77_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_78_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_79_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_80_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_81_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_82_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_83_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_84_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_85_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_86_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_87_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_88_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_89_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_90_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_91_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_92_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_93_X;
  localparam [31:0] n8769_o = 32'bX;
  wire [30:0] n8770_o;
  wire [31:0] n8771_o;
  wire [29:0] n8772_o;
  wire [30:0] n8773_o;
  wire n8774_o;
  wire [31:0] n8775_o;
  wire [28:0] n8776_o;
  wire [29:0] n8777_o;
  wire [1:0] n8778_o;
  wire [31:0] n8779_o;
  wire [27:0] n8780_o;
  wire [28:0] n8781_o;
  wire [2:0] n8782_o;
  wire [31:0] n8783_o;
  wire [26:0] n8784_o;
  wire [27:0] n8785_o;
  wire [3:0] n8786_o;
  wire [31:0] n8787_o;
  wire [25:0] n8788_o;
  wire [26:0] n8789_o;
  wire [4:0] n8790_o;
  wire [31:0] n8791_o;
  wire [24:0] n8792_o;
  wire [25:0] n8793_o;
  wire [5:0] n8794_o;
  wire [31:0] n8795_o;
  wire [23:0] n8796_o;
  wire [24:0] n8797_o;
  wire [6:0] n8798_o;
  wire [31:0] n8799_o;
  wire [22:0] n8800_o;
  wire [23:0] n8801_o;
  wire [7:0] n8802_o;
  wire [31:0] n8803_o;
  wire [21:0] n8804_o;
  wire [22:0] n8805_o;
  wire [8:0] n8806_o;
  wire [31:0] n8807_o;
  wire [20:0] n8808_o;
  wire [21:0] n8809_o;
  wire [9:0] n8810_o;
  wire [31:0] n8811_o;
  wire [19:0] n8812_o;
  wire [20:0] n8813_o;
  wire [10:0] n8814_o;
  wire [31:0] n8815_o;
  wire [18:0] n8816_o;
  wire [19:0] n8817_o;
  wire [11:0] n8818_o;
  wire [31:0] n8819_o;
  wire [17:0] n8820_o;
  wire [18:0] n8821_o;
  wire [12:0] n8822_o;
  wire [31:0] n8823_o;
  wire [16:0] n8824_o;
  wire [17:0] n8825_o;
  wire [13:0] n8826_o;
  wire [31:0] n8827_o;
  wire [15:0] n8828_o;
  wire [16:0] n8829_o;
  wire [14:0] n8830_o;
  wire [31:0] n8831_o;
  wire [14:0] n8832_o;
  wire [15:0] n8833_o;
  wire [15:0] n8834_o;
  wire [31:0] n8835_o;
  wire [13:0] n8836_o;
  wire [14:0] n8837_o;
  wire [16:0] n8838_o;
  wire [31:0] n8839_o;
  wire [12:0] n8840_o;
  wire [13:0] n8841_o;
  wire [17:0] n8842_o;
  wire [31:0] n8843_o;
  wire [11:0] n8844_o;
  wire [12:0] n8845_o;
  wire [18:0] n8846_o;
  wire [31:0] n8847_o;
  wire [10:0] n8848_o;
  wire [11:0] n8849_o;
  wire [19:0] n8850_o;
  wire [31:0] n8851_o;
  wire [9:0] n8852_o;
  wire [10:0] n8853_o;
  wire [20:0] n8854_o;
  wire [31:0] n8855_o;
  wire [8:0] n8856_o;
  wire [9:0] n8857_o;
  wire [21:0] n8858_o;
  wire [31:0] n8859_o;
  wire [7:0] n8860_o;
  wire [8:0] n8861_o;
  wire [22:0] n8862_o;
  wire [31:0] n8863_o;
  wire [6:0] n8864_o;
  wire [7:0] n8865_o;
  wire [23:0] n8866_o;
  wire [31:0] n8867_o;
  wire [5:0] n8868_o;
  wire [6:0] n8869_o;
  wire [24:0] n8870_o;
  wire [31:0] n8871_o;
  wire [4:0] n8872_o;
  wire [5:0] n8873_o;
  wire [25:0] n8874_o;
  wire [31:0] n8875_o;
  wire [3:0] n8876_o;
  wire [4:0] n8877_o;
  wire [26:0] n8878_o;
  wire [31:0] n8879_o;
  wire [2:0] n8880_o;
  wire [3:0] n8881_o;
  wire [27:0] n8882_o;
  wire [31:0] n8883_o;
  wire [1:0] n8884_o;
  wire [2:0] n8885_o;
  wire [28:0] n8886_o;
  wire [31:0] n8887_o;
  wire n8888_o;
  wire [1:0] n8889_o;
  wire [29:0] n8890_o;
  wire [31:0] n8891_o;
  wire [30:0] n8892_o;
  wire [31:0] n8893_o;
  wire n8894_o;
  wire n8896_o;
  wire n8897_o;
  wire n8899_o;
  wire n8900_o;
  wire n8902_o;
  wire n8903_o;
  wire n8905_o;
  wire n8906_o;
  wire n8908_o;
  wire n8909_o;
  wire n8911_o;
  wire n8912_o;
  wire n8914_o;
  wire n8915_o;
  wire n8917_o;
  wire n8918_o;
  wire n8920_o;
  wire n8921_o;
  wire n8923_o;
  wire n8924_o;
  wire n8926_o;
  wire n8927_o;
  wire n8929_o;
  wire n8930_o;
  wire n8932_o;
  wire n8933_o;
  wire n8935_o;
  wire n8936_o;
  wire n8938_o;
  wire n8939_o;
  wire n8941_o;
  wire n8942_o;
  wire n8944_o;
  wire n8945_o;
  wire n8947_o;
  wire n8948_o;
  wire n8950_o;
  wire n8951_o;
  wire n8953_o;
  wire n8954_o;
  wire n8956_o;
  wire n8957_o;
  wire n8959_o;
  wire n8960_o;
  wire n8962_o;
  wire n8963_o;
  wire n8965_o;
  wire n8966_o;
  wire n8968_o;
  wire n8969_o;
  wire n8971_o;
  wire n8972_o;
  wire n8974_o;
  wire n8975_o;
  wire n8977_o;
  wire n8978_o;
  wire n8980_o;
  wire n8981_o;
  wire n8983_o;
  wire n8984_o;
  wire n8986_o;
  wire n8987_o;
  wire n8989_o;
  wire [31:0] n8990_o;
  reg n8992_o;
  assign out_chain_output = n8992_o;
  /* find_the_damn_issue_sky130.vhd:5850:16  */
  assign s_chain_input_2 = in_chain_input; // (signal)
  /* find_the_damn_issue_sky130.vhd:5851:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x = sky130_fd_sc_hd_dlygate4sd3_1_inst_2_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:5852:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_2 = sky130_fd_sc_hd_dlygate4sd3_1_inst_3_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:5853:16  */
  assign s_unnamed = s_sky130_fd_sc_hd_dlygate4sd3_1_x; // (signal)
  /* find_the_damn_issue_sky130.vhd:5854:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_3 = sky130_fd_sc_hd_dlygate4sd3_1_inst_4_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:5855:16  */
  assign s_unnamed_2 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_2; // (signal)
  /* find_the_damn_issue_sky130.vhd:5856:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_4 = sky130_fd_sc_hd_dlygate4sd3_1_inst_5_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:5857:16  */
  assign s_unnamed_3 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_3; // (signal)
  /* find_the_damn_issue_sky130.vhd:5858:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_5 = sky130_fd_sc_hd_dlygate4sd3_1_inst_6_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:5859:16  */
  assign s_unnamed_4 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_4; // (signal)
  /* find_the_damn_issue_sky130.vhd:5860:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_6 = sky130_fd_sc_hd_dlygate4sd3_1_inst_7_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:5861:16  */
  assign s_unnamed_5 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_5; // (signal)
  /* find_the_damn_issue_sky130.vhd:5862:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_7 = sky130_fd_sc_hd_dlygate4sd3_1_inst_10_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:5863:16  */
  assign s_unnamed_6 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_6; // (signal)
  /* find_the_damn_issue_sky130.vhd:5864:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_8 = sky130_fd_sc_hd_dlygate4sd3_1_inst_11_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:5865:16  */
  assign s_unnamed_7 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_7; // (signal)
  /* find_the_damn_issue_sky130.vhd:5866:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_9 = sky130_fd_sc_hd_dlygate4sd3_1_inst_12_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:5867:16  */
  assign s_unnamed_8 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_8; // (signal)
  /* find_the_damn_issue_sky130.vhd:5868:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_10 = sky130_fd_sc_hd_dlygate4sd3_1_inst_15_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:5869:16  */
  assign s_unnamed_9 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_9; // (signal)
  /* find_the_damn_issue_sky130.vhd:5870:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_11 = sky130_fd_sc_hd_dlygate4sd3_1_inst_18_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:5871:16  */
  assign s_unnamed_10 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_10; // (signal)
  /* find_the_damn_issue_sky130.vhd:5872:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_12 = sky130_fd_sc_hd_dlygate4sd3_1_inst_19_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:5873:16  */
  assign s_unnamed_11 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_11; // (signal)
  /* find_the_damn_issue_sky130.vhd:5874:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_13 = sky130_fd_sc_hd_dlygate4sd3_1_inst_20_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:5875:16  */
  assign s_unnamed_12 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_12; // (signal)
  /* find_the_damn_issue_sky130.vhd:5876:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_14 = sky130_fd_sc_hd_dlygate4sd3_1_inst_22_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:5877:16  */
  assign s_unnamed_13 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_13; // (signal)
  /* find_the_damn_issue_sky130.vhd:5878:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_15 = sky130_fd_sc_hd_dlygate4sd3_1_inst_25_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:5879:16  */
  assign s_unnamed_14 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_14; // (signal)
  /* find_the_damn_issue_sky130.vhd:5880:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_16 = sky130_fd_sc_hd_dlygate4sd3_1_inst_27_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:5881:16  */
  assign s_unnamed_15 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_15; // (signal)
  /* find_the_damn_issue_sky130.vhd:5882:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_17 = sky130_fd_sc_hd_dlygate4sd3_1_inst_28_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:5883:16  */
  assign s_unnamed_16 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_16; // (signal)
  /* find_the_damn_issue_sky130.vhd:5884:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_18 = sky130_fd_sc_hd_dlygate4sd3_1_inst_30_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:5885:16  */
  assign s_unnamed_17 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_17; // (signal)
  /* find_the_damn_issue_sky130.vhd:5886:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_19 = sky130_fd_sc_hd_dlygate4sd3_1_inst_32_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:5887:16  */
  assign s_unnamed_18 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_18; // (signal)
  /* find_the_damn_issue_sky130.vhd:5888:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_20 = sky130_fd_sc_hd_dlygate4sd3_1_inst_33_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:5889:16  */
  assign s_unnamed_19 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_19; // (signal)
  /* find_the_damn_issue_sky130.vhd:5890:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_21 = sky130_fd_sc_hd_dlygate4sd3_1_inst_35_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:5891:16  */
  assign s_unnamed_20 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_20; // (signal)
  /* find_the_damn_issue_sky130.vhd:5892:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_22 = sky130_fd_sc_hd_dlygate4sd3_1_inst_36_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:5893:16  */
  assign s_unnamed_21 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_21; // (signal)
  /* find_the_damn_issue_sky130.vhd:5894:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_23 = sky130_fd_sc_hd_dlygate4sd3_1_inst_38_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:5895:16  */
  assign s_unnamed_22 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_22; // (signal)
  /* find_the_damn_issue_sky130.vhd:5896:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_24 = sky130_fd_sc_hd_dlygate4sd3_1_inst_39_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:5897:16  */
  assign s_unnamed_23 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_23; // (signal)
  /* find_the_damn_issue_sky130.vhd:5898:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_25 = sky130_fd_sc_hd_dlygate4sd3_1_inst_44_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:5899:16  */
  assign s_unnamed_24 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_24; // (signal)
  /* find_the_damn_issue_sky130.vhd:5900:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_26 = sky130_fd_sc_hd_dlygate4sd3_1_inst_45_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:5901:16  */
  assign s_unnamed_25 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_25; // (signal)
  /* find_the_damn_issue_sky130.vhd:5902:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_27 = sky130_fd_sc_hd_dlygate4sd3_1_inst_46_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:5903:16  */
  assign s_unnamed_26 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_26; // (signal)
  /* find_the_damn_issue_sky130.vhd:5904:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_28 = sky130_fd_sc_hd_dlygate4sd3_1_inst_48_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:5905:16  */
  assign s_unnamed_27 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_27; // (signal)
  /* find_the_damn_issue_sky130.vhd:5906:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_29 = sky130_fd_sc_hd_dlygate4sd3_1_inst_49_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:5907:16  */
  assign s_unnamed_28 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_28; // (signal)
  /* find_the_damn_issue_sky130.vhd:5908:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_30 = sky130_fd_sc_hd_dlygate4sd3_1_inst_52_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:5909:16  */
  assign s_unnamed_29 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_29; // (signal)
  /* find_the_damn_issue_sky130.vhd:5910:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_31 = sky130_fd_sc_hd_dlygate4sd3_1_inst_54_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:5911:16  */
  assign s_unnamed_30 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_30; // (signal)
  /* find_the_damn_issue_sky130.vhd:5912:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_32 = sky130_fd_sc_hd_dlygate4sd3_1_inst_56_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:5913:16  */
  assign s_unnamed_31 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_31; // (signal)
  /* find_the_damn_issue_sky130.vhd:5914:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_33 = sky130_fd_sc_hd_dlygate4sd3_1_inst_57_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:5915:16  */
  assign s_unnamed_32 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_32; // (signal)
  /* find_the_damn_issue_sky130.vhd:5916:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_34 = sky130_fd_sc_hd_dlygate4sd3_1_inst_60_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:5917:16  */
  assign s_unnamed_33 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_33; // (signal)
  /* find_the_damn_issue_sky130.vhd:5918:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_35 = sky130_fd_sc_hd_dlygate4sd3_1_inst_61_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:5919:16  */
  assign s_unnamed_34 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_34; // (signal)
  /* find_the_damn_issue_sky130.vhd:5920:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_36 = sky130_fd_sc_hd_dlygate4sd3_1_inst_62_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:5921:16  */
  assign s_unnamed_35 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_35; // (signal)
  /* find_the_damn_issue_sky130.vhd:5922:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_37 = sky130_fd_sc_hd_dlygate4sd3_1_inst_64_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:5923:16  */
  assign s_unnamed_36 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_36; // (signal)
  /* find_the_damn_issue_sky130.vhd:5924:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_38 = sky130_fd_sc_hd_dlygate4sd3_1_inst_66_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:5925:16  */
  assign s_unnamed_37 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_37; // (signal)
  /* find_the_damn_issue_sky130.vhd:5926:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_39 = sky130_fd_sc_hd_dlygate4sd3_1_inst_67_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:5927:16  */
  assign s_unnamed_38 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_38; // (signal)
  /* find_the_damn_issue_sky130.vhd:5928:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_40 = sky130_fd_sc_hd_dlygate4sd3_1_inst_70_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:5929:16  */
  assign s_unnamed_39 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_39; // (signal)
  /* find_the_damn_issue_sky130.vhd:5930:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_41 = sky130_fd_sc_hd_dlygate4sd3_1_inst_72_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:5931:16  */
  assign s_unnamed_40 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_40; // (signal)
  /* find_the_damn_issue_sky130.vhd:5932:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_42 = sky130_fd_sc_hd_dlygate4sd3_1_inst_73_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:5933:16  */
  assign s_unnamed_41 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_41; // (signal)
  /* find_the_damn_issue_sky130.vhd:5934:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_43 = sky130_fd_sc_hd_dlygate4sd3_1_inst_75_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:5935:16  */
  assign s_unnamed_42 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_42; // (signal)
  /* find_the_damn_issue_sky130.vhd:5936:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_44 = sky130_fd_sc_hd_dlygate4sd3_1_inst_76_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:5937:16  */
  assign s_unnamed_43 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_43; // (signal)
  /* find_the_damn_issue_sky130.vhd:5938:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_45 = sky130_fd_sc_hd_dlygate4sd3_1_inst_79_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:5939:16  */
  assign s_unnamed_44 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_44; // (signal)
  /* find_the_damn_issue_sky130.vhd:5940:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_46 = sky130_fd_sc_hd_dlygate4sd3_1_inst_80_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:5941:16  */
  assign s_unnamed_45 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_45; // (signal)
  /* find_the_damn_issue_sky130.vhd:5942:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_47 = sky130_fd_sc_hd_dlygate4sd3_1_inst_81_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:5943:16  */
  assign s_unnamed_46 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_46; // (signal)
  /* find_the_damn_issue_sky130.vhd:5944:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_48 = sky130_fd_sc_hd_dlygate4sd3_1_inst_83_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:5945:16  */
  assign s_unnamed_47 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_47; // (signal)
  /* find_the_damn_issue_sky130.vhd:5946:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_49 = sky130_fd_sc_hd_dlygate4sd3_1_inst_86_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:5947:16  */
  assign s_unnamed_48 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_48; // (signal)
  /* find_the_damn_issue_sky130.vhd:5948:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_50 = sky130_fd_sc_hd_dlygate4sd3_1_inst_88_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:5949:16  */
  assign s_unnamed_49 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_49; // (signal)
  /* find_the_damn_issue_sky130.vhd:5950:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_51 = sky130_fd_sc_hd_dlygate4sd3_1_inst_89_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:5951:16  */
  assign s_unnamed_50 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_50; // (signal)
  /* find_the_damn_issue_sky130.vhd:5952:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_52 = sky130_fd_sc_hd_dlygate4sd3_1_inst_91_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:5953:16  */
  assign s_unnamed_51 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_51; // (signal)
  /* find_the_damn_issue_sky130.vhd:5954:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_53 = sky130_fd_sc_hd_dlygate4sd3_1_inst_92_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:5955:16  */
  assign s_unnamed_52 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_52; // (signal)
  /* find_the_damn_issue_sky130.vhd:5956:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_54 = sky130_fd_sc_hd_dlygate4sd3_1_inst_93_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:5957:16  */
  assign s_unnamed_53 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_53; // (signal)
  /* find_the_damn_issue_sky130.vhd:5958:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_55 = sky130_fd_sc_hd_dlygate4sd3_1_inst_14_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:5959:16  */
  assign s_unnamed_54 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_54; // (signal)
  /* find_the_damn_issue_sky130.vhd:5960:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_56 = sky130_fd_sc_hd_dlygate4sd3_1_inst_23_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:5961:16  */
  assign s_unnamed_55 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_55; // (signal)
  /* find_the_damn_issue_sky130.vhd:5962:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_57 = sky130_fd_sc_hd_dlygate4sd3_1_inst_31_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:5963:16  */
  assign s_unnamed_56 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_56; // (signal)
  /* find_the_damn_issue_sky130.vhd:5964:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_58 = sky130_fd_sc_hd_dlygate4sd3_1_inst_43_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:5965:16  */
  assign s_unnamed_57 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_57; // (signal)
  /* find_the_damn_issue_sky130.vhd:5966:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_59 = sky130_fd_sc_hd_dlygate4sd3_1_inst_51_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:5967:16  */
  assign s_unnamed_58 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_58; // (signal)
  /* find_the_damn_issue_sky130.vhd:5968:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_60 = sky130_fd_sc_hd_dlygate4sd3_1_inst_58_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:5969:16  */
  assign s_unnamed_59 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_59; // (signal)
  /* find_the_damn_issue_sky130.vhd:5970:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_61 = sky130_fd_sc_hd_dlygate4sd3_1_inst_69_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:5971:16  */
  assign s_unnamed_60 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_60; // (signal)
  /* find_the_damn_issue_sky130.vhd:5972:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_62 = sky130_fd_sc_hd_dlygate4sd3_1_inst_77_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:5973:16  */
  assign s_unnamed_61 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_61; // (signal)
  /* find_the_damn_issue_sky130.vhd:5974:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_63 = sky130_fd_sc_hd_dlygate4sd3_1_inst_85_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:5975:16  */
  assign s_unnamed_62 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_62; // (signal)
  /* find_the_damn_issue_sky130.vhd:5976:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_64 = sky130_fd_sc_hd_dlygate4sd3_1_inst_16_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:5977:16  */
  assign s_unnamed_63 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_63; // (signal)
  /* find_the_damn_issue_sky130.vhd:5978:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_65 = sky130_fd_sc_hd_dlygate4sd3_1_inst_55_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:5979:16  */
  assign s_unnamed_64 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_64; // (signal)
  /* find_the_damn_issue_sky130.vhd:5980:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_66 = sky130_fd_sc_hd_dlygate4sd3_1_inst_8_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:5981:16  */
  assign s_unnamed_65 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_65; // (signal)
  /* find_the_damn_issue_sky130.vhd:5982:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_67 = sky130_fd_sc_hd_dlygate4sd3_1_inst_40_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:5983:16  */
  assign s_unnamed_66 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_66; // (signal)
  /* find_the_damn_issue_sky130.vhd:5984:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_68 = sky130_fd_sc_hd_dlygate4sd3_1_inst_84_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:5985:16  */
  assign s_unnamed_67 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_67; // (signal)
  /* find_the_damn_issue_sky130.vhd:5986:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_69 = sky130_fd_sc_hd_dlygate4sd3_1_inst_68_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:5987:16  */
  assign s_unnamed_68 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_68; // (signal)
  /* find_the_damn_issue_sky130.vhd:5988:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_70 = sky130_fd_sc_hd_dlygate4sd3_1_inst_42_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:5989:16  */
  assign s_unnamed_69 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_69; // (signal)
  /* find_the_damn_issue_sky130.vhd:5990:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_71 = sky130_fd_sc_hd_dlygate4sd3_1_inst_24_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:5991:16  */
  assign s_unnamed_70 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_70; // (signal)
  /* find_the_damn_issue_sky130.vhd:5992:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_72 = sky130_fd_sc_hd_dlygate4sd3_1_inst_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:5993:16  */
  assign s_unnamed_71 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_71; // (signal)
  /* find_the_damn_issue_sky130.vhd:5994:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_73 = sky130_fd_sc_hd_dlygate4sd3_1_inst_90_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:5995:16  */
  assign s_unnamed_72 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_72; // (signal)
  /* find_the_damn_issue_sky130.vhd:5996:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_74 = sky130_fd_sc_hd_dlygate4sd3_1_inst_87_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:5997:16  */
  assign s_unnamed_73 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_73; // (signal)
  /* find_the_damn_issue_sky130.vhd:5998:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_75 = sky130_fd_sc_hd_dlygate4sd3_1_inst_82_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:5999:16  */
  assign s_unnamed_74 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_74; // (signal)
  /* find_the_damn_issue_sky130.vhd:6000:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_76 = sky130_fd_sc_hd_dlygate4sd3_1_inst_78_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:6001:16  */
  assign s_unnamed_75 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_75; // (signal)
  /* find_the_damn_issue_sky130.vhd:6002:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_77 = sky130_fd_sc_hd_dlygate4sd3_1_inst_74_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:6003:16  */
  assign s_unnamed_76 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_76; // (signal)
  /* find_the_damn_issue_sky130.vhd:6004:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_78 = sky130_fd_sc_hd_dlygate4sd3_1_inst_71_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:6005:16  */
  assign s_unnamed_77 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_77; // (signal)
  /* find_the_damn_issue_sky130.vhd:6006:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_79 = sky130_fd_sc_hd_dlygate4sd3_1_inst_65_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:6007:16  */
  assign s_unnamed_78 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_78; // (signal)
  /* find_the_damn_issue_sky130.vhd:6008:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_80 = sky130_fd_sc_hd_dlygate4sd3_1_inst_63_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:6009:16  */
  assign s_unnamed_79 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_79; // (signal)
  /* find_the_damn_issue_sky130.vhd:6010:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_81 = sky130_fd_sc_hd_dlygate4sd3_1_inst_59_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:6011:16  */
  assign s_unnamed_80 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_80; // (signal)
  /* find_the_damn_issue_sky130.vhd:6012:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_82 = sky130_fd_sc_hd_dlygate4sd3_1_inst_53_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:6013:16  */
  assign s_unnamed_81 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_81; // (signal)
  /* find_the_damn_issue_sky130.vhd:6014:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_83 = sky130_fd_sc_hd_dlygate4sd3_1_inst_50_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:6015:16  */
  assign s_unnamed_82 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_82; // (signal)
  /* find_the_damn_issue_sky130.vhd:6016:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_84 = sky130_fd_sc_hd_dlygate4sd3_1_inst_47_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:6017:16  */
  assign s_unnamed_83 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_83; // (signal)
  /* find_the_damn_issue_sky130.vhd:6018:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_85 = sky130_fd_sc_hd_dlygate4sd3_1_inst_41_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:6019:16  */
  assign s_unnamed_84 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_84; // (signal)
  /* find_the_damn_issue_sky130.vhd:6020:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_86 = sky130_fd_sc_hd_dlygate4sd3_1_inst_37_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:6021:16  */
  assign s_unnamed_85 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_85; // (signal)
  /* find_the_damn_issue_sky130.vhd:6022:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_87 = sky130_fd_sc_hd_dlygate4sd3_1_inst_34_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:6023:16  */
  assign s_unnamed_86 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_86; // (signal)
  /* find_the_damn_issue_sky130.vhd:6024:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_88 = sky130_fd_sc_hd_dlygate4sd3_1_inst_29_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:6025:16  */
  assign s_unnamed_87 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_87; // (signal)
  /* find_the_damn_issue_sky130.vhd:6026:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_89 = sky130_fd_sc_hd_dlygate4sd3_1_inst_26_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:6027:16  */
  assign s_unnamed_88 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_88; // (signal)
  /* find_the_damn_issue_sky130.vhd:6028:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_90 = sky130_fd_sc_hd_dlygate4sd3_1_inst_21_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:6029:16  */
  assign s_unnamed_89 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_89; // (signal)
  /* find_the_damn_issue_sky130.vhd:6030:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_91 = sky130_fd_sc_hd_dlygate4sd3_1_inst_17_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:6031:16  */
  assign s_unnamed_90 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_90; // (signal)
  /* find_the_damn_issue_sky130.vhd:6032:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_92 = sky130_fd_sc_hd_dlygate4sd3_1_inst_13_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:6033:16  */
  assign s_unnamed_91 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_91; // (signal)
  /* find_the_damn_issue_sky130.vhd:6034:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_93 = sky130_fd_sc_hd_dlygate4sd3_1_inst_9_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:6035:16  */
  assign s_unnamed_92 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_92; // (signal)
  /* find_the_damn_issue_sky130.vhd:6036:16  */
  assign s_unnamed_93 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_3; // (signal)
  /* find_the_damn_issue_sky130.vhd:6037:16  */
  assign s_unnamed_94 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_6; // (signal)
  /* find_the_damn_issue_sky130.vhd:6038:16  */
  assign s_unnamed_95 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_9; // (signal)
  /* find_the_damn_issue_sky130.vhd:6039:16  */
  assign s_unnamed_96 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_12; // (signal)
  /* find_the_damn_issue_sky130.vhd:6040:16  */
  assign s_unnamed_97 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_15; // (signal)
  /* find_the_damn_issue_sky130.vhd:6041:16  */
  assign s_unnamed_98 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_18; // (signal)
  /* find_the_damn_issue_sky130.vhd:6042:16  */
  assign s_unnamed_99 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_21; // (signal)
  /* find_the_damn_issue_sky130.vhd:6043:16  */
  assign s_unnamed_100 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_24; // (signal)
  /* find_the_damn_issue_sky130.vhd:6044:16  */
  assign s_unnamed_101 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_27; // (signal)
  /* find_the_damn_issue_sky130.vhd:6045:16  */
  assign s_unnamed_102 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_30; // (signal)
  /* find_the_damn_issue_sky130.vhd:6046:16  */
  assign s_unnamed_103 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_33; // (signal)
  /* find_the_damn_issue_sky130.vhd:6047:16  */
  assign s_unnamed_104 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_36; // (signal)
  /* find_the_damn_issue_sky130.vhd:6048:16  */
  assign s_unnamed_105 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_39; // (signal)
  /* find_the_damn_issue_sky130.vhd:6049:16  */
  assign s_unnamed_106 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_42; // (signal)
  /* find_the_damn_issue_sky130.vhd:6050:16  */
  assign s_unnamed_107 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_45; // (signal)
  /* find_the_damn_issue_sky130.vhd:6051:16  */
  assign s_unnamed_108 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_48; // (signal)
  /* find_the_damn_issue_sky130.vhd:6052:16  */
  assign s_unnamed_109 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_51; // (signal)
  /* find_the_damn_issue_sky130.vhd:6053:16  */
  assign s_unnamed_110 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_54; // (signal)
  /* find_the_damn_issue_sky130.vhd:6054:16  */
  assign s_unnamed_111 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_57; // (signal)
  /* find_the_damn_issue_sky130.vhd:6055:16  */
  assign s_unnamed_112 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_60; // (signal)
  /* find_the_damn_issue_sky130.vhd:6056:16  */
  assign s_unnamed_113 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_63; // (signal)
  /* find_the_damn_issue_sky130.vhd:6057:16  */
  assign s_unnamed_114 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_66; // (signal)
  /* find_the_damn_issue_sky130.vhd:6058:16  */
  assign s_unnamed_115 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_69; // (signal)
  /* find_the_damn_issue_sky130.vhd:6059:16  */
  assign s_unnamed_116 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_72; // (signal)
  /* find_the_damn_issue_sky130.vhd:6060:16  */
  assign s_unnamed_117 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_75; // (signal)
  /* find_the_damn_issue_sky130.vhd:6061:16  */
  assign s_unnamed_118 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_78; // (signal)
  /* find_the_damn_issue_sky130.vhd:6062:16  */
  assign s_unnamed_119 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_81; // (signal)
  /* find_the_damn_issue_sky130.vhd:6063:16  */
  assign s_unnamed_120 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_84; // (signal)
  /* find_the_damn_issue_sky130.vhd:6064:16  */
  assign s_unnamed_121 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_87; // (signal)
  /* find_the_damn_issue_sky130.vhd:6065:16  */
  assign s_unnamed_122 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_90; // (signal)
  /* find_the_damn_issue_sky130.vhd:6066:16  */
  assign s_unnamed_123 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_93; // (signal)
  /* find_the_damn_issue_sky130.vhd:6068:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst (
    .A(s_unnamed_71),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_X));
  /* find_the_damn_issue_sky130.vhd:6073:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_2 (
    .A(s_chain_input_2),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_2_X));
  /* find_the_damn_issue_sky130.vhd:6078:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_3 (
    .A(s_unnamed),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_3_X));
  /* find_the_damn_issue_sky130.vhd:6083:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_4 (
    .A(s_unnamed_2),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_4_X));
  /* find_the_damn_issue_sky130.vhd:6088:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_5 (
    .A(s_unnamed_3),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_5_X));
  /* find_the_damn_issue_sky130.vhd:6093:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_6 (
    .A(s_unnamed_4),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_6_X));
  /* find_the_damn_issue_sky130.vhd:6098:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_7 (
    .A(s_unnamed_5),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_7_X));
  /* find_the_damn_issue_sky130.vhd:6103:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_8 (
    .A(s_unnamed_65),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_8_X));
  /* find_the_damn_issue_sky130.vhd:6108:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_9 (
    .A(s_unnamed_92),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_9_X));
  /* find_the_damn_issue_sky130.vhd:6113:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_10 (
    .A(s_unnamed_6),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_10_X));
  /* find_the_damn_issue_sky130.vhd:6118:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_11 (
    .A(s_unnamed_7),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_11_X));
  /* find_the_damn_issue_sky130.vhd:6123:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_12 (
    .A(s_unnamed_8),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_12_X));
  /* find_the_damn_issue_sky130.vhd:6128:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_13 (
    .A(s_unnamed_91),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_13_X));
  /* find_the_damn_issue_sky130.vhd:6133:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_14 (
    .A(s_unnamed_54),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_14_X));
  /* find_the_damn_issue_sky130.vhd:6138:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_15 (
    .A(s_unnamed_9),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_15_X));
  /* find_the_damn_issue_sky130.vhd:6143:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_16 (
    .A(s_unnamed_63),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_16_X));
  /* find_the_damn_issue_sky130.vhd:6148:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_17 (
    .A(s_unnamed_90),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_17_X));
  /* find_the_damn_issue_sky130.vhd:6153:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_18 (
    .A(s_unnamed_10),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_18_X));
  /* find_the_damn_issue_sky130.vhd:6158:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_19 (
    .A(s_unnamed_11),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_19_X));
  /* find_the_damn_issue_sky130.vhd:6163:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_20 (
    .A(s_unnamed_12),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_20_X));
  /* find_the_damn_issue_sky130.vhd:6168:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_21 (
    .A(s_unnamed_89),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_21_X));
  /* find_the_damn_issue_sky130.vhd:6173:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_22 (
    .A(s_unnamed_13),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_22_X));
  /* find_the_damn_issue_sky130.vhd:6178:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_23 (
    .A(s_unnamed_55),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_23_X));
  /* find_the_damn_issue_sky130.vhd:6183:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_24 (
    .A(s_unnamed_70),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_24_X));
  /* find_the_damn_issue_sky130.vhd:6188:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_25 (
    .A(s_unnamed_14),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_25_X));
  /* find_the_damn_issue_sky130.vhd:6193:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_26 (
    .A(s_unnamed_88),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_26_X));
  /* find_the_damn_issue_sky130.vhd:6198:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_27 (
    .A(s_unnamed_15),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_27_X));
  /* find_the_damn_issue_sky130.vhd:6203:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_28 (
    .A(s_unnamed_16),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_28_X));
  /* find_the_damn_issue_sky130.vhd:6208:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_29 (
    .A(s_unnamed_87),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_29_X));
  /* find_the_damn_issue_sky130.vhd:6213:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_30 (
    .A(s_unnamed_17),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_30_X));
  /* find_the_damn_issue_sky130.vhd:6218:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_31 (
    .A(s_unnamed_56),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_31_X));
  /* find_the_damn_issue_sky130.vhd:6223:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_32 (
    .A(s_unnamed_18),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_32_X));
  /* find_the_damn_issue_sky130.vhd:6228:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_33 (
    .A(s_unnamed_19),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_33_X));
  /* find_the_damn_issue_sky130.vhd:6233:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_34 (
    .A(s_unnamed_86),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_34_X));
  /* find_the_damn_issue_sky130.vhd:6238:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_35 (
    .A(s_unnamed_20),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_35_X));
  /* find_the_damn_issue_sky130.vhd:6243:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_36 (
    .A(s_unnamed_21),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_36_X));
  /* find_the_damn_issue_sky130.vhd:6248:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_37 (
    .A(s_unnamed_85),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_37_X));
  /* find_the_damn_issue_sky130.vhd:6253:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_38 (
    .A(s_unnamed_22),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_38_X));
  /* find_the_damn_issue_sky130.vhd:6258:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_39 (
    .A(s_unnamed_23),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_39_X));
  /* find_the_damn_issue_sky130.vhd:6263:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_40 (
    .A(s_unnamed_66),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_40_X));
  /* find_the_damn_issue_sky130.vhd:6268:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_41 (
    .A(s_unnamed_84),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_41_X));
  /* find_the_damn_issue_sky130.vhd:6273:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_42 (
    .A(s_unnamed_69),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_42_X));
  /* find_the_damn_issue_sky130.vhd:6278:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_43 (
    .A(s_unnamed_57),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_43_X));
  /* find_the_damn_issue_sky130.vhd:6283:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_44 (
    .A(s_unnamed_24),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_44_X));
  /* find_the_damn_issue_sky130.vhd:6288:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_45 (
    .A(s_unnamed_25),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_45_X));
  /* find_the_damn_issue_sky130.vhd:6293:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_46 (
    .A(s_unnamed_26),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_46_X));
  /* find_the_damn_issue_sky130.vhd:6298:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_47 (
    .A(s_unnamed_83),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_47_X));
  /* find_the_damn_issue_sky130.vhd:6303:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_48 (
    .A(s_unnamed_27),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_48_X));
  /* find_the_damn_issue_sky130.vhd:6308:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_49 (
    .A(s_unnamed_28),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_49_X));
  /* find_the_damn_issue_sky130.vhd:6313:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_50 (
    .A(s_unnamed_82),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_50_X));
  /* find_the_damn_issue_sky130.vhd:6318:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_51 (
    .A(s_unnamed_58),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_51_X));
  /* find_the_damn_issue_sky130.vhd:6323:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_52 (
    .A(s_unnamed_29),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_52_X));
  /* find_the_damn_issue_sky130.vhd:6328:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_53 (
    .A(s_unnamed_81),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_53_X));
  /* find_the_damn_issue_sky130.vhd:6333:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_54 (
    .A(s_unnamed_30),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_54_X));
  /* find_the_damn_issue_sky130.vhd:6338:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_55 (
    .A(s_unnamed_64),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_55_X));
  /* find_the_damn_issue_sky130.vhd:6343:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_56 (
    .A(s_unnamed_31),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_56_X));
  /* find_the_damn_issue_sky130.vhd:6348:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_57 (
    .A(s_unnamed_32),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_57_X));
  /* find_the_damn_issue_sky130.vhd:6353:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_58 (
    .A(s_unnamed_59),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_58_X));
  /* find_the_damn_issue_sky130.vhd:6358:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_59 (
    .A(s_unnamed_80),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_59_X));
  /* find_the_damn_issue_sky130.vhd:6363:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_60 (
    .A(s_unnamed_33),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_60_X));
  /* find_the_damn_issue_sky130.vhd:6368:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_61 (
    .A(s_unnamed_34),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_61_X));
  /* find_the_damn_issue_sky130.vhd:6373:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_62 (
    .A(s_unnamed_35),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_62_X));
  /* find_the_damn_issue_sky130.vhd:6378:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_63 (
    .A(s_unnamed_79),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_63_X));
  /* find_the_damn_issue_sky130.vhd:6383:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_64 (
    .A(s_unnamed_36),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_64_X));
  /* find_the_damn_issue_sky130.vhd:6388:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_65 (
    .A(s_unnamed_78),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_65_X));
  /* find_the_damn_issue_sky130.vhd:6393:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_66 (
    .A(s_unnamed_37),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_66_X));
  /* find_the_damn_issue_sky130.vhd:6398:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_67 (
    .A(s_unnamed_38),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_67_X));
  /* find_the_damn_issue_sky130.vhd:6403:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_68 (
    .A(s_unnamed_68),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_68_X));
  /* find_the_damn_issue_sky130.vhd:6408:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_69 (
    .A(s_unnamed_60),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_69_X));
  /* find_the_damn_issue_sky130.vhd:6413:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_70 (
    .A(s_unnamed_39),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_70_X));
  /* find_the_damn_issue_sky130.vhd:6418:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_71 (
    .A(s_unnamed_77),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_71_X));
  /* find_the_damn_issue_sky130.vhd:6423:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_72 (
    .A(s_unnamed_40),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_72_X));
  /* find_the_damn_issue_sky130.vhd:6428:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_73 (
    .A(s_unnamed_41),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_73_X));
  /* find_the_damn_issue_sky130.vhd:6433:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_74 (
    .A(s_unnamed_76),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_74_X));
  /* find_the_damn_issue_sky130.vhd:6438:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_75 (
    .A(s_unnamed_42),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_75_X));
  /* find_the_damn_issue_sky130.vhd:6443:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_76 (
    .A(s_unnamed_43),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_76_X));
  /* find_the_damn_issue_sky130.vhd:6448:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_77 (
    .A(s_unnamed_61),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_77_X));
  /* find_the_damn_issue_sky130.vhd:6453:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_78 (
    .A(s_unnamed_75),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_78_X));
  /* find_the_damn_issue_sky130.vhd:6458:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_79 (
    .A(s_unnamed_44),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_79_X));
  /* find_the_damn_issue_sky130.vhd:6463:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_80 (
    .A(s_unnamed_45),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_80_X));
  /* find_the_damn_issue_sky130.vhd:6468:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_81 (
    .A(s_unnamed_46),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_81_X));
  /* find_the_damn_issue_sky130.vhd:6473:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_82 (
    .A(s_unnamed_74),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_82_X));
  /* find_the_damn_issue_sky130.vhd:6478:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_83 (
    .A(s_unnamed_47),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_83_X));
  /* find_the_damn_issue_sky130.vhd:6483:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_84 (
    .A(s_unnamed_67),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_84_X));
  /* find_the_damn_issue_sky130.vhd:6488:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_85 (
    .A(s_unnamed_62),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_85_X));
  /* find_the_damn_issue_sky130.vhd:6493:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_86 (
    .A(s_unnamed_48),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_86_X));
  /* find_the_damn_issue_sky130.vhd:6498:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_87 (
    .A(s_unnamed_73),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_87_X));
  /* find_the_damn_issue_sky130.vhd:6503:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_88 (
    .A(s_unnamed_49),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_88_X));
  /* find_the_damn_issue_sky130.vhd:6508:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_89 (
    .A(s_unnamed_50),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_89_X));
  /* find_the_damn_issue_sky130.vhd:6513:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_90 (
    .A(s_unnamed_72),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_90_X));
  /* find_the_damn_issue_sky130.vhd:6518:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_91 (
    .A(s_unnamed_51),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_91_X));
  /* find_the_damn_issue_sky130.vhd:6523:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_92 (
    .A(s_unnamed_52),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_92_X));
  /* find_the_damn_issue_sky130.vhd:6528:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_93 (
    .A(s_unnamed_53),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_93_X));
  /* find_the_damn_issue_sky130.vhd:6666:60  */
  assign n8770_o = n8769_o[31:1];
  /* find_the_damn_issue_sky130.vhd:6666:74  */
  assign n8771_o = {n8770_o, s_chain_input_2};
  /* find_the_damn_issue_sky130.vhd:6668:60  */
  assign n8772_o = n8771_o[31:2];
  /* find_the_damn_issue_sky130.vhd:6668:74  */
  assign n8773_o = {n8772_o, s_unnamed_93};
  /* find_the_damn_issue_sky130.vhd:6668:120  */
  assign n8774_o = n8771_o[0];
  /* find_the_damn_issue_sky130.vhd:6668:89  */
  assign n8775_o = {n8773_o, n8774_o};
  /* find_the_damn_issue_sky130.vhd:6670:42  */
  assign n8776_o = n8775_o[31:3];
  /* find_the_damn_issue_sky130.vhd:6670:56  */
  assign n8777_o = {n8776_o, s_unnamed_94};
  /* find_the_damn_issue_sky130.vhd:6670:82  */
  assign n8778_o = n8775_o[1:0];
  /* find_the_damn_issue_sky130.vhd:6670:71  */
  assign n8779_o = {n8777_o, n8778_o};
  /* find_the_damn_issue_sky130.vhd:6672:44  */
  assign n8780_o = n8779_o[31:4];
  /* find_the_damn_issue_sky130.vhd:6672:58  */
  assign n8781_o = {n8780_o, s_unnamed_95};
  /* find_the_damn_issue_sky130.vhd:6672:86  */
  assign n8782_o = n8779_o[2:0];
  /* find_the_damn_issue_sky130.vhd:6672:73  */
  assign n8783_o = {n8781_o, n8782_o};
  /* find_the_damn_issue_sky130.vhd:6674:44  */
  assign n8784_o = n8783_o[31:5];
  /* find_the_damn_issue_sky130.vhd:6674:58  */
  assign n8785_o = {n8784_o, s_unnamed_96};
  /* find_the_damn_issue_sky130.vhd:6674:86  */
  assign n8786_o = n8783_o[3:0];
  /* find_the_damn_issue_sky130.vhd:6674:73  */
  assign n8787_o = {n8785_o, n8786_o};
  /* find_the_damn_issue_sky130.vhd:6676:44  */
  assign n8788_o = n8787_o[31:6];
  /* find_the_damn_issue_sky130.vhd:6676:58  */
  assign n8789_o = {n8788_o, s_unnamed_97};
  /* find_the_damn_issue_sky130.vhd:6676:86  */
  assign n8790_o = n8787_o[4:0];
  /* find_the_damn_issue_sky130.vhd:6676:73  */
  assign n8791_o = {n8789_o, n8790_o};
  /* find_the_damn_issue_sky130.vhd:6678:44  */
  assign n8792_o = n8791_o[31:7];
  /* find_the_damn_issue_sky130.vhd:6678:58  */
  assign n8793_o = {n8792_o, s_unnamed_98};
  /* find_the_damn_issue_sky130.vhd:6678:86  */
  assign n8794_o = n8791_o[5:0];
  /* find_the_damn_issue_sky130.vhd:6678:73  */
  assign n8795_o = {n8793_o, n8794_o};
  /* find_the_damn_issue_sky130.vhd:6680:44  */
  assign n8796_o = n8795_o[31:8];
  /* find_the_damn_issue_sky130.vhd:6680:58  */
  assign n8797_o = {n8796_o, s_unnamed_99};
  /* find_the_damn_issue_sky130.vhd:6680:86  */
  assign n8798_o = n8795_o[6:0];
  /* find_the_damn_issue_sky130.vhd:6680:73  */
  assign n8799_o = {n8797_o, n8798_o};
  /* find_the_damn_issue_sky130.vhd:6682:44  */
  assign n8800_o = n8799_o[31:9];
  /* find_the_damn_issue_sky130.vhd:6682:58  */
  assign n8801_o = {n8800_o, s_unnamed_100};
  /* find_the_damn_issue_sky130.vhd:6682:87  */
  assign n8802_o = n8799_o[7:0];
  /* find_the_damn_issue_sky130.vhd:6682:74  */
  assign n8803_o = {n8801_o, n8802_o};
  /* find_the_damn_issue_sky130.vhd:6684:44  */
  assign n8804_o = n8803_o[31:10];
  /* find_the_damn_issue_sky130.vhd:6684:59  */
  assign n8805_o = {n8804_o, s_unnamed_101};
  /* find_the_damn_issue_sky130.vhd:6684:88  */
  assign n8806_o = n8803_o[8:0];
  /* find_the_damn_issue_sky130.vhd:6684:75  */
  assign n8807_o = {n8805_o, n8806_o};
  /* find_the_damn_issue_sky130.vhd:6686:45  */
  assign n8808_o = n8807_o[31:11];
  /* find_the_damn_issue_sky130.vhd:6686:60  */
  assign n8809_o = {n8808_o, s_unnamed_102};
  /* find_the_damn_issue_sky130.vhd:6686:89  */
  assign n8810_o = n8807_o[9:0];
  /* find_the_damn_issue_sky130.vhd:6686:76  */
  assign n8811_o = {n8809_o, n8810_o};
  /* find_the_damn_issue_sky130.vhd:6688:46  */
  assign n8812_o = n8811_o[31:12];
  /* find_the_damn_issue_sky130.vhd:6688:61  */
  assign n8813_o = {n8812_o, s_unnamed_103};
  /* find_the_damn_issue_sky130.vhd:6688:91  */
  assign n8814_o = n8811_o[10:0];
  /* find_the_damn_issue_sky130.vhd:6688:77  */
  assign n8815_o = {n8813_o, n8814_o};
  /* find_the_damn_issue_sky130.vhd:6690:46  */
  assign n8816_o = n8815_o[31:13];
  /* find_the_damn_issue_sky130.vhd:6690:61  */
  assign n8817_o = {n8816_o, s_unnamed_104};
  /* find_the_damn_issue_sky130.vhd:6690:91  */
  assign n8818_o = n8815_o[11:0];
  /* find_the_damn_issue_sky130.vhd:6690:77  */
  assign n8819_o = {n8817_o, n8818_o};
  /* find_the_damn_issue_sky130.vhd:6692:46  */
  assign n8820_o = n8819_o[31:14];
  /* find_the_damn_issue_sky130.vhd:6692:61  */
  assign n8821_o = {n8820_o, s_unnamed_105};
  /* find_the_damn_issue_sky130.vhd:6692:91  */
  assign n8822_o = n8819_o[12:0];
  /* find_the_damn_issue_sky130.vhd:6692:77  */
  assign n8823_o = {n8821_o, n8822_o};
  /* find_the_damn_issue_sky130.vhd:6694:46  */
  assign n8824_o = n8823_o[31:15];
  /* find_the_damn_issue_sky130.vhd:6694:61  */
  assign n8825_o = {n8824_o, s_unnamed_106};
  /* find_the_damn_issue_sky130.vhd:6694:91  */
  assign n8826_o = n8823_o[13:0];
  /* find_the_damn_issue_sky130.vhd:6694:77  */
  assign n8827_o = {n8825_o, n8826_o};
  /* find_the_damn_issue_sky130.vhd:6696:46  */
  assign n8828_o = n8827_o[31:16];
  /* find_the_damn_issue_sky130.vhd:6696:61  */
  assign n8829_o = {n8828_o, s_unnamed_107};
  /* find_the_damn_issue_sky130.vhd:6696:91  */
  assign n8830_o = n8827_o[14:0];
  /* find_the_damn_issue_sky130.vhd:6696:77  */
  assign n8831_o = {n8829_o, n8830_o};
  /* find_the_damn_issue_sky130.vhd:6698:46  */
  assign n8832_o = n8831_o[31:17];
  /* find_the_damn_issue_sky130.vhd:6698:61  */
  assign n8833_o = {n8832_o, s_unnamed_108};
  /* find_the_damn_issue_sky130.vhd:6698:91  */
  assign n8834_o = n8831_o[15:0];
  /* find_the_damn_issue_sky130.vhd:6698:77  */
  assign n8835_o = {n8833_o, n8834_o};
  /* find_the_damn_issue_sky130.vhd:6700:46  */
  assign n8836_o = n8835_o[31:18];
  /* find_the_damn_issue_sky130.vhd:6700:61  */
  assign n8837_o = {n8836_o, s_unnamed_109};
  /* find_the_damn_issue_sky130.vhd:6700:91  */
  assign n8838_o = n8835_o[16:0];
  /* find_the_damn_issue_sky130.vhd:6700:77  */
  assign n8839_o = {n8837_o, n8838_o};
  /* find_the_damn_issue_sky130.vhd:6702:46  */
  assign n8840_o = n8839_o[31:19];
  /* find_the_damn_issue_sky130.vhd:6702:61  */
  assign n8841_o = {n8840_o, s_unnamed_110};
  /* find_the_damn_issue_sky130.vhd:6702:91  */
  assign n8842_o = n8839_o[17:0];
  /* find_the_damn_issue_sky130.vhd:6702:77  */
  assign n8843_o = {n8841_o, n8842_o};
  /* find_the_damn_issue_sky130.vhd:6704:46  */
  assign n8844_o = n8843_o[31:20];
  /* find_the_damn_issue_sky130.vhd:6704:61  */
  assign n8845_o = {n8844_o, s_unnamed_111};
  /* find_the_damn_issue_sky130.vhd:6704:91  */
  assign n8846_o = n8843_o[18:0];
  /* find_the_damn_issue_sky130.vhd:6704:77  */
  assign n8847_o = {n8845_o, n8846_o};
  /* find_the_damn_issue_sky130.vhd:6706:46  */
  assign n8848_o = n8847_o[31:21];
  /* find_the_damn_issue_sky130.vhd:6706:61  */
  assign n8849_o = {n8848_o, s_unnamed_112};
  /* find_the_damn_issue_sky130.vhd:6706:91  */
  assign n8850_o = n8847_o[19:0];
  /* find_the_damn_issue_sky130.vhd:6706:77  */
  assign n8851_o = {n8849_o, n8850_o};
  /* find_the_damn_issue_sky130.vhd:6708:46  */
  assign n8852_o = n8851_o[31:22];
  /* find_the_damn_issue_sky130.vhd:6708:61  */
  assign n8853_o = {n8852_o, s_unnamed_113};
  /* find_the_damn_issue_sky130.vhd:6708:91  */
  assign n8854_o = n8851_o[20:0];
  /* find_the_damn_issue_sky130.vhd:6708:77  */
  assign n8855_o = {n8853_o, n8854_o};
  /* find_the_damn_issue_sky130.vhd:6710:46  */
  assign n8856_o = n8855_o[31:23];
  /* find_the_damn_issue_sky130.vhd:6710:61  */
  assign n8857_o = {n8856_o, s_unnamed_114};
  /* find_the_damn_issue_sky130.vhd:6710:91  */
  assign n8858_o = n8855_o[21:0];
  /* find_the_damn_issue_sky130.vhd:6710:77  */
  assign n8859_o = {n8857_o, n8858_o};
  /* find_the_damn_issue_sky130.vhd:6712:46  */
  assign n8860_o = n8859_o[31:24];
  /* find_the_damn_issue_sky130.vhd:6712:61  */
  assign n8861_o = {n8860_o, s_unnamed_115};
  /* find_the_damn_issue_sky130.vhd:6712:91  */
  assign n8862_o = n8859_o[22:0];
  /* find_the_damn_issue_sky130.vhd:6712:77  */
  assign n8863_o = {n8861_o, n8862_o};
  /* find_the_damn_issue_sky130.vhd:6714:46  */
  assign n8864_o = n8863_o[31:25];
  /* find_the_damn_issue_sky130.vhd:6714:61  */
  assign n8865_o = {n8864_o, s_unnamed_116};
  /* find_the_damn_issue_sky130.vhd:6714:91  */
  assign n8866_o = n8863_o[23:0];
  /* find_the_damn_issue_sky130.vhd:6714:77  */
  assign n8867_o = {n8865_o, n8866_o};
  /* find_the_damn_issue_sky130.vhd:6716:46  */
  assign n8868_o = n8867_o[31:26];
  /* find_the_damn_issue_sky130.vhd:6716:61  */
  assign n8869_o = {n8868_o, s_unnamed_117};
  /* find_the_damn_issue_sky130.vhd:6716:91  */
  assign n8870_o = n8867_o[24:0];
  /* find_the_damn_issue_sky130.vhd:6716:77  */
  assign n8871_o = {n8869_o, n8870_o};
  /* find_the_damn_issue_sky130.vhd:6718:46  */
  assign n8872_o = n8871_o[31:27];
  /* find_the_damn_issue_sky130.vhd:6718:61  */
  assign n8873_o = {n8872_o, s_unnamed_118};
  /* find_the_damn_issue_sky130.vhd:6718:91  */
  assign n8874_o = n8871_o[25:0];
  /* find_the_damn_issue_sky130.vhd:6718:77  */
  assign n8875_o = {n8873_o, n8874_o};
  /* find_the_damn_issue_sky130.vhd:6720:46  */
  assign n8876_o = n8875_o[31:28];
  /* find_the_damn_issue_sky130.vhd:6720:61  */
  assign n8877_o = {n8876_o, s_unnamed_119};
  /* find_the_damn_issue_sky130.vhd:6720:91  */
  assign n8878_o = n8875_o[26:0];
  /* find_the_damn_issue_sky130.vhd:6720:77  */
  assign n8879_o = {n8877_o, n8878_o};
  /* find_the_damn_issue_sky130.vhd:6722:46  */
  assign n8880_o = n8879_o[31:29];
  /* find_the_damn_issue_sky130.vhd:6722:61  */
  assign n8881_o = {n8880_o, s_unnamed_120};
  /* find_the_damn_issue_sky130.vhd:6722:91  */
  assign n8882_o = n8879_o[27:0];
  /* find_the_damn_issue_sky130.vhd:6722:77  */
  assign n8883_o = {n8881_o, n8882_o};
  /* find_the_damn_issue_sky130.vhd:6724:46  */
  assign n8884_o = n8883_o[31:30];
  /* find_the_damn_issue_sky130.vhd:6724:61  */
  assign n8885_o = {n8884_o, s_unnamed_121};
  /* find_the_damn_issue_sky130.vhd:6724:91  */
  assign n8886_o = n8883_o[28:0];
  /* find_the_damn_issue_sky130.vhd:6724:77  */
  assign n8887_o = {n8885_o, n8886_o};
  /* find_the_damn_issue_sky130.vhd:6726:46  */
  assign n8888_o = n8887_o[31];
  /* find_the_damn_issue_sky130.vhd:6726:61  */
  assign n8889_o = {n8888_o, s_unnamed_122};
  /* find_the_damn_issue_sky130.vhd:6726:91  */
  assign n8890_o = n8887_o[29:0];
  /* find_the_damn_issue_sky130.vhd:6726:77  */
  assign n8891_o = {n8889_o, n8890_o};
  /* find_the_damn_issue_sky130.vhd:6727:62  */
  assign n8892_o = n8891_o[30:0];
  /* find_the_damn_issue_sky130.vhd:6727:48  */
  assign n8893_o = {s_unnamed_123, n8892_o};
  /* find_the_damn_issue_sky130.vhd:6729:71  */
  assign n8894_o = n8893_o[0];
  /* find_the_damn_issue_sky130.vhd:6729:25  */
  assign n8896_o = in_delay == 5'b00000;
  /* find_the_damn_issue_sky130.vhd:6730:71  */
  assign n8897_o = n8893_o[1];
  /* find_the_damn_issue_sky130.vhd:6730:25  */
  assign n8899_o = in_delay == 5'b00001;
  /* find_the_damn_issue_sky130.vhd:6731:71  */
  assign n8900_o = n8893_o[2];
  /* find_the_damn_issue_sky130.vhd:6731:25  */
  assign n8902_o = in_delay == 5'b00010;
  /* find_the_damn_issue_sky130.vhd:6732:71  */
  assign n8903_o = n8893_o[3];
  /* find_the_damn_issue_sky130.vhd:6732:25  */
  assign n8905_o = in_delay == 5'b00011;
  /* find_the_damn_issue_sky130.vhd:6733:71  */
  assign n8906_o = n8893_o[4];
  /* find_the_damn_issue_sky130.vhd:6733:25  */
  assign n8908_o = in_delay == 5'b00100;
  /* find_the_damn_issue_sky130.vhd:6734:71  */
  assign n8909_o = n8893_o[5];
  /* find_the_damn_issue_sky130.vhd:6734:25  */
  assign n8911_o = in_delay == 5'b00101;
  /* find_the_damn_issue_sky130.vhd:6735:71  */
  assign n8912_o = n8893_o[6];
  /* find_the_damn_issue_sky130.vhd:6735:25  */
  assign n8914_o = in_delay == 5'b00110;
  /* find_the_damn_issue_sky130.vhd:6736:71  */
  assign n8915_o = n8893_o[7];
  /* find_the_damn_issue_sky130.vhd:6736:25  */
  assign n8917_o = in_delay == 5'b00111;
  /* find_the_damn_issue_sky130.vhd:6737:71  */
  assign n8918_o = n8893_o[8];
  /* find_the_damn_issue_sky130.vhd:6737:25  */
  assign n8920_o = in_delay == 5'b01000;
  /* find_the_damn_issue_sky130.vhd:6738:71  */
  assign n8921_o = n8893_o[9];
  /* find_the_damn_issue_sky130.vhd:6738:25  */
  assign n8923_o = in_delay == 5'b01001;
  /* find_the_damn_issue_sky130.vhd:6739:71  */
  assign n8924_o = n8893_o[10];
  /* find_the_damn_issue_sky130.vhd:6739:25  */
  assign n8926_o = in_delay == 5'b01010;
  /* find_the_damn_issue_sky130.vhd:6740:71  */
  assign n8927_o = n8893_o[11];
  /* find_the_damn_issue_sky130.vhd:6740:25  */
  assign n8929_o = in_delay == 5'b01011;
  /* find_the_damn_issue_sky130.vhd:6741:71  */
  assign n8930_o = n8893_o[12];
  /* find_the_damn_issue_sky130.vhd:6741:25  */
  assign n8932_o = in_delay == 5'b01100;
  /* find_the_damn_issue_sky130.vhd:6742:71  */
  assign n8933_o = n8893_o[13];
  /* find_the_damn_issue_sky130.vhd:6742:25  */
  assign n8935_o = in_delay == 5'b01101;
  /* find_the_damn_issue_sky130.vhd:6743:71  */
  assign n8936_o = n8893_o[14];
  /* find_the_damn_issue_sky130.vhd:6743:25  */
  assign n8938_o = in_delay == 5'b01110;
  /* find_the_damn_issue_sky130.vhd:6744:71  */
  assign n8939_o = n8893_o[15];
  /* find_the_damn_issue_sky130.vhd:6744:25  */
  assign n8941_o = in_delay == 5'b01111;
  /* find_the_damn_issue_sky130.vhd:6745:71  */
  assign n8942_o = n8893_o[16];
  /* find_the_damn_issue_sky130.vhd:6745:25  */
  assign n8944_o = in_delay == 5'b10000;
  /* find_the_damn_issue_sky130.vhd:6746:71  */
  assign n8945_o = n8893_o[17];
  /* find_the_damn_issue_sky130.vhd:6746:25  */
  assign n8947_o = in_delay == 5'b10001;
  /* find_the_damn_issue_sky130.vhd:6747:71  */
  assign n8948_o = n8893_o[18];
  /* find_the_damn_issue_sky130.vhd:6747:25  */
  assign n8950_o = in_delay == 5'b10010;
  /* find_the_damn_issue_sky130.vhd:6748:71  */
  assign n8951_o = n8893_o[19];
  /* find_the_damn_issue_sky130.vhd:6748:25  */
  assign n8953_o = in_delay == 5'b10011;
  /* find_the_damn_issue_sky130.vhd:6749:71  */
  assign n8954_o = n8893_o[20];
  /* find_the_damn_issue_sky130.vhd:6749:25  */
  assign n8956_o = in_delay == 5'b10100;
  /* find_the_damn_issue_sky130.vhd:6750:71  */
  assign n8957_o = n8893_o[21];
  /* find_the_damn_issue_sky130.vhd:6750:25  */
  assign n8959_o = in_delay == 5'b10101;
  /* find_the_damn_issue_sky130.vhd:6751:71  */
  assign n8960_o = n8893_o[22];
  /* find_the_damn_issue_sky130.vhd:6751:25  */
  assign n8962_o = in_delay == 5'b10110;
  /* find_the_damn_issue_sky130.vhd:6752:71  */
  assign n8963_o = n8893_o[23];
  /* find_the_damn_issue_sky130.vhd:6752:25  */
  assign n8965_o = in_delay == 5'b10111;
  /* find_the_damn_issue_sky130.vhd:6753:71  */
  assign n8966_o = n8893_o[24];
  /* find_the_damn_issue_sky130.vhd:6753:25  */
  assign n8968_o = in_delay == 5'b11000;
  /* find_the_damn_issue_sky130.vhd:6754:71  */
  assign n8969_o = n8893_o[25];
  /* find_the_damn_issue_sky130.vhd:6754:25  */
  assign n8971_o = in_delay == 5'b11001;
  /* find_the_damn_issue_sky130.vhd:6755:71  */
  assign n8972_o = n8893_o[26];
  /* find_the_damn_issue_sky130.vhd:6755:25  */
  assign n8974_o = in_delay == 5'b11010;
  /* find_the_damn_issue_sky130.vhd:6756:71  */
  assign n8975_o = n8893_o[27];
  /* find_the_damn_issue_sky130.vhd:6756:25  */
  assign n8977_o = in_delay == 5'b11011;
  /* find_the_damn_issue_sky130.vhd:6757:71  */
  assign n8978_o = n8893_o[28];
  /* find_the_damn_issue_sky130.vhd:6757:25  */
  assign n8980_o = in_delay == 5'b11100;
  /* find_the_damn_issue_sky130.vhd:6758:71  */
  assign n8981_o = n8893_o[29];
  /* find_the_damn_issue_sky130.vhd:6758:25  */
  assign n8983_o = in_delay == 5'b11101;
  /* find_the_damn_issue_sky130.vhd:6759:71  */
  assign n8984_o = n8893_o[30];
  /* find_the_damn_issue_sky130.vhd:6759:25  */
  assign n8986_o = in_delay == 5'b11110;
  /* find_the_damn_issue_sky130.vhd:6760:71  */
  assign n8987_o = n8893_o[31];
  /* find_the_damn_issue_sky130.vhd:6760:25  */
  assign n8989_o = in_delay == 5'b11111;
  assign n8990_o = {n8989_o, n8986_o, n8983_o, n8980_o, n8977_o, n8974_o, n8971_o, n8968_o, n8965_o, n8962_o, n8959_o, n8956_o, n8953_o, n8950_o, n8947_o, n8944_o, n8941_o, n8938_o, n8935_o, n8932_o, n8929_o, n8926_o, n8923_o, n8920_o, n8917_o, n8914_o, n8911_o, n8908_o, n8905_o, n8902_o, n8899_o, n8896_o};
  /* find_the_damn_issue_sky130.vhd:6728:17  */
  always @*
    case (n8990_o)
      32'b10000000000000000000000000000000: n8992_o = n8987_o;
      32'b01000000000000000000000000000000: n8992_o = n8984_o;
      32'b00100000000000000000000000000000: n8992_o = n8981_o;
      32'b00010000000000000000000000000000: n8992_o = n8978_o;
      32'b00001000000000000000000000000000: n8992_o = n8975_o;
      32'b00000100000000000000000000000000: n8992_o = n8972_o;
      32'b00000010000000000000000000000000: n8992_o = n8969_o;
      32'b00000001000000000000000000000000: n8992_o = n8966_o;
      32'b00000000100000000000000000000000: n8992_o = n8963_o;
      32'b00000000010000000000000000000000: n8992_o = n8960_o;
      32'b00000000001000000000000000000000: n8992_o = n8957_o;
      32'b00000000000100000000000000000000: n8992_o = n8954_o;
      32'b00000000000010000000000000000000: n8992_o = n8951_o;
      32'b00000000000001000000000000000000: n8992_o = n8948_o;
      32'b00000000000000100000000000000000: n8992_o = n8945_o;
      32'b00000000000000010000000000000000: n8992_o = n8942_o;
      32'b00000000000000001000000000000000: n8992_o = n8939_o;
      32'b00000000000000000100000000000000: n8992_o = n8936_o;
      32'b00000000000000000010000000000000: n8992_o = n8933_o;
      32'b00000000000000000001000000000000: n8992_o = n8930_o;
      32'b00000000000000000000100000000000: n8992_o = n8927_o;
      32'b00000000000000000000010000000000: n8992_o = n8924_o;
      32'b00000000000000000000001000000000: n8992_o = n8921_o;
      32'b00000000000000000000000100000000: n8992_o = n8918_o;
      32'b00000000000000000000000010000000: n8992_o = n8915_o;
      32'b00000000000000000000000001000000: n8992_o = n8912_o;
      32'b00000000000000000000000000100000: n8992_o = n8909_o;
      32'b00000000000000000000000000010000: n8992_o = n8906_o;
      32'b00000000000000000000000000001000: n8992_o = n8903_o;
      32'b00000000000000000000000000000100: n8992_o = n8900_o;
      32'b00000000000000000000000000000010: n8992_o = n8897_o;
      32'b00000000000000000000000000000001: n8992_o = n8894_o;
      default: n8992_o = 1'bX;
    endcase
endmodule

module delay_chain_with_taps
  (input  in_chain_input,
   input  [4:0] in_delay,
   output out_chain_output);
  wire s_chain_input_2;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_2;
  wire s_unnamed;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_3;
  wire s_unnamed_2;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_4;
  wire s_unnamed_3;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_5;
  wire s_unnamed_4;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_6;
  wire s_unnamed_5;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_7;
  wire s_unnamed_6;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_8;
  wire s_unnamed_7;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_9;
  wire s_unnamed_8;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_10;
  wire s_unnamed_9;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_11;
  wire s_unnamed_10;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_12;
  wire s_unnamed_11;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_13;
  wire s_unnamed_12;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_14;
  wire s_unnamed_13;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_15;
  wire s_unnamed_14;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_16;
  wire s_unnamed_15;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_17;
  wire s_unnamed_16;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_18;
  wire s_unnamed_17;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_19;
  wire s_unnamed_18;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_20;
  wire s_unnamed_19;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_21;
  wire s_unnamed_20;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_22;
  wire s_unnamed_21;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_23;
  wire s_unnamed_22;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_24;
  wire s_unnamed_23;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_25;
  wire s_unnamed_24;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_26;
  wire s_unnamed_25;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_27;
  wire s_unnamed_26;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_28;
  wire s_unnamed_27;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_29;
  wire s_unnamed_28;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_30;
  wire s_unnamed_29;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_31;
  wire s_unnamed_30;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_32;
  wire s_unnamed_31;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_33;
  wire s_unnamed_32;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_34;
  wire s_unnamed_33;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_35;
  wire s_unnamed_34;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_36;
  wire s_unnamed_35;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_37;
  wire s_unnamed_36;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_38;
  wire s_unnamed_37;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_39;
  wire s_unnamed_38;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_40;
  wire s_unnamed_39;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_41;
  wire s_unnamed_40;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_42;
  wire s_unnamed_41;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_43;
  wire s_unnamed_42;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_44;
  wire s_unnamed_43;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_45;
  wire s_unnamed_44;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_46;
  wire s_unnamed_45;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_47;
  wire s_unnamed_46;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_48;
  wire s_unnamed_47;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_49;
  wire s_unnamed_48;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_50;
  wire s_unnamed_49;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_51;
  wire s_unnamed_50;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_52;
  wire s_unnamed_51;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_53;
  wire s_unnamed_52;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_54;
  wire s_unnamed_53;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_55;
  wire s_unnamed_54;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_56;
  wire s_unnamed_55;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_57;
  wire s_unnamed_56;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_58;
  wire s_unnamed_57;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_59;
  wire s_unnamed_58;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_60;
  wire s_unnamed_59;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_61;
  wire s_unnamed_60;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_62;
  wire s_unnamed_61;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_63;
  wire s_unnamed_62;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_64;
  wire s_unnamed_63;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_65;
  wire s_unnamed_64;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_66;
  wire s_unnamed_65;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_67;
  wire s_unnamed_66;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_68;
  wire s_unnamed_67;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_69;
  wire s_unnamed_68;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_70;
  wire s_unnamed_69;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_71;
  wire s_unnamed_70;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_72;
  wire s_unnamed_71;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_73;
  wire s_unnamed_72;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_74;
  wire s_unnamed_73;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_75;
  wire s_unnamed_74;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_76;
  wire s_unnamed_75;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_77;
  wire s_unnamed_76;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_78;
  wire s_unnamed_77;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_79;
  wire s_unnamed_78;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_80;
  wire s_unnamed_79;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_81;
  wire s_unnamed_80;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_82;
  wire s_unnamed_81;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_83;
  wire s_unnamed_82;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_84;
  wire s_unnamed_83;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_85;
  wire s_unnamed_84;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_86;
  wire s_unnamed_85;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_87;
  wire s_unnamed_86;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_88;
  wire s_unnamed_87;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_89;
  wire s_unnamed_88;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_90;
  wire s_unnamed_89;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_91;
  wire s_unnamed_90;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_92;
  wire s_unnamed_91;
  wire s_sky130_fd_sc_hd_dlygate4sd3_1_x_93;
  wire s_unnamed_92;
  wire s_unnamed_93;
  wire s_unnamed_94;
  wire s_unnamed_95;
  wire s_unnamed_96;
  wire s_unnamed_97;
  wire s_unnamed_98;
  wire s_unnamed_99;
  wire s_unnamed_100;
  wire s_unnamed_101;
  wire s_unnamed_102;
  wire s_unnamed_103;
  wire s_unnamed_104;
  wire s_unnamed_105;
  wire s_unnamed_106;
  wire s_unnamed_107;
  wire s_unnamed_108;
  wire s_unnamed_109;
  wire s_unnamed_110;
  wire s_unnamed_111;
  wire s_unnamed_112;
  wire s_unnamed_113;
  wire s_unnamed_114;
  wire s_unnamed_115;
  wire s_unnamed_116;
  wire s_unnamed_117;
  wire s_unnamed_118;
  wire s_unnamed_119;
  wire s_unnamed_120;
  wire s_unnamed_121;
  wire s_unnamed_122;
  wire s_unnamed_123;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_2_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_3_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_4_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_5_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_6_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_7_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_8_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_9_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_10_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_11_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_12_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_13_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_14_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_15_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_16_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_17_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_18_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_19_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_20_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_21_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_22_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_23_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_24_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_25_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_26_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_27_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_28_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_29_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_30_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_31_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_32_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_33_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_34_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_35_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_36_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_37_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_38_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_39_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_40_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_41_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_42_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_43_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_44_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_45_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_46_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_47_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_48_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_49_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_50_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_51_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_52_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_53_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_54_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_55_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_56_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_57_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_58_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_59_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_60_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_61_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_62_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_63_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_64_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_65_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_66_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_67_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_68_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_69_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_70_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_71_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_72_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_73_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_74_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_75_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_76_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_77_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_78_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_79_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_80_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_81_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_82_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_83_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_84_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_85_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_86_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_87_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_88_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_89_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_90_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_91_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_92_X;
  wire sky130_fd_sc_hd_dlygate4sd3_1_inst_93_X;
  localparam [31:0] n8413_o = 32'bX;
  wire [30:0] n8414_o;
  wire [31:0] n8415_o;
  wire [29:0] n8416_o;
  wire [30:0] n8417_o;
  wire n8418_o;
  wire [31:0] n8419_o;
  wire [28:0] n8420_o;
  wire [29:0] n8421_o;
  wire [1:0] n8422_o;
  wire [31:0] n8423_o;
  wire [27:0] n8424_o;
  wire [28:0] n8425_o;
  wire [2:0] n8426_o;
  wire [31:0] n8427_o;
  wire [26:0] n8428_o;
  wire [27:0] n8429_o;
  wire [3:0] n8430_o;
  wire [31:0] n8431_o;
  wire [25:0] n8432_o;
  wire [26:0] n8433_o;
  wire [4:0] n8434_o;
  wire [31:0] n8435_o;
  wire [24:0] n8436_o;
  wire [25:0] n8437_o;
  wire [5:0] n8438_o;
  wire [31:0] n8439_o;
  wire [23:0] n8440_o;
  wire [24:0] n8441_o;
  wire [6:0] n8442_o;
  wire [31:0] n8443_o;
  wire [22:0] n8444_o;
  wire [23:0] n8445_o;
  wire [7:0] n8446_o;
  wire [31:0] n8447_o;
  wire [21:0] n8448_o;
  wire [22:0] n8449_o;
  wire [8:0] n8450_o;
  wire [31:0] n8451_o;
  wire [20:0] n8452_o;
  wire [21:0] n8453_o;
  wire [9:0] n8454_o;
  wire [31:0] n8455_o;
  wire [19:0] n8456_o;
  wire [20:0] n8457_o;
  wire [10:0] n8458_o;
  wire [31:0] n8459_o;
  wire [18:0] n8460_o;
  wire [19:0] n8461_o;
  wire [11:0] n8462_o;
  wire [31:0] n8463_o;
  wire [17:0] n8464_o;
  wire [18:0] n8465_o;
  wire [12:0] n8466_o;
  wire [31:0] n8467_o;
  wire [16:0] n8468_o;
  wire [17:0] n8469_o;
  wire [13:0] n8470_o;
  wire [31:0] n8471_o;
  wire [15:0] n8472_o;
  wire [16:0] n8473_o;
  wire [14:0] n8474_o;
  wire [31:0] n8475_o;
  wire [14:0] n8476_o;
  wire [15:0] n8477_o;
  wire [15:0] n8478_o;
  wire [31:0] n8479_o;
  wire [13:0] n8480_o;
  wire [14:0] n8481_o;
  wire [16:0] n8482_o;
  wire [31:0] n8483_o;
  wire [12:0] n8484_o;
  wire [13:0] n8485_o;
  wire [17:0] n8486_o;
  wire [31:0] n8487_o;
  wire [11:0] n8488_o;
  wire [12:0] n8489_o;
  wire [18:0] n8490_o;
  wire [31:0] n8491_o;
  wire [10:0] n8492_o;
  wire [11:0] n8493_o;
  wire [19:0] n8494_o;
  wire [31:0] n8495_o;
  wire [9:0] n8496_o;
  wire [10:0] n8497_o;
  wire [20:0] n8498_o;
  wire [31:0] n8499_o;
  wire [8:0] n8500_o;
  wire [9:0] n8501_o;
  wire [21:0] n8502_o;
  wire [31:0] n8503_o;
  wire [7:0] n8504_o;
  wire [8:0] n8505_o;
  wire [22:0] n8506_o;
  wire [31:0] n8507_o;
  wire [6:0] n8508_o;
  wire [7:0] n8509_o;
  wire [23:0] n8510_o;
  wire [31:0] n8511_o;
  wire [5:0] n8512_o;
  wire [6:0] n8513_o;
  wire [24:0] n8514_o;
  wire [31:0] n8515_o;
  wire [4:0] n8516_o;
  wire [5:0] n8517_o;
  wire [25:0] n8518_o;
  wire [31:0] n8519_o;
  wire [3:0] n8520_o;
  wire [4:0] n8521_o;
  wire [26:0] n8522_o;
  wire [31:0] n8523_o;
  wire [2:0] n8524_o;
  wire [3:0] n8525_o;
  wire [27:0] n8526_o;
  wire [31:0] n8527_o;
  wire [1:0] n8528_o;
  wire [2:0] n8529_o;
  wire [28:0] n8530_o;
  wire [31:0] n8531_o;
  wire n8532_o;
  wire [1:0] n8533_o;
  wire [29:0] n8534_o;
  wire [31:0] n8535_o;
  wire [30:0] n8536_o;
  wire [31:0] n8537_o;
  wire n8538_o;
  wire n8540_o;
  wire n8541_o;
  wire n8543_o;
  wire n8544_o;
  wire n8546_o;
  wire n8547_o;
  wire n8549_o;
  wire n8550_o;
  wire n8552_o;
  wire n8553_o;
  wire n8555_o;
  wire n8556_o;
  wire n8558_o;
  wire n8559_o;
  wire n8561_o;
  wire n8562_o;
  wire n8564_o;
  wire n8565_o;
  wire n8567_o;
  wire n8568_o;
  wire n8570_o;
  wire n8571_o;
  wire n8573_o;
  wire n8574_o;
  wire n8576_o;
  wire n8577_o;
  wire n8579_o;
  wire n8580_o;
  wire n8582_o;
  wire n8583_o;
  wire n8585_o;
  wire n8586_o;
  wire n8588_o;
  wire n8589_o;
  wire n8591_o;
  wire n8592_o;
  wire n8594_o;
  wire n8595_o;
  wire n8597_o;
  wire n8598_o;
  wire n8600_o;
  wire n8601_o;
  wire n8603_o;
  wire n8604_o;
  wire n8606_o;
  wire n8607_o;
  wire n8609_o;
  wire n8610_o;
  wire n8612_o;
  wire n8613_o;
  wire n8615_o;
  wire n8616_o;
  wire n8618_o;
  wire n8619_o;
  wire n8621_o;
  wire n8622_o;
  wire n8624_o;
  wire n8625_o;
  wire n8627_o;
  wire n8628_o;
  wire n8630_o;
  wire n8631_o;
  wire n8633_o;
  wire [31:0] n8634_o;
  reg n8636_o;
  assign out_chain_output = n8636_o;
  /* find_the_damn_issue_sky130.vhd:6800:16  */
  assign s_chain_input_2 = in_chain_input; // (signal)
  /* find_the_damn_issue_sky130.vhd:6801:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x = sky130_fd_sc_hd_dlygate4sd3_1_inst_2_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:6802:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_2 = sky130_fd_sc_hd_dlygate4sd3_1_inst_3_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:6803:16  */
  assign s_unnamed = s_sky130_fd_sc_hd_dlygate4sd3_1_x; // (signal)
  /* find_the_damn_issue_sky130.vhd:6804:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_3 = sky130_fd_sc_hd_dlygate4sd3_1_inst_4_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:6805:16  */
  assign s_unnamed_2 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_2; // (signal)
  /* find_the_damn_issue_sky130.vhd:6806:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_4 = sky130_fd_sc_hd_dlygate4sd3_1_inst_5_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:6807:16  */
  assign s_unnamed_3 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_3; // (signal)
  /* find_the_damn_issue_sky130.vhd:6808:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_5 = sky130_fd_sc_hd_dlygate4sd3_1_inst_6_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:6809:16  */
  assign s_unnamed_4 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_4; // (signal)
  /* find_the_damn_issue_sky130.vhd:6810:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_6 = sky130_fd_sc_hd_dlygate4sd3_1_inst_7_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:6811:16  */
  assign s_unnamed_5 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_5; // (signal)
  /* find_the_damn_issue_sky130.vhd:6812:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_7 = sky130_fd_sc_hd_dlygate4sd3_1_inst_10_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:6813:16  */
  assign s_unnamed_6 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_6; // (signal)
  /* find_the_damn_issue_sky130.vhd:6814:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_8 = sky130_fd_sc_hd_dlygate4sd3_1_inst_11_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:6815:16  */
  assign s_unnamed_7 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_7; // (signal)
  /* find_the_damn_issue_sky130.vhd:6816:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_9 = sky130_fd_sc_hd_dlygate4sd3_1_inst_12_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:6817:16  */
  assign s_unnamed_8 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_8; // (signal)
  /* find_the_damn_issue_sky130.vhd:6818:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_10 = sky130_fd_sc_hd_dlygate4sd3_1_inst_15_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:6819:16  */
  assign s_unnamed_9 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_9; // (signal)
  /* find_the_damn_issue_sky130.vhd:6820:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_11 = sky130_fd_sc_hd_dlygate4sd3_1_inst_18_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:6821:16  */
  assign s_unnamed_10 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_10; // (signal)
  /* find_the_damn_issue_sky130.vhd:6822:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_12 = sky130_fd_sc_hd_dlygate4sd3_1_inst_19_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:6823:16  */
  assign s_unnamed_11 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_11; // (signal)
  /* find_the_damn_issue_sky130.vhd:6824:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_13 = sky130_fd_sc_hd_dlygate4sd3_1_inst_20_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:6825:16  */
  assign s_unnamed_12 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_12; // (signal)
  /* find_the_damn_issue_sky130.vhd:6826:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_14 = sky130_fd_sc_hd_dlygate4sd3_1_inst_22_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:6827:16  */
  assign s_unnamed_13 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_13; // (signal)
  /* find_the_damn_issue_sky130.vhd:6828:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_15 = sky130_fd_sc_hd_dlygate4sd3_1_inst_25_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:6829:16  */
  assign s_unnamed_14 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_14; // (signal)
  /* find_the_damn_issue_sky130.vhd:6830:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_16 = sky130_fd_sc_hd_dlygate4sd3_1_inst_27_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:6831:16  */
  assign s_unnamed_15 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_15; // (signal)
  /* find_the_damn_issue_sky130.vhd:6832:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_17 = sky130_fd_sc_hd_dlygate4sd3_1_inst_28_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:6833:16  */
  assign s_unnamed_16 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_16; // (signal)
  /* find_the_damn_issue_sky130.vhd:6834:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_18 = sky130_fd_sc_hd_dlygate4sd3_1_inst_30_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:6835:16  */
  assign s_unnamed_17 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_17; // (signal)
  /* find_the_damn_issue_sky130.vhd:6836:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_19 = sky130_fd_sc_hd_dlygate4sd3_1_inst_32_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:6837:16  */
  assign s_unnamed_18 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_18; // (signal)
  /* find_the_damn_issue_sky130.vhd:6838:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_20 = sky130_fd_sc_hd_dlygate4sd3_1_inst_33_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:6839:16  */
  assign s_unnamed_19 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_19; // (signal)
  /* find_the_damn_issue_sky130.vhd:6840:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_21 = sky130_fd_sc_hd_dlygate4sd3_1_inst_35_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:6841:16  */
  assign s_unnamed_20 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_20; // (signal)
  /* find_the_damn_issue_sky130.vhd:6842:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_22 = sky130_fd_sc_hd_dlygate4sd3_1_inst_36_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:6843:16  */
  assign s_unnamed_21 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_21; // (signal)
  /* find_the_damn_issue_sky130.vhd:6844:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_23 = sky130_fd_sc_hd_dlygate4sd3_1_inst_38_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:6845:16  */
  assign s_unnamed_22 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_22; // (signal)
  /* find_the_damn_issue_sky130.vhd:6846:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_24 = sky130_fd_sc_hd_dlygate4sd3_1_inst_39_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:6847:16  */
  assign s_unnamed_23 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_23; // (signal)
  /* find_the_damn_issue_sky130.vhd:6848:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_25 = sky130_fd_sc_hd_dlygate4sd3_1_inst_44_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:6849:16  */
  assign s_unnamed_24 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_24; // (signal)
  /* find_the_damn_issue_sky130.vhd:6850:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_26 = sky130_fd_sc_hd_dlygate4sd3_1_inst_45_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:6851:16  */
  assign s_unnamed_25 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_25; // (signal)
  /* find_the_damn_issue_sky130.vhd:6852:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_27 = sky130_fd_sc_hd_dlygate4sd3_1_inst_46_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:6853:16  */
  assign s_unnamed_26 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_26; // (signal)
  /* find_the_damn_issue_sky130.vhd:6854:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_28 = sky130_fd_sc_hd_dlygate4sd3_1_inst_48_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:6855:16  */
  assign s_unnamed_27 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_27; // (signal)
  /* find_the_damn_issue_sky130.vhd:6856:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_29 = sky130_fd_sc_hd_dlygate4sd3_1_inst_49_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:6857:16  */
  assign s_unnamed_28 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_28; // (signal)
  /* find_the_damn_issue_sky130.vhd:6858:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_30 = sky130_fd_sc_hd_dlygate4sd3_1_inst_52_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:6859:16  */
  assign s_unnamed_29 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_29; // (signal)
  /* find_the_damn_issue_sky130.vhd:6860:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_31 = sky130_fd_sc_hd_dlygate4sd3_1_inst_54_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:6861:16  */
  assign s_unnamed_30 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_30; // (signal)
  /* find_the_damn_issue_sky130.vhd:6862:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_32 = sky130_fd_sc_hd_dlygate4sd3_1_inst_56_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:6863:16  */
  assign s_unnamed_31 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_31; // (signal)
  /* find_the_damn_issue_sky130.vhd:6864:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_33 = sky130_fd_sc_hd_dlygate4sd3_1_inst_57_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:6865:16  */
  assign s_unnamed_32 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_32; // (signal)
  /* find_the_damn_issue_sky130.vhd:6866:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_34 = sky130_fd_sc_hd_dlygate4sd3_1_inst_60_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:6867:16  */
  assign s_unnamed_33 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_33; // (signal)
  /* find_the_damn_issue_sky130.vhd:6868:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_35 = sky130_fd_sc_hd_dlygate4sd3_1_inst_61_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:6869:16  */
  assign s_unnamed_34 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_34; // (signal)
  /* find_the_damn_issue_sky130.vhd:6870:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_36 = sky130_fd_sc_hd_dlygate4sd3_1_inst_62_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:6871:16  */
  assign s_unnamed_35 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_35; // (signal)
  /* find_the_damn_issue_sky130.vhd:6872:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_37 = sky130_fd_sc_hd_dlygate4sd3_1_inst_64_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:6873:16  */
  assign s_unnamed_36 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_36; // (signal)
  /* find_the_damn_issue_sky130.vhd:6874:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_38 = sky130_fd_sc_hd_dlygate4sd3_1_inst_66_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:6875:16  */
  assign s_unnamed_37 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_37; // (signal)
  /* find_the_damn_issue_sky130.vhd:6876:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_39 = sky130_fd_sc_hd_dlygate4sd3_1_inst_67_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:6877:16  */
  assign s_unnamed_38 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_38; // (signal)
  /* find_the_damn_issue_sky130.vhd:6878:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_40 = sky130_fd_sc_hd_dlygate4sd3_1_inst_70_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:6879:16  */
  assign s_unnamed_39 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_39; // (signal)
  /* find_the_damn_issue_sky130.vhd:6880:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_41 = sky130_fd_sc_hd_dlygate4sd3_1_inst_72_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:6881:16  */
  assign s_unnamed_40 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_40; // (signal)
  /* find_the_damn_issue_sky130.vhd:6882:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_42 = sky130_fd_sc_hd_dlygate4sd3_1_inst_73_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:6883:16  */
  assign s_unnamed_41 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_41; // (signal)
  /* find_the_damn_issue_sky130.vhd:6884:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_43 = sky130_fd_sc_hd_dlygate4sd3_1_inst_75_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:6885:16  */
  assign s_unnamed_42 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_42; // (signal)
  /* find_the_damn_issue_sky130.vhd:6886:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_44 = sky130_fd_sc_hd_dlygate4sd3_1_inst_76_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:6887:16  */
  assign s_unnamed_43 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_43; // (signal)
  /* find_the_damn_issue_sky130.vhd:6888:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_45 = sky130_fd_sc_hd_dlygate4sd3_1_inst_79_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:6889:16  */
  assign s_unnamed_44 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_44; // (signal)
  /* find_the_damn_issue_sky130.vhd:6890:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_46 = sky130_fd_sc_hd_dlygate4sd3_1_inst_80_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:6891:16  */
  assign s_unnamed_45 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_45; // (signal)
  /* find_the_damn_issue_sky130.vhd:6892:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_47 = sky130_fd_sc_hd_dlygate4sd3_1_inst_81_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:6893:16  */
  assign s_unnamed_46 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_46; // (signal)
  /* find_the_damn_issue_sky130.vhd:6894:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_48 = sky130_fd_sc_hd_dlygate4sd3_1_inst_83_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:6895:16  */
  assign s_unnamed_47 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_47; // (signal)
  /* find_the_damn_issue_sky130.vhd:6896:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_49 = sky130_fd_sc_hd_dlygate4sd3_1_inst_86_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:6897:16  */
  assign s_unnamed_48 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_48; // (signal)
  /* find_the_damn_issue_sky130.vhd:6898:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_50 = sky130_fd_sc_hd_dlygate4sd3_1_inst_88_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:6899:16  */
  assign s_unnamed_49 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_49; // (signal)
  /* find_the_damn_issue_sky130.vhd:6900:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_51 = sky130_fd_sc_hd_dlygate4sd3_1_inst_89_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:6901:16  */
  assign s_unnamed_50 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_50; // (signal)
  /* find_the_damn_issue_sky130.vhd:6902:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_52 = sky130_fd_sc_hd_dlygate4sd3_1_inst_91_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:6903:16  */
  assign s_unnamed_51 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_51; // (signal)
  /* find_the_damn_issue_sky130.vhd:6904:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_53 = sky130_fd_sc_hd_dlygate4sd3_1_inst_92_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:6905:16  */
  assign s_unnamed_52 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_52; // (signal)
  /* find_the_damn_issue_sky130.vhd:6906:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_54 = sky130_fd_sc_hd_dlygate4sd3_1_inst_93_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:6907:16  */
  assign s_unnamed_53 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_53; // (signal)
  /* find_the_damn_issue_sky130.vhd:6908:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_55 = sky130_fd_sc_hd_dlygate4sd3_1_inst_14_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:6909:16  */
  assign s_unnamed_54 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_54; // (signal)
  /* find_the_damn_issue_sky130.vhd:6910:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_56 = sky130_fd_sc_hd_dlygate4sd3_1_inst_23_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:6911:16  */
  assign s_unnamed_55 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_55; // (signal)
  /* find_the_damn_issue_sky130.vhd:6912:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_57 = sky130_fd_sc_hd_dlygate4sd3_1_inst_31_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:6913:16  */
  assign s_unnamed_56 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_56; // (signal)
  /* find_the_damn_issue_sky130.vhd:6914:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_58 = sky130_fd_sc_hd_dlygate4sd3_1_inst_43_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:6915:16  */
  assign s_unnamed_57 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_57; // (signal)
  /* find_the_damn_issue_sky130.vhd:6916:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_59 = sky130_fd_sc_hd_dlygate4sd3_1_inst_51_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:6917:16  */
  assign s_unnamed_58 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_58; // (signal)
  /* find_the_damn_issue_sky130.vhd:6918:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_60 = sky130_fd_sc_hd_dlygate4sd3_1_inst_58_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:6919:16  */
  assign s_unnamed_59 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_59; // (signal)
  /* find_the_damn_issue_sky130.vhd:6920:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_61 = sky130_fd_sc_hd_dlygate4sd3_1_inst_69_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:6921:16  */
  assign s_unnamed_60 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_60; // (signal)
  /* find_the_damn_issue_sky130.vhd:6922:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_62 = sky130_fd_sc_hd_dlygate4sd3_1_inst_77_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:6923:16  */
  assign s_unnamed_61 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_61; // (signal)
  /* find_the_damn_issue_sky130.vhd:6924:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_63 = sky130_fd_sc_hd_dlygate4sd3_1_inst_85_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:6925:16  */
  assign s_unnamed_62 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_62; // (signal)
  /* find_the_damn_issue_sky130.vhd:6926:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_64 = sky130_fd_sc_hd_dlygate4sd3_1_inst_16_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:6927:16  */
  assign s_unnamed_63 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_63; // (signal)
  /* find_the_damn_issue_sky130.vhd:6928:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_65 = sky130_fd_sc_hd_dlygate4sd3_1_inst_55_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:6929:16  */
  assign s_unnamed_64 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_64; // (signal)
  /* find_the_damn_issue_sky130.vhd:6930:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_66 = sky130_fd_sc_hd_dlygate4sd3_1_inst_8_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:6931:16  */
  assign s_unnamed_65 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_65; // (signal)
  /* find_the_damn_issue_sky130.vhd:6932:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_67 = sky130_fd_sc_hd_dlygate4sd3_1_inst_40_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:6933:16  */
  assign s_unnamed_66 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_66; // (signal)
  /* find_the_damn_issue_sky130.vhd:6934:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_68 = sky130_fd_sc_hd_dlygate4sd3_1_inst_84_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:6935:16  */
  assign s_unnamed_67 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_67; // (signal)
  /* find_the_damn_issue_sky130.vhd:6936:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_69 = sky130_fd_sc_hd_dlygate4sd3_1_inst_68_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:6937:16  */
  assign s_unnamed_68 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_68; // (signal)
  /* find_the_damn_issue_sky130.vhd:6938:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_70 = sky130_fd_sc_hd_dlygate4sd3_1_inst_42_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:6939:16  */
  assign s_unnamed_69 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_69; // (signal)
  /* find_the_damn_issue_sky130.vhd:6940:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_71 = sky130_fd_sc_hd_dlygate4sd3_1_inst_24_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:6941:16  */
  assign s_unnamed_70 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_70; // (signal)
  /* find_the_damn_issue_sky130.vhd:6942:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_72 = sky130_fd_sc_hd_dlygate4sd3_1_inst_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:6943:16  */
  assign s_unnamed_71 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_71; // (signal)
  /* find_the_damn_issue_sky130.vhd:6944:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_73 = sky130_fd_sc_hd_dlygate4sd3_1_inst_90_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:6945:16  */
  assign s_unnamed_72 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_72; // (signal)
  /* find_the_damn_issue_sky130.vhd:6946:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_74 = sky130_fd_sc_hd_dlygate4sd3_1_inst_87_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:6947:16  */
  assign s_unnamed_73 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_73; // (signal)
  /* find_the_damn_issue_sky130.vhd:6948:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_75 = sky130_fd_sc_hd_dlygate4sd3_1_inst_82_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:6949:16  */
  assign s_unnamed_74 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_74; // (signal)
  /* find_the_damn_issue_sky130.vhd:6950:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_76 = sky130_fd_sc_hd_dlygate4sd3_1_inst_78_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:6951:16  */
  assign s_unnamed_75 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_75; // (signal)
  /* find_the_damn_issue_sky130.vhd:6952:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_77 = sky130_fd_sc_hd_dlygate4sd3_1_inst_74_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:6953:16  */
  assign s_unnamed_76 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_76; // (signal)
  /* find_the_damn_issue_sky130.vhd:6954:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_78 = sky130_fd_sc_hd_dlygate4sd3_1_inst_71_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:6955:16  */
  assign s_unnamed_77 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_77; // (signal)
  /* find_the_damn_issue_sky130.vhd:6956:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_79 = sky130_fd_sc_hd_dlygate4sd3_1_inst_65_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:6957:16  */
  assign s_unnamed_78 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_78; // (signal)
  /* find_the_damn_issue_sky130.vhd:6958:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_80 = sky130_fd_sc_hd_dlygate4sd3_1_inst_63_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:6959:16  */
  assign s_unnamed_79 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_79; // (signal)
  /* find_the_damn_issue_sky130.vhd:6960:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_81 = sky130_fd_sc_hd_dlygate4sd3_1_inst_59_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:6961:16  */
  assign s_unnamed_80 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_80; // (signal)
  /* find_the_damn_issue_sky130.vhd:6962:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_82 = sky130_fd_sc_hd_dlygate4sd3_1_inst_53_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:6963:16  */
  assign s_unnamed_81 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_81; // (signal)
  /* find_the_damn_issue_sky130.vhd:6964:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_83 = sky130_fd_sc_hd_dlygate4sd3_1_inst_50_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:6965:16  */
  assign s_unnamed_82 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_82; // (signal)
  /* find_the_damn_issue_sky130.vhd:6966:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_84 = sky130_fd_sc_hd_dlygate4sd3_1_inst_47_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:6967:16  */
  assign s_unnamed_83 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_83; // (signal)
  /* find_the_damn_issue_sky130.vhd:6968:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_85 = sky130_fd_sc_hd_dlygate4sd3_1_inst_41_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:6969:16  */
  assign s_unnamed_84 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_84; // (signal)
  /* find_the_damn_issue_sky130.vhd:6970:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_86 = sky130_fd_sc_hd_dlygate4sd3_1_inst_37_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:6971:16  */
  assign s_unnamed_85 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_85; // (signal)
  /* find_the_damn_issue_sky130.vhd:6972:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_87 = sky130_fd_sc_hd_dlygate4sd3_1_inst_34_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:6973:16  */
  assign s_unnamed_86 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_86; // (signal)
  /* find_the_damn_issue_sky130.vhd:6974:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_88 = sky130_fd_sc_hd_dlygate4sd3_1_inst_29_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:6975:16  */
  assign s_unnamed_87 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_87; // (signal)
  /* find_the_damn_issue_sky130.vhd:6976:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_89 = sky130_fd_sc_hd_dlygate4sd3_1_inst_26_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:6977:16  */
  assign s_unnamed_88 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_88; // (signal)
  /* find_the_damn_issue_sky130.vhd:6978:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_90 = sky130_fd_sc_hd_dlygate4sd3_1_inst_21_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:6979:16  */
  assign s_unnamed_89 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_89; // (signal)
  /* find_the_damn_issue_sky130.vhd:6980:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_91 = sky130_fd_sc_hd_dlygate4sd3_1_inst_17_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:6981:16  */
  assign s_unnamed_90 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_90; // (signal)
  /* find_the_damn_issue_sky130.vhd:6982:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_92 = sky130_fd_sc_hd_dlygate4sd3_1_inst_13_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:6983:16  */
  assign s_unnamed_91 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_91; // (signal)
  /* find_the_damn_issue_sky130.vhd:6984:16  */
  assign s_sky130_fd_sc_hd_dlygate4sd3_1_x_93 = sky130_fd_sc_hd_dlygate4sd3_1_inst_9_X; // (signal)
  /* find_the_damn_issue_sky130.vhd:6985:16  */
  assign s_unnamed_92 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_92; // (signal)
  /* find_the_damn_issue_sky130.vhd:6986:16  */
  assign s_unnamed_93 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_3; // (signal)
  /* find_the_damn_issue_sky130.vhd:6987:16  */
  assign s_unnamed_94 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_6; // (signal)
  /* find_the_damn_issue_sky130.vhd:6988:16  */
  assign s_unnamed_95 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_9; // (signal)
  /* find_the_damn_issue_sky130.vhd:6989:16  */
  assign s_unnamed_96 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_12; // (signal)
  /* find_the_damn_issue_sky130.vhd:6990:16  */
  assign s_unnamed_97 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_15; // (signal)
  /* find_the_damn_issue_sky130.vhd:6991:16  */
  assign s_unnamed_98 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_18; // (signal)
  /* find_the_damn_issue_sky130.vhd:6992:16  */
  assign s_unnamed_99 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_21; // (signal)
  /* find_the_damn_issue_sky130.vhd:6993:16  */
  assign s_unnamed_100 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_24; // (signal)
  /* find_the_damn_issue_sky130.vhd:6994:16  */
  assign s_unnamed_101 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_27; // (signal)
  /* find_the_damn_issue_sky130.vhd:6995:16  */
  assign s_unnamed_102 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_30; // (signal)
  /* find_the_damn_issue_sky130.vhd:6996:16  */
  assign s_unnamed_103 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_33; // (signal)
  /* find_the_damn_issue_sky130.vhd:6997:16  */
  assign s_unnamed_104 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_36; // (signal)
  /* find_the_damn_issue_sky130.vhd:6998:16  */
  assign s_unnamed_105 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_39; // (signal)
  /* find_the_damn_issue_sky130.vhd:6999:16  */
  assign s_unnamed_106 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_42; // (signal)
  /* find_the_damn_issue_sky130.vhd:7000:16  */
  assign s_unnamed_107 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_45; // (signal)
  /* find_the_damn_issue_sky130.vhd:7001:16  */
  assign s_unnamed_108 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_48; // (signal)
  /* find_the_damn_issue_sky130.vhd:7002:16  */
  assign s_unnamed_109 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_51; // (signal)
  /* find_the_damn_issue_sky130.vhd:7003:16  */
  assign s_unnamed_110 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_54; // (signal)
  /* find_the_damn_issue_sky130.vhd:7004:16  */
  assign s_unnamed_111 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_57; // (signal)
  /* find_the_damn_issue_sky130.vhd:7005:16  */
  assign s_unnamed_112 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_60; // (signal)
  /* find_the_damn_issue_sky130.vhd:7006:16  */
  assign s_unnamed_113 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_63; // (signal)
  /* find_the_damn_issue_sky130.vhd:7007:16  */
  assign s_unnamed_114 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_66; // (signal)
  /* find_the_damn_issue_sky130.vhd:7008:16  */
  assign s_unnamed_115 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_69; // (signal)
  /* find_the_damn_issue_sky130.vhd:7009:16  */
  assign s_unnamed_116 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_72; // (signal)
  /* find_the_damn_issue_sky130.vhd:7010:16  */
  assign s_unnamed_117 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_75; // (signal)
  /* find_the_damn_issue_sky130.vhd:7011:16  */
  assign s_unnamed_118 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_78; // (signal)
  /* find_the_damn_issue_sky130.vhd:7012:16  */
  assign s_unnamed_119 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_81; // (signal)
  /* find_the_damn_issue_sky130.vhd:7013:16  */
  assign s_unnamed_120 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_84; // (signal)
  /* find_the_damn_issue_sky130.vhd:7014:16  */
  assign s_unnamed_121 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_87; // (signal)
  /* find_the_damn_issue_sky130.vhd:7015:16  */
  assign s_unnamed_122 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_90; // (signal)
  /* find_the_damn_issue_sky130.vhd:7016:16  */
  assign s_unnamed_123 = s_sky130_fd_sc_hd_dlygate4sd3_1_x_93; // (signal)
  /* find_the_damn_issue_sky130.vhd:7018:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst (
    .A(s_unnamed_71),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_X));
  /* find_the_damn_issue_sky130.vhd:7023:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_2 (
    .A(s_chain_input_2),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_2_X));
  /* find_the_damn_issue_sky130.vhd:7028:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_3 (
    .A(s_unnamed),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_3_X));
  /* find_the_damn_issue_sky130.vhd:7033:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_4 (
    .A(s_unnamed_2),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_4_X));
  /* find_the_damn_issue_sky130.vhd:7038:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_5 (
    .A(s_unnamed_3),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_5_X));
  /* find_the_damn_issue_sky130.vhd:7043:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_6 (
    .A(s_unnamed_4),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_6_X));
  /* find_the_damn_issue_sky130.vhd:7048:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_7 (
    .A(s_unnamed_5),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_7_X));
  /* find_the_damn_issue_sky130.vhd:7053:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_8 (
    .A(s_unnamed_65),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_8_X));
  /* find_the_damn_issue_sky130.vhd:7058:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_9 (
    .A(s_unnamed_92),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_9_X));
  /* find_the_damn_issue_sky130.vhd:7063:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_10 (
    .A(s_unnamed_6),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_10_X));
  /* find_the_damn_issue_sky130.vhd:7068:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_11 (
    .A(s_unnamed_7),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_11_X));
  /* find_the_damn_issue_sky130.vhd:7073:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_12 (
    .A(s_unnamed_8),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_12_X));
  /* find_the_damn_issue_sky130.vhd:7078:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_13 (
    .A(s_unnamed_91),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_13_X));
  /* find_the_damn_issue_sky130.vhd:7083:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_14 (
    .A(s_unnamed_54),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_14_X));
  /* find_the_damn_issue_sky130.vhd:7088:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_15 (
    .A(s_unnamed_9),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_15_X));
  /* find_the_damn_issue_sky130.vhd:7093:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_16 (
    .A(s_unnamed_63),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_16_X));
  /* find_the_damn_issue_sky130.vhd:7098:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_17 (
    .A(s_unnamed_90),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_17_X));
  /* find_the_damn_issue_sky130.vhd:7103:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_18 (
    .A(s_unnamed_10),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_18_X));
  /* find_the_damn_issue_sky130.vhd:7108:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_19 (
    .A(s_unnamed_11),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_19_X));
  /* find_the_damn_issue_sky130.vhd:7113:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_20 (
    .A(s_unnamed_12),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_20_X));
  /* find_the_damn_issue_sky130.vhd:7118:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_21 (
    .A(s_unnamed_89),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_21_X));
  /* find_the_damn_issue_sky130.vhd:7123:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_22 (
    .A(s_unnamed_13),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_22_X));
  /* find_the_damn_issue_sky130.vhd:7128:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_23 (
    .A(s_unnamed_55),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_23_X));
  /* find_the_damn_issue_sky130.vhd:7133:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_24 (
    .A(s_unnamed_70),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_24_X));
  /* find_the_damn_issue_sky130.vhd:7138:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_25 (
    .A(s_unnamed_14),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_25_X));
  /* find_the_damn_issue_sky130.vhd:7143:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_26 (
    .A(s_unnamed_88),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_26_X));
  /* find_the_damn_issue_sky130.vhd:7148:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_27 (
    .A(s_unnamed_15),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_27_X));
  /* find_the_damn_issue_sky130.vhd:7153:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_28 (
    .A(s_unnamed_16),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_28_X));
  /* find_the_damn_issue_sky130.vhd:7158:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_29 (
    .A(s_unnamed_87),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_29_X));
  /* find_the_damn_issue_sky130.vhd:7163:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_30 (
    .A(s_unnamed_17),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_30_X));
  /* find_the_damn_issue_sky130.vhd:7168:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_31 (
    .A(s_unnamed_56),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_31_X));
  /* find_the_damn_issue_sky130.vhd:7173:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_32 (
    .A(s_unnamed_18),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_32_X));
  /* find_the_damn_issue_sky130.vhd:7178:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_33 (
    .A(s_unnamed_19),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_33_X));
  /* find_the_damn_issue_sky130.vhd:7183:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_34 (
    .A(s_unnamed_86),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_34_X));
  /* find_the_damn_issue_sky130.vhd:7188:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_35 (
    .A(s_unnamed_20),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_35_X));
  /* find_the_damn_issue_sky130.vhd:7193:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_36 (
    .A(s_unnamed_21),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_36_X));
  /* find_the_damn_issue_sky130.vhd:7198:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_37 (
    .A(s_unnamed_85),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_37_X));
  /* find_the_damn_issue_sky130.vhd:7203:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_38 (
    .A(s_unnamed_22),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_38_X));
  /* find_the_damn_issue_sky130.vhd:7208:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_39 (
    .A(s_unnamed_23),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_39_X));
  /* find_the_damn_issue_sky130.vhd:7213:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_40 (
    .A(s_unnamed_66),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_40_X));
  /* find_the_damn_issue_sky130.vhd:7218:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_41 (
    .A(s_unnamed_84),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_41_X));
  /* find_the_damn_issue_sky130.vhd:7223:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_42 (
    .A(s_unnamed_69),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_42_X));
  /* find_the_damn_issue_sky130.vhd:7228:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_43 (
    .A(s_unnamed_57),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_43_X));
  /* find_the_damn_issue_sky130.vhd:7233:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_44 (
    .A(s_unnamed_24),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_44_X));
  /* find_the_damn_issue_sky130.vhd:7238:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_45 (
    .A(s_unnamed_25),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_45_X));
  /* find_the_damn_issue_sky130.vhd:7243:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_46 (
    .A(s_unnamed_26),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_46_X));
  /* find_the_damn_issue_sky130.vhd:7248:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_47 (
    .A(s_unnamed_83),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_47_X));
  /* find_the_damn_issue_sky130.vhd:7253:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_48 (
    .A(s_unnamed_27),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_48_X));
  /* find_the_damn_issue_sky130.vhd:7258:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_49 (
    .A(s_unnamed_28),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_49_X));
  /* find_the_damn_issue_sky130.vhd:7263:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_50 (
    .A(s_unnamed_82),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_50_X));
  /* find_the_damn_issue_sky130.vhd:7268:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_51 (
    .A(s_unnamed_58),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_51_X));
  /* find_the_damn_issue_sky130.vhd:7273:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_52 (
    .A(s_unnamed_29),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_52_X));
  /* find_the_damn_issue_sky130.vhd:7278:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_53 (
    .A(s_unnamed_81),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_53_X));
  /* find_the_damn_issue_sky130.vhd:7283:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_54 (
    .A(s_unnamed_30),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_54_X));
  /* find_the_damn_issue_sky130.vhd:7288:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_55 (
    .A(s_unnamed_64),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_55_X));
  /* find_the_damn_issue_sky130.vhd:7293:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_56 (
    .A(s_unnamed_31),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_56_X));
  /* find_the_damn_issue_sky130.vhd:7298:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_57 (
    .A(s_unnamed_32),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_57_X));
  /* find_the_damn_issue_sky130.vhd:7303:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_58 (
    .A(s_unnamed_59),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_58_X));
  /* find_the_damn_issue_sky130.vhd:7308:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_59 (
    .A(s_unnamed_80),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_59_X));
  /* find_the_damn_issue_sky130.vhd:7313:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_60 (
    .A(s_unnamed_33),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_60_X));
  /* find_the_damn_issue_sky130.vhd:7318:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_61 (
    .A(s_unnamed_34),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_61_X));
  /* find_the_damn_issue_sky130.vhd:7323:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_62 (
    .A(s_unnamed_35),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_62_X));
  /* find_the_damn_issue_sky130.vhd:7328:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_63 (
    .A(s_unnamed_79),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_63_X));
  /* find_the_damn_issue_sky130.vhd:7333:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_64 (
    .A(s_unnamed_36),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_64_X));
  /* find_the_damn_issue_sky130.vhd:7338:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_65 (
    .A(s_unnamed_78),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_65_X));
  /* find_the_damn_issue_sky130.vhd:7343:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_66 (
    .A(s_unnamed_37),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_66_X));
  /* find_the_damn_issue_sky130.vhd:7348:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_67 (
    .A(s_unnamed_38),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_67_X));
  /* find_the_damn_issue_sky130.vhd:7353:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_68 (
    .A(s_unnamed_68),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_68_X));
  /* find_the_damn_issue_sky130.vhd:7358:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_69 (
    .A(s_unnamed_60),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_69_X));
  /* find_the_damn_issue_sky130.vhd:7363:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_70 (
    .A(s_unnamed_39),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_70_X));
  /* find_the_damn_issue_sky130.vhd:7368:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_71 (
    .A(s_unnamed_77),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_71_X));
  /* find_the_damn_issue_sky130.vhd:7373:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_72 (
    .A(s_unnamed_40),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_72_X));
  /* find_the_damn_issue_sky130.vhd:7378:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_73 (
    .A(s_unnamed_41),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_73_X));
  /* find_the_damn_issue_sky130.vhd:7383:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_74 (
    .A(s_unnamed_76),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_74_X));
  /* find_the_damn_issue_sky130.vhd:7388:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_75 (
    .A(s_unnamed_42),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_75_X));
  /* find_the_damn_issue_sky130.vhd:7393:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_76 (
    .A(s_unnamed_43),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_76_X));
  /* find_the_damn_issue_sky130.vhd:7398:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_77 (
    .A(s_unnamed_61),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_77_X));
  /* find_the_damn_issue_sky130.vhd:7403:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_78 (
    .A(s_unnamed_75),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_78_X));
  /* find_the_damn_issue_sky130.vhd:7408:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_79 (
    .A(s_unnamed_44),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_79_X));
  /* find_the_damn_issue_sky130.vhd:7413:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_80 (
    .A(s_unnamed_45),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_80_X));
  /* find_the_damn_issue_sky130.vhd:7418:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_81 (
    .A(s_unnamed_46),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_81_X));
  /* find_the_damn_issue_sky130.vhd:7423:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_82 (
    .A(s_unnamed_74),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_82_X));
  /* find_the_damn_issue_sky130.vhd:7428:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_83 (
    .A(s_unnamed_47),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_83_X));
  /* find_the_damn_issue_sky130.vhd:7433:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_84 (
    .A(s_unnamed_67),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_84_X));
  /* find_the_damn_issue_sky130.vhd:7438:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_85 (
    .A(s_unnamed_62),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_85_X));
  /* find_the_damn_issue_sky130.vhd:7443:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_86 (
    .A(s_unnamed_48),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_86_X));
  /* find_the_damn_issue_sky130.vhd:7448:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_87 (
    .A(s_unnamed_73),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_87_X));
  /* find_the_damn_issue_sky130.vhd:7453:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_88 (
    .A(s_unnamed_49),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_88_X));
  /* find_the_damn_issue_sky130.vhd:7458:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_89 (
    .A(s_unnamed_50),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_89_X));
  /* find_the_damn_issue_sky130.vhd:7463:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_90 (
    .A(s_unnamed_72),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_90_X));
  /* find_the_damn_issue_sky130.vhd:7468:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_91 (
    .A(s_unnamed_51),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_91_X));
  /* find_the_damn_issue_sky130.vhd:7473:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_92 (
    .A(s_unnamed_52),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_92_X));
  /* find_the_damn_issue_sky130.vhd:7478:9  */
  sky130_fd_sc_hd_dlygate4sd3_1 sky130_fd_sc_hd_dlygate4sd3_1_inst_93 (
    .A(s_unnamed_53),
    .X(sky130_fd_sc_hd_dlygate4sd3_1_inst_93_X));
  /* find_the_damn_issue_sky130.vhd:7616:60  */
  assign n8414_o = n8413_o[31:1];
  /* find_the_damn_issue_sky130.vhd:7616:74  */
  assign n8415_o = {n8414_o, s_chain_input_2};
  /* find_the_damn_issue_sky130.vhd:7618:60  */
  assign n8416_o = n8415_o[31:2];
  /* find_the_damn_issue_sky130.vhd:7618:74  */
  assign n8417_o = {n8416_o, s_unnamed_93};
  /* find_the_damn_issue_sky130.vhd:7618:120  */
  assign n8418_o = n8415_o[0];
  /* find_the_damn_issue_sky130.vhd:7618:89  */
  assign n8419_o = {n8417_o, n8418_o};
  /* find_the_damn_issue_sky130.vhd:7620:42  */
  assign n8420_o = n8419_o[31:3];
  /* find_the_damn_issue_sky130.vhd:7620:56  */
  assign n8421_o = {n8420_o, s_unnamed_94};
  /* find_the_damn_issue_sky130.vhd:7620:82  */
  assign n8422_o = n8419_o[1:0];
  /* find_the_damn_issue_sky130.vhd:7620:71  */
  assign n8423_o = {n8421_o, n8422_o};
  /* find_the_damn_issue_sky130.vhd:7622:44  */
  assign n8424_o = n8423_o[31:4];
  /* find_the_damn_issue_sky130.vhd:7622:58  */
  assign n8425_o = {n8424_o, s_unnamed_95};
  /* find_the_damn_issue_sky130.vhd:7622:86  */
  assign n8426_o = n8423_o[2:0];
  /* find_the_damn_issue_sky130.vhd:7622:73  */
  assign n8427_o = {n8425_o, n8426_o};
  /* find_the_damn_issue_sky130.vhd:7624:44  */
  assign n8428_o = n8427_o[31:5];
  /* find_the_damn_issue_sky130.vhd:7624:58  */
  assign n8429_o = {n8428_o, s_unnamed_96};
  /* find_the_damn_issue_sky130.vhd:7624:86  */
  assign n8430_o = n8427_o[3:0];
  /* find_the_damn_issue_sky130.vhd:7624:73  */
  assign n8431_o = {n8429_o, n8430_o};
  /* find_the_damn_issue_sky130.vhd:7626:44  */
  assign n8432_o = n8431_o[31:6];
  /* find_the_damn_issue_sky130.vhd:7626:58  */
  assign n8433_o = {n8432_o, s_unnamed_97};
  /* find_the_damn_issue_sky130.vhd:7626:86  */
  assign n8434_o = n8431_o[4:0];
  /* find_the_damn_issue_sky130.vhd:7626:73  */
  assign n8435_o = {n8433_o, n8434_o};
  /* find_the_damn_issue_sky130.vhd:7628:44  */
  assign n8436_o = n8435_o[31:7];
  /* find_the_damn_issue_sky130.vhd:7628:58  */
  assign n8437_o = {n8436_o, s_unnamed_98};
  /* find_the_damn_issue_sky130.vhd:7628:86  */
  assign n8438_o = n8435_o[5:0];
  /* find_the_damn_issue_sky130.vhd:7628:73  */
  assign n8439_o = {n8437_o, n8438_o};
  /* find_the_damn_issue_sky130.vhd:7630:44  */
  assign n8440_o = n8439_o[31:8];
  /* find_the_damn_issue_sky130.vhd:7630:58  */
  assign n8441_o = {n8440_o, s_unnamed_99};
  /* find_the_damn_issue_sky130.vhd:7630:86  */
  assign n8442_o = n8439_o[6:0];
  /* find_the_damn_issue_sky130.vhd:7630:73  */
  assign n8443_o = {n8441_o, n8442_o};
  /* find_the_damn_issue_sky130.vhd:7632:44  */
  assign n8444_o = n8443_o[31:9];
  /* find_the_damn_issue_sky130.vhd:7632:58  */
  assign n8445_o = {n8444_o, s_unnamed_100};
  /* find_the_damn_issue_sky130.vhd:7632:87  */
  assign n8446_o = n8443_o[7:0];
  /* find_the_damn_issue_sky130.vhd:7632:74  */
  assign n8447_o = {n8445_o, n8446_o};
  /* find_the_damn_issue_sky130.vhd:7634:44  */
  assign n8448_o = n8447_o[31:10];
  /* find_the_damn_issue_sky130.vhd:7634:59  */
  assign n8449_o = {n8448_o, s_unnamed_101};
  /* find_the_damn_issue_sky130.vhd:7634:88  */
  assign n8450_o = n8447_o[8:0];
  /* find_the_damn_issue_sky130.vhd:7634:75  */
  assign n8451_o = {n8449_o, n8450_o};
  /* find_the_damn_issue_sky130.vhd:7636:45  */
  assign n8452_o = n8451_o[31:11];
  /* find_the_damn_issue_sky130.vhd:7636:60  */
  assign n8453_o = {n8452_o, s_unnamed_102};
  /* find_the_damn_issue_sky130.vhd:7636:89  */
  assign n8454_o = n8451_o[9:0];
  /* find_the_damn_issue_sky130.vhd:7636:76  */
  assign n8455_o = {n8453_o, n8454_o};
  /* find_the_damn_issue_sky130.vhd:7638:46  */
  assign n8456_o = n8455_o[31:12];
  /* find_the_damn_issue_sky130.vhd:7638:61  */
  assign n8457_o = {n8456_o, s_unnamed_103};
  /* find_the_damn_issue_sky130.vhd:7638:91  */
  assign n8458_o = n8455_o[10:0];
  /* find_the_damn_issue_sky130.vhd:7638:77  */
  assign n8459_o = {n8457_o, n8458_o};
  /* find_the_damn_issue_sky130.vhd:7640:46  */
  assign n8460_o = n8459_o[31:13];
  /* find_the_damn_issue_sky130.vhd:7640:61  */
  assign n8461_o = {n8460_o, s_unnamed_104};
  /* find_the_damn_issue_sky130.vhd:7640:91  */
  assign n8462_o = n8459_o[11:0];
  /* find_the_damn_issue_sky130.vhd:7640:77  */
  assign n8463_o = {n8461_o, n8462_o};
  /* find_the_damn_issue_sky130.vhd:7642:46  */
  assign n8464_o = n8463_o[31:14];
  /* find_the_damn_issue_sky130.vhd:7642:61  */
  assign n8465_o = {n8464_o, s_unnamed_105};
  /* find_the_damn_issue_sky130.vhd:7642:91  */
  assign n8466_o = n8463_o[12:0];
  /* find_the_damn_issue_sky130.vhd:7642:77  */
  assign n8467_o = {n8465_o, n8466_o};
  /* find_the_damn_issue_sky130.vhd:7644:46  */
  assign n8468_o = n8467_o[31:15];
  /* find_the_damn_issue_sky130.vhd:7644:61  */
  assign n8469_o = {n8468_o, s_unnamed_106};
  /* find_the_damn_issue_sky130.vhd:7644:91  */
  assign n8470_o = n8467_o[13:0];
  /* find_the_damn_issue_sky130.vhd:7644:77  */
  assign n8471_o = {n8469_o, n8470_o};
  /* find_the_damn_issue_sky130.vhd:7646:46  */
  assign n8472_o = n8471_o[31:16];
  /* find_the_damn_issue_sky130.vhd:7646:61  */
  assign n8473_o = {n8472_o, s_unnamed_107};
  /* find_the_damn_issue_sky130.vhd:7646:91  */
  assign n8474_o = n8471_o[14:0];
  /* find_the_damn_issue_sky130.vhd:7646:77  */
  assign n8475_o = {n8473_o, n8474_o};
  /* find_the_damn_issue_sky130.vhd:7648:46  */
  assign n8476_o = n8475_o[31:17];
  /* find_the_damn_issue_sky130.vhd:7648:61  */
  assign n8477_o = {n8476_o, s_unnamed_108};
  /* find_the_damn_issue_sky130.vhd:7648:91  */
  assign n8478_o = n8475_o[15:0];
  /* find_the_damn_issue_sky130.vhd:7648:77  */
  assign n8479_o = {n8477_o, n8478_o};
  /* find_the_damn_issue_sky130.vhd:7650:46  */
  assign n8480_o = n8479_o[31:18];
  /* find_the_damn_issue_sky130.vhd:7650:61  */
  assign n8481_o = {n8480_o, s_unnamed_109};
  /* find_the_damn_issue_sky130.vhd:7650:91  */
  assign n8482_o = n8479_o[16:0];
  /* find_the_damn_issue_sky130.vhd:7650:77  */
  assign n8483_o = {n8481_o, n8482_o};
  /* find_the_damn_issue_sky130.vhd:7652:46  */
  assign n8484_o = n8483_o[31:19];
  /* find_the_damn_issue_sky130.vhd:7652:61  */
  assign n8485_o = {n8484_o, s_unnamed_110};
  /* find_the_damn_issue_sky130.vhd:7652:91  */
  assign n8486_o = n8483_o[17:0];
  /* find_the_damn_issue_sky130.vhd:7652:77  */
  assign n8487_o = {n8485_o, n8486_o};
  /* find_the_damn_issue_sky130.vhd:7654:46  */
  assign n8488_o = n8487_o[31:20];
  /* find_the_damn_issue_sky130.vhd:7654:61  */
  assign n8489_o = {n8488_o, s_unnamed_111};
  /* find_the_damn_issue_sky130.vhd:7654:91  */
  assign n8490_o = n8487_o[18:0];
  /* find_the_damn_issue_sky130.vhd:7654:77  */
  assign n8491_o = {n8489_o, n8490_o};
  /* find_the_damn_issue_sky130.vhd:7656:46  */
  assign n8492_o = n8491_o[31:21];
  /* find_the_damn_issue_sky130.vhd:7656:61  */
  assign n8493_o = {n8492_o, s_unnamed_112};
  /* find_the_damn_issue_sky130.vhd:7656:91  */
  assign n8494_o = n8491_o[19:0];
  /* find_the_damn_issue_sky130.vhd:7656:77  */
  assign n8495_o = {n8493_o, n8494_o};
  /* find_the_damn_issue_sky130.vhd:7658:46  */
  assign n8496_o = n8495_o[31:22];
  /* find_the_damn_issue_sky130.vhd:7658:61  */
  assign n8497_o = {n8496_o, s_unnamed_113};
  /* find_the_damn_issue_sky130.vhd:7658:91  */
  assign n8498_o = n8495_o[20:0];
  /* find_the_damn_issue_sky130.vhd:7658:77  */
  assign n8499_o = {n8497_o, n8498_o};
  /* find_the_damn_issue_sky130.vhd:7660:46  */
  assign n8500_o = n8499_o[31:23];
  /* find_the_damn_issue_sky130.vhd:7660:61  */
  assign n8501_o = {n8500_o, s_unnamed_114};
  /* find_the_damn_issue_sky130.vhd:7660:91  */
  assign n8502_o = n8499_o[21:0];
  /* find_the_damn_issue_sky130.vhd:7660:77  */
  assign n8503_o = {n8501_o, n8502_o};
  /* find_the_damn_issue_sky130.vhd:7662:46  */
  assign n8504_o = n8503_o[31:24];
  /* find_the_damn_issue_sky130.vhd:7662:61  */
  assign n8505_o = {n8504_o, s_unnamed_115};
  /* find_the_damn_issue_sky130.vhd:7662:91  */
  assign n8506_o = n8503_o[22:0];
  /* find_the_damn_issue_sky130.vhd:7662:77  */
  assign n8507_o = {n8505_o, n8506_o};
  /* find_the_damn_issue_sky130.vhd:7664:46  */
  assign n8508_o = n8507_o[31:25];
  /* find_the_damn_issue_sky130.vhd:7664:61  */
  assign n8509_o = {n8508_o, s_unnamed_116};
  /* find_the_damn_issue_sky130.vhd:7664:91  */
  assign n8510_o = n8507_o[23:0];
  /* find_the_damn_issue_sky130.vhd:7664:77  */
  assign n8511_o = {n8509_o, n8510_o};
  /* find_the_damn_issue_sky130.vhd:7666:46  */
  assign n8512_o = n8511_o[31:26];
  /* find_the_damn_issue_sky130.vhd:7666:61  */
  assign n8513_o = {n8512_o, s_unnamed_117};
  /* find_the_damn_issue_sky130.vhd:7666:91  */
  assign n8514_o = n8511_o[24:0];
  /* find_the_damn_issue_sky130.vhd:7666:77  */
  assign n8515_o = {n8513_o, n8514_o};
  /* find_the_damn_issue_sky130.vhd:7668:46  */
  assign n8516_o = n8515_o[31:27];
  /* find_the_damn_issue_sky130.vhd:7668:61  */
  assign n8517_o = {n8516_o, s_unnamed_118};
  /* find_the_damn_issue_sky130.vhd:7668:91  */
  assign n8518_o = n8515_o[25:0];
  /* find_the_damn_issue_sky130.vhd:7668:77  */
  assign n8519_o = {n8517_o, n8518_o};
  /* find_the_damn_issue_sky130.vhd:7670:46  */
  assign n8520_o = n8519_o[31:28];
  /* find_the_damn_issue_sky130.vhd:7670:61  */
  assign n8521_o = {n8520_o, s_unnamed_119};
  /* find_the_damn_issue_sky130.vhd:7670:91  */
  assign n8522_o = n8519_o[26:0];
  /* find_the_damn_issue_sky130.vhd:7670:77  */
  assign n8523_o = {n8521_o, n8522_o};
  /* find_the_damn_issue_sky130.vhd:7672:46  */
  assign n8524_o = n8523_o[31:29];
  /* find_the_damn_issue_sky130.vhd:7672:61  */
  assign n8525_o = {n8524_o, s_unnamed_120};
  /* find_the_damn_issue_sky130.vhd:7672:91  */
  assign n8526_o = n8523_o[27:0];
  /* find_the_damn_issue_sky130.vhd:7672:77  */
  assign n8527_o = {n8525_o, n8526_o};
  /* find_the_damn_issue_sky130.vhd:7674:46  */
  assign n8528_o = n8527_o[31:30];
  /* find_the_damn_issue_sky130.vhd:7674:61  */
  assign n8529_o = {n8528_o, s_unnamed_121};
  /* find_the_damn_issue_sky130.vhd:7674:91  */
  assign n8530_o = n8527_o[28:0];
  /* find_the_damn_issue_sky130.vhd:7674:77  */
  assign n8531_o = {n8529_o, n8530_o};
  /* find_the_damn_issue_sky130.vhd:7676:46  */
  assign n8532_o = n8531_o[31];
  /* find_the_damn_issue_sky130.vhd:7676:61  */
  assign n8533_o = {n8532_o, s_unnamed_122};
  /* find_the_damn_issue_sky130.vhd:7676:91  */
  assign n8534_o = n8531_o[29:0];
  /* find_the_damn_issue_sky130.vhd:7676:77  */
  assign n8535_o = {n8533_o, n8534_o};
  /* find_the_damn_issue_sky130.vhd:7677:62  */
  assign n8536_o = n8535_o[30:0];
  /* find_the_damn_issue_sky130.vhd:7677:48  */
  assign n8537_o = {s_unnamed_123, n8536_o};
  /* find_the_damn_issue_sky130.vhd:7679:71  */
  assign n8538_o = n8537_o[0];
  /* find_the_damn_issue_sky130.vhd:7679:25  */
  assign n8540_o = in_delay == 5'b00000;
  /* find_the_damn_issue_sky130.vhd:7680:71  */
  assign n8541_o = n8537_o[1];
  /* find_the_damn_issue_sky130.vhd:7680:25  */
  assign n8543_o = in_delay == 5'b00001;
  /* find_the_damn_issue_sky130.vhd:7681:71  */
  assign n8544_o = n8537_o[2];
  /* find_the_damn_issue_sky130.vhd:7681:25  */
  assign n8546_o = in_delay == 5'b00010;
  /* find_the_damn_issue_sky130.vhd:7682:71  */
  assign n8547_o = n8537_o[3];
  /* find_the_damn_issue_sky130.vhd:7682:25  */
  assign n8549_o = in_delay == 5'b00011;
  /* find_the_damn_issue_sky130.vhd:7683:71  */
  assign n8550_o = n8537_o[4];
  /* find_the_damn_issue_sky130.vhd:7683:25  */
  assign n8552_o = in_delay == 5'b00100;
  /* find_the_damn_issue_sky130.vhd:7684:71  */
  assign n8553_o = n8537_o[5];
  /* find_the_damn_issue_sky130.vhd:7684:25  */
  assign n8555_o = in_delay == 5'b00101;
  /* find_the_damn_issue_sky130.vhd:7685:71  */
  assign n8556_o = n8537_o[6];
  /* find_the_damn_issue_sky130.vhd:7685:25  */
  assign n8558_o = in_delay == 5'b00110;
  /* find_the_damn_issue_sky130.vhd:7686:71  */
  assign n8559_o = n8537_o[7];
  /* find_the_damn_issue_sky130.vhd:7686:25  */
  assign n8561_o = in_delay == 5'b00111;
  /* find_the_damn_issue_sky130.vhd:7687:71  */
  assign n8562_o = n8537_o[8];
  /* find_the_damn_issue_sky130.vhd:7687:25  */
  assign n8564_o = in_delay == 5'b01000;
  /* find_the_damn_issue_sky130.vhd:7688:71  */
  assign n8565_o = n8537_o[9];
  /* find_the_damn_issue_sky130.vhd:7688:25  */
  assign n8567_o = in_delay == 5'b01001;
  /* find_the_damn_issue_sky130.vhd:7689:71  */
  assign n8568_o = n8537_o[10];
  /* find_the_damn_issue_sky130.vhd:7689:25  */
  assign n8570_o = in_delay == 5'b01010;
  /* find_the_damn_issue_sky130.vhd:7690:71  */
  assign n8571_o = n8537_o[11];
  /* find_the_damn_issue_sky130.vhd:7690:25  */
  assign n8573_o = in_delay == 5'b01011;
  /* find_the_damn_issue_sky130.vhd:7691:71  */
  assign n8574_o = n8537_o[12];
  /* find_the_damn_issue_sky130.vhd:7691:25  */
  assign n8576_o = in_delay == 5'b01100;
  /* find_the_damn_issue_sky130.vhd:7692:71  */
  assign n8577_o = n8537_o[13];
  /* find_the_damn_issue_sky130.vhd:7692:25  */
  assign n8579_o = in_delay == 5'b01101;
  /* find_the_damn_issue_sky130.vhd:7693:71  */
  assign n8580_o = n8537_o[14];
  /* find_the_damn_issue_sky130.vhd:7693:25  */
  assign n8582_o = in_delay == 5'b01110;
  /* find_the_damn_issue_sky130.vhd:7694:71  */
  assign n8583_o = n8537_o[15];
  /* find_the_damn_issue_sky130.vhd:7694:25  */
  assign n8585_o = in_delay == 5'b01111;
  /* find_the_damn_issue_sky130.vhd:7695:71  */
  assign n8586_o = n8537_o[16];
  /* find_the_damn_issue_sky130.vhd:7695:25  */
  assign n8588_o = in_delay == 5'b10000;
  /* find_the_damn_issue_sky130.vhd:7696:71  */
  assign n8589_o = n8537_o[17];
  /* find_the_damn_issue_sky130.vhd:7696:25  */
  assign n8591_o = in_delay == 5'b10001;
  /* find_the_damn_issue_sky130.vhd:7697:71  */
  assign n8592_o = n8537_o[18];
  /* find_the_damn_issue_sky130.vhd:7697:25  */
  assign n8594_o = in_delay == 5'b10010;
  /* find_the_damn_issue_sky130.vhd:7698:71  */
  assign n8595_o = n8537_o[19];
  /* find_the_damn_issue_sky130.vhd:7698:25  */
  assign n8597_o = in_delay == 5'b10011;
  /* find_the_damn_issue_sky130.vhd:7699:71  */
  assign n8598_o = n8537_o[20];
  /* find_the_damn_issue_sky130.vhd:7699:25  */
  assign n8600_o = in_delay == 5'b10100;
  /* find_the_damn_issue_sky130.vhd:7700:71  */
  assign n8601_o = n8537_o[21];
  /* find_the_damn_issue_sky130.vhd:7700:25  */
  assign n8603_o = in_delay == 5'b10101;
  /* find_the_damn_issue_sky130.vhd:7701:71  */
  assign n8604_o = n8537_o[22];
  /* find_the_damn_issue_sky130.vhd:7701:25  */
  assign n8606_o = in_delay == 5'b10110;
  /* find_the_damn_issue_sky130.vhd:7702:71  */
  assign n8607_o = n8537_o[23];
  /* find_the_damn_issue_sky130.vhd:7702:25  */
  assign n8609_o = in_delay == 5'b10111;
  /* find_the_damn_issue_sky130.vhd:7703:71  */
  assign n8610_o = n8537_o[24];
  /* find_the_damn_issue_sky130.vhd:7703:25  */
  assign n8612_o = in_delay == 5'b11000;
  /* find_the_damn_issue_sky130.vhd:7704:71  */
  assign n8613_o = n8537_o[25];
  /* find_the_damn_issue_sky130.vhd:7704:25  */
  assign n8615_o = in_delay == 5'b11001;
  /* find_the_damn_issue_sky130.vhd:7705:71  */
  assign n8616_o = n8537_o[26];
  /* find_the_damn_issue_sky130.vhd:7705:25  */
  assign n8618_o = in_delay == 5'b11010;
  /* find_the_damn_issue_sky130.vhd:7706:71  */
  assign n8619_o = n8537_o[27];
  /* find_the_damn_issue_sky130.vhd:7706:25  */
  assign n8621_o = in_delay == 5'b11011;
  /* find_the_damn_issue_sky130.vhd:7707:71  */
  assign n8622_o = n8537_o[28];
  /* find_the_damn_issue_sky130.vhd:7707:25  */
  assign n8624_o = in_delay == 5'b11100;
  /* find_the_damn_issue_sky130.vhd:7708:71  */
  assign n8625_o = n8537_o[29];
  /* find_the_damn_issue_sky130.vhd:7708:25  */
  assign n8627_o = in_delay == 5'b11101;
  /* find_the_damn_issue_sky130.vhd:7709:71  */
  assign n8628_o = n8537_o[30];
  /* find_the_damn_issue_sky130.vhd:7709:25  */
  assign n8630_o = in_delay == 5'b11110;
  /* find_the_damn_issue_sky130.vhd:7710:71  */
  assign n8631_o = n8537_o[31];
  /* find_the_damn_issue_sky130.vhd:7710:25  */
  assign n8633_o = in_delay == 5'b11111;
  assign n8634_o = {n8633_o, n8630_o, n8627_o, n8624_o, n8621_o, n8618_o, n8615_o, n8612_o, n8609_o, n8606_o, n8603_o, n8600_o, n8597_o, n8594_o, n8591_o, n8588_o, n8585_o, n8582_o, n8579_o, n8576_o, n8573_o, n8570_o, n8567_o, n8564_o, n8561_o, n8558_o, n8555_o, n8552_o, n8549_o, n8546_o, n8543_o, n8540_o};
  /* find_the_damn_issue_sky130.vhd:7678:17  */
  always @*
    case (n8634_o)
      32'b10000000000000000000000000000000: n8636_o = n8631_o;
      32'b01000000000000000000000000000000: n8636_o = n8628_o;
      32'b00100000000000000000000000000000: n8636_o = n8625_o;
      32'b00010000000000000000000000000000: n8636_o = n8622_o;
      32'b00001000000000000000000000000000: n8636_o = n8619_o;
      32'b00000100000000000000000000000000: n8636_o = n8616_o;
      32'b00000010000000000000000000000000: n8636_o = n8613_o;
      32'b00000001000000000000000000000000: n8636_o = n8610_o;
      32'b00000000100000000000000000000000: n8636_o = n8607_o;
      32'b00000000010000000000000000000000: n8636_o = n8604_o;
      32'b00000000001000000000000000000000: n8636_o = n8601_o;
      32'b00000000000100000000000000000000: n8636_o = n8598_o;
      32'b00000000000010000000000000000000: n8636_o = n8595_o;
      32'b00000000000001000000000000000000: n8636_o = n8592_o;
      32'b00000000000000100000000000000000: n8636_o = n8589_o;
      32'b00000000000000010000000000000000: n8636_o = n8586_o;
      32'b00000000000000001000000000000000: n8636_o = n8583_o;
      32'b00000000000000000100000000000000: n8636_o = n8580_o;
      32'b00000000000000000010000000000000: n8636_o = n8577_o;
      32'b00000000000000000001000000000000: n8636_o = n8574_o;
      32'b00000000000000000000100000000000: n8636_o = n8571_o;
      32'b00000000000000000000010000000000: n8636_o = n8568_o;
      32'b00000000000000000000001000000000: n8636_o = n8565_o;
      32'b00000000000000000000000100000000: n8636_o = n8562_o;
      32'b00000000000000000000000010000000: n8636_o = n8559_o;
      32'b00000000000000000000000001000000: n8636_o = n8556_o;
      32'b00000000000000000000000000100000: n8636_o = n8553_o;
      32'b00000000000000000000000000010000: n8636_o = n8550_o;
      32'b00000000000000000000000000001000: n8636_o = n8547_o;
      32'b00000000000000000000000000000100: n8636_o = n8544_o;
      32'b00000000000000000000000000000010: n8636_o = n8541_o;
      32'b00000000000000000000000000000001: n8636_o = n8538_o;
      default: n8636_o = 1'bX;
    endcase
endmodule

module scl_counter_11
  (input  clk,
   input  rst_n,
   input  in_unnamed,
   input  [1:0] in_unnamed_2,
   output out_m_last,
   output out_const_0,
   output [1:0] out_const_xx);
  reg [1:0] s_m_value;
  wire [1:0] s_m_loadvalue_mux1;
  wire n8255_o;
  wire [1:0] n8257_o;
  wire [1:0] n8259_o;
  wire [1:0] n8260_o;
  wire n8263_o;
  wire n8270_o;
  localparam n8273_o = 1'b0;
  localparam [1:0] n8274_o = 2'bX;
  wire n8276_o;
  reg [1:0] n8282_q;
  assign out_m_last = n8270_o;
  assign out_const_0 = n8273_o;
  assign out_const_xx = n8274_o;
  /* find_the_damn_issue_sky130.vhd:3649:16  */
  always @*
    s_m_value = n8282_q; // (isignal)
  initial
    s_m_value = 2'b00;
  /* find_the_damn_issue_sky130.vhd:3650:16  */
  assign s_m_loadvalue_mux1 = n8260_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:3662:31  */
  assign n8255_o = s_m_value == 2'b10;
  /* find_the_damn_issue_sky130.vhd:3665:67  */
  assign n8257_o = s_m_value + 2'b01;
  /* find_the_damn_issue_sky130.vhd:3662:17  */
  assign n8259_o = n8255_o ? 2'b00 : n8257_o;
  /* find_the_damn_issue_sky130.vhd:3667:17  */
  assign n8260_o = in_unnamed ? in_unnamed_2 : n8259_o;
  /* find_the_damn_issue_sky130.vhd:3672:55  */
  assign n8263_o = s_m_value == 2'b10;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n8270_o = n8263_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:3680:27  */
  assign n8276_o = ~rst_n;
  /* find_the_damn_issue_sky130.vhd:3682:17  */
  always @(posedge clk or posedge n8276_o)
    if (n8276_o)
      n8282_q <= 2'b00;
    else
      n8282_q <= s_m_loadvalue_mux1;
endmodule

module scl_counter_10
  (input  clk,
   input  rst_n,
   input  in_unnamed,
   input  [1:0] in_unnamed_2,
   output out_m_last,
   output out_const_0,
   output [1:0] out_const_xx);
  reg [1:0] s_m_value;
  wire [1:0] s_m_loadvalue_mux1;
  wire [1:0] n8220_o;
  wire [1:0] n8221_o;
  wire n8224_o;
  wire n8231_o;
  localparam n8234_o = 1'b0;
  localparam [1:0] n8235_o = 2'bX;
  wire n8237_o;
  reg [1:0] n8243_q;
  assign out_m_last = n8231_o;
  assign out_const_0 = n8234_o;
  assign out_const_xx = n8235_o;
  /* find_the_damn_issue_sky130.vhd:3792:16  */
  always @*
    s_m_value = n8243_q; // (isignal)
  initial
    s_m_value = 2'b00;
  /* find_the_damn_issue_sky130.vhd:3793:16  */
  assign s_m_loadvalue_mux1 = n8221_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:3807:58  */
  assign n8220_o = s_m_value + 2'b01;
  /* find_the_damn_issue_sky130.vhd:3804:17  */
  assign n8221_o = in_unnamed ? in_unnamed_2 : n8220_o;
  /* find_the_damn_issue_sky130.vhd:3809:55  */
  assign n8224_o = s_m_value == 2'b11;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n8231_o = n8224_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:3817:27  */
  assign n8237_o = ~rst_n;
  /* find_the_damn_issue_sky130.vhd:3819:17  */
  always @(posedge clk or posedge n8237_o)
    if (n8237_o)
      n8243_q <= 2'b00;
    else
      n8243_q <= s_m_loadvalue_mux1;
endmodule

module scl_counter_8
  (input  clk,
   input  rst_n,
   input  in_unnamed,
   input  in_unnamed_2,
   input  [2:0] in_unnamed_3,
   output out_m_last,
   output out_const_0,
   output out_const_0_2,
   output [2:0] out_const_xxx);
  reg [2:0] s_m_value;
  wire [2:0] s_m_loadvalue_mux1;
  wire [2:0] n8169_o;
  wire n8172_o;
  wire n8179_o;
  wire n8181_o;
  wire n8183_o;
  wire n8184_o;
  wire [2:0] n8185_o;
  wire [2:0] n8187_o;
  wire n8189_o;
  wire n8191_o;
  wire n8192_o;
  wire [2:0] n8194_o;
  wire [2:0] n8195_o;
  localparam n8199_o = 1'b0;
  localparam n8200_o = 1'b0;
  localparam [2:0] n8201_o = 3'bX;
  wire n8203_o;
  reg [2:0] n8209_q;
  assign out_m_last = n8179_o;
  assign out_const_0 = n8199_o;
  assign out_const_0_2 = n8200_o;
  assign out_const_xxx = n8201_o;
  /* find_the_damn_issue_sky130.vhd:4029:16  */
  always @*
    s_m_value = n8209_q; // (isignal)
  initial
    s_m_value = 3'b000;
  /* find_the_damn_issue_sky130.vhd:4030:16  */
  assign s_m_loadvalue_mux1 = n8195_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:4044:17  */
  assign n8169_o = in_unnamed ? 3'b001 : 3'b000;
  /* find_the_damn_issue_sky130.vhd:4052:55  */
  assign n8172_o = s_m_value == 3'b110;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n8179_o = n8172_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:4057:32  */
  assign n8181_o = s_m_value == 3'b110;
  /* find_the_damn_issue_sky130.vhd:4057:63  */
  assign n8183_o = n8169_o == 3'b001;
  /* find_the_damn_issue_sky130.vhd:4057:41  */
  assign n8184_o = n8181_o & n8183_o;
  /* find_the_damn_issue_sky130.vhd:4060:67  */
  assign n8185_o = s_m_value + n8169_o;
  /* find_the_damn_issue_sky130.vhd:4057:17  */
  assign n8187_o = n8184_o ? 3'b000 : n8185_o;
  /* find_the_damn_issue_sky130.vhd:4062:32  */
  assign n8189_o = s_m_value == 3'b000;
  /* find_the_damn_issue_sky130.vhd:4062:63  */
  assign n8191_o = n8169_o == 3'b111;
  /* find_the_damn_issue_sky130.vhd:4062:41  */
  assign n8192_o = n8189_o & n8191_o;
  /* find_the_damn_issue_sky130.vhd:4062:17  */
  assign n8194_o = n8192_o ? 3'b110 : n8187_o;
  /* find_the_damn_issue_sky130.vhd:4067:17  */
  assign n8195_o = in_unnamed_2 ? in_unnamed_3 : n8194_o;
  /* find_the_damn_issue_sky130.vhd:4077:27  */
  assign n8203_o = ~rst_n;
  /* find_the_damn_issue_sky130.vhd:4079:17  */
  always @(posedge clk or posedge n8203_o)
    if (n8203_o)
      n8209_q <= 3'b000;
    else
      n8209_q <= s_m_loadvalue_mux1;
endmodule

module scl_counter_7
  (input  clk,
   input  rst_n,
   input  in_unnamed,
   input  in_unnamed_2,
   input  [3:0] in_unnamed_3,
   output [3:0] out_m_value,
   output out_m_last,
   output out_const_0,
   output out_const_0_2,
   output [3:0] out_const_x);
  reg [3:0] s_m_value_2;
  wire [3:0] s_m_value_plus_const_0_mux2;
  wire [3:0] n8126_o;
  wire [3:0] n8127_o;
  wire [3:0] n8128_o;
  wire n8131_o;
  wire n8138_o;
  localparam n8141_o = 1'b0;
  localparam n8142_o = 1'b0;
  localparam [3:0] n8143_o = 4'bX;
  wire n8145_o;
  reg [3:0] n8151_q;
  assign out_m_value = s_m_value_2;
  assign out_m_last = n8138_o;
  assign out_const_0 = n8141_o;
  assign out_const_0_2 = n8142_o;
  assign out_const_x = n8143_o;
  /* find_the_damn_issue_sky130.vhd:4227:16  */
  always @*
    s_m_value_2 = n8151_q; // (isignal)
  initial
    s_m_value_2 = 4'b0000;
  /* find_the_damn_issue_sky130.vhd:4228:16  */
  assign s_m_value_plus_const_0_mux2 = n8128_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:4238:17  */
  assign n8126_o = in_unnamed ? 4'b0001 : 4'b0000;
  /* find_the_damn_issue_sky130.vhd:4249:69  */
  assign n8127_o = s_m_value_2 + n8126_o;
  /* find_the_damn_issue_sky130.vhd:4246:17  */
  assign n8128_o = in_unnamed_2 ? in_unnamed_3 : n8127_o;
  /* find_the_damn_issue_sky130.vhd:4251:57  */
  assign n8131_o = s_m_value_2 == 4'b1111;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n8138_o = n8131_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:4260:27  */
  assign n8145_o = ~rst_n;
  /* find_the_damn_issue_sky130.vhd:4262:17  */
  always @(posedge clk or posedge n8145_o)
    if (n8145_o)
      n8151_q <= 4'b0000;
    else
      n8151_q <= s_m_value_plus_const_0_mux2;
endmodule

module scl_counter_6
  (input  clk,
   input  rst_n,
   input  in_unnamed,
   input  in_unnamed_2,
   input  [2:0] in_unnamed_3,
   output [2:0] out_m_value,
   output out_m_last,
   output out_const_0,
   output out_const_0_2,
   output [2:0] out_const_xxx);
  reg [2:0] s_m_value_2;
  wire [2:0] s_m_value_plus_const_0_mux2;
  wire [2:0] n8086_o;
  wire [2:0] n8087_o;
  wire [2:0] n8088_o;
  wire n8091_o;
  wire n8098_o;
  localparam n8101_o = 1'b0;
  localparam n8102_o = 1'b0;
  localparam [2:0] n8103_o = 3'bX;
  wire n8105_o;
  reg [2:0] n8111_q;
  assign out_m_value = s_m_value_2;
  assign out_m_last = n8098_o;
  assign out_const_0 = n8101_o;
  assign out_const_0_2 = n8102_o;
  assign out_const_xxx = n8103_o;
  /* find_the_damn_issue_sky130.vhd:4541:16  */
  always @*
    s_m_value_2 = n8111_q; // (isignal)
  initial
    s_m_value_2 = 3'b000;
  /* find_the_damn_issue_sky130.vhd:4542:16  */
  assign s_m_value_plus_const_0_mux2 = n8088_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:4552:17  */
  assign n8086_o = in_unnamed ? 3'b001 : 3'b000;
  /* find_the_damn_issue_sky130.vhd:4563:69  */
  assign n8087_o = s_m_value_2 + n8086_o;
  /* find_the_damn_issue_sky130.vhd:4560:17  */
  assign n8088_o = in_unnamed_2 ? in_unnamed_3 : n8087_o;
  /* find_the_damn_issue_sky130.vhd:4565:57  */
  assign n8091_o = s_m_value_2 == 3'b111;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n8098_o = n8091_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:4574:27  */
  assign n8105_o = ~rst_n;
  /* find_the_damn_issue_sky130.vhd:4576:17  */
  always @(posedge clk or posedge n8105_o)
    if (n8105_o)
      n8111_q <= 3'b000;
    else
      n8111_q <= s_m_value_plus_const_0_mux2;
endmodule

module scl_counter_5
  (input  clk,
   input  rst_n,
   input  in_unnamed,
   input  in_unnamed_2,
   input  in_unnamed_3,
   output out_m_value,
   output out_const_0,
   output out_const_0_2,
   output out_const_x);
  reg s_m_value_2;
  wire s_m_value_plus_const_0_mux2;
  wire n8056_o;
  wire n8057_o;
  wire n8058_o;
  localparam n8061_o = 1'b0;
  localparam n8062_o = 1'b0;
  localparam n8063_o = 1'bX;
  wire n8065_o;
  reg n8071_q;
  assign out_m_value = s_m_value_2;
  assign out_const_0 = n8061_o;
  assign out_const_0_2 = n8062_o;
  assign out_const_x = n8063_o;
  /* find_the_damn_issue_sky130.vhd:4711:16  */
  always @*
    s_m_value_2 = n8071_q; // (isignal)
  initial
    s_m_value_2 = 1'b0;
  /* find_the_damn_issue_sky130.vhd:4712:16  */
  assign s_m_value_plus_const_0_mux2 = n8058_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:4722:17  */
  assign n8056_o = in_unnamed ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:4733:69  */
  assign n8057_o = s_m_value_2 + n8056_o;
  /* find_the_damn_issue_sky130.vhd:4730:17  */
  assign n8058_o = in_unnamed_2 ? in_unnamed_3 : n8057_o;
  /* find_the_damn_issue_sky130.vhd:4743:27  */
  assign n8065_o = ~rst_n;
  /* find_the_damn_issue_sky130.vhd:4745:17  */
  always @(posedge clk or posedge n8065_o)
    if (n8065_o)
      n8071_q <= 1'b0;
    else
      n8071_q <= s_m_value_plus_const_0_mux2;
endmodule

module scl_eraselastbeat
  (input  clk,
   input  rst_n,
   input  [7:0] in_in,
   input  in_unnamed,
   input  in_unnamed_2,
   input  in_unnamed_3,
   output out_unnamed_or_in_valid_mux1_delayed1_not,
   output out_out_ready,
   output out_out_valid,
   output out_out_eop,
   output [7:0] out_out);
  wire s_in_ready;
  wire s_in_eop;
  wire [7:0] s_in_2;
  reg s_in_valid_mux1_delayed1;
  wire [7:0] s_out_2;
  reg s_in_valid_mux1_delayed1_2;
  wire s_in_eop_delayed1;
  reg s_unnamed_4;
  wire s_in_valid_mux1;
  wire s_unnamed_5;
  wire n7997_o;
  wire n7998_o;
  wire n8000_o;
  wire n8001_o;
  wire n8003_o;
  wire n8004_o;
  wire n8005_o;
  wire n8006_o;
  wire n8007_o;
  wire n8008_o;
  wire n8020_o;
  wire n8034_o;
  reg n8035_q;
  wire [7:0] n8036_o;
  reg [7:0] n8037_q;
  wire n8038_o;
  reg n8039_q;
  wire n8040_o;
  reg n8041_q;
  reg n8042_q;
  assign out_unnamed_or_in_valid_mux1_delayed1_not = n7998_o;
  assign out_out_ready = in_unnamed_3;
  assign out_out_valid = s_in_valid_mux1_delayed1_2;
  assign out_out_eop = n8003_o;
  assign out_out = s_out_2;
  /* find_the_damn_issue_sky130.vhd:4881:16  */
  assign s_in_ready = n7998_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:4882:16  */
  assign s_in_eop = in_unnamed_2; // (signal)
  /* find_the_damn_issue_sky130.vhd:4883:16  */
  assign s_in_2 = in_in; // (signal)
  /* find_the_damn_issue_sky130.vhd:4884:16  */
  always @*
    s_in_valid_mux1_delayed1 = n8035_q; // (isignal)
  initial
    s_in_valid_mux1_delayed1 = 1'b0;
  /* find_the_damn_issue_sky130.vhd:4885:16  */
  assign s_out_2 = n8037_q; // (signal)
  /* find_the_damn_issue_sky130.vhd:4886:16  */
  always @*
    s_in_valid_mux1_delayed1_2 = n8039_q; // (isignal)
  initial
    s_in_valid_mux1_delayed1_2 = 1'b0;
  /* find_the_damn_issue_sky130.vhd:4887:16  */
  assign s_in_eop_delayed1 = n8041_q; // (signal)
  /* find_the_damn_issue_sky130.vhd:4888:16  */
  always @*
    s_unnamed_4 = n8042_q; // (isignal)
  initial
    s_unnamed_4 = 1'b0;
  /* find_the_damn_issue_sky130.vhd:4889:16  */
  assign s_in_valid_mux1 = n8000_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:4890:16  */
  assign s_unnamed_5 = n8008_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:4897:81  */
  assign n7997_o = ~s_in_valid_mux1_delayed1;
  /* find_the_damn_issue_sky130.vhd:4897:76  */
  assign n7998_o = in_unnamed_3 | n7997_o;
  /* find_the_damn_issue_sky130.vhd:4902:17  */
  assign n8000_o = in_unnamed_2 ? 1'b0 : in_unnamed;
  /* find_the_damn_issue_sky130.vhd:4907:40  */
  assign n8001_o = in_unnamed_2 | s_unnamed_4;
  /* find_the_damn_issue_sky130.vhd:4907:17  */
  assign n8003_o = n8001_o ? 1'b1 : s_in_eop_delayed1;
  /* find_the_damn_issue_sky130.vhd:4917:63  */
  assign n8004_o = in_unnamed_2 & in_unnamed;
  /* find_the_damn_issue_sky130.vhd:4917:46  */
  assign n8005_o = s_unnamed_4 | n8004_o;
  /* find_the_damn_issue_sky130.vhd:4917:118  */
  assign n8006_o = s_in_valid_mux1_delayed1_2 & in_unnamed_3;
  /* find_the_damn_issue_sky130.vhd:4917:86  */
  assign n8007_o = ~n8006_o;
  /* find_the_damn_issue_sky130.vhd:4917:80  */
  assign n8008_o = n8005_o & n8007_o;
  /* find_the_damn_issue_sky130.vhd:4934:27  */
  assign n8020_o = ~rst_n;
  /* find_the_damn_issue_sky130.vhd:4938:17  */
  assign n8034_o = s_in_ready ? s_in_valid_mux1 : s_in_valid_mux1_delayed1;
  /* find_the_damn_issue_sky130.vhd:4938:17  */
  always @(posedge clk or posedge n8020_o)
    if (n8020_o)
      n8035_q <= 1'b0;
    else
      n8035_q <= n8034_o;
  /* find_the_damn_issue_sky130.vhd:4922:17  */
  assign n8036_o = s_in_ready ? s_in_2 : s_out_2;
  /* find_the_damn_issue_sky130.vhd:4922:17  */
  always @(posedge clk)
    n8037_q <= n8036_o;
  /* find_the_damn_issue_sky130.vhd:4938:17  */
  assign n8038_o = s_in_ready ? s_in_valid_mux1 : s_in_valid_mux1_delayed1_2;
  /* find_the_damn_issue_sky130.vhd:4938:17  */
  always @(posedge clk or posedge n8020_o)
    if (n8020_o)
      n8039_q <= 1'b0;
    else
      n8039_q <= n8038_o;
  /* find_the_damn_issue_sky130.vhd:4922:17  */
  assign n8040_o = s_in_ready ? s_in_eop : s_in_eop_delayed1;
  /* find_the_damn_issue_sky130.vhd:4922:17  */
  always @(posedge clk)
    n8041_q <= n8040_o;
  /* find_the_damn_issue_sky130.vhd:4938:17  */
  always @(posedge clk or posedge n8020_o)
    if (n8020_o)
      n8042_q <= 1'b0;
    else
      n8042_q <= s_unnamed_5;
endmodule

module scl_counter_4
  (input  clk,
   input  rst_n,
   input  in_unnamed,
   input  in_unnamed_2,
   input  [2:0] in_unnamed_3,
   output out_m_last,
   output out_const_0,
   output out_const_0_2,
   output [2:0] out_const_xxx);
  reg [2:0] s_m_value;
  wire [2:0] s_m_value_plus_const_0_mux2;
  wire [2:0] n7959_o;
  wire [2:0] n7960_o;
  wire [2:0] n7961_o;
  wire n7964_o;
  wire n7971_o;
  localparam n7974_o = 1'b0;
  localparam n7975_o = 1'b0;
  localparam [2:0] n7976_o = 3'bX;
  wire n7978_o;
  reg [2:0] n7984_q;
  assign out_m_last = n7971_o;
  assign out_const_0 = n7974_o;
  assign out_const_0_2 = n7975_o;
  assign out_const_xxx = n7976_o;
  /* find_the_damn_issue_sky130.vhd:5085:16  */
  always @*
    s_m_value = n7984_q; // (isignal)
  initial
    s_m_value = 3'b000;
  /* find_the_damn_issue_sky130.vhd:5086:16  */
  assign s_m_value_plus_const_0_mux2 = n7961_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:5097:17  */
  assign n7959_o = in_unnamed ? 3'b001 : 3'b000;
  /* find_the_damn_issue_sky130.vhd:5108:67  */
  assign n7960_o = s_m_value + n7959_o;
  /* find_the_damn_issue_sky130.vhd:5105:17  */
  assign n7961_o = in_unnamed_2 ? in_unnamed_3 : n7960_o;
  /* find_the_damn_issue_sky130.vhd:5110:55  */
  assign n7964_o = s_m_value == 3'b111;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n7971_o = n7964_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:5119:27  */
  assign n7978_o = ~rst_n;
  /* find_the_damn_issue_sky130.vhd:5121:17  */
  always @(posedge clk or posedge n7978_o)
    if (n7978_o)
      n7984_q <= 3'b000;
    else
      n7984_q <= s_m_value_plus_const_0_mux2;
endmodule

module scl_counter_2
  (input  clk,
   input  rst_n,
   input  in_unnamed,
   input  [2:0] in_unnamed_2,
   input  in_unnamed_3,
   output out_m_last,
   output out_const_0,
   output [2:0] out_const_xxx);
  reg [2:0] s_m_value;
  wire s_unnamed_4;
  wire [2:0] s_m_value_plus_const_0_mux4;
  wire n7900_o;
  wire n7907_o;
  wire [2:0] n7910_o;
  wire n7911_o;
  wire n7913_o;
  wire n7915_o;
  wire n7916_o;
  wire n7917_o;
  wire [2:0] n7918_o;
  wire [2:0] n7920_o;
  wire n7922_o;
  wire n7924_o;
  wire n7925_o;
  wire n7926_o;
  wire [2:0] n7928_o;
  wire [2:0] n7929_o;
  localparam n7933_o = 1'b0;
  localparam [2:0] n7934_o = 3'bX;
  wire n7936_o;
  wire [2:0] n7943_o;
  reg [2:0] n7944_q;
  assign out_m_last = n7907_o;
  assign out_const_0 = n7933_o;
  assign out_const_xxx = n7934_o;
  /* find_the_damn_issue_sky130.vhd:5401:16  */
  always @*
    s_m_value = n7944_q; // (isignal)
  initial
    s_m_value = 3'b000;
  /* find_the_damn_issue_sky130.vhd:5402:16  */
  assign s_unnamed_4 = in_unnamed_3; // (signal)
  /* find_the_damn_issue_sky130.vhd:5403:16  */
  assign s_m_value_plus_const_0_mux4 = n7929_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:5419:55  */
  assign n7900_o = s_m_value == 3'b110;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n7907_o = n7900_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:5422:17  */
  assign n7910_o = s_unnamed_4 ? 3'b001 : 3'b000;
  /* find_the_damn_issue_sky130.vhd:5427:56  */
  assign n7911_o = in_unnamed & s_unnamed_4;
  /* find_the_damn_issue_sky130.vhd:5429:32  */
  assign n7913_o = s_m_value == 3'b110;
  /* find_the_damn_issue_sky130.vhd:5429:64  */
  assign n7915_o = n7910_o == 3'b001;
  /* find_the_damn_issue_sky130.vhd:5429:73  */
  assign n7916_o = n7915_o & s_unnamed_4;
  /* find_the_damn_issue_sky130.vhd:5429:41  */
  assign n7917_o = n7913_o & n7916_o;
  /* find_the_damn_issue_sky130.vhd:5432:67  */
  assign n7918_o = s_m_value + n7910_o;
  /* find_the_damn_issue_sky130.vhd:5429:17  */
  assign n7920_o = n7917_o ? 3'b000 : n7918_o;
  /* find_the_damn_issue_sky130.vhd:5434:32  */
  assign n7922_o = s_m_value == 3'b000;
  /* find_the_damn_issue_sky130.vhd:5434:64  */
  assign n7924_o = n7910_o == 3'b111;
  /* find_the_damn_issue_sky130.vhd:5434:73  */
  assign n7925_o = n7924_o & s_unnamed_4;
  /* find_the_damn_issue_sky130.vhd:5434:41  */
  assign n7926_o = n7922_o & n7925_o;
  /* find_the_damn_issue_sky130.vhd:5434:17  */
  assign n7928_o = n7926_o ? 3'b110 : n7920_o;
  /* find_the_damn_issue_sky130.vhd:5439:17  */
  assign n7929_o = n7911_o ? in_unnamed_2 : n7928_o;
  /* find_the_damn_issue_sky130.vhd:5450:27  */
  assign n7936_o = ~rst_n;
  /* find_the_damn_issue_sky130.vhd:5452:17  */
  assign n7943_o = s_unnamed_4 ? s_m_value_plus_const_0_mux4 : s_m_value;
  /* find_the_damn_issue_sky130.vhd:5452:17  */
  always @(posedge clk or posedge n7936_o)
    if (n7936_o)
      n7944_q <= 3'b000;
    else
      n7944_q <= n7943_o;
endmodule

module scl_recoverdatadifferential_equalsampling_sky130
  (input  clk,
   input  rst_n,
   input  in_unnamed,
   input  in_unnamed_2,
   output out_se0,
   output out_p,
   output out_unnamed_3);
  wire s_chain_input;
  wire s_chain_input_2;
  wire s_chain_output;
  wire s_in_p_delayed;
  wire s_chain_output_2;
  wire s_in_n_delayed;
  wire s_singleended;
  wire [1:0] s_ret;
  wire [4:0] s_m_value;
  wire s_m_last;
  wire s_const_0;
  wire s_const_0_2;
  wire s_const_0_3;
  wire s_unnamed_4;
  wire s_unnamed_5;
  wire s_unnamed_6;
  wire [4:0] s_unnamed_7;
  wire [4:0] s_delay;
  reg s_p_2;
  reg s_unnamed_8;
  wire [4:0] s_const_xxxxx;
  wire s_unnamed_9;
  wire delay_chain_with_taps0_out_chain_output;
  wire n7839_o;
  wire n7841_o;
  wire n7842_o;
  wire n7844_o;
  wire n7846_o;
  wire n7847_o;
  wire n7849_o;
  wire n7850_o;
  wire n7852_o;
  wire n7854_o;
  wire [4:0] n7856_o;
  wire n7857_o;
  wire n7858_o;
  wire n7859_o;
  wire n7860_o;
  wire n7861_o;
  wire n7864_o;
  wire delay_chain_with_taps1_out_chain_output;
  wire detectsingleended0_out_singleended;
  wire [1:0] analyze_phase0_out_ret;
  wire [4:0] scl_counter0_out_m_value;
  wire scl_counter0_out_m_last;
  wire scl_counter0_out_const_0;
  wire scl_counter0_out_const_0_2;
  wire scl_counter0_out_const_0_3;
  wire [4:0] scl_counter0_out_const_xxxxx;
  reg n7882_q;
  reg n7883_q;
  assign out_se0 = s_singleended;
  assign out_p = s_p_2;
  assign out_unnamed_3 = n7857_o;
  /* find_the_damn_issue_sky130.vhd:7748:16  */
  assign s_chain_input = in_unnamed; // (signal)
  /* find_the_damn_issue_sky130.vhd:7749:16  */
  assign s_chain_input_2 = in_unnamed_2; // (signal)
  /* find_the_damn_issue_sky130.vhd:7750:16  */
  assign s_chain_output = delay_chain_with_taps0_out_chain_output; // (signal)
  /* find_the_damn_issue_sky130.vhd:7751:16  */
  assign s_in_p_delayed = s_chain_output; // (signal)
  /* find_the_damn_issue_sky130.vhd:7752:16  */
  assign s_chain_output_2 = delay_chain_with_taps1_out_chain_output; // (signal)
  /* find_the_damn_issue_sky130.vhd:7753:16  */
  assign s_in_n_delayed = s_chain_output_2; // (signal)
  /* find_the_damn_issue_sky130.vhd:7754:16  */
  assign s_singleended = detectsingleended0_out_singleended; // (signal)
  /* find_the_damn_issue_sky130.vhd:7755:16  */
  assign s_ret = analyze_phase0_out_ret; // (signal)
  /* find_the_damn_issue_sky130.vhd:7756:16  */
  assign s_m_value = scl_counter0_out_m_value; // (signal)
  /* find_the_damn_issue_sky130.vhd:7757:16  */
  assign s_m_last = scl_counter0_out_m_last; // (signal)
  /* find_the_damn_issue_sky130.vhd:7758:16  */
  assign s_const_0 = scl_counter0_out_const_0; // (signal)
  /* find_the_damn_issue_sky130.vhd:7759:16  */
  assign s_const_0_2 = scl_counter0_out_const_0_2; // (signal)
  /* find_the_damn_issue_sky130.vhd:7760:16  */
  assign s_const_0_3 = scl_counter0_out_const_0_3; // (signal)
  /* find_the_damn_issue_sky130.vhd:7761:16  */
  assign s_unnamed_4 = n7844_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:7762:16  */
  assign s_unnamed_5 = n7852_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:7763:16  */
  assign s_unnamed_6 = n7854_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:7764:16  */
  assign s_unnamed_7 = n7856_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:7765:16  */
  assign s_delay = s_m_value; // (signal)
  /* find_the_damn_issue_sky130.vhd:7766:16  */
  always @*
    s_p_2 = n7882_q; // (isignal)
  initial
    s_p_2 = 1'b0;
  /* find_the_damn_issue_sky130.vhd:7767:16  */
  always @*
    s_unnamed_8 = n7883_q; // (isignal)
  initial
    s_unnamed_8 = 1'b0;
  /* find_the_damn_issue_sky130.vhd:7768:16  */
  assign s_const_xxxxx = scl_counter0_out_const_xxxxx; // (signal)
  /* find_the_damn_issue_sky130.vhd:7769:16  */
  assign s_unnamed_9 = n7861_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:7771:9  */
  delay_chain_with_taps delay_chain_with_taps0 (
    .in_chain_input(s_chain_input),
    .in_delay(s_delay),
    .out_chain_output(delay_chain_with_taps0_out_chain_output));
  /* find_the_damn_issue_sky130.vhd:7789:23  */
  assign n7839_o = ~s_m_last;
  /* find_the_damn_issue_sky130.vhd:7789:54  */
  assign n7841_o = s_ret == 2'b00;
  /* find_the_damn_issue_sky130.vhd:7789:43  */
  assign n7842_o = n7839_o & n7841_o;
  /* find_the_damn_issue_sky130.vhd:7789:17  */
  assign n7844_o = n7842_o ? 1'b1 : s_const_0_2;
  /* find_the_damn_issue_sky130.vhd:7794:38  */
  assign n7846_o = s_m_value == 5'b00000;
  /* find_the_damn_issue_sky130.vhd:7794:23  */
  assign n7847_o = ~n7846_o;
  /* find_the_damn_issue_sky130.vhd:7794:61  */
  assign n7849_o = s_ret == 2'b01;
  /* find_the_damn_issue_sky130.vhd:7794:50  */
  assign n7850_o = n7847_o & n7849_o;
  /* find_the_damn_issue_sky130.vhd:7794:17  */
  assign n7852_o = n7850_o ? 1'b1 : s_const_0_3;
  /* find_the_damn_issue_sky130.vhd:7799:17  */
  assign n7854_o = s_singleended ? 1'b1 : s_const_0;
  /* find_the_damn_issue_sky130.vhd:7804:17  */
  assign n7856_o = s_singleended ? 5'b01111 : s_const_xxxxx;
  /* find_the_damn_issue_sky130.vhd:7811:36  */
  assign n7857_o = ~s_unnamed_8;
  /* find_the_damn_issue_sky130.vhd:7812:46  */
  assign n7858_o = s_unnamed_8 | s_singleended;
  /* find_the_damn_issue_sky130.vhd:7812:70  */
  assign n7859_o = ~s_singleended;
  /* find_the_damn_issue_sky130.vhd:7812:64  */
  assign n7860_o = ~n7859_o;
  /* find_the_damn_issue_sky130.vhd:7812:58  */
  assign n7861_o = n7858_o & n7860_o;
  /* find_the_damn_issue_sky130.vhd:7817:27  */
  assign n7864_o = ~rst_n;
  /* find_the_damn_issue_sky130.vhd:7826:9  */
  delay_chain_with_taps_2 delay_chain_with_taps1 (
    .in_chain_input(s_chain_input_2),
    .in_delay(s_delay),
    .out_chain_output(delay_chain_with_taps1_out_chain_output));
  /* find_the_damn_issue_sky130.vhd:7831:9  */
  detectsingleended detectsingleended0 (
    .clk(clk),
    .rst_n(rst_n),
    .in_unnamed(s_in_p_delayed),
    .in_unnamed_2(s_in_n_delayed),
    .out_singleended(detectsingleended0_out_singleended));
  /* find_the_damn_issue_sky130.vhd:7838:9  */
  analyze_phase analyze_phase0 (
    .clk(clk),
    .rst_n(rst_n),
    .in_delayed_input(s_in_p_delayed),
    .out_ret(analyze_phase0_out_ret));
  /* find_the_damn_issue_sky130.vhd:7844:9  */
  scl_counter scl_counter0 (
    .clk(clk),
    .rst_n(rst_n),
    .in_unnamed(s_unnamed_4),
    .in_unnamed_2(s_unnamed_5),
    .in_unnamed_3(s_unnamed_6),
    .in_unnamed_4(s_unnamed_7),
    .out_m_value(scl_counter0_out_m_value),
    .out_m_last(scl_counter0_out_m_last),
    .out_const_0(scl_counter0_out_const_0),
    .out_const_0_2(scl_counter0_out_const_0_2),
    .out_const_0_3(scl_counter0_out_const_0_3),
    .out_const_xxxxx(scl_counter0_out_const_xxxxx));
  /* find_the_damn_issue_sky130.vhd:7820:17  */
  always @(posedge clk or posedge n7864_o)
    if (n7864_o)
      n7882_q <= 1'b0;
    else
      n7882_q <= s_in_p_delayed;
  /* find_the_damn_issue_sky130.vhd:7820:17  */
  always @(posedge clk or posedge n7864_o)
    if (n7864_o)
      n7883_q <= 1'b0;
    else
      n7883_q <= s_unnamed_9;
endmodule

module physical_memory_3
  (input  clk,
   input  [3:0] in_unnamed,
   input  [11:0] in_unnamed_2,
   input  [3:0] in_unnamed_3,
   input  in_unnamed_4,
   output [11:0] out_unnamed_5);
  reg [11:0] n7828_data; // mem_rd
  assign out_unnamed_5 = n7828_data;
  /* find_the_damn_issue_sky130.vhd:91:17  */
  reg [11:0] memory[15:0] ; // memory
  always @(posedge clk)
    if (1'b1)
      n7828_data <= memory[in_unnamed];
  always @(posedge clk)
    if (in_unnamed_4)
      memory[in_unnamed_3] <= in_unnamed_2;
  /* find_the_damn_issue_sky130.vhd:110:40  */
endmodule

module physical_memory_2
  (input  clk,
   input  [3:0] in_unnamed,
   input  [11:0] in_unnamed_2,
   input  [3:0] in_unnamed_3,
   input  in_unnamed_4,
   output [11:0] out_unnamed_5);
  reg [11:0] n7808_data; // mem_rd
  assign out_unnamed_5 = n7808_data;
  /* find_the_damn_issue_sky130.vhd:2765:17  */
  reg [11:0] memory[15:0] ; // memory
  always @(posedge clk)
    if (1'b1)
      n7808_data <= memory[in_unnamed];
  always @(posedge clk)
    if (in_unnamed_4)
      memory[in_unnamed_3] <= in_unnamed_2;
  /* find_the_damn_issue_sky130.vhd:2784:40  */
endmodule

module physical_memory
  (input  clk,
   input  [7:0] in_unnamed,
   output [7:0] out_unnamed_2);
  reg [1255:0] memory;
  reg [7:0] n7789_data; // mem_rd
  assign out_unnamed_2 = n7789_data;
  /* find_the_damn_issue_sky130.vhd:3324:16  */
  always @*
    memory = 1256'b00000000011001010000000001110101000000000111001100000000011100110000000001001001000000000110111000000000011011010000000001100001000000000100010000000000011001010000000001101000000000000101010000000000011001000000000001101110000000000110100100000000010001100000001100100010000000000110010100000000011101000000000001100001000000000110011100000000011011110000000001101110000000000111100100000000010100110000001100010010000001000000100100000011000001000000000100000000000010000000001000000001000001010000011100000001000000000000100000000010100000010000010100000111000000000000000000000000000010100000001000000000000000010000010000001001000000010000000000001000000000111000001000000101000001110000000100000000000001100010010000000101000000000000001000100100000001000000000000000000000000010010010000000101000000010001000000000000001001000000010100000000000000010000001000000010000000010000000000000000000001000000100100110010100000000000000000000001000000100000000001000011000000100000100100000001000000000000001000000001000000010000000000000000000000000001110101010000000010000000000000000000000000100000000100010000000000010001001000000000000000000000110100001100000010110000101000001001000010000000011100000110000001010000010000000011000000100000000100000000; // (isignal)
  initial
    memory = 1256'b00000000011001010000000001110101000000000111001100000000011100110000000001001001000000000110111000000000011011010000000001100001000000000100010000000000011001010000000001101000000000000101010000000000011001000000000001101110000000000110100100000000010001100000001100100010000000000110010100000000011101000000000001100001000000000110011100000000011011110000000001101110000000000111100100000000010100110000001100010010000001000000100100000011000001000000000100000000000010000000001000000001000001010000011100000001000000000000100000000010100000010000010100000111000000000000000000000000000010100000001000000000000000010000010000001001000000010000000000001000000000111000001000000101000001110000000100000000000001100010010000000101000000000000001000100100000001000000000000000000000000010010010000000101000000010001000000000000001001000000010100000000000000010000001000000010000000010000000000000000000001000000100100110010100000000000000000000001000000100000000001000011000000100000100100000001000000000000001000000001000000010000000000000000000000000001110101010000000010000000000000000000000000100000000100010000000000010001001000000000000000000000110100001100000010110000101000001001000010000000011100000110000001010000010000000011000000100000000100000000;
  /* find_the_damn_issue_sky130.vhd:3314:17  */
  reg [7:0] n7787[156:0] ; // memory
  initial begin
    n7787[156] = 8'b00000000;
    n7787[155] = 8'b01100101;
    n7787[154] = 8'b00000000;
    n7787[153] = 8'b01110101;
    n7787[152] = 8'b00000000;
    n7787[151] = 8'b01110011;
    n7787[150] = 8'b00000000;
    n7787[149] = 8'b01110011;
    n7787[148] = 8'b00000000;
    n7787[147] = 8'b01001001;
    n7787[146] = 8'b00000000;
    n7787[145] = 8'b01101110;
    n7787[144] = 8'b00000000;
    n7787[143] = 8'b01101101;
    n7787[142] = 8'b00000000;
    n7787[141] = 8'b01100001;
    n7787[140] = 8'b00000000;
    n7787[139] = 8'b01000100;
    n7787[138] = 8'b00000000;
    n7787[137] = 8'b01100101;
    n7787[136] = 8'b00000000;
    n7787[135] = 8'b01101000;
    n7787[134] = 8'b00000000;
    n7787[133] = 8'b01010100;
    n7787[132] = 8'b00000000;
    n7787[131] = 8'b01100100;
    n7787[130] = 8'b00000000;
    n7787[129] = 8'b01101110;
    n7787[128] = 8'b00000000;
    n7787[127] = 8'b01101001;
    n7787[126] = 8'b00000000;
    n7787[125] = 8'b01000110;
    n7787[124] = 8'b00000011;
    n7787[123] = 8'b00100010;
    n7787[122] = 8'b00000000;
    n7787[121] = 8'b01100101;
    n7787[120] = 8'b00000000;
    n7787[119] = 8'b01110100;
    n7787[118] = 8'b00000000;
    n7787[117] = 8'b01100001;
    n7787[116] = 8'b00000000;
    n7787[115] = 8'b01100111;
    n7787[114] = 8'b00000000;
    n7787[113] = 8'b01101111;
    n7787[112] = 8'b00000000;
    n7787[111] = 8'b01101110;
    n7787[110] = 8'b00000000;
    n7787[109] = 8'b01111001;
    n7787[108] = 8'b00000000;
    n7787[107] = 8'b01010011;
    n7787[106] = 8'b00000011;
    n7787[105] = 8'b00010010;
    n7787[104] = 8'b00000100;
    n7787[103] = 8'b00001001;
    n7787[102] = 8'b00000011;
    n7787[101] = 8'b00000100;
    n7787[100] = 8'b00000001;
    n7787[99] = 8'b00000000;
    n7787[98] = 8'b00001000;
    n7787[97] = 8'b00000010;
    n7787[96] = 8'b00000001;
    n7787[95] = 8'b00000101;
    n7787[94] = 8'b00000111;
    n7787[93] = 8'b00000001;
    n7787[92] = 8'b00000000;
    n7787[91] = 8'b00001000;
    n7787[90] = 8'b00000010;
    n7787[89] = 8'b10000001;
    n7787[88] = 8'b00000101;
    n7787[87] = 8'b00000111;
    n7787[86] = 8'b00000000;
    n7787[85] = 8'b00000000;
    n7787[84] = 8'b00000000;
    n7787[83] = 8'b00001010;
    n7787[82] = 8'b00000010;
    n7787[81] = 8'b00000000;
    n7787[80] = 8'b00000001;
    n7787[79] = 8'b00000100;
    n7787[78] = 8'b00001001;
    n7787[77] = 8'b00000001;
    n7787[76] = 8'b00000000;
    n7787[75] = 8'b00001000;
    n7787[74] = 8'b00000011;
    n7787[73] = 8'b10000010;
    n7787[72] = 8'b00000101;
    n7787[71] = 8'b00000111;
    n7787[70] = 8'b00000001;
    n7787[69] = 8'b00000000;
    n7787[68] = 8'b00000110;
    n7787[67] = 8'b00100100;
    n7787[66] = 8'b00000101;
    n7787[65] = 8'b00000000;
    n7787[64] = 8'b00000010;
    n7787[63] = 8'b00100100;
    n7787[62] = 8'b00000100;
    n7787[61] = 8'b00000000;
    n7787[60] = 8'b00000000;
    n7787[59] = 8'b00000001;
    n7787[58] = 8'b00100100;
    n7787[57] = 8'b00000101;
    n7787[56] = 8'b00000001;
    n7787[55] = 8'b00010000;
    n7787[54] = 8'b00000000;
    n7787[53] = 8'b00100100;
    n7787[52] = 8'b00000101;
    n7787[51] = 8'b00000000;
    n7787[50] = 8'b00000001;
    n7787[49] = 8'b00000010;
    n7787[48] = 8'b00000010;
    n7787[47] = 8'b00000001;
    n7787[46] = 8'b00000000;
    n7787[45] = 8'b00000000;
    n7787[44] = 8'b00000100;
    n7787[43] = 8'b00001001;
    n7787[42] = 8'b00110010;
    n7787[41] = 8'b10000000;
    n7787[40] = 8'b00000000;
    n7787[39] = 8'b00000001;
    n7787[38] = 8'b00000010;
    n7787[37] = 8'b00000000;
    n7787[36] = 8'b01000011;
    n7787[35] = 8'b00000010;
    n7787[34] = 8'b00001001;
    n7787[33] = 8'b00000001;
    n7787[32] = 8'b00000000;
    n7787[31] = 8'b00000010;
    n7787[30] = 8'b00000001;
    n7787[29] = 8'b00000001;
    n7787[28] = 8'b00000000;
    n7787[27] = 8'b00000000;
    n7787[26] = 8'b00000000;
    n7787[25] = 8'b00011101;
    n7787[24] = 8'b01010000;
    n7787[23] = 8'b00001000;
    n7787[22] = 8'b00000000;
    n7787[21] = 8'b00000000;
    n7787[20] = 8'b00000010;
    n7787[19] = 8'b00000001;
    n7787[18] = 8'b00010000;
    n7787[17] = 8'b00000001;
    n7787[16] = 8'b00010010;
    n7787[15] = 8'b00000000;
    n7787[14] = 8'b00000000;
    n7787[13] = 8'b00001101;
    n7787[12] = 8'b00001100;
    n7787[11] = 8'b00001011;
    n7787[10] = 8'b00001010;
    n7787[9] = 8'b00001001;
    n7787[8] = 8'b00001000;
    n7787[7] = 8'b00000111;
    n7787[6] = 8'b00000110;
    n7787[5] = 8'b00000101;
    n7787[4] = 8'b00000100;
    n7787[3] = 8'b00000011;
    n7787[2] = 8'b00000010;
    n7787[1] = 8'b00000001;
    n7787[0] = 8'b00000000;
    end
  always @(posedge clk)
    if (1'b1)
      n7789_data <= n7787[in_unnamed];
  /* find_the_damn_issue_sky130.vhd:3753:17  */
endmodule

module scl_pulseextender_2
  (input  clk,
   input  rst_n,
   input  in_input,
   output out_ret);
  wire s_m_last;
  wire s_const_0;
  wire s_unnamed;
  wire [1:0] s_unnamed_2;
  reg s_ret_and_m_last_and_input_not_not_delayed1;
  wire s_ret_and_m_last_and_input_not_not;
  wire [1:0] s_const_xx;
  wire scl_counter0_out_m_last;
  wire scl_counter0_out_const_0;
  wire [1:0] scl_counter0_out_const_xx;
  wire n7759_o;
  wire [1:0] n7761_o;
  wire n7762_o;
  wire n7763_o;
  wire n7764_o;
  wire n7765_o;
  wire n7766_o;
  wire n7769_o;
  reg n7775_q;
  assign out_ret = n7762_o;
  /* find_the_damn_issue_sky130.vhd:3716:16  */
  assign s_m_last = scl_counter0_out_m_last; // (signal)
  /* find_the_damn_issue_sky130.vhd:3717:16  */
  assign s_const_0 = scl_counter0_out_const_0; // (signal)
  /* find_the_damn_issue_sky130.vhd:3718:16  */
  assign s_unnamed = n7759_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:3719:16  */
  assign s_unnamed_2 = n7761_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:3720:16  */
  always @*
    s_ret_and_m_last_and_input_not_not_delayed1 = n7775_q; // (isignal)
  initial
    s_ret_and_m_last_and_input_not_not_delayed1 = 1'b0;
  /* find_the_damn_issue_sky130.vhd:3721:16  */
  assign s_ret_and_m_last_and_input_not_not = n7766_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:3722:16  */
  assign s_const_xx = scl_counter0_out_const_xx; // (signal)
  /* find_the_damn_issue_sky130.vhd:3724:9  */
  scl_counter_11 scl_counter0 (
    .clk(clk),
    .rst_n(rst_n),
    .in_unnamed(s_unnamed),
    .in_unnamed_2(s_unnamed_2),
    .out_m_last(scl_counter0_out_m_last),
    .out_const_0(scl_counter0_out_const_0),
    .out_const_xx(scl_counter0_out_const_xx));
  /* find_the_damn_issue_sky130.vhd:3736:17  */
  assign n7759_o = in_input ? 1'b1 : s_const_0;
  /* find_the_damn_issue_sky130.vhd:3741:17  */
  assign n7761_o = in_input ? 2'b00 : s_const_xx;
  /* find_the_damn_issue_sky130.vhd:3747:73  */
  assign n7762_o = s_ret_and_m_last_and_input_not_not_delayed1 | in_input;
  /* find_the_damn_issue_sky130.vhd:3748:90  */
  assign n7763_o = ~in_input;
  /* find_the_damn_issue_sky130.vhd:3748:84  */
  assign n7764_o = s_m_last & n7763_o;
  /* find_the_damn_issue_sky130.vhd:3748:70  */
  assign n7765_o = ~n7764_o;
  /* find_the_damn_issue_sky130.vhd:3748:64  */
  assign n7766_o = n7762_o & n7765_o;
  /* find_the_damn_issue_sky130.vhd:3753:27  */
  assign n7769_o = ~rst_n;
  /* find_the_damn_issue_sky130.vhd:3755:17  */
  always @(posedge clk or posedge n7769_o)
    if (n7769_o)
      n7775_q <= 1'b0;
    else
      n7775_q <= s_ret_and_m_last_and_input_not_not;
endmodule

module scl_pulseextender
  (input  clk,
   input  rst_n,
   input  in_input,
   output out_ret);
  wire s_m_last;
  wire s_const_0;
  wire s_unnamed;
  wire [1:0] s_unnamed_2;
  reg s_ret_and_m_last_and_input_not_not_delayed1;
  wire s_ret_and_m_last_and_input_not_not;
  wire [1:0] s_const_xx;
  wire scl_counter0_out_m_last;
  wire scl_counter0_out_const_0;
  wire [1:0] scl_counter0_out_const_xx;
  wire n7734_o;
  wire [1:0] n7736_o;
  wire n7737_o;
  wire n7738_o;
  wire n7739_o;
  wire n7740_o;
  wire n7741_o;
  wire n7744_o;
  reg n7750_q;
  assign out_ret = n7737_o;
  /* find_the_damn_issue_sky130.vhd:3853:16  */
  assign s_m_last = scl_counter0_out_m_last; // (signal)
  /* find_the_damn_issue_sky130.vhd:3854:16  */
  assign s_const_0 = scl_counter0_out_const_0; // (signal)
  /* find_the_damn_issue_sky130.vhd:3855:16  */
  assign s_unnamed = n7734_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:3856:16  */
  assign s_unnamed_2 = n7736_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:3857:16  */
  always @*
    s_ret_and_m_last_and_input_not_not_delayed1 = n7750_q; // (isignal)
  initial
    s_ret_and_m_last_and_input_not_not_delayed1 = 1'b0;
  /* find_the_damn_issue_sky130.vhd:3858:16  */
  assign s_ret_and_m_last_and_input_not_not = n7741_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:3859:16  */
  assign s_const_xx = scl_counter0_out_const_xx; // (signal)
  /* find_the_damn_issue_sky130.vhd:3861:9  */
  scl_counter_10 scl_counter0 (
    .clk(clk),
    .rst_n(rst_n),
    .in_unnamed(s_unnamed),
    .in_unnamed_2(s_unnamed_2),
    .out_m_last(scl_counter0_out_m_last),
    .out_const_0(scl_counter0_out_const_0),
    .out_const_xx(scl_counter0_out_const_xx));
  /* find_the_damn_issue_sky130.vhd:3873:17  */
  assign n7734_o = in_input ? 1'b1 : s_const_0;
  /* find_the_damn_issue_sky130.vhd:3878:17  */
  assign n7736_o = in_input ? 2'b00 : s_const_xx;
  /* find_the_damn_issue_sky130.vhd:3884:73  */
  assign n7737_o = s_ret_and_m_last_and_input_not_not_delayed1 | in_input;
  /* find_the_damn_issue_sky130.vhd:3885:90  */
  assign n7738_o = ~in_input;
  /* find_the_damn_issue_sky130.vhd:3885:84  */
  assign n7739_o = s_m_last & n7738_o;
  /* find_the_damn_issue_sky130.vhd:3885:70  */
  assign n7740_o = ~n7739_o;
  /* find_the_damn_issue_sky130.vhd:3885:64  */
  assign n7741_o = n7737_o & n7740_o;
  /* find_the_damn_issue_sky130.vhd:3890:27  */
  assign n7744_o = ~rst_n;
  /* find_the_damn_issue_sky130.vhd:3892:17  */
  always @(posedge clk or posedge n7744_o)
    if (n7744_o)
      n7750_q <= 1'b0;
    else
      n7750_q <= s_ret_and_m_last_and_input_not_not;
endmodule

module scl_counter_9
  (output out_m_last);
  localparam n7725_o = 1'b1;
  assign out_m_last = n7725_o;
endmodule

module nrzi
  (input  clk,
   input  rst_n,
   input  in_unnamed,
   input  in_unnamed_2,
   input  in_unnamed_3,
   input  in_unnamed_4,
   output out_out);
  reg s_last;
  wire s_last_mux2;
  wire n7704_o;
  wire n7705_o;
  wire n7706_o;
  wire n7707_o;
  wire n7708_o;
  wire n7709_o;
  wire n7711_o;
  wire n7715_o;
  reg n7721_q;
  assign out_out = n7707_o;
  /* find_the_damn_issue_sky130.vhd:3961:16  */
  always @*
    s_last = n7721_q; // (isignal)
  initial
    s_last = 1'b1;
  /* find_the_damn_issue_sky130.vhd:3962:16  */
  assign s_last_mux2 = n7711_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:3970:79  */
  assign n7704_o = in_unnamed_2 & in_unnamed;
  /* find_the_damn_issue_sky130.vhd:3970:61  */
  assign n7705_o = in_unnamed_3 & n7704_o;
  /* find_the_damn_issue_sky130.vhd:3972:42  */
  assign n7706_o = ~in_unnamed_4;
  /* find_the_damn_issue_sky130.vhd:3972:36  */
  assign n7707_o = s_last ^ n7706_o;
  /* find_the_damn_issue_sky130.vhd:3973:40  */
  assign n7708_o = in_unnamed_2 & in_unnamed;
  /* find_the_damn_issue_sky130.vhd:3973:17  */
  assign n7709_o = n7708_o ? n7707_o : s_last;
  /* find_the_damn_issue_sky130.vhd:3978:17  */
  assign n7711_o = n7705_o ? 1'b1 : n7709_o;
  /* find_the_damn_issue_sky130.vhd:3988:27  */
  assign n7715_o = ~rst_n;
  /* find_the_damn_issue_sky130.vhd:3990:17  */
  always @(posedge clk or posedge n7715_o)
    if (n7715_o)
      n7721_q <= 1'b1;
    else
      n7721_q <= s_last_mux2;
endmodule

module bitstuff
  (input  clk,
   input  rst_n,
   input  in_unnamed,
   input  in_unnamed_2,
   input  in_unnamed_3,
   input  in_unnamed_4,
   input  in_unnamed_5,
   output out_unnamed_mux1,
   output out_out_ready,
   output out_out_valid,
   output out_out_eop,
   output out_out);
  wire s_m_last;
  wire s_const_0;
  wire s_const_0_2;
  wire s_unnamed_6;
  wire s_unnamed_7;
  wire [2:0] s_unnamed_8;
  wire [2:0] s_const_xxx;
  wire scl_counter0_out_m_last;
  wire scl_counter0_out_const_0;
  wire scl_counter0_out_const_0_2;
  wire [2:0] scl_counter0_out_const_xxx;
  wire n7674_o;
  wire n7675_o;
  wire n7677_o;
  wire n7678_o;
  wire n7679_o;
  wire n7680_o;
  wire n7682_o;
  wire [2:0] n7684_o;
  wire n7686_o;
  wire n7688_o;
  wire n7690_o;
  wire n7692_o;
  assign out_unnamed_mux1 = n7686_o;
  assign out_out_ready = in_unnamed_5;
  assign out_out_valid = n7688_o;
  assign out_out_eop = n7690_o;
  assign out_out = n7692_o;
  /* find_the_damn_issue_sky130.vhd:4121:16  */
  assign s_m_last = scl_counter0_out_m_last; // (signal)
  /* find_the_damn_issue_sky130.vhd:4122:16  */
  assign s_const_0 = scl_counter0_out_const_0; // (signal)
  /* find_the_damn_issue_sky130.vhd:4123:16  */
  assign s_const_0_2 = scl_counter0_out_const_0_2; // (signal)
  /* find_the_damn_issue_sky130.vhd:4124:16  */
  assign s_unnamed_6 = n7677_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:4125:16  */
  assign s_unnamed_7 = n7682_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:4126:16  */
  assign s_unnamed_8 = n7684_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:4127:16  */
  assign s_const_xxx = scl_counter0_out_const_xxx; // (signal)
  /* find_the_damn_issue_sky130.vhd:4129:9  */
  scl_counter_8 scl_counter0 (
    .clk(clk),
    .rst_n(rst_n),
    .in_unnamed(s_unnamed_6),
    .in_unnamed_2(s_unnamed_7),
    .in_unnamed_3(s_unnamed_8),
    .out_m_last(scl_counter0_out_m_last),
    .out_const_0(scl_counter0_out_const_0),
    .out_const_0_2(scl_counter0_out_const_0_2),
    .out_const_xxx(scl_counter0_out_const_xxx));
  /* find_the_damn_issue_sky130.vhd:4148:83  */
  assign n7674_o = in_unnamed_4 & in_unnamed_5;
  /* find_the_damn_issue_sky130.vhd:4148:65  */
  assign n7675_o = in_unnamed_3 & n7674_o;
  /* find_the_damn_issue_sky130.vhd:4149:17  */
  assign n7677_o = n7675_o ? 1'b1 : s_const_0_2;
  /* find_the_damn_issue_sky130.vhd:4154:40  */
  assign n7678_o = ~in_unnamed_3;
  /* find_the_damn_issue_sky130.vhd:4155:92  */
  assign n7679_o = in_unnamed_4 & in_unnamed_5;
  /* find_the_damn_issue_sky130.vhd:4155:74  */
  assign n7680_o = n7678_o & n7679_o;
  /* find_the_damn_issue_sky130.vhd:4156:17  */
  assign n7682_o = n7680_o ? 1'b1 : s_const_0;
  /* find_the_damn_issue_sky130.vhd:4161:17  */
  assign n7684_o = n7680_o ? 3'b000 : s_const_xxx;
  /* find_the_damn_issue_sky130.vhd:4166:17  */
  assign n7686_o = s_m_last ? 1'b0 : in_unnamed_5;
  /* find_the_damn_issue_sky130.vhd:4171:17  */
  assign n7688_o = s_m_last ? 1'b1 : in_unnamed;
  /* find_the_damn_issue_sky130.vhd:4176:17  */
  assign n7690_o = s_m_last ? 1'b0 : in_unnamed_2;
  /* find_the_damn_issue_sky130.vhd:4181:17  */
  assign n7692_o = s_m_last ? 1'b0 : in_unnamed_3;
endmodule

module generatetxcrcappend
  (input  clk,
   input  rst_n,
   input  in_unnamed,
   input  in_unnamed_2,
   input  in_unnamed_3,
   input  in_unnamed_4,
   input  in_unnamed_5,
   input  in_unnamed_6,
   input  in_in_valid,
   input  in_in_eop,
   input  in_in,
   input  in_unnamed_7,
   input  in_unnamed_8,
   output out_unnamed_9,
   output out_unnamed_mux1,
   output out_unnamed_mux1_2,
   output out_firstdatabit_mux2,
   output out_unnamed_mux2,
   output out_unnamed_mux1_3,
   output out_out_ready,
   output out_out_valid,
   output out_out_eop,
   output out_out);
  wire s_in_2;
  wire [1:0] s_data_mux4;
  reg [1:0] s_state;
  wire [3:0] s_m_value;
  wire s_m_last;
  wire s_const_0;
  wire s_const_0_2;
  wire s_appendcrc;
  wire s_unnamed_10;
  wire s_m_value_eq_const_8_and_state_eq_prefix;
  reg s_firstdatabit;
  wire s_unnamed_11;
  wire [3:0] s_unnamed_12;
  wire s_firstdatabit_or_state_eq_prefix_and_state_neq_prefix_and_in_valid_and_unnamed_not;
  wire [3:0] s_const_x;
  wire [3:0] scl_counter0_out_m_value;
  wire scl_counter0_out_m_last;
  wire scl_counter0_out_const_0;
  wire scl_counter0_out_const_0_2;
  wire [3:0] scl_counter0_out_const_x;
  wire n7484_o;
  wire n7486_o;
  wire n7489_o;
  wire n7496_o;
  wire n7499_o;
  wire n7506_o;
  wire n7507_o;
  wire n7508_o;
  wire n7511_o;
  wire n7518_o;
  wire n7519_o;
  wire n7521_o;
  wire n7522_o;
  wire n7523_o;
  wire n7524_o;
  wire n7526_o;
  wire n7527_o;
  wire [1:0] n7529_o;
  wire n7530_o;
  wire n7531_o;
  wire n7532_o;
  wire n7535_o;
  wire n7542_o;
  wire n7543_o;
  wire n7544_o;
  wire [1:0] n7546_o;
  wire n7548_o;
  wire n7550_o;
  wire n7552_o;
  wire [3:0] n7554_o;
  wire n7556_o;
  wire n7557_o;
  wire n7559_o;
  wire n7560_o;
  wire n7561_o;
  wire n7563_o;
  wire n7564_o;
  wire n7565_o;
  wire n7566_o;
  wire n7568_o;
  wire n7569_o;
  wire [1:0] n7571_o;
  wire n7573_o;
  wire n7575_o;
  wire n7577_o;
  wire n7578_o;
  wire n7580_o;
  wire n7581_o;
  wire n7583_o;
  wire n7584_o;
  wire n7586_o;
  wire n7588_o;
  wire n7589_o;
  wire n7590_o;
  wire n7592_o;
  wire n7594_o;
  wire n7596_o;
  wire n7598_o;
  wire [3:0] n7599_o;
  reg n7602_o;
  wire n7603_o;
  wire n7604_o;
  wire n7606_o;
  wire n7607_o;
  wire [1:0] n7609_o;
  wire n7612_o;
  wire n7619_o;
  wire n7620_o;
  wire n7623_o;
  wire n7630_o;
  wire n7631_o;
  wire n7632_o;
  wire n7633_o;
  wire n7634_o;
  wire n7645_o;
  reg [1:0] n7654_q;
  wire n7655_o;
  reg n7656_q;
  reg n7657_q;
  assign out_unnamed_9 = in_unnamed_8;
  assign out_unnamed_mux1 = n7521_o;
  assign out_unnamed_mux1_2 = n7564_o;
  assign out_firstdatabit_mux2 = n7581_o;
  assign out_unnamed_mux2 = n7584_o;
  assign out_unnamed_mux1_3 = n7588_o;
  assign out_out_ready = in_unnamed_8;
  assign out_out_valid = n7575_o;
  assign out_out_eop = n7602_o;
  assign out_out = n7578_o;
  /* find_the_damn_issue_sky130.vhd:4315:16  */
  assign s_in_2 = in_in; // (signal)
  /* find_the_damn_issue_sky130.vhd:4316:16  */
  assign s_data_mux4 = n7609_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:4317:16  */
  always @*
    s_state = n7654_q; // (isignal)
  initial
    s_state = 2'b00;
  /* find_the_damn_issue_sky130.vhd:4318:16  */
  assign s_m_value = scl_counter0_out_m_value; // (signal)
  /* find_the_damn_issue_sky130.vhd:4319:16  */
  assign s_m_last = scl_counter0_out_m_last; // (signal)
  /* find_the_damn_issue_sky130.vhd:4320:16  */
  assign s_const_0 = scl_counter0_out_const_0; // (signal)
  /* find_the_damn_issue_sky130.vhd:4321:16  */
  assign s_const_0_2 = scl_counter0_out_const_0_2; // (signal)
  /* find_the_damn_issue_sky130.vhd:4322:16  */
  assign s_appendcrc = n7656_q; // (signal)
  /* find_the_damn_issue_sky130.vhd:4323:16  */
  assign s_unnamed_10 = n7486_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:4324:16  */
  assign s_m_value_eq_const_8_and_state_eq_prefix = n7507_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:4325:16  */
  always @*
    s_firstdatabit = n7657_q; // (isignal)
  initial
    s_firstdatabit = 1'b0;
  /* find_the_damn_issue_sky130.vhd:4326:16  */
  assign s_unnamed_11 = n7550_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:4327:16  */
  assign s_unnamed_12 = n7554_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:4328:16  */
  assign s_firstdatabit_or_state_eq_prefix_and_state_neq_prefix_and_in_valid_and_unnamed_not = n7634_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:4329:16  */
  assign s_const_x = scl_counter0_out_const_x; // (signal)
  /* find_the_damn_issue_sky130.vhd:4331:9  */
  scl_counter_7 scl_counter0 (
    .clk(clk),
    .rst_n(rst_n),
    .in_unnamed(s_unnamed_10),
    .in_unnamed_2(s_unnamed_11),
    .in_unnamed_3(s_unnamed_12),
    .out_m_value(scl_counter0_out_m_value),
    .out_m_last(scl_counter0_out_m_last),
    .out_const_0(scl_counter0_out_const_0),
    .out_const_0_2(scl_counter0_out_const_0_2),
    .out_const_x(scl_counter0_out_const_x));
  /* find_the_damn_issue_sky130.vhd:4381:40  */
  assign n7484_o = in_unnamed_7 & in_unnamed_8;
  /* find_the_damn_issue_sky130.vhd:4381:17  */
  assign n7486_o = n7484_o ? 1'b1 : s_const_0_2;
  /* find_the_damn_issue_sky130.vhd:4386:86  */
  assign n7489_o = s_m_value == 4'b1000;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n7496_o = n7489_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:4386:122  */
  assign n7499_o = s_state == 2'b00;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n7506_o = n7499_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:4386:96  */
  assign n7507_o = n7496_o & n7506_o;
  /* find_the_damn_issue_sky130.vhd:4387:17  */
  assign n7508_o = s_m_value_eq_const_8_and_state_eq_prefix ? s_in_2 : s_appendcrc;
  /* find_the_damn_issue_sky130.vhd:4392:86  */
  assign n7511_o = s_state == 2'b00;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n7518_o = n7511_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:4392:60  */
  assign n7519_o = in_in_valid & n7518_o;
  /* find_the_damn_issue_sky130.vhd:4393:17  */
  assign n7521_o = n7519_o ? 1'b1 : in_unnamed_3;
  /* find_the_damn_issue_sky130.vhd:4398:41  */
  assign n7522_o = in_in_valid & in_unnamed_8;
  /* find_the_damn_issue_sky130.vhd:4398:66  */
  assign n7523_o = n7522_o & n7508_o;
  /* find_the_damn_issue_sky130.vhd:4398:94  */
  assign n7524_o = n7523_o & s_m_last;
  /* find_the_damn_issue_sky130.vhd:4398:127  */
  assign n7526_o = s_state == 2'b00;
  /* find_the_damn_issue_sky130.vhd:4398:114  */
  assign n7527_o = n7524_o & n7526_o;
  /* find_the_damn_issue_sky130.vhd:4398:17  */
  assign n7529_o = n7527_o ? 2'b01 : s_state;
  /* find_the_damn_issue_sky130.vhd:4403:75  */
  assign n7530_o = in_in_valid & in_unnamed_8;
  /* find_the_damn_issue_sky130.vhd:4403:94  */
  assign n7531_o = n7530_o & n7508_o;
  /* find_the_damn_issue_sky130.vhd:4403:116  */
  assign n7532_o = n7531_o & s_m_last;
  /* find_the_damn_issue_sky130.vhd:4403:156  */
  assign n7535_o = s_state == 2'b00;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n7542_o = n7535_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:4403:130  */
  assign n7543_o = n7532_o & n7542_o;
  /* find_the_damn_issue_sky130.vhd:4403:56  */
  assign n7544_o = in_in_eop & n7543_o;
  /* find_the_damn_issue_sky130.vhd:4404:17  */
  assign n7546_o = n7544_o ? 2'b10 : n7529_o;
  /* find_the_damn_issue_sky130.vhd:4410:29  */
  assign n7548_o = s_state == 2'b01;
  /* find_the_damn_issue_sky130.vhd:4410:17  */
  assign n7550_o = n7548_o ? 1'b1 : s_const_0;
  /* find_the_damn_issue_sky130.vhd:4415:29  */
  assign n7552_o = s_state == 2'b01;
  /* find_the_damn_issue_sky130.vhd:4415:17  */
  assign n7554_o = n7552_o ? 4'b0000 : s_const_x;
  /* find_the_damn_issue_sky130.vhd:4420:29  */
  assign n7556_o = s_state == 2'b01;
  /* find_the_damn_issue_sky130.vhd:4420:17  */
  assign n7557_o = n7556_o ? s_firstdatabit : in_unnamed_4;
  /* find_the_damn_issue_sky130.vhd:4425:29  */
  assign n7559_o = s_state == 2'b01;
  /* find_the_damn_issue_sky130.vhd:4426:55  */
  assign n7560_o = in_in_valid & in_unnamed_8;
  /* find_the_damn_issue_sky130.vhd:4425:17  */
  assign n7561_o = n7559_o ? n7560_o : in_unnamed_6;
  /* find_the_damn_issue_sky130.vhd:4430:29  */
  assign n7563_o = s_state == 2'b01;
  /* find_the_damn_issue_sky130.vhd:4430:17  */
  assign n7564_o = n7563_o ? s_in_2 : in_unnamed_5;
  /* find_the_damn_issue_sky130.vhd:4435:40  */
  assign n7565_o = in_in_valid & in_unnamed_8;
  /* find_the_damn_issue_sky130.vhd:4435:65  */
  assign n7566_o = n7565_o & in_in_eop;
  /* find_the_damn_issue_sky130.vhd:4435:98  */
  assign n7568_o = s_state == 2'b01;
  /* find_the_damn_issue_sky130.vhd:4435:85  */
  assign n7569_o = n7566_o & n7568_o;
  /* find_the_damn_issue_sky130.vhd:4435:17  */
  assign n7571_o = n7569_o ? 2'b10 : n7546_o;
  /* find_the_damn_issue_sky130.vhd:4440:29  */
  assign n7573_o = s_state == 2'b10;
  /* find_the_damn_issue_sky130.vhd:4440:17  */
  assign n7575_o = n7573_o ? 1'b1 : in_in_valid;
  /* find_the_damn_issue_sky130.vhd:4445:29  */
  assign n7577_o = s_state == 2'b10;
  /* find_the_damn_issue_sky130.vhd:4445:17  */
  assign n7578_o = n7577_o ? in_unnamed : s_in_2;
  /* find_the_damn_issue_sky130.vhd:4450:29  */
  assign n7580_o = s_state == 2'b10;
  /* find_the_damn_issue_sky130.vhd:4450:17  */
  assign n7581_o = n7580_o ? s_firstdatabit : n7557_o;
  /* find_the_damn_issue_sky130.vhd:4455:29  */
  assign n7583_o = s_state == 2'b10;
  /* find_the_damn_issue_sky130.vhd:4455:17  */
  assign n7584_o = n7583_o ? in_unnamed_8 : n7561_o;
  /* find_the_damn_issue_sky130.vhd:4460:29  */
  assign n7586_o = s_state == 2'b10;
  /* find_the_damn_issue_sky130.vhd:4460:17  */
  assign n7588_o = n7586_o ? 1'b1 : in_unnamed_2;
  /* find_the_damn_issue_sky130.vhd:4469:67  */
  assign n7589_o = ~n7508_o;
  /* find_the_damn_issue_sky130.vhd:4469:61  */
  assign n7590_o = in_in_eop & n7589_o;
  /* find_the_damn_issue_sky130.vhd:4469:25  */
  assign n7592_o = s_state == 2'b00;
  /* find_the_damn_issue_sky130.vhd:4470:25  */
  assign n7594_o = s_state == 2'b01;
  /* find_the_damn_issue_sky130.vhd:4471:25  */
  assign n7596_o = s_state == 2'b10;
  /* find_the_damn_issue_sky130.vhd:4472:25  */
  assign n7598_o = s_state == 2'b11;
  assign n7599_o = {n7598_o, n7596_o, n7594_o, n7592_o};
  /* find_the_damn_issue_sky130.vhd:4468:17  */
  always @*
    case (n7599_o)
      4'b1000: n7602_o = in_in_eop;
      4'b0100: n7602_o = s_m_last;
      4'b0010: n7602_o = 1'b0;
      4'b0001: n7602_o = n7590_o;
      default: n7602_o = 1'bX;
    endcase
  /* find_the_damn_issue_sky130.vhd:4475:41  */
  assign n7603_o = n7575_o & in_unnamed_8;
  /* find_the_damn_issue_sky130.vhd:4475:66  */
  assign n7604_o = n7603_o & n7602_o;
  /* find_the_damn_issue_sky130.vhd:4475:100  */
  assign n7606_o = s_state == 2'b10;
  /* find_the_damn_issue_sky130.vhd:4475:87  */
  assign n7607_o = n7604_o & n7606_o;
  /* find_the_damn_issue_sky130.vhd:4475:17  */
  assign n7609_o = n7607_o ? 2'b00 : n7571_o;
  /* find_the_damn_issue_sky130.vhd:4483:146  */
  assign n7612_o = s_state == 2'b00;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n7619_o = n7612_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:4483:121  */
  assign n7620_o = s_firstdatabit | n7619_o;
  /* find_the_damn_issue_sky130.vhd:4483:194  */
  assign n7623_o = s_state != 2'b00;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n7630_o = n7623_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:4483:225  */
  assign n7631_o = in_in_valid & in_unnamed_8;
  /* find_the_damn_issue_sky130.vhd:4483:209  */
  assign n7632_o = n7630_o & n7631_o;
  /* find_the_damn_issue_sky130.vhd:4483:167  */
  assign n7633_o = ~n7632_o;
  /* find_the_damn_issue_sky130.vhd:4483:161  */
  assign n7634_o = n7620_o & n7633_o;
  /* find_the_damn_issue_sky130.vhd:4497:27  */
  assign n7645_o = ~rst_n;
  /* find_the_damn_issue_sky130.vhd:4500:17  */
  always @(posedge clk or posedge n7645_o)
    if (n7645_o)
      n7654_q <= 2'b00;
    else
      n7654_q <= s_data_mux4;
  /* find_the_damn_issue_sky130.vhd:4488:17  */
  assign n7655_o = s_m_value_eq_const_8_and_state_eq_prefix ? s_in_2 : s_appendcrc;
  /* find_the_damn_issue_sky130.vhd:4488:17  */
  always @(posedge clk)
    n7656_q <= n7655_o;
  /* find_the_damn_issue_sky130.vhd:4500:17  */
  always @(posedge clk or posedge n7645_o)
    if (n7645_o)
      n7657_q <= 1'b0;
    else
      n7657_q <= s_firstdatabit_or_state_eq_prefix_and_state_neq_prefix_and_in_valid_and_unnamed_not;
endmodule

module scl_reducewidth
  (input  clk,
   input  rst_n,
   input  in_out_valid,
   input  in_unnamed,
   input  [7:0] in_unnamed_2,
   input  in_unnamed_3,
   input  in_unnamed_4,
   output out_unnamed_and_m_last,
   output out_out_ready,
   output out_out_valid_2,
   output out_out_eop,
   output out_out);
  wire [2:0] s_m_value;
  wire s_m_last;
  wire s_const_0;
  wire s_const_0_2;
  wire s_unnamed_5;
  wire s_unnamed_6;
  wire [2:0] s_unnamed_7;
  wire [2:0] s_const_xxx;
  wire [2:0] scl_counter0_out_m_value;
  wire scl_counter0_out_m_last;
  wire scl_counter0_out_const_0;
  wire scl_counter0_out_const_0_2;
  wire [2:0] scl_counter0_out_const_xxx;
  wire n7410_o;
  wire n7412_o;
  wire n7414_o;
  wire [2:0] n7416_o;
  wire n7417_o;
  wire n7418_o;
  wire n7419_o;
  wire n7421_o;
  wire n7422_o;
  wire n7424_o;
  wire n7425_o;
  wire n7427_o;
  wire n7428_o;
  wire n7430_o;
  wire n7431_o;
  wire n7433_o;
  wire n7434_o;
  wire n7436_o;
  wire n7437_o;
  wire n7439_o;
  wire n7440_o;
  wire n7442_o;
  wire [7:0] n7443_o;
  reg n7445_o;
  assign out_unnamed_and_m_last = n7417_o;
  assign out_out_ready = in_unnamed_4;
  assign out_out_valid_2 = in_out_valid;
  assign out_out_eop = n7418_o;
  assign out_out = n7445_o;
  /* find_the_damn_issue_sky130.vhd:4618:16  */
  assign s_m_value = scl_counter0_out_m_value; // (signal)
  /* find_the_damn_issue_sky130.vhd:4619:16  */
  assign s_m_last = scl_counter0_out_m_last; // (signal)
  /* find_the_damn_issue_sky130.vhd:4620:16  */
  assign s_const_0 = scl_counter0_out_const_0; // (signal)
  /* find_the_damn_issue_sky130.vhd:4621:16  */
  assign s_const_0_2 = scl_counter0_out_const_0_2; // (signal)
  /* find_the_damn_issue_sky130.vhd:4622:16  */
  assign s_unnamed_5 = n7412_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:4623:16  */
  assign s_unnamed_6 = n7414_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:4624:16  */
  assign s_unnamed_7 = n7416_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:4625:16  */
  assign s_const_xxx = scl_counter0_out_const_xxx; // (signal)
  /* find_the_damn_issue_sky130.vhd:4627:9  */
  scl_counter_6 scl_counter0 (
    .clk(clk),
    .rst_n(rst_n),
    .in_unnamed(s_unnamed_5),
    .in_unnamed_2(s_unnamed_6),
    .in_unnamed_3(s_unnamed_7),
    .out_m_value(scl_counter0_out_m_value),
    .out_m_last(scl_counter0_out_m_last),
    .out_const_0(scl_counter0_out_const_0),
    .out_const_0_2(scl_counter0_out_const_0_2),
    .out_const_xxx(scl_counter0_out_const_xxx));
  /* find_the_damn_issue_sky130.vhd:4643:40  */
  assign n7410_o = in_unnamed_3 & in_unnamed_4;
  /* find_the_damn_issue_sky130.vhd:4643:17  */
  assign n7412_o = n7410_o ? 1'b1 : s_const_0_2;
  /* find_the_damn_issue_sky130.vhd:4648:17  */
  assign n7414_o = in_out_valid ? s_const_0 : 1'b1;
  /* find_the_damn_issue_sky130.vhd:4653:17  */
  assign n7416_o = in_out_valid ? s_const_xxx : 3'b000;
  /* find_the_damn_issue_sky130.vhd:4658:57  */
  assign n7417_o = in_unnamed_4 & s_m_last;
  /* find_the_damn_issue_sky130.vhd:4661:44  */
  assign n7418_o = in_unnamed & s_m_last;
  /* find_the_damn_issue_sky130.vhd:4664:57  */
  assign n7419_o = in_unnamed_2[0];
  /* find_the_damn_issue_sky130.vhd:4664:25  */
  assign n7421_o = s_m_value == 3'b000;
  /* find_the_damn_issue_sky130.vhd:4665:57  */
  assign n7422_o = in_unnamed_2[1];
  /* find_the_damn_issue_sky130.vhd:4665:25  */
  assign n7424_o = s_m_value == 3'b001;
  /* find_the_damn_issue_sky130.vhd:4666:57  */
  assign n7425_o = in_unnamed_2[2];
  /* find_the_damn_issue_sky130.vhd:4666:25  */
  assign n7427_o = s_m_value == 3'b010;
  /* find_the_damn_issue_sky130.vhd:4667:57  */
  assign n7428_o = in_unnamed_2[3];
  /* find_the_damn_issue_sky130.vhd:4667:25  */
  assign n7430_o = s_m_value == 3'b011;
  /* find_the_damn_issue_sky130.vhd:4668:57  */
  assign n7431_o = in_unnamed_2[4];
  /* find_the_damn_issue_sky130.vhd:4668:25  */
  assign n7433_o = s_m_value == 3'b100;
  /* find_the_damn_issue_sky130.vhd:4669:57  */
  assign n7434_o = in_unnamed_2[5];
  /* find_the_damn_issue_sky130.vhd:4669:25  */
  assign n7436_o = s_m_value == 3'b101;
  /* find_the_damn_issue_sky130.vhd:4670:57  */
  assign n7437_o = in_unnamed_2[6];
  /* find_the_damn_issue_sky130.vhd:4670:25  */
  assign n7439_o = s_m_value == 3'b110;
  /* find_the_damn_issue_sky130.vhd:4671:57  */
  assign n7440_o = in_unnamed_2[7];
  /* find_the_damn_issue_sky130.vhd:4671:25  */
  assign n7442_o = s_m_value == 3'b111;
  assign n7443_o = {n7442_o, n7439_o, n7436_o, n7433_o, n7430_o, n7427_o, n7424_o, n7421_o};
  /* find_the_damn_issue_sky130.vhd:4663:17  */
  always @*
    case (n7443_o)
      8'b10000000: n7445_o = n7440_o;
      8'b01000000: n7445_o = n7437_o;
      8'b00100000: n7445_o = n7434_o;
      8'b00010000: n7445_o = n7431_o;
      8'b00001000: n7445_o = n7428_o;
      8'b00000100: n7445_o = n7425_o;
      8'b00000010: n7445_o = n7422_o;
      8'b00000001: n7445_o = n7419_o;
      default: n7445_o = 1'bX;
    endcase
endmodule

module scl_insertbeat
  (input  clk,
   input  rst_n,
   input  in_unnamed,
   input  in_unnamed_2,
   input  [7:0] in_unnamed_3,
   input  in_unnamed_4,
   output out_unnamed_mux1,
   output out_out_ready,
   output out_out_valid,
   output out_out_eop,
   output [7:0] out_out);
  wire s_m_value;
  wire s_const_0;
  wire s_const_0_2;
  wire s_unnamed_5;
  wire s_unnamed_6;
  wire s_unnamed_7;
  wire s_const_x;
  wire scl_counter0_out_m_value;
  wire scl_counter0_out_const_0;
  wire scl_counter0_out_const_0_2;
  wire scl_counter0_out_const_x;
  wire n7363_o;
  wire n7364_o;
  wire n7365_o;
  wire n7367_o;
  wire n7369_o;
  wire n7370_o;
  wire n7371_o;
  wire n7372_o;
  wire n7374_o;
  wire n7376_o;
  wire n7377_o;
  wire n7378_o;
  wire n7379_o;
  wire n7381_o;
  wire n7383_o;
  wire [7:0] n7385_o;
  wire n7387_o;
  wire n7389_o;
  wire n7391_o;
  wire n7393_o;
  assign out_unnamed_mux1 = n7389_o;
  assign out_out_ready = in_unnamed_4;
  assign out_out_valid = in_unnamed;
  assign out_out_eop = n7393_o;
  assign out_out = n7385_o;
  /* find_the_damn_issue_sky130.vhd:4786:16  */
  assign s_m_value = scl_counter0_out_m_value; // (signal)
  /* find_the_damn_issue_sky130.vhd:4787:16  */
  assign s_const_0 = scl_counter0_out_const_0; // (signal)
  /* find_the_damn_issue_sky130.vhd:4788:16  */
  assign s_const_0_2 = scl_counter0_out_const_0_2; // (signal)
  /* find_the_damn_issue_sky130.vhd:4789:16  */
  assign s_unnamed_5 = n7367_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:4790:16  */
  assign s_unnamed_6 = n7374_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:4791:16  */
  assign s_unnamed_7 = n7381_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:4792:16  */
  assign s_const_x = scl_counter0_out_const_x; // (signal)
  /* find_the_damn_issue_sky130.vhd:4794:9  */
  scl_counter_5 scl_counter0 (
    .clk(clk),
    .rst_n(rst_n),
    .in_unnamed(s_unnamed_5),
    .in_unnamed_2(s_unnamed_6),
    .in_unnamed_3(s_unnamed_7),
    .out_m_value(scl_counter0_out_m_value),
    .out_const_0(scl_counter0_out_const_0),
    .out_const_0_2(scl_counter0_out_const_0_2),
    .out_const_x(scl_counter0_out_const_x));
  /* find_the_damn_issue_sky130.vhd:4809:32  */
  assign n7363_o = $unsigned(s_m_value) < $unsigned(1'b1);
  /* find_the_damn_issue_sky130.vhd:4809:61  */
  assign n7364_o = in_unnamed & in_unnamed_4;
  /* find_the_damn_issue_sky130.vhd:4809:39  */
  assign n7365_o = n7363_o & n7364_o;
  /* find_the_damn_issue_sky130.vhd:4809:17  */
  assign n7367_o = n7365_o ? 1'b1 : s_const_0_2;
  /* find_the_damn_issue_sky130.vhd:4814:56  */
  assign n7369_o = s_m_value != 1'b0;
  /* find_the_damn_issue_sky130.vhd:4814:41  */
  assign n7370_o = in_unnamed_2 & n7369_o;
  /* find_the_damn_issue_sky130.vhd:4814:87  */
  assign n7371_o = in_unnamed & in_unnamed_4;
  /* find_the_damn_issue_sky130.vhd:4814:65  */
  assign n7372_o = n7370_o & n7371_o;
  /* find_the_damn_issue_sky130.vhd:4814:17  */
  assign n7374_o = n7372_o ? 1'b1 : s_const_0;
  /* find_the_damn_issue_sky130.vhd:4819:56  */
  assign n7376_o = s_m_value != 1'b0;
  /* find_the_damn_issue_sky130.vhd:4819:41  */
  assign n7377_o = in_unnamed_2 & n7376_o;
  /* find_the_damn_issue_sky130.vhd:4819:87  */
  assign n7378_o = in_unnamed & in_unnamed_4;
  /* find_the_damn_issue_sky130.vhd:4819:65  */
  assign n7379_o = n7377_o & n7378_o;
  /* find_the_damn_issue_sky130.vhd:4819:17  */
  assign n7381_o = n7379_o ? 1'b0 : s_const_x;
  /* find_the_damn_issue_sky130.vhd:4824:31  */
  assign n7383_o = s_m_value == 1'b0;
  /* find_the_damn_issue_sky130.vhd:4824:17  */
  assign n7385_o = n7383_o ? 8'b10000000 : in_unnamed_3;
  /* find_the_damn_issue_sky130.vhd:4829:31  */
  assign n7387_o = s_m_value == 1'b0;
  /* find_the_damn_issue_sky130.vhd:4829:17  */
  assign n7389_o = n7387_o ? 1'b0 : in_unnamed_4;
  /* find_the_damn_issue_sky130.vhd:4834:31  */
  assign n7391_o = s_m_value == 1'b0;
  /* find_the_damn_issue_sky130.vhd:4834:17  */
  assign n7393_o = n7391_o ? 1'b0 : in_unnamed_2;
endmodule

module scl_addeopdeferred
  (input  clk,
   input  rst_n,
   input  in_in_valid,
   input  [7:0] in_in,
   input  in_unnamed,
   input  in_unnamed_2,
   output out_unnamed_or_in_valid_mux1_delayed1_not_mux1,
   output out_out_ready,
   output out_out_valid,
   output out_out_eop,
   output [7:0] out_out);
  wire [7:0] s_in_2;
  wire s_unnamed_3;
  wire s_unnamed_4;
  wire s_unnamed_or_in_valid_mux1_delayed1_not;
  wire s_out_ready_2;
  wire s_out_valid_2;
  wire s_out_eop_2;
  wire [7:0] s_out_2;
  reg s_unnamed_5;
  wire s_unnamed_6;
  wire scl_eraselastbeat0_out_unnamed_or_in_valid_mux1_delayed1_not;
  wire scl_eraselastbeat0_out_out_ready;
  wire scl_eraselastbeat0_out_out_valid;
  wire scl_eraselastbeat0_out_out_eop;
  wire [7:0] scl_eraselastbeat0_out_out;
  wire n7328_o;
  wire n7330_o;
  wire n7332_o;
  wire n7335_o;
  wire n7336_o;
  wire n7337_o;
  wire n7338_o;
  wire n7339_o;
  wire n7343_o;
  reg n7349_q;
  assign out_unnamed_or_in_valid_mux1_delayed1_not_mux1 = n7330_o;
  assign out_out_ready = s_out_ready_2;
  assign out_out_valid = s_out_valid_2;
  assign out_out_eop = s_out_eop_2;
  assign out_out = s_out_2;
  /* find_the_damn_issue_sky130.vhd:4985:16  */
  assign s_in_2 = in_in; // (signal)
  /* find_the_damn_issue_sky130.vhd:4986:16  */
  assign s_unnamed_3 = n7332_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:4987:16  */
  assign s_unnamed_4 = n7335_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:4988:16  */
  assign s_unnamed_or_in_valid_mux1_delayed1_not = scl_eraselastbeat0_out_unnamed_or_in_valid_mux1_delayed1_not; // (signal)
  /* find_the_damn_issue_sky130.vhd:4989:16  */
  assign s_out_ready_2 = scl_eraselastbeat0_out_out_ready; // (signal)
  /* find_the_damn_issue_sky130.vhd:4990:16  */
  assign s_out_valid_2 = scl_eraselastbeat0_out_out_valid; // (signal)
  /* find_the_damn_issue_sky130.vhd:4991:16  */
  assign s_out_eop_2 = scl_eraselastbeat0_out_out_eop; // (signal)
  /* find_the_damn_issue_sky130.vhd:4992:16  */
  assign s_out_2 = scl_eraselastbeat0_out_out; // (signal)
  /* find_the_damn_issue_sky130.vhd:4993:16  */
  always @*
    s_unnamed_5 = n7349_q; // (isignal)
  initial
    s_unnamed_5 = 1'b0;
  /* find_the_damn_issue_sky130.vhd:4994:16  */
  assign s_unnamed_6 = n7339_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:4996:9  */
  scl_eraselastbeat scl_eraselastbeat0 (
    .clk(clk),
    .rst_n(rst_n),
    .in_in(s_in_2),
    .in_unnamed(s_unnamed_3),
    .in_unnamed_2(s_unnamed_4),
    .in_unnamed_3(in_unnamed_2),
    .out_unnamed_or_in_valid_mux1_delayed1_not(scl_eraselastbeat0_out_unnamed_or_in_valid_mux1_delayed1_not),
    .out_out_ready(scl_eraselastbeat0_out_out_ready),
    .out_out_valid(scl_eraselastbeat0_out_out_valid),
    .out_out_eop(scl_eraselastbeat0_out_out_eop),
    .out_out(scl_eraselastbeat0_out_out));
  /* find_the_damn_issue_sky130.vhd:5019:47  */
  assign n7328_o = s_unnamed_5 | in_unnamed;
  /* find_the_damn_issue_sky130.vhd:5020:17  */
  assign n7330_o = n7328_o ? 1'b0 : s_unnamed_or_in_valid_mux1_delayed1_not;
  /* find_the_damn_issue_sky130.vhd:5025:17  */
  assign n7332_o = n7328_o ? 1'b1 : in_in_valid;
  /* find_the_damn_issue_sky130.vhd:5030:17  */
  assign n7335_o = n7328_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:5039:46  */
  assign n7336_o = s_unnamed_5 | in_unnamed;
  /* find_the_damn_issue_sky130.vhd:5039:86  */
  assign n7337_o = s_out_valid_2 & s_out_ready_2;
  /* find_the_damn_issue_sky130.vhd:5039:67  */
  assign n7338_o = ~n7337_o;
  /* find_the_damn_issue_sky130.vhd:5039:61  */
  assign n7339_o = n7336_o & n7338_o;
  /* find_the_damn_issue_sky130.vhd:5044:27  */
  assign n7343_o = ~rst_n;
  /* find_the_damn_issue_sky130.vhd:5046:17  */
  always @(posedge clk or posedge n7343_o)
    if (n7343_o)
      n7349_q <= 1'b0;
    else
      n7349_q <= s_unnamed_6;
endmodule

module scl_extendwidth
  (input  clk,
   input  rst_n,
   input  in_unnamed,
   input  in_unnamed_2,
   input  in_ret_zero,
   input  in_unnamed_3,
   output out_ret_valid,
   output out_ret_zero_2,
   output [7:0] out_ret);
  wire s_m_last;
  wire s_const_0;
  wire s_const_0_2;
  wire s_unnamed_4;
  wire s_unnamed_5;
  wire [2:0] s_unnamed_6;
  wire [7:0] s_unnamed_7;
  wire s_unnamed_8;
  wire [2:0] s_const_xxx;
  wire [7:0] s_unnamed_9;
  wire scl_counter0_out_m_last;
  wire scl_counter0_out_const_0;
  wire scl_counter0_out_const_0_2;
  wire [2:0] scl_counter0_out_const_xxx;
  wire n7293_o;
  wire [2:0] n7295_o;
  wire n7297_o;
  wire n7298_o;
  wire [6:0] n7299_o;
  wire [7:0] n7301_o;
  wire [6:0] n7302_o;
  wire [7:0] n7303_o;
  wire [7:0] n7310_o;
  reg [7:0] n7311_q;
  assign out_ret_valid = n7298_o;
  assign out_ret_zero_2 = in_ret_zero;
  assign out_ret = n7303_o;
  /* find_the_damn_issue_sky130.vhd:5160:16  */
  assign s_m_last = scl_counter0_out_m_last; // (signal)
  /* find_the_damn_issue_sky130.vhd:5161:16  */
  assign s_const_0 = scl_counter0_out_const_0; // (signal)
  /* find_the_damn_issue_sky130.vhd:5162:16  */
  assign s_const_0_2 = scl_counter0_out_const_0_2; // (signal)
  /* find_the_damn_issue_sky130.vhd:5163:16  */
  assign s_unnamed_4 = n7297_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:5164:16  */
  assign s_unnamed_5 = n7293_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:5165:16  */
  assign s_unnamed_6 = n7295_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:5166:16  */
  assign s_unnamed_7 = n7311_q; // (signal)
  /* find_the_damn_issue_sky130.vhd:5167:16  */
  assign s_unnamed_8 = in_unnamed_2; // (signal)
  /* find_the_damn_issue_sky130.vhd:5168:16  */
  assign s_const_xxx = scl_counter0_out_const_xxx; // (signal)
  /* find_the_damn_issue_sky130.vhd:5169:16  */
  assign s_unnamed_9 = n7303_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:5171:9  */
  scl_counter_4 scl_counter0 (
    .clk(clk),
    .rst_n(rst_n),
    .in_unnamed(s_unnamed_4),
    .in_unnamed_2(s_unnamed_5),
    .in_unnamed_3(s_unnamed_6),
    .out_m_last(scl_counter0_out_m_last),
    .out_const_0(scl_counter0_out_const_0),
    .out_const_0_2(scl_counter0_out_const_0_2),
    .out_const_xxx(scl_counter0_out_const_xxx));
  /* find_the_damn_issue_sky130.vhd:5187:17  */
  assign n7293_o = in_unnamed ? s_const_0 : 1'b1;
  /* find_the_damn_issue_sky130.vhd:5192:17  */
  assign n7295_o = in_unnamed ? s_const_xxx : 3'b000;
  /* find_the_damn_issue_sky130.vhd:5200:17  */
  assign n7297_o = s_unnamed_8 ? 1'b1 : s_const_0_2;
  /* find_the_damn_issue_sky130.vhd:5205:44  */
  assign n7298_o = s_m_last & s_unnamed_8;
  /* find_the_damn_issue_sky130.vhd:5206:48  */
  assign n7299_o = s_unnamed_7[7:1];
  /* find_the_damn_issue_sky130.vhd:5206:37  */
  assign n7301_o = {1'b0, n7299_o};
  /* find_the_damn_issue_sky130.vhd:5207:53  */
  assign n7302_o = n7301_o[6:0];
  /* find_the_damn_issue_sky130.vhd:5207:40  */
  assign n7303_o = {in_unnamed_3, n7302_o};
  /* find_the_damn_issue_sky130.vhd:5214:17  */
  assign n7310_o = s_unnamed_8 ? s_unnamed_9 : s_unnamed_7;
  /* find_the_damn_issue_sky130.vhd:5214:17  */
  always @(posedge clk)
    n7311_q <= n7310_o;
endmodule

module scl_counter_3
  (input  clk,
   input  rst_n,
   input  in_unnamed,
   input  in_unnamed_2,
   output out_m_last);
  reg s_m_value;
  wire s_unnamed_3;
  wire s_m_value_plus_const_0_mux1;
  wire n7258_o;
  wire n7261_o;
  wire n7268_o;
  wire n7269_o;
  wire n7272_o;
  wire n7279_o;
  reg n7280_q;
  assign out_m_last = n7268_o;
  /* find_the_damn_issue_sky130.vhd:5251:16  */
  always @*
    s_m_value = n7280_q; // (isignal)
  initial
    s_m_value = 1'b0;
  /* find_the_damn_issue_sky130.vhd:5252:16  */
  assign s_unnamed_3 = in_unnamed_2; // (signal)
  /* find_the_damn_issue_sky130.vhd:5253:16  */
  assign s_m_value_plus_const_0_mux1 = n7269_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:5259:17  */
  assign n7258_o = in_unnamed ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:5265:55  */
  assign n7261_o = s_m_value == 1'b1;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n7268_o = n7261_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:5267:59  */
  assign n7269_o = s_m_value + n7258_o;
  /* find_the_damn_issue_sky130.vhd:5272:27  */
  assign n7272_o = ~rst_n;
  /* find_the_damn_issue_sky130.vhd:5274:17  */
  assign n7279_o = s_unnamed_3 ? s_m_value_plus_const_0_mux1 : s_m_value;
  /* find_the_damn_issue_sky130.vhd:5274:17  */
  always @(posedge clk or posedge n7272_o)
    if (n7272_o)
      n7280_q <= 1'b0;
    else
      n7280_q <= n7279_o;
endmodule

module combinedbitcrc
  (input  clk,
   input  in_unnamed,
   input  in_unnamed_2,
   input  in_unnamed_3,
   input  in_unnamed_4,
   input  in_unnamed_5,
   output out_m_out,
   output out_m_match);
  wire [15:0] s_m_state;
  wire [15:0] s_m_state_delayed1;
  wire s_unnamed_6;
  wire [1:0] n7181_o;
  wire [2:0] n7182_o;
  wire [3:0] n7183_o;
  wire [4:0] n7184_o;
  wire [5:0] n7185_o;
  wire [6:0] n7186_o;
  wire [7:0] n7187_o;
  wire [8:0] n7188_o;
  wire [9:0] n7189_o;
  wire [10:0] n7190_o;
  wire [11:0] n7191_o;
  wire [12:0] n7192_o;
  wire [13:0] n7193_o;
  wire [14:0] n7194_o;
  wire [15:0] n7195_o;
  wire [15:0] n7196_o;
  wire n7198_o;
  wire n7199_o;
  wire n7200_o;
  wire n7201_o;
  wire n7202_o;
  wire n7203_o;
  wire n7204_o;
  wire n7205_o;
  wire [14:0] n7206_o;
  wire [15:0] n7207_o;
  wire [14:0] n7208_o;
  wire n7209_o;
  wire n7210_o;
  wire [15:0] n7211_o;
  wire [1:0] n7212_o;
  wire n7213_o;
  wire n7214_o;
  wire [2:0] n7215_o;
  wire [12:0] n7216_o;
  wire [15:0] n7217_o;
  wire [4:0] n7219_o;
  wire n7221_o;
  wire n7228_o;
  wire n7231_o;
  wire n7238_o;
  wire n7240_o;
  wire n7241_o;
  wire [15:0] n7249_o;
  reg [15:0] n7250_q;
  assign out_m_out = n7202_o;
  assign out_m_match = n7241_o;
  /* find_the_damn_issue_sky130.vhd:5314:16  */
  assign s_m_state = n7217_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:5315:16  */
  assign s_m_state_delayed1 = n7250_q; // (signal)
  /* find_the_damn_issue_sky130.vhd:5316:16  */
  assign s_unnamed_6 = in_unnamed_2; // (signal)
  /* find_the_damn_issue_sky130.vhd:5335:95  */
  assign n7181_o = {in_unnamed_4, in_unnamed_4};
  /* find_the_damn_issue_sky130.vhd:5335:110  */
  assign n7182_o = {n7181_o, in_unnamed_4};
  /* find_the_damn_issue_sky130.vhd:5335:125  */
  assign n7183_o = {n7182_o, in_unnamed_4};
  /* find_the_damn_issue_sky130.vhd:5335:140  */
  assign n7184_o = {n7183_o, in_unnamed_4};
  /* find_the_damn_issue_sky130.vhd:5335:155  */
  assign n7185_o = {n7184_o, in_unnamed_4};
  /* find_the_damn_issue_sky130.vhd:5335:170  */
  assign n7186_o = {n7185_o, in_unnamed_4};
  /* find_the_damn_issue_sky130.vhd:5335:185  */
  assign n7187_o = {n7186_o, in_unnamed_4};
  /* find_the_damn_issue_sky130.vhd:5335:200  */
  assign n7188_o = {n7187_o, in_unnamed_4};
  /* find_the_damn_issue_sky130.vhd:5335:215  */
  assign n7189_o = {n7188_o, in_unnamed_4};
  /* find_the_damn_issue_sky130.vhd:5335:230  */
  assign n7190_o = {n7189_o, in_unnamed_4};
  /* find_the_damn_issue_sky130.vhd:5335:245  */
  assign n7191_o = {n7190_o, in_unnamed_4};
  /* find_the_damn_issue_sky130.vhd:5335:260  */
  assign n7192_o = {n7191_o, in_unnamed_4};
  /* find_the_damn_issue_sky130.vhd:5335:275  */
  assign n7193_o = {n7192_o, in_unnamed_4};
  /* find_the_damn_issue_sky130.vhd:5335:290  */
  assign n7194_o = {n7193_o, in_unnamed_4};
  /* find_the_damn_issue_sky130.vhd:5335:305  */
  assign n7195_o = {n7194_o, in_unnamed_4};
  /* find_the_damn_issue_sky130.vhd:5335:78  */
  assign n7196_o = s_m_state_delayed1 | n7195_o;
  /* find_the_damn_issue_sky130.vhd:5337:31  */
  assign n7198_o = in_unnamed == 1'b0;
  /* find_the_damn_issue_sky130.vhd:5338:115  */
  assign n7199_o = n7196_o[11];
  /* find_the_damn_issue_sky130.vhd:5340:115  */
  assign n7200_o = n7196_o[0];
  /* find_the_damn_issue_sky130.vhd:5337:17  */
  assign n7201_o = n7198_o ? n7199_o : n7200_o;
  /* find_the_damn_issue_sky130.vhd:5342:32  */
  assign n7202_o = ~n7201_o;
  /* find_the_damn_issue_sky130.vhd:5343:41  */
  assign n7203_o = in_unnamed_3 ^ n7201_o;
  /* find_the_damn_issue_sky130.vhd:5343:102  */
  assign n7204_o = ~in_unnamed_5;
  /* find_the_damn_issue_sky130.vhd:5343:96  */
  assign n7205_o = n7203_o & n7204_o;
  /* find_the_damn_issue_sky130.vhd:5344:116  */
  assign n7206_o = n7196_o[15:1];
  /* find_the_damn_issue_sky130.vhd:5344:77  */
  assign n7207_o = {n7205_o, n7206_o};
  /* find_the_damn_issue_sky130.vhd:5345:190  */
  assign n7208_o = n7207_o[15:1];
  /* find_the_damn_issue_sky130.vhd:5345:256  */
  assign n7209_o = n7207_o[0];
  /* find_the_damn_issue_sky130.vhd:5345:260  */
  assign n7210_o = n7209_o ^ n7205_o;
  /* find_the_damn_issue_sky130.vhd:5345:204  */
  assign n7211_o = {n7208_o, n7210_o};
  /* find_the_damn_issue_sky130.vhd:5346:150  */
  assign n7212_o = n7211_o[15:14];
  /* find_the_damn_issue_sky130.vhd:5346:287  */
  assign n7213_o = n7211_o[13];
  /* find_the_damn_issue_sky130.vhd:5346:292  */
  assign n7214_o = n7213_o ^ n7205_o;
  /* find_the_damn_issue_sky130.vhd:5346:165  */
  assign n7215_o = {n7212_o, n7214_o};
  /* find_the_damn_issue_sky130.vhd:5346:424  */
  assign n7216_o = n7211_o[12:0];
  /* find_the_damn_issue_sky130.vhd:5346:303  */
  assign n7217_o = {n7215_o, n7216_o};
  /* find_the_damn_issue_sky130.vhd:5349:56  */
  assign n7219_o = n7217_o[15:11];
  /* find_the_damn_issue_sky130.vhd:5349:71  */
  assign n7221_o = n7219_o == 5'b00110;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n7228_o = n7221_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:5350:58  */
  assign n7231_o = n7217_o == 16'b1011000000000001;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n7238_o = n7231_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:5351:31  */
  assign n7240_o = in_unnamed == 1'b0;
  /* find_the_damn_issue_sky130.vhd:5351:17  */
  assign n7241_o = n7240_o ? n7228_o : n7238_o;
  /* find_the_damn_issue_sky130.vhd:5361:17  */
  assign n7249_o = s_unnamed_6 ? s_m_state : s_m_state_delayed1;
  /* find_the_damn_issue_sky130.vhd:5361:17  */
  always @(posedge clk)
    n7250_q <= n7249_o;
endmodule

module scl_decodenrzi
  (input  clk,
   input  rst_n,
   input  in_out_zero,
   input  in_unnamed,
   input  in_unnamed_2,
   output out_out_valid,
   output out_out_zero_2,
   output out_out);
  reg s_unnamed_delayed1;
  wire s_m_last;
  wire s_const_0;
  wire s_unnamed_3;
  wire [2:0] s_unnamed_4;
  wire s_unnamed_5;
  wire s_unnamed_6;
  wire [2:0] s_const_xxx;
  wire scl_counter0_out_m_last;
  wire scl_counter0_out_const_0;
  wire [2:0] scl_counter0_out_const_xxx;
  wire n7134_o;
  wire n7141_o;
  wire n7142_o;
  wire n7143_o;
  wire n7145_o;
  wire n7146_o;
  wire n7147_o;
  wire n7149_o;
  wire n7150_o;
  wire n7151_o;
  wire [2:0] n7153_o;
  wire n7158_o;
  wire n7165_o;
  reg n7166_q;
  assign out_out_valid = n7145_o;
  assign out_out_zero_2 = in_out_zero;
  assign out_out = n7142_o;
  /* find_the_damn_issue_sky130.vhd:5492:16  */
  always @*
    s_unnamed_delayed1 = n7166_q; // (isignal)
  initial
    s_unnamed_delayed1 = 1'b0;
  /* find_the_damn_issue_sky130.vhd:5493:16  */
  assign s_m_last = scl_counter0_out_m_last; // (signal)
  /* find_the_damn_issue_sky130.vhd:5494:16  */
  assign s_const_0 = scl_counter0_out_const_0; // (signal)
  /* find_the_damn_issue_sky130.vhd:5495:16  */
  assign s_unnamed_3 = n7149_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:5496:16  */
  assign s_unnamed_4 = n7153_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:5497:16  */
  assign s_unnamed_5 = in_unnamed; // (signal)
  /* find_the_damn_issue_sky130.vhd:5498:16  */
  assign s_unnamed_6 = in_unnamed_2; // (signal)
  /* find_the_damn_issue_sky130.vhd:5499:16  */
  assign s_const_xxx = scl_counter0_out_const_xxx; // (signal)
  /* find_the_damn_issue_sky130.vhd:5501:9  */
  scl_counter_2 scl_counter0 (
    .clk(clk),
    .rst_n(rst_n),
    .in_unnamed(s_unnamed_3),
    .in_unnamed_2(s_unnamed_4),
    .in_unnamed_3(s_unnamed_6),
    .out_m_last(scl_counter0_out_m_last),
    .out_const_0(scl_counter0_out_const_0),
    .out_const_xxx(scl_counter0_out_const_xxx));
  /* find_the_damn_issue_sky130.vhd:5520:60  */
  assign n7134_o = s_unnamed_5 == s_unnamed_delayed1;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n7141_o = n7134_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:5519:17  */
  assign n7142_o = s_unnamed_6 ? n7141_o : in_unnamed;
  /* find_the_damn_issue_sky130.vhd:5524:56  */
  assign n7143_o = s_m_last & s_unnamed_6;
  /* find_the_damn_issue_sky130.vhd:5525:17  */
  assign n7145_o = n7143_o ? 1'b0 : in_unnamed_2;
  /* find_the_damn_issue_sky130.vhd:5530:23  */
  assign n7146_o = ~n7142_o;
  /* find_the_damn_issue_sky130.vhd:5530:40  */
  assign n7147_o = n7146_o & s_unnamed_6;
  /* find_the_damn_issue_sky130.vhd:5530:17  */
  assign n7149_o = n7147_o ? 1'b1 : s_const_0;
  /* find_the_damn_issue_sky130.vhd:5535:23  */
  assign n7150_o = ~n7142_o;
  /* find_the_damn_issue_sky130.vhd:5535:40  */
  assign n7151_o = n7150_o & s_unnamed_6;
  /* find_the_damn_issue_sky130.vhd:5535:17  */
  assign n7153_o = n7151_o ? 3'b000 : s_const_xxx;
  /* find_the_damn_issue_sky130.vhd:5546:27  */
  assign n7158_o = ~rst_n;
  /* find_the_damn_issue_sky130.vhd:5548:17  */
  assign n7165_o = s_unnamed_6 ? s_unnamed_5 : s_unnamed_delayed1;
  /* find_the_damn_issue_sky130.vhd:5548:17  */
  always @(posedge clk or posedge n7158_o)
    if (n7158_o)
      n7166_q <= 1'b0;
    else
      n7166_q <= n7165_o;
endmodule

module scl_recoverdatadifferential
  (input  clk,
   input  rst_n,
   input  in_unnamed,
   input  in_unnamed_2,
   output out_se0,
   output out_p,
   output out_unnamed_3);
  wire s_unnamed_4;
  wire s_unnamed_5;
  wire scl_recoverdatadifferential_equalsampling_sky1300_out_se0;
  wire scl_recoverdatadifferential_equalsampling_sky1300_out_p;
  wire scl_recoverdatadifferential_equalsampling_sky1300_out_unnamed_3;
  assign out_se0 = scl_recoverdatadifferential_equalsampling_sky1300_out_se0;
  assign out_p = scl_recoverdatadifferential_equalsampling_sky1300_out_p;
  assign out_unnamed_3 = scl_recoverdatadifferential_equalsampling_sky1300_out_unnamed_3;
  /* find_the_damn_issue_sky130.vhd:7890:16  */
  assign s_unnamed_4 = in_unnamed; // (signal)
  /* find_the_damn_issue_sky130.vhd:7891:16  */
  assign s_unnamed_5 = in_unnamed_2; // (signal)
  /* find_the_damn_issue_sky130.vhd:7893:9  */
  scl_recoverdatadifferential_equalsampling_sky130 scl_recoverdatadifferential_equalsampling_sky1300 (
    .clk(clk),
    .rst_n(rst_n),
    .in_unnamed(s_unnamed_4),
    .in_unnamed_2(s_unnamed_5),
    .out_se0(scl_recoverdatadifferential_equalsampling_sky1300_out_se0),
    .out_p(scl_recoverdatadifferential_equalsampling_sky1300_out_p),
    .out_unnamed_3(scl_recoverdatadifferential_equalsampling_sky1300_out_unnamed_3));
endmodule

module scl_memory_3
  (input  clk,
   input  in_unnamed,
   input  [3:0] in_unnamed_2,
   input  [11:0] in_unnamed_3,
   input  [3:0] in_unnamed_4,
   output [11:0] out_unnamed_5);
  wire [3:0] s_unnamed_6;
  wire [11:0] s_unnamed_7;
  wire [3:0] s_unnamed_8;
  wire s_unnamed_9;
  wire [11:0] physical_memory0_out_unnamed_5;
  assign out_unnamed_5 = physical_memory0_out_unnamed_5;
  /* find_the_damn_issue_sky130.vhd:147:16  */
  assign s_unnamed_6 = in_unnamed_4; // (signal)
  /* find_the_damn_issue_sky130.vhd:148:16  */
  assign s_unnamed_7 = in_unnamed_3; // (signal)
  /* find_the_damn_issue_sky130.vhd:149:16  */
  assign s_unnamed_8 = in_unnamed_2; // (signal)
  /* find_the_damn_issue_sky130.vhd:150:16  */
  assign s_unnamed_9 = in_unnamed; // (signal)
  /* find_the_damn_issue_sky130.vhd:152:9  */
  physical_memory_3 physical_memory0 (
    .clk(clk),
    .in_unnamed(s_unnamed_6),
    .in_unnamed_2(s_unnamed_7),
    .in_unnamed_3(s_unnamed_8),
    .in_unnamed_4(s_unnamed_9),
    .out_unnamed_5(physical_memory0_out_unnamed_5));
endmodule

module scl_counter_16
  (input  clk,
   input  rst_n,
   input  in_unnamed,
   output [2:0] out_m_value,
   output out_m_last);
  reg [2:0] s_m_value_2;
  wire s_unnamed_2;
  wire [2:0] s_m_value_plus_const_0_mux1;
  wire n7087_o;
  wire n7094_o;
  wire [2:0] n7097_o;
  wire [2:0] n7098_o;
  wire n7101_o;
  wire [2:0] n7108_o;
  reg [2:0] n7109_q;
  assign out_m_value = s_m_value_2;
  assign out_m_last = n7094_o;
  /* find_the_damn_issue_sky130.vhd:487:16  */
  always @*
    s_m_value_2 = n7109_q; // (isignal)
  initial
    s_m_value_2 = 3'b000;
  /* find_the_damn_issue_sky130.vhd:488:16  */
  assign s_unnamed_2 = in_unnamed; // (signal)
  /* find_the_damn_issue_sky130.vhd:489:16  */
  assign s_m_value_plus_const_0_mux1 = n7098_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:495:57  */
  assign n7087_o = s_m_value_2 == 3'b111;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n7094_o = n7087_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:497:17  */
  assign n7097_o = s_unnamed_2 ? 3'b001 : 3'b000;
  /* find_the_damn_issue_sky130.vhd:502:61  */
  assign n7098_o = s_m_value_2 + n7097_o;
  /* find_the_damn_issue_sky130.vhd:507:27  */
  assign n7101_o = ~rst_n;
  /* find_the_damn_issue_sky130.vhd:509:17  */
  assign n7108_o = s_unnamed_2 ? s_m_value_plus_const_0_mux1 : s_m_value_2;
  /* find_the_damn_issue_sky130.vhd:509:17  */
  always @(posedge clk or posedge n7101_o)
    if (n7101_o)
      n7109_q <= 3'b000;
    else
      n7109_q <= n7108_o;
endmodule

module scl_baudrategenerator_2
  (input  clk,
   input  rst_n,
   input  [23:0] in_baudrate,
   input  in_settohalf,
   output out_out);
  reg [16:0] s_baudcounter;
  wire [16:0] s_baudcounter_rewired_plus_baudrate_rewired_rewired_minus_const_10110111000110110_mux2;
  wire [17:0] n7047_o;
  wire [16:0] n7048_o;
  wire [17:0] n7050_o;
  wire [17:0] n7051_o;
  wire n7054_o;
  wire n7061_o;
  wire n7062_o;
  wire n7063_o;
  wire [16:0] n7064_o;
  wire [16:0] n7066_o;
  wire [16:0] n7067_o;
  wire [16:0] n7069_o;
  wire n7073_o;
  reg [16:0] n7079_q;
  assign out_out = n7063_o;
  /* find_the_damn_issue_sky130.vhd:546:16  */
  always @*
    s_baudcounter = n7079_q; // (isignal)
  initial
    s_baudcounter = 17'b00000000000000000;
  /* find_the_damn_issue_sky130.vhd:547:16  */
  assign s_baudcounter_rewired_plus_baudrate_rewired_rewired_minus_const_10110111000110110_mux2 = n7069_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:561:70  */
  assign n7047_o = {1'b0, s_baudcounter};
  /* find_the_damn_issue_sky130.vhd:561:106  */
  assign n7048_o = in_baudrate[23:7];
  /* find_the_damn_issue_sky130.vhd:561:94  */
  assign n7050_o = {1'b0, n7048_o};
  /* find_the_damn_issue_sky130.vhd:561:87  */
  assign n7051_o = n7047_o + n7050_o;
  /* find_the_damn_issue_sky130.vhd:562:87  */
  assign n7054_o = $unsigned(n7051_o) >= $unsigned(18'b010110111000110110);
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n7061_o = n7054_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:562:118  */
  assign n7062_o = ~in_settohalf;
  /* find_the_damn_issue_sky130.vhd:562:112  */
  assign n7063_o = n7061_o & n7062_o;
  /* find_the_damn_issue_sky130.vhd:563:115  */
  assign n7064_o = n7051_o[16:0];
  /* find_the_damn_issue_sky130.vhd:565:168  */
  assign n7066_o = n7064_o - 17'b10110111000110110;
  /* find_the_damn_issue_sky130.vhd:564:17  */
  assign n7067_o = n7063_o ? n7066_o : n7064_o;
  /* find_the_damn_issue_sky130.vhd:569:17  */
  assign n7069_o = in_settohalf ? 17'b01011011100011011 : n7067_o;
  /* find_the_damn_issue_sky130.vhd:579:27  */
  assign n7073_o = ~rst_n;
  /* find_the_damn_issue_sky130.vhd:581:17  */
  always @(posedge clk or posedge n7073_o)
    if (n7073_o)
      n7079_q <= 17'b00000000000000000;
    else
      n7079_q <= s_baudcounter_rewired_plus_baudrate_rewired_rewired_minus_const_10110111000110110_mux2;
endmodule

module scl_counter_15
  (input  clk,
   input  rst_n,
   input  in_unnamed,
   input  in_unnamed_2,
   input  [2:0] in_unnamed_3,
   output [2:0] out_m_value,
   output out_const_0,
   output [2:0] out_const_xxx);
  reg [2:0] s_m_value_2;
  wire s_unnamed_4;
  wire [2:0] s_m_loadvalue_mux1;
  wire [2:0] n7018_o;
  wire n7019_o;
  wire [2:0] n7020_o;
  wire [2:0] n7021_o;
  localparam n7024_o = 1'b0;
  localparam [2:0] n7025_o = 3'bX;
  wire n7027_o;
  wire [2:0] n7034_o;
  reg [2:0] n7035_q;
  assign out_m_value = s_m_value_2;
  assign out_const_0 = n7024_o;
  assign out_const_xxx = n7025_o;
  /* find_the_damn_issue_sky130.vhd:786:16  */
  always @*
    s_m_value_2 = n7035_q; // (isignal)
  initial
    s_m_value_2 = 3'b000;
  /* find_the_damn_issue_sky130.vhd:787:16  */
  assign s_unnamed_4 = in_unnamed; // (signal)
  /* find_the_damn_issue_sky130.vhd:788:16  */
  assign s_m_loadvalue_mux1 = n7021_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:802:17  */
  assign n7018_o = s_unnamed_4 ? 3'b001 : 3'b000;
  /* find_the_damn_issue_sky130.vhd:807:56  */
  assign n7019_o = in_unnamed_2 & s_unnamed_4;
  /* find_the_damn_issue_sky130.vhd:811:60  */
  assign n7020_o = s_m_value_2 + n7018_o;
  /* find_the_damn_issue_sky130.vhd:808:17  */
  assign n7021_o = n7019_o ? in_unnamed_3 : n7020_o;
  /* find_the_damn_issue_sky130.vhd:819:27  */
  assign n7027_o = ~rst_n;
  /* find_the_damn_issue_sky130.vhd:821:17  */
  assign n7034_o = s_unnamed_4 ? s_m_loadvalue_mux1 : s_m_value_2;
  /* find_the_damn_issue_sky130.vhd:821:17  */
  always @(posedge clk or posedge n7027_o)
    if (n7027_o)
      n7035_q <= 3'b000;
    else
      n7035_q <= n7034_o;
endmodule

module scl_counter_14
  (input  clk,
   input  rst_n,
   input  in_unnamed,
   input  in_unnamed_2,
   input  [2:0] in_unnamed_3,
   output [2:0] out_m_value,
   output out_const_0,
   output [2:0] out_const_xxx);
  reg [2:0] s_m_value_2;
  wire s_unnamed_4;
  wire [2:0] s_m_loadvalue_mux1;
  wire [2:0] n6988_o;
  wire n6989_o;
  wire [2:0] n6990_o;
  wire [2:0] n6991_o;
  localparam n6994_o = 1'b0;
  localparam [2:0] n6995_o = 3'bX;
  wire n6997_o;
  wire [2:0] n7004_o;
  reg [2:0] n7005_q;
  assign out_m_value = s_m_value_2;
  assign out_const_0 = n6994_o;
  assign out_const_xxx = n6995_o;
  /* find_the_damn_issue_sky130.vhd:861:16  */
  always @*
    s_m_value_2 = n7005_q; // (isignal)
  initial
    s_m_value_2 = 3'b000;
  /* find_the_damn_issue_sky130.vhd:862:16  */
  assign s_unnamed_4 = in_unnamed; // (signal)
  /* find_the_damn_issue_sky130.vhd:863:16  */
  assign s_m_loadvalue_mux1 = n6991_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:877:17  */
  assign n6988_o = s_unnamed_4 ? 3'b001 : 3'b000;
  /* find_the_damn_issue_sky130.vhd:882:56  */
  assign n6989_o = in_unnamed_2 & s_unnamed_4;
  /* find_the_damn_issue_sky130.vhd:886:60  */
  assign n6990_o = s_m_value_2 + n6988_o;
  /* find_the_damn_issue_sky130.vhd:883:17  */
  assign n6991_o = n6989_o ? in_unnamed_3 : n6990_o;
  /* find_the_damn_issue_sky130.vhd:894:27  */
  assign n6997_o = ~rst_n;
  /* find_the_damn_issue_sky130.vhd:896:17  */
  assign n7004_o = s_unnamed_4 ? s_m_loadvalue_mux1 : s_m_value_2;
  /* find_the_damn_issue_sky130.vhd:896:17  */
  always @(posedge clk or posedge n6997_o)
    if (n6997_o)
      n7005_q <= 3'b000;
    else
      n7005_q <= n7004_o;
endmodule

module scl_counter_13
  (input  clk,
   input  rst_n,
   input  [16:0] in_unnamed,
   output out_m_last);
  reg [16:0] s_m_value;
  wire [16:0] s_m_value_plus_const_1_mux1;
  wire [16:0] n6949_o;
  wire n6950_o;
  wire [16:0] n6952_o;
  wire [16:0] n6954_o;
  wire [16:0] n6957_o;
  wire n6958_o;
  wire n6965_o;
  wire n6969_o;
  reg [16:0] n6975_q;
  assign out_m_last = n6965_o;
  /* find_the_damn_issue_sky130.vhd:932:16  */
  always @*
    s_m_value = n6975_q; // (isignal)
  initial
    s_m_value = 17'b00000000000000000;
  /* find_the_damn_issue_sky130.vhd:933:16  */
  assign s_m_value_plus_const_1_mux1 = n6954_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:940:45  */
  assign n6949_o = in_unnamed - 17'b00000000000000001;
  /* find_the_damn_issue_sky130.vhd:940:31  */
  assign n6950_o = s_m_value == n6949_o;
  /* find_the_damn_issue_sky130.vhd:943:67  */
  assign n6952_o = s_m_value + 17'b00000000000000001;
  /* find_the_damn_issue_sky130.vhd:940:17  */
  assign n6954_o = n6950_o ? 17'b00000000000000000 : n6952_o;
  /* find_the_damn_issue_sky130.vhd:945:69  */
  assign n6957_o = in_unnamed - 17'b00000000000000001;
  /* find_the_damn_issue_sky130.vhd:945:55  */
  assign n6958_o = s_m_value == n6957_o;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n6965_o = n6958_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:951:27  */
  assign n6969_o = ~rst_n;
  /* find_the_damn_issue_sky130.vhd:953:17  */
  always @(posedge clk or posedge n6969_o)
    if (n6969_o)
      n6975_q <= 17'b00000000000000000;
    else
      n6975_q <= s_m_value_plus_const_1_mux1;
endmodule

module scl_counter_12
  (input  clk,
   input  rst_n,
   input  in_unnamed,
   input  in_unnamed_2,
   input  [3:0] in_unnamed_3,
   output [3:0] out_m_value,
   output out_m_last,
   output out_const_0,
   output out_const_0_2,
   output [3:0] out_const_x);
  reg [3:0] s_m_value_2;
  wire [3:0] s_m_loadvalue_mux1;
  wire [3:0] n6917_o;
  wire [3:0] n6918_o;
  wire [3:0] n6919_o;
  wire n6922_o;
  wire n6929_o;
  localparam n6932_o = 1'b0;
  localparam n6933_o = 1'b0;
  localparam [3:0] n6934_o = 4'bX;
  wire n6936_o;
  reg [3:0] n6942_q;
  assign out_m_value = s_m_value_2;
  assign out_m_last = n6929_o;
  assign out_const_0 = n6932_o;
  assign out_const_0_2 = n6933_o;
  assign out_const_x = n6934_o;
  /* find_the_damn_issue_sky130.vhd:2449:16  */
  always @*
    s_m_value_2 = n6942_q; // (isignal)
  initial
    s_m_value_2 = 4'b0100;
  /* find_the_damn_issue_sky130.vhd:2450:16  */
  assign s_m_loadvalue_mux1 = n6919_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:2460:17  */
  assign n6917_o = in_unnamed ? 4'b0001 : 4'b0000;
  /* find_the_damn_issue_sky130.vhd:2471:60  */
  assign n6918_o = s_m_value_2 + n6917_o;
  /* find_the_damn_issue_sky130.vhd:2468:17  */
  assign n6919_o = in_unnamed_2 ? in_unnamed_3 : n6918_o;
  /* find_the_damn_issue_sky130.vhd:2473:57  */
  assign n6922_o = s_m_value_2 == 4'b1111;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n6929_o = n6922_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:2482:27  */
  assign n6936_o = ~rst_n;
  /* find_the_damn_issue_sky130.vhd:2484:17  */
  always @(posedge clk or posedge n6936_o)
    if (n6936_o)
      n6942_q <= 4'b0100;
    else
      n6942_q <= s_m_loadvalue_mux1;
endmodule

module scl_baudrategenerator
  (input  clk,
   input  rst_n,
   input  [23:0] in_baudrate,
   output out_out);
  wire [16:0] s_baudcounter_rewired_plus_baudrate_rewired_rewired_minus_const_10110111000110110_mux1;
  reg [16:0] s_baudcounter;
  wire [17:0] n6874_o;
  wire [16:0] n6875_o;
  wire [17:0] n6877_o;
  wire [17:0] n6878_o;
  wire n6881_o;
  wire n6888_o;
  wire [16:0] n6889_o;
  wire [16:0] n6891_o;
  wire [16:0] n6892_o;
  wire n6896_o;
  reg [16:0] n6902_q;
  assign out_out = n6888_o;
  /* find_the_damn_issue_sky130.vhd:2518:16  */
  assign s_baudcounter_rewired_plus_baudrate_rewired_rewired_minus_const_10110111000110110_mux1 = n6892_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:2519:16  */
  always @*
    s_baudcounter = n6902_q; // (isignal)
  initial
    s_baudcounter = 17'b00000000000000000;
  /* find_the_damn_issue_sky130.vhd:2530:70  */
  assign n6874_o = {1'b0, s_baudcounter};
  /* find_the_damn_issue_sky130.vhd:2530:106  */
  assign n6875_o = in_baudrate[23:7];
  /* find_the_damn_issue_sky130.vhd:2530:94  */
  assign n6877_o = {1'b0, n6875_o};
  /* find_the_damn_issue_sky130.vhd:2530:87  */
  assign n6878_o = n6874_o + n6877_o;
  /* find_the_damn_issue_sky130.vhd:2531:86  */
  assign n6881_o = $unsigned(n6878_o) >= $unsigned(18'b010110111000110110);
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n6888_o = n6881_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:2532:115  */
  assign n6889_o = n6878_o[16:0];
  /* find_the_damn_issue_sky130.vhd:2534:168  */
  assign n6891_o = n6889_o - 17'b10110111000110110;
  /* find_the_damn_issue_sky130.vhd:2533:17  */
  assign n6892_o = n6888_o ? n6891_o : n6889_o;
  /* find_the_damn_issue_sky130.vhd:2543:27  */
  assign n6896_o = ~rst_n;
  /* find_the_damn_issue_sky130.vhd:2545:17  */
  always @(posedge clk or posedge n6896_o)
    if (n6896_o)
      n6902_q <= 17'b00000000000000000;
    else
      n6902_q <= s_baudcounter_rewired_plus_baudrate_rewired_rewired_minus_const_10110111000110110_mux1;
endmodule

module scl_memory_2
  (input  clk,
   input  in_unnamed,
   input  [3:0] in_unnamed_2,
   input  [11:0] in_unnamed_3,
   input  [3:0] in_unnamed_4,
   output [11:0] out_unnamed_5);
  wire [3:0] s_unnamed_6;
  wire [11:0] s_unnamed_7;
  wire [3:0] s_unnamed_8;
  wire s_unnamed_9;
  wire [11:0] physical_memory0_out_unnamed_5;
  assign out_unnamed_5 = physical_memory0_out_unnamed_5;
  /* find_the_damn_issue_sky130.vhd:2821:16  */
  assign s_unnamed_6 = in_unnamed_4; // (signal)
  /* find_the_damn_issue_sky130.vhd:2822:16  */
  assign s_unnamed_7 = in_unnamed_3; // (signal)
  /* find_the_damn_issue_sky130.vhd:2823:16  */
  assign s_unnamed_8 = in_unnamed_2; // (signal)
  /* find_the_damn_issue_sky130.vhd:2824:16  */
  assign s_unnamed_9 = in_unnamed; // (signal)
  /* find_the_damn_issue_sky130.vhd:2826:9  */
  physical_memory_2 physical_memory0 (
    .clk(clk),
    .in_unnamed(s_unnamed_6),
    .in_unnamed_2(s_unnamed_7),
    .in_unnamed_3(s_unnamed_8),
    .in_unnamed_4(s_unnamed_9),
    .out_unnamed_5(physical_memory0_out_unnamed_5));
endmodule

module txfifointerface
  (input  [3:0] in_unnamed,
   input  in_unnamed_2,
   input  in_unnamed_3,
   input  in_tx_ready,
   input  in_unnamed_4,
   input  [7:0] in_unnamed_5,
   input  [3:0] in_unnamed_6,
   input  [7:0] in_unnamed_7,
   input  [3:0] in_unnamed_8,
   input  in_unnamed_9,
   input  in_unnamed_10,
   input  in_unnamed_11,
   output out_unnamed_not_mux1,
   output out_unnamed_mux2,
   output out_const_0_mux1,
   output out_tx_ready_2,
   output out_tx_valid,
   output [3:0] out_tx_endpoint,
   output [7:0] out_tx_data,
   output out_unnamed_mux2_2);
  wire n6833_o;
  wire n6840_o;
  wire n6841_o;
  wire n6842_o;
  wire [7:0] n6843_o;
  wire [3:0] n6844_o;
  wire n6845_o;
  wire n6846_o;
  wire n6847_o;
  wire n6848_o;
  wire n6850_o;
  wire n6851_o;
  wire n6853_o;
  wire n6856_o;
  assign out_unnamed_not_mux1 = n6847_o;
  assign out_unnamed_mux2 = n6853_o;
  assign out_const_0_mux1 = n6856_o;
  assign out_tx_ready_2 = in_tx_ready;
  assign out_tx_valid = n6842_o;
  assign out_tx_endpoint = n6844_o;
  assign out_tx_data = n6843_o;
  assign out_unnamed_mux2_2 = n6853_o;
  /* find_the_damn_issue_sky130.vhd:3068:55  */
  assign n6833_o = in_unnamed == 4'b0001;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n6840_o = n6833_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:3070:41  */
  assign n6841_o = ~in_unnamed_11;
  /* find_the_damn_issue_sky130.vhd:3069:17  */
  assign n6842_o = n6840_o ? n6841_o : in_unnamed_4;
  /* find_the_damn_issue_sky130.vhd:3074:17  */
  assign n6843_o = n6840_o ? in_unnamed_7 : in_unnamed_5;
  /* find_the_damn_issue_sky130.vhd:3079:17  */
  assign n6844_o = n6840_o ? in_unnamed_8 : in_unnamed_6;
  /* find_the_damn_issue_sky130.vhd:3084:63  */
  assign n6845_o = in_tx_ready & n6840_o;
  /* find_the_damn_issue_sky130.vhd:3086:51  */
  assign n6846_o = ~in_unnamed_11;
  /* find_the_damn_issue_sky130.vhd:3085:17  */
  assign n6847_o = n6845_o ? n6846_o : in_unnamed_10;
  /* find_the_damn_issue_sky130.vhd:3090:65  */
  assign n6848_o = in_unnamed_2 & n6840_o;
  /* find_the_damn_issue_sky130.vhd:3091:17  */
  assign n6850_o = n6848_o ? 1'b1 : in_unnamed_9;
  /* find_the_damn_issue_sky130.vhd:3096:67  */
  assign n6851_o = in_unnamed_3 & n6840_o;
  /* find_the_damn_issue_sky130.vhd:3097:17  */
  assign n6853_o = n6851_o ? 1'b0 : n6850_o;
  /* find_the_damn_issue_sky130.vhd:3102:17  */
  assign n6856_o = n6851_o ? 1'b1 : 1'b0;
endmodule

module rxfifointerface
  (input  [3:0] in_unnamed,
   input  in_unnamed_2,
   input  in_unnamed_3,
   input  [3:0] in_unnamed_4,
   input  [7:0] in_unnamed_5,
   input  in_unnamed_6,
   input  in_unnamed_7,
   input  [4:0] in_unnamed_8,
   input  in_unnamed_9,
   input  [3:0] in_unnamed_10,
   input  [7:0] in_unnamed_11,
   input  in_unnamed_12,
   input  in_unnamed_13,
   output out_unnamed_not_mux1,
   output out_unnamed_not_mux1_2,
   output [7:0] out_unnamed_mux1,
   output [3:0] out_unnamed_mux1_2,
   output out_const_0_mux1,
   output out_unnamed_mux2,
   output [4:0] out_const_10_mux1);
  wire n6783_o;
  wire n6790_o;
  wire n6791_o;
  wire n6792_o;
  wire n6793_o;
  wire n6794_o;
  wire n6795_o;
  wire [7:0] n6796_o;
  wire [3:0] n6797_o;
  wire n6798_o;
  wire n6799_o;
  wire n6801_o;
  wire n6802_o;
  wire n6803_o;
  wire n6806_o;
  wire n6808_o;
  wire [4:0] n6810_o;
  assign out_unnamed_not_mux1 = n6792_o;
  assign out_unnamed_not_mux1_2 = n6795_o;
  assign out_unnamed_mux1 = n6796_o;
  assign out_unnamed_mux1_2 = n6797_o;
  assign out_const_0_mux1 = n6806_o;
  assign out_unnamed_mux2 = n6808_o;
  assign out_const_10_mux1 = n6810_o;
  /* find_the_damn_issue_sky130.vhd:3171:55  */
  assign n6783_o = in_unnamed == 4'b0001;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n6790_o = n6783_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:3173:51  */
  assign n6791_o = ~in_unnamed_13;
  /* find_the_damn_issue_sky130.vhd:3172:17  */
  assign n6792_o = n6790_o ? n6791_o : in_unnamed_2;
  /* find_the_damn_issue_sky130.vhd:3177:64  */
  assign n6793_o = in_unnamed_3 & n6790_o;
  /* find_the_damn_issue_sky130.vhd:3179:53  */
  assign n6794_o = ~in_unnamed_13;
  /* find_the_damn_issue_sky130.vhd:3178:17  */
  assign n6795_o = n6793_o ? n6794_o : in_unnamed_12;
  /* find_the_damn_issue_sky130.vhd:3183:17  */
  assign n6796_o = n6793_o ? in_unnamed_5 : in_unnamed_11;
  /* find_the_damn_issue_sky130.vhd:3188:17  */
  assign n6797_o = n6793_o ? in_unnamed_4 : in_unnamed_10;
  /* find_the_damn_issue_sky130.vhd:3193:62  */
  assign n6798_o = in_unnamed_6 & n6790_o;
  /* find_the_damn_issue_sky130.vhd:3194:64  */
  assign n6799_o = in_unnamed_7 & n6798_o;
  /* find_the_damn_issue_sky130.vhd:3195:17  */
  assign n6801_o = n6799_o ? 1'b1 : in_unnamed_9;
  /* find_the_damn_issue_sky130.vhd:3200:39  */
  assign n6802_o = ~in_unnamed_7;
  /* find_the_damn_issue_sky130.vhd:3201:72  */
  assign n6803_o = n6802_o & n6798_o;
  /* find_the_damn_issue_sky130.vhd:3202:17  */
  assign n6806_o = n6803_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:3207:17  */
  assign n6808_o = n6803_o ? 1'b0 : n6801_o;
  /* find_the_damn_issue_sky130.vhd:3212:17  */
  assign n6810_o = n6803_o ? 5'b00010 : in_unnamed_8;
endmodule

module rxstream
  (input  clk,
   input  rst_n,
   input  in_m_rx_ready,
   input  in_unnamed,
   input  in_unnamed_2,
   input  [3:0] in_unnamed_3,
   input  in_unnamed_4,
   input  in_unnamed_5,
   input  in_unnamed_6,
   input  [7:0] in_m_rx_data,
   input  [3:0] in_m_rx_endpoint,
   input  [3:0] in_unnamed_7,
   output out_m_rxreadyerror,
   output out_const_1,
   output out_m_rx_valid,
   output [3:0] out_m_rx_endpoint_2,
   output [7:0] out_m_rx_data_2,
   output out_m_rx_eop,
   output out_m_rx_error);
  reg s_m_rxreadyerror_2;
  wire s_unnamed_or_unnamed_and_functionstream_and_m_rx_ready_not_and_unnamed_not;
  wire n6726_o;
  wire n6733_o;
  wire n6736_o;
  wire n6743_o;
  wire n6744_o;
  wire n6745_o;
  wire n6746_o;
  wire n6747_o;
  wire n6748_o;
  wire n6749_o;
  wire n6750_o;
  wire n6751_o;
  wire n6752_o;
  wire n6753_o;
  wire n6754_o;
  wire n6755_o;
  localparam n6757_o = 1'b1;
  wire n6759_o;
  reg n6765_q;
  assign out_m_rxreadyerror = s_m_rxreadyerror_2;
  assign out_const_1 = n6757_o;
  assign out_m_rx_valid = n6747_o;
  assign out_m_rx_endpoint_2 = in_m_rx_endpoint;
  assign out_m_rx_data_2 = in_m_rx_data;
  assign out_m_rx_eop = n6748_o;
  assign out_m_rx_error = n6749_o;
  /* find_the_damn_issue_sky130.vhd:3263:16  */
  always @*
    s_m_rxreadyerror_2 = n6765_q; // (isignal)
  initial
    s_m_rxreadyerror_2 = 1'b0;
  /* find_the_damn_issue_sky130.vhd:3264:16  */
  assign s_unnamed_or_unnamed_and_functionstream_and_m_rx_ready_not_and_unnamed_not = n6755_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:3271:65  */
  assign n6726_o = in_unnamed_3 == 4'b1000;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n6733_o = n6726_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:3271:110  */
  assign n6736_o = in_unnamed_7 != 4'b0000;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n6743_o = n6736_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:3271:79  */
  assign n6744_o = n6733_o & n6743_o;
  /* find_the_damn_issue_sky130.vhd:3275:50  */
  assign n6745_o = in_unnamed_4 & n6744_o;
  /* find_the_damn_issue_sky130.vhd:3275:78  */
  assign n6746_o = ~s_m_rxreadyerror_2;
  /* find_the_damn_issue_sky130.vhd:3275:72  */
  assign n6747_o = n6745_o & n6746_o;
  /* find_the_damn_issue_sky130.vhd:3278:47  */
  assign n6748_o = in_unnamed_5 & n6744_o;
  /* find_the_damn_issue_sky130.vhd:3279:49  */
  assign n6749_o = in_unnamed_6 | s_m_rxreadyerror_2;
  /* find_the_damn_issue_sky130.vhd:3280:128  */
  assign n6750_o = in_unnamed_4 & n6744_o;
  /* find_the_damn_issue_sky130.vhd:3280:156  */
  assign n6751_o = ~in_m_rx_ready;
  /* find_the_damn_issue_sky130.vhd:3280:150  */
  assign n6752_o = n6750_o & n6751_o;
  /* find_the_damn_issue_sky130.vhd:3280:110  */
  assign n6753_o = in_unnamed_2 | n6752_o;
  /* find_the_damn_issue_sky130.vhd:3280:182  */
  assign n6754_o = ~in_unnamed;
  /* find_the_damn_issue_sky130.vhd:3280:176  */
  assign n6755_o = n6753_o & n6754_o;
  /* find_the_damn_issue_sky130.vhd:3285:27  */
  assign n6759_o = ~rst_n;
  /* find_the_damn_issue_sky130.vhd:3287:17  */
  always @(posedge clk or posedge n6759_o)
    if (n6759_o)
      n6765_q <= 1'b0;
    else
      n6765_q <= s_unnamed_or_unnamed_and_functionstream_and_m_rx_ready_not_and_unnamed_not;
endmodule

module scl_memory
  (input  clk,
   input  [7:0] in_unnamed,
   output [7:0] out_unnamed_2);
  wire [7:0] s_unnamed_3;
  wire [7:0] physical_memory0_out_unnamed_2;
  assign out_unnamed_2 = physical_memory0_out_unnamed_2;
  /* find_the_damn_issue_sky130.vhd:3519:16  */
  assign s_unnamed_3 = in_unnamed; // (signal)
  /* find_the_damn_issue_sky130.vhd:3521:9  */
  physical_memory physical_memory0 (
    .clk(clk),
    .in_unnamed(s_unnamed_3),
    .out_unnamed_2(physical_memory0_out_unnamed_2));
endmodule

module functionreset
  (input  clk,
   input  rst_n,
   input  [6:0] in_unnamed,
   input  [3:0] in_unnamed_2,
   input  [6:0] in_unnamed_3,
   input  [1:0] in_unnamed_4,
   input  in_unnamed_5,
   output [6:0] out_unnamed_mux1,
   output [3:0] out_unnamed_mux1_2,
   output [6:0] out_unnamed_mux1_3);
  reg [9:0] s_s0timer;
  reg s_unnamed_or_s0timer_eq_const_0_delayed1;
  wire s_unnamed_or_s0timer_eq_const_0;
  wire [9:0] s_s0timer_plus_const_1_mux1;
  wire n6670_o;
  wire [9:0] n6672_o;
  wire [9:0] n6674_o;
  wire [6:0] n6676_o;
  wire [6:0] n6678_o;
  wire [3:0] n6680_o;
  wire n6683_o;
  wire n6690_o;
  wire n6691_o;
  wire n6698_o;
  reg [9:0] n6707_q;
  reg n6708_q;
  assign out_unnamed_mux1 = n6678_o;
  assign out_unnamed_mux1_2 = n6680_o;
  assign out_unnamed_mux1_3 = n6676_o;
  /* find_the_damn_issue_sky130.vhd:3566:16  */
  always @*
    s_s0timer = n6707_q; // (isignal)
  initial
    s_s0timer = 10'b0000000000;
  /* find_the_damn_issue_sky130.vhd:3567:16  */
  always @*
    s_unnamed_or_s0timer_eq_const_0_delayed1 = n6708_q; // (isignal)
  initial
    s_unnamed_or_s0timer_eq_const_0_delayed1 = 1'b0;
  /* find_the_damn_issue_sky130.vhd:3568:16  */
  assign s_unnamed_or_s0timer_eq_const_0 = n6691_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:3569:16  */
  assign s_s0timer_plus_const_1_mux1 = n6674_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:3579:34  */
  assign n6670_o = in_unnamed_4 == 2'b00;
  /* find_the_damn_issue_sky130.vhd:3580:67  */
  assign n6672_o = s_s0timer + 10'b0000000001;
  /* find_the_damn_issue_sky130.vhd:3579:17  */
  assign n6674_o = n6670_o ? n6672_o : 10'b0000000001;
  /* find_the_damn_issue_sky130.vhd:3584:17  */
  assign n6676_o = s_unnamed_or_s0timer_eq_const_0_delayed1 ? 7'b0000000 : in_unnamed;
  /* find_the_damn_issue_sky130.vhd:3589:17  */
  assign n6678_o = s_unnamed_or_s0timer_eq_const_0_delayed1 ? 7'b0000000 : in_unnamed_3;
  /* find_the_damn_issue_sky130.vhd:3594:17  */
  assign n6680_o = s_unnamed_or_s0timer_eq_const_0_delayed1 ? 4'b0000 : in_unnamed_2;
  /* find_the_damn_issue_sky130.vhd:3602:93  */
  assign n6683_o = s_s0timer == 10'b0000000000;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n6690_o = n6683_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:3602:66  */
  assign n6691_o = in_unnamed_5 | n6690_o;
  /* find_the_damn_issue_sky130.vhd:3608:27  */
  assign n6698_o = ~rst_n;
  /* find_the_damn_issue_sky130.vhd:3611:17  */
  always @(posedge clk or posedge n6698_o)
    if (n6698_o)
      n6707_q <= 10'b0000000000;
    else
      n6707_q <= s_s0timer_plus_const_1_mux1;
  /* find_the_damn_issue_sky130.vhd:3611:17  */
  always @(posedge clk or posedge n6698_o)
    if (n6698_o)
      n6708_q <= 1'b0;
    else
      n6708_q <= s_unnamed_or_s0timer_eq_const_0;
endmodule

module scl_usbgpiophy
  (input  clk,
   input  rst_n,
   input  [1:0] in_unnamed,
   input  in_unnamed_2,
   input  in_m_tx_ready,
   input  in_m_tx_valid,
   input  [7:0] in_m_tx_data,
   input  in_m_crcen,
   input  in_m_crcin,
   input  in_m_crcout,
   input  in_m_crcmatch,
   input  in_m_crcreset,
   input  in_m_crcshiftout,
   input  in_unnamed_3,
   input  [7:0] in_unnamed_4,
   input  [7:0] in_unnamed_5,
   input  [7:0] in_unnamed_6,
   output [1:0] out_m_status_linestate,
   output out_m_status_sessend,
   output out_m_status_rxactive,
   output out_m_out,
   output out_m_match_delayed1,
   output out_m_rx_valid,
   output out_m_rx_sop,
   output out_m_rx_eop,
   output out_m_rx_error,
   output [7:0] out_m_rx_data,
   output out_unnamed_or_in_valid_mux1_delayed1_not_mux1,
   output out_unnamed_mux1,
   output out_unnamed_mux1_2,
   output out_firstdatabit_mux2,
   output out_unnamed_mux2,
   output out_unnamed_mux1_3,
   output [7:0] out_unnamed_txstuffedstream_valid_mux2_rewired_txstuffedstream_valid_mux2_rewired,
   output [7:0] out_unnamed_txstuffedstream_mux1_rewired_txstuffedstream_not_mux1_rewired);
  wire s_dpin;
  wire s_dnin;
  wire s_se0;
  wire s_p;
  wire s_linein_valid;
  wire s_linein_zero;
  wire s_linein;
  wire s_unnamed_7;
  wire [1:0] s_m_status_linestate_2;
  wire s_out_valid;
  wire s_out_zero;
  wire s_out;
  reg s_unnamed_and_lineindecoded_valid_and_lineindecoded_zero_not_delayed1;
  wire s_m_se0;
  wire s_m_crcmode;
  wire s_m_crcmode_2;
  wire s_m_crcen_2;
  wire s_m_crcin_2;
  wire s_m_crcreset_2;
  wire s_m_crcshiftout_2;
  wire s_m_match;
  wire s_unnamed_8;
  wire [2:0] s_waitforlock_mux6;
  reg [2:0] s_preamble_detection_state;
  wire s_lineindecoded_valid_and_preamble_detection_state_eq_waitforlock;
  wire s_unnamed_9;
  wire s_m_last;
  wire s_in_bit_masked_valid;
  wire s_in_bit_masked_zero;
  wire s_in_bit_masked;
  wire s_ret_valid;
  wire [7:0] s_ret;
  reg s_rxdataactive;
  reg s_m_status_rxactive_delayed1;
  reg s_requirecrccheck;
  wire s_unnamed_10;
  reg s_unnamed_11;
  wire s_unnamed_12;
  wire s_unnamed_13;
  wire s_unnamed_14;
  wire s_m_tx_valid_2;
  wire [7:0] s_m_tx_data_2;
  reg s_m_tx_valid_delayed1;
  wire s_unnamed_15;
  wire s_out_valid_2;
  wire s_out_eop;
  wire [7:0] s_out_2;
  wire s_txpacketstream_valid;
  wire s_txpacketstream_eop;
  wire [7:0] s_txpacketstream;
  wire s_unnamed_16;
  wire s_out_valid_3;
  wire s_out_eop_2;
  wire [7:0] s_out_3;
  wire s_txpreambledstream_valid;
  wire s_txpreambledstream_eop;
  wire [7:0] s_txpreambledstream;
  wire s_unnamed_17;
  wire s_out_valid_4;
  wire s_out_eop_3;
  wire s_out_4;
  wire s_txbitvecstream_valid;
  wire s_txbitvecstream_eop;
  wire s_in;
  wire s_unnamed_18;
  wire s_out_valid_5;
  wire s_out_eop_4;
  wire s_out_5;
  wire s_txbitstream_valid;
  wire s_txbitstream_eop;
  wire s_txbitstream;
  wire s_unnamed_19;
  wire s_out_ready_5;
  wire s_out_valid_6;
  wire s_out_eop_5;
  wire s_out_6;
  wire s_out_7;
  wire s_m_last_2;
  wire s_ret_2;
  wire s_unnamed_20;
  wire s_unnamed_21;
  wire s_input;
  wire s_ret_3;
  reg s_se0_2;
  wire s_unnamed_22;
  wire [1:0] s_linein_and_linein_zero_not_unnamed_rewired_linein_not_and_linein_zero_not_rewired;
  wire s_linein_valid_mux1;
  wire s_unnamed_and_lineindecoded_valid_and_lineindecoded_zero_not;
  wire s_rxdataactive_or_lineinword_valid_and_m_status_rxactive_not_not;
  wire s_requirecrccheck_or_lineinword_valid_and_rxdataactive_not_and_lineinword_rewired_neq_const_10_and_m_status_rxactive_not_and_m_status_rxactive_delayed1_and_rxdataactive_not;
  wire s_unnamed_23;
  wire scl_recoverdatadifferential0_out_se0;
  wire scl_recoverdatadifferential0_out_p;
  wire scl_recoverdatadifferential0_out_unnamed_3;
  wire n6401_o;
  wire n6402_o;
  wire n6403_o;
  wire n6405_o;
  wire n6406_o;
  wire [2:0] n6408_o;
  wire n6411_o;
  wire n6418_o;
  wire n6419_o;
  wire n6422_o;
  wire n6429_o;
  wire n6430_o;
  wire n6431_o;
  wire [2:0] n6433_o;
  wire n6434_o;
  wire n6435_o;
  wire n6437_o;
  wire n6438_o;
  wire [2:0] n6440_o;
  wire n6441_o;
  wire n6443_o;
  wire n6444_o;
  wire [2:0] n6446_o;
  wire n6447_o;
  wire n6449_o;
  wire n6450_o;
  wire [2:0] n6452_o;
  wire n6453_o;
  wire [2:0] n6455_o;
  wire n6457_o;
  wire n6458_o;
  wire n6459_o;
  wire n6461_o;
  wire n6462_o;
  wire n6463_o;
  wire n6464_o;
  wire n6465_o;
  wire n6466_o;
  wire n6467_o;
  wire n6468_o;
  wire n6469_o;
  wire n6470_o;
  wire n6471_o;
  wire n6472_o;
  wire n6473_o;
  wire n6475_o;
  wire n6476_o;
  wire n6477_o;
  wire n6478_o;
  wire n6479_o;
  wire n6481_o;
  wire n6483_o;
  wire n6485_o;
  wire n6487_o;
  wire n6488_o;
  wire n6489_o;
  wire n6491_o;
  wire n6493_o;
  wire n6494_o;
  wire n6496_o;
  wire n6498_o;
  wire n6500_o;
  wire n6501_o;
  wire n6503_o;
  wire n6504_o;
  wire n6505_o;
  wire n6506_o;
  wire [1:0] n6507_o;
  wire [5:0] n6508_o;
  wire [7:0] n6509_o;
  wire n6510_o;
  wire [1:0] n6511_o;
  wire [5:0] n6512_o;
  wire [7:0] n6513_o;
  wire [6:0] n6514_o;
  wire [7:0] n6515_o;
  wire [6:0] n6516_o;
  wire [7:0] n6517_o;
  wire n6518_o;
  wire n6519_o;
  wire n6520_o;
  wire [1:0] n6521_o;
  wire n6522_o;
  wire n6523_o;
  wire n6524_o;
  wire n6525_o;
  wire [1:0] n6526_o;
  wire n6527_o;
  wire n6528_o;
  wire n6529_o;
  wire n6530_o;
  wire n6531_o;
  wire n6532_o;
  wire n6533_o;
  wire n6534_o;
  wire n6535_o;
  wire [1:0] n6537_o;
  wire n6539_o;
  wire n6546_o;
  wire n6547_o;
  wire n6548_o;
  wire n6549_o;
  wire n6550_o;
  wire n6551_o;
  wire n6552_o;
  wire n6553_o;
  wire n6554_o;
  wire n6555_o;
  wire n6556_o;
  wire n6557_o;
  wire n6558_o;
  localparam n6562_o = 1'b0;
  wire n6573_o;
  wire scl_decodenrzi0_out_out_valid;
  wire scl_decodenrzi0_out_out_zero_2;
  wire scl_decodenrzi0_out_out;
  wire combinedbitcrc0_out_m_out;
  wire combinedbitcrc0_out_m_match;
  wire scl_counter0_out_m_last;
  wire scl_extendwidth0_out_ret_valid;
  wire scl_extendwidth0_out_ret_zero_2;
  wire [7:0] scl_extendwidth0_out_ret;
  wire scl_addeopdeferred0_out_unnamed_or_in_valid_mux1_delayed1_not_mux1;
  wire scl_addeopdeferred0_out_out_ready;
  wire scl_addeopdeferred0_out_out_valid;
  wire scl_addeopdeferred0_out_out_eop;
  wire [7:0] scl_addeopdeferred0_out_out;
  wire scl_insertbeat0_out_unnamed_mux1;
  wire scl_insertbeat0_out_out_ready;
  wire scl_insertbeat0_out_out_valid;
  wire scl_insertbeat0_out_out_eop;
  wire [7:0] scl_insertbeat0_out_out;
  wire scl_reducewidth0_out_unnamed_and_m_last;
  wire scl_reducewidth0_out_out_ready;
  wire scl_reducewidth0_out_out_valid_2;
  wire scl_reducewidth0_out_out_eop;
  wire scl_reducewidth0_out_out;
  wire generatetxcrcappend0_out_unnamed_9;
  wire generatetxcrcappend0_out_unnamed_mux1;
  wire generatetxcrcappend0_out_unnamed_mux1_2;
  wire generatetxcrcappend0_out_firstdatabit_mux2;
  wire generatetxcrcappend0_out_unnamed_mux2;
  wire generatetxcrcappend0_out_unnamed_mux1_3;
  wire generatetxcrcappend0_out_out_ready;
  wire generatetxcrcappend0_out_out_valid;
  wire generatetxcrcappend0_out_out_eop;
  wire generatetxcrcappend0_out_out;
  wire bitstuff0_out_unnamed_mux1;
  wire bitstuff0_out_out_ready;
  wire bitstuff0_out_out_valid;
  wire bitstuff0_out_out_eop;
  wire bitstuff0_out_out;
  wire nrzi0_out_out;
  wire scl_counter1_out_m_last;
  wire scl_pulseextender0_out_ret;
  wire scl_pulseextender1_out_ret;
  wire [1:0] n6644_o;
  reg [1:0] n6645_q;
  reg n6646_q;
  reg n6647_q;
  reg [2:0] n6648_q;
  reg n6649_q;
  reg n6650_q;
  reg n6651_q;
  wire n6652_o;
  reg n6653_q;
  reg n6654_q;
  reg n6655_q;
  wire n6656_o;
  reg n6657_q;
  assign out_m_status_linestate = s_m_status_linestate_2;
  assign out_m_status_sessend = n6562_o;
  assign out_m_status_rxactive = n6401_o;
  assign out_m_out = combinedbitcrc0_out_m_out;
  assign out_m_match_delayed1 = n6657_q;
  assign out_m_rx_valid = s_ret_valid;
  assign out_m_rx_sop = n6462_o;
  assign out_m_rx_eop = n6465_o;
  assign out_m_rx_error = n6471_o;
  assign out_m_rx_data = s_ret;
  assign out_unnamed_or_in_valid_mux1_delayed1_not_mux1 = scl_addeopdeferred0_out_unnamed_or_in_valid_mux1_delayed1_not_mux1;
  assign out_unnamed_mux1 = generatetxcrcappend0_out_unnamed_mux1;
  assign out_unnamed_mux1_2 = generatetxcrcappend0_out_unnamed_mux1_2;
  assign out_firstdatabit_mux2 = generatetxcrcappend0_out_firstdatabit_mux2;
  assign out_unnamed_mux2 = generatetxcrcappend0_out_unnamed_mux2;
  assign out_unnamed_mux1_3 = generatetxcrcappend0_out_unnamed_mux1_3;
  assign out_unnamed_txstuffedstream_valid_mux2_rewired_txstuffedstream_valid_mux2_rewired = n6515_o;
  assign out_unnamed_txstuffedstream_mux1_rewired_txstuffedstream_not_mux1_rewired = n6517_o;
  /* find_the_damn_issue_sky130.vhd:7968:16  */
  assign s_dpin = n6504_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:7969:16  */
  assign s_dnin = n6505_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:7970:16  */
  assign s_se0 = scl_recoverdatadifferential0_out_se0; // (signal)
  /* find_the_damn_issue_sky130.vhd:7971:16  */
  assign s_p = scl_recoverdatadifferential0_out_p; // (signal)
  /* find_the_damn_issue_sky130.vhd:7972:16  */
  assign s_linein_valid = scl_recoverdatadifferential0_out_unnamed_3; // (signal)
  /* find_the_damn_issue_sky130.vhd:7973:16  */
  assign s_linein_zero = s_se0; // (signal)
  /* find_the_damn_issue_sky130.vhd:7974:16  */
  assign s_linein = s_p; // (signal)
  /* find_the_damn_issue_sky130.vhd:7975:16  */
  assign s_unnamed_7 = n6498_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:7976:16  */
  assign s_m_status_linestate_2 = n6645_q; // (signal)
  /* find_the_damn_issue_sky130.vhd:7977:16  */
  assign s_out_valid = scl_decodenrzi0_out_out_valid; // (signal)
  /* find_the_damn_issue_sky130.vhd:7978:16  */
  assign s_out_zero = scl_decodenrzi0_out_out_zero_2; // (signal)
  /* find_the_damn_issue_sky130.vhd:7979:16  */
  assign s_out = scl_decodenrzi0_out_out; // (signal)
  /* find_the_damn_issue_sky130.vhd:7980:16  */
  always @*
    s_unnamed_and_lineindecoded_valid_and_lineindecoded_zero_not_delayed1 = n6646_q; // (isignal)
  initial
    s_unnamed_and_lineindecoded_valid_and_lineindecoded_zero_not_delayed1 = 1'b0;
  /* find_the_damn_issue_sky130.vhd:7981:16  */
  assign s_m_se0 = s_out_zero; // (signal)
  /* find_the_damn_issue_sky130.vhd:7982:16  */
  assign s_m_crcmode = n6647_q; // (signal)
  /* find_the_damn_issue_sky130.vhd:7983:16  */
  assign s_m_crcmode_2 = s_m_crcmode; // (signal)
  /* find_the_damn_issue_sky130.vhd:7984:16  */
  assign s_m_crcen_2 = in_m_crcen; // (signal)
  /* find_the_damn_issue_sky130.vhd:7985:16  */
  assign s_m_crcin_2 = in_m_crcin; // (signal)
  /* find_the_damn_issue_sky130.vhd:7986:16  */
  assign s_m_crcreset_2 = in_m_crcreset; // (signal)
  /* find_the_damn_issue_sky130.vhd:7987:16  */
  assign s_m_crcshiftout_2 = in_m_crcshiftout; // (signal)
  /* find_the_damn_issue_sky130.vhd:7988:16  */
  assign s_m_match = combinedbitcrc0_out_m_match; // (signal)
  /* find_the_damn_issue_sky130.vhd:7989:16  */
  assign s_unnamed_8 = 1'b0; // (signal)
  /* find_the_damn_issue_sky130.vhd:7990:16  */
  assign s_waitforlock_mux6 = n6455_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:7991:16  */
  always @*
    s_preamble_detection_state = n6648_q; // (isignal)
  initial
    s_preamble_detection_state = 3'b000;
  /* find_the_damn_issue_sky130.vhd:7992:16  */
  assign s_lineindecoded_valid_and_preamble_detection_state_eq_waitforlock = n6419_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:7993:16  */
  assign s_unnamed_9 = n6430_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:7994:16  */
  assign s_m_last = scl_counter0_out_m_last; // (signal)
  /* find_the_damn_issue_sky130.vhd:7995:16  */
  assign s_in_bit_masked_valid = n6461_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:7996:16  */
  assign s_in_bit_masked_zero = s_out_zero; // (signal)
  /* find_the_damn_issue_sky130.vhd:7997:16  */
  assign s_in_bit_masked = s_out; // (signal)
  /* find_the_damn_issue_sky130.vhd:7998:16  */
  assign s_ret_valid = scl_extendwidth0_out_ret_valid; // (signal)
  /* find_the_damn_issue_sky130.vhd:8000:16  */
  assign s_ret = scl_extendwidth0_out_ret; // (signal)
  /* find_the_damn_issue_sky130.vhd:8001:16  */
  always @*
    s_rxdataactive = n6649_q; // (isignal)
  initial
    s_rxdataactive = 1'b0;
  /* find_the_damn_issue_sky130.vhd:8002:16  */
  always @*
    s_m_status_rxactive_delayed1 = n6650_q; // (isignal)
  initial
    s_m_status_rxactive_delayed1 = 1'b0;
  /* find_the_damn_issue_sky130.vhd:8003:16  */
  always @*
    s_requirecrccheck = n6651_q; // (isignal)
  initial
    s_requirecrccheck = 1'b0;
  /* find_the_damn_issue_sky130.vhd:8004:16  */
  assign s_unnamed_10 = n6481_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:8005:16  */
  always @*
    s_unnamed_11 = n6653_q; // (isignal)
  initial
    s_unnamed_11 = 1'b0;
  /* find_the_damn_issue_sky130.vhd:8006:16  */
  assign s_unnamed_12 = n6483_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:8007:16  */
  assign s_unnamed_13 = n6485_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:8008:16  */
  assign s_unnamed_14 = n6487_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:8009:16  */
  assign s_m_tx_valid_2 = in_m_tx_valid; // (signal)
  /* find_the_damn_issue_sky130.vhd:8010:16  */
  assign s_m_tx_data_2 = in_m_tx_data; // (signal)
  /* find_the_damn_issue_sky130.vhd:8011:16  */
  always @*
    s_m_tx_valid_delayed1 = n6654_q; // (isignal)
  initial
    s_m_tx_valid_delayed1 = 1'b0;
  /* find_the_damn_issue_sky130.vhd:8012:16  */
  assign s_unnamed_15 = n6489_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:8014:16  */
  assign s_out_valid_2 = scl_addeopdeferred0_out_out_valid; // (signal)
  /* find_the_damn_issue_sky130.vhd:8015:16  */
  assign s_out_eop = scl_addeopdeferred0_out_out_eop; // (signal)
  /* find_the_damn_issue_sky130.vhd:8016:16  */
  assign s_out_2 = scl_addeopdeferred0_out_out; // (signal)
  /* find_the_damn_issue_sky130.vhd:8017:16  */
  assign s_txpacketstream_valid = s_out_valid_2; // (signal)
  /* find_the_damn_issue_sky130.vhd:8018:16  */
  assign s_txpacketstream_eop = s_out_eop; // (signal)
  /* find_the_damn_issue_sky130.vhd:8019:16  */
  assign s_txpacketstream = s_out_2; // (signal)
  /* find_the_damn_issue_sky130.vhd:8020:16  */
  assign s_unnamed_16 = scl_insertbeat0_out_unnamed_mux1; // (signal)
  /* find_the_damn_issue_sky130.vhd:8022:16  */
  assign s_out_valid_3 = scl_insertbeat0_out_out_valid; // (signal)
  /* find_the_damn_issue_sky130.vhd:8023:16  */
  assign s_out_eop_2 = scl_insertbeat0_out_out_eop; // (signal)
  /* find_the_damn_issue_sky130.vhd:8024:16  */
  assign s_out_3 = scl_insertbeat0_out_out; // (signal)
  /* find_the_damn_issue_sky130.vhd:8025:16  */
  assign s_txpreambledstream_valid = s_out_valid_3; // (signal)
  /* find_the_damn_issue_sky130.vhd:8026:16  */
  assign s_txpreambledstream_eop = s_out_eop_2; // (signal)
  /* find_the_damn_issue_sky130.vhd:8027:16  */
  assign s_txpreambledstream = s_out_3; // (signal)
  /* find_the_damn_issue_sky130.vhd:8028:16  */
  assign s_unnamed_17 = scl_reducewidth0_out_unnamed_and_m_last; // (signal)
  /* find_the_damn_issue_sky130.vhd:8030:16  */
  assign s_out_valid_4 = scl_reducewidth0_out_out_valid_2; // (signal)
  /* find_the_damn_issue_sky130.vhd:8031:16  */
  assign s_out_eop_3 = scl_reducewidth0_out_out_eop; // (signal)
  /* find_the_damn_issue_sky130.vhd:8247:41  */
  assign s_out_4 = scl_reducewidth0_out_out; // (signal)
  /* find_the_damn_issue_sky130.vhd:8033:16  */
  assign s_txbitvecstream_valid = s_out_valid_4; // (signal)
  /* find_the_damn_issue_sky130.vhd:8034:16  */
  assign s_txbitvecstream_eop = s_out_eop_3; // (signal)
  /* find_the_damn_issue_sky130.vhd:8035:16  */
  assign s_in = s_out_4; // (signal)
  /* find_the_damn_issue_sky130.vhd:8036:16  */
  assign s_unnamed_18 = generatetxcrcappend0_out_unnamed_9; // (signal)
  /* find_the_damn_issue_sky130.vhd:8038:16  */
  assign s_out_valid_5 = generatetxcrcappend0_out_out_valid; // (signal)
  /* find_the_damn_issue_sky130.vhd:8039:16  */
  assign s_out_eop_4 = generatetxcrcappend0_out_out_eop; // (signal)
  /* find_the_damn_issue_sky130.vhd:8040:16  */
  assign s_out_5 = generatetxcrcappend0_out_out; // (signal)
  /* find_the_damn_issue_sky130.vhd:8041:16  */
  assign s_txbitstream_valid = s_out_valid_5; // (signal)
  /* find_the_damn_issue_sky130.vhd:8042:16  */
  assign s_txbitstream_eop = s_out_eop_4; // (signal)
  /* find_the_damn_issue_sky130.vhd:8043:16  */
  assign s_txbitstream = s_out_5; // (signal)
  /* find_the_damn_issue_sky130.vhd:8044:16  */
  assign s_unnamed_19 = bitstuff0_out_unnamed_mux1; // (signal)
  /* find_the_damn_issue_sky130.vhd:8045:16  */
  assign s_out_ready_5 = bitstuff0_out_out_ready; // (signal)
  /* find_the_damn_issue_sky130.vhd:8046:16  */
  assign s_out_valid_6 = bitstuff0_out_out_valid; // (signal)
  /* find_the_damn_issue_sky130.vhd:8047:16  */
  assign s_out_eop_5 = bitstuff0_out_out_eop; // (signal)
  /* find_the_damn_issue_sky130.vhd:8048:16  */
  assign s_out_6 = bitstuff0_out_out; // (signal)
  /* find_the_damn_issue_sky130.vhd:8049:16  */
  assign s_out_7 = nrzi0_out_out; // (signal)
  /* find_the_damn_issue_sky130.vhd:8050:16  */
  assign s_m_last_2 = scl_counter1_out_m_last; // (signal)
  /* find_the_damn_issue_sky130.vhd:8051:16  */
  assign s_ret_2 = scl_pulseextender0_out_ret; // (signal)
  /* find_the_damn_issue_sky130.vhd:8052:16  */
  assign s_unnamed_20 = n6491_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:8053:16  */
  assign s_unnamed_21 = n6493_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:8054:16  */
  assign s_input = n6494_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:8055:16  */
  assign s_ret_3 = scl_pulseextender1_out_ret; // (signal)
  /* find_the_damn_issue_sky130.vhd:8056:16  */
  always @*
    s_se0_2 = n6655_q; // (isignal)
  initial
    s_se0_2 = 1'b0;
  /* find_the_damn_issue_sky130.vhd:8057:16  */
  assign s_unnamed_22 = in_unnamed_3; // (signal)
  /* find_the_damn_issue_sky130.vhd:8058:16  */
  assign s_linein_and_linein_zero_not_unnamed_rewired_linein_not_and_linein_zero_not_rewired = n6526_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:8059:16  */
  assign s_linein_valid_mux1 = s_unnamed_7; // (signal)
  /* find_the_damn_issue_sky130.vhd:8060:16  */
  assign s_unnamed_and_lineindecoded_valid_and_lineindecoded_zero_not = n6529_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:8061:16  */
  assign s_rxdataactive_or_lineinword_valid_and_m_status_rxactive_not_not = n6533_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:8062:16  */
  assign s_requirecrccheck_or_lineinword_valid_and_rxdataactive_not_and_lineinword_rewired_neq_const_10_and_m_status_rxactive_not_and_m_status_rxactive_delayed1_and_rxdataactive_not = n6553_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:8063:16  */
  assign s_unnamed_23 = n6558_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:8065:9  */
  scl_recoverdatadifferential scl_recoverdatadifferential0 (
    .clk(clk),
    .rst_n(rst_n),
    .in_unnamed(s_dpin),
    .in_unnamed_2(s_dnin),
    .out_se0(scl_recoverdatadifferential0_out_se0),
    .out_p(scl_recoverdatadifferential0_out_p),
    .out_unnamed_3(scl_recoverdatadifferential0_out_unnamed_3));
  /* find_the_damn_issue_sky130.vhd:8141:113  */
  assign n6401_o = s_unnamed_and_lineindecoded_valid_and_lineindecoded_zero_not_delayed1 | s_out_valid;
  /* find_the_damn_issue_sky130.vhd:8152:56  */
  assign n6402_o = ~s_out;
  /* find_the_damn_issue_sky130.vhd:8152:50  */
  assign n6403_o = s_out_valid & n6402_o;
  /* find_the_damn_issue_sky130.vhd:8152:116  */
  assign n6405_o = s_preamble_detection_state == 3'b000;
  /* find_the_damn_issue_sky130.vhd:8152:84  */
  assign n6406_o = n6403_o & n6405_o;
  /* find_the_damn_issue_sky130.vhd:8152:17  */
  assign n6408_o = n6406_o ? 3'b001 : s_preamble_detection_state;
  /* find_the_damn_issue_sky130.vhd:8157:154  */
  assign n6411_o = s_preamble_detection_state == 3'b001;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n6418_o = n6411_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:8157:109  */
  assign n6419_o = s_out_valid & n6418_o;
  /* find_the_damn_issue_sky130.vhd:8158:144  */
  assign n6422_o = s_preamble_detection_state == 3'b001;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n6429_o = n6422_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:8158:99  */
  assign n6430_o = s_lineindecoded_valid_and_preamble_detection_state_eq_waitforlock & n6429_o;
  /* find_the_damn_issue_sky130.vhd:8159:56  */
  assign n6431_o = s_m_last & s_lineindecoded_valid_and_preamble_detection_state_eq_waitforlock;
  /* find_the_damn_issue_sky130.vhd:8160:17  */
  assign n6433_o = n6431_o ? 3'b010 : n6408_o;
  /* find_the_damn_issue_sky130.vhd:8165:56  */
  assign n6434_o = ~s_out;
  /* find_the_damn_issue_sky130.vhd:8165:50  */
  assign n6435_o = s_out_valid & n6434_o;
  /* find_the_damn_issue_sky130.vhd:8165:116  */
  assign n6437_o = s_preamble_detection_state == 3'b010;
  /* find_the_damn_issue_sky130.vhd:8165:84  */
  assign n6438_o = n6435_o & n6437_o;
  /* find_the_damn_issue_sky130.vhd:8165:17  */
  assign n6440_o = n6438_o ? 3'b011 : n6433_o;
  /* find_the_damn_issue_sky130.vhd:8170:50  */
  assign n6441_o = s_out_valid & s_out;
  /* find_the_damn_issue_sky130.vhd:8170:109  */
  assign n6443_o = s_preamble_detection_state == 3'b010;
  /* find_the_damn_issue_sky130.vhd:8170:77  */
  assign n6444_o = n6441_o & n6443_o;
  /* find_the_damn_issue_sky130.vhd:8170:17  */
  assign n6446_o = n6444_o ? 3'b000 : n6440_o;
  /* find_the_damn_issue_sky130.vhd:8175:50  */
  assign n6447_o = s_out_valid & s_out;
  /* find_the_damn_issue_sky130.vhd:8175:109  */
  assign n6449_o = s_preamble_detection_state == 3'b011;
  /* find_the_damn_issue_sky130.vhd:8175:77  */
  assign n6450_o = n6447_o & n6449_o;
  /* find_the_damn_issue_sky130.vhd:8175:17  */
  assign n6452_o = n6450_o ? 3'b100 : n6446_o;
  /* find_the_damn_issue_sky130.vhd:8181:49  */
  assign n6453_o = s_out_valid & s_out_zero;
  /* find_the_damn_issue_sky130.vhd:8181:17  */
  assign n6455_o = n6453_o ? 3'b000 : n6452_o;
  /* find_the_damn_issue_sky130.vhd:8188:49  */
  assign n6457_o = s_preamble_detection_state != 3'b100;
  /* find_the_damn_issue_sky130.vhd:8188:94  */
  assign n6458_o = s_out_valid & s_out_zero;
  /* find_the_damn_issue_sky130.vhd:8188:62  */
  assign n6459_o = n6457_o | n6458_o;
  /* find_the_damn_issue_sky130.vhd:8188:17  */
  assign n6461_o = n6459_o ? 1'b0 : s_out_valid;
  /* find_the_damn_issue_sky130.vhd:8202:35  */
  assign n6462_o = ~s_rxdataactive;
  /* find_the_damn_issue_sky130.vhd:8203:37  */
  assign n6463_o = ~n6401_o;
  /* find_the_damn_issue_sky130.vhd:8203:64  */
  assign n6464_o = n6463_o & s_m_status_rxactive_delayed1;
  /* find_the_damn_issue_sky130.vhd:8203:98  */
  assign n6465_o = n6464_o & s_rxdataactive;
  /* find_the_damn_issue_sky130.vhd:8204:40  */
  assign n6466_o = ~n6401_o;
  /* find_the_damn_issue_sky130.vhd:8204:67  */
  assign n6467_o = n6466_o & s_m_status_rxactive_delayed1;
  /* find_the_damn_issue_sky130.vhd:8204:101  */
  assign n6468_o = n6467_o & s_rxdataactive;
  /* find_the_damn_issue_sky130.vhd:8204:128  */
  assign n6469_o = ~n6657_q;
  /* find_the_damn_issue_sky130.vhd:8204:154  */
  assign n6470_o = n6469_o & s_requirecrccheck;
  /* find_the_damn_issue_sky130.vhd:8204:121  */
  assign n6471_o = n6468_o & n6470_o;
  /* find_the_damn_issue_sky130.vhd:8206:43  */
  assign n6472_o = s_ret_valid & n6462_o;
  /* find_the_damn_issue_sky130.vhd:8206:67  */
  assign n6473_o = n6472_o & n6401_o;
  /* find_the_damn_issue_sky130.vhd:8206:17  */
  assign n6475_o = n6473_o ? 1'b0 : s_m_crcmode_2;
  /* find_the_damn_issue_sky130.vhd:8211:34  */
  assign n6476_o = s_ret[1];
  /* find_the_damn_issue_sky130.vhd:8211:71  */
  assign n6477_o = s_ret_valid & n6462_o;
  /* find_the_damn_issue_sky130.vhd:8211:95  */
  assign n6478_o = n6477_o & n6401_o;
  /* find_the_damn_issue_sky130.vhd:8211:44  */
  assign n6479_o = n6476_o & n6478_o;
  /* find_the_damn_issue_sky130.vhd:8211:17  */
  assign n6481_o = n6479_o ? 1'b1 : n6475_o;
  /* find_the_damn_issue_sky130.vhd:8216:17  */
  assign n6483_o = n6401_o ? s_unnamed_11 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:8221:17  */
  assign n6485_o = n6401_o ? s_out : 1'bX;
  /* find_the_damn_issue_sky130.vhd:8226:17  */
  assign n6487_o = n6401_o ? s_in_bit_masked_valid : 1'b0;
  /* find_the_damn_issue_sky130.vhd:8234:36  */
  assign n6488_o = ~s_m_tx_valid_2;
  /* find_the_damn_issue_sky130.vhd:8234:56  */
  assign n6489_o = n6488_o & s_m_tx_valid_delayed1;
  /* find_the_damn_issue_sky130.vhd:8256:17  */
  assign n6491_o = s_ret_2 ? 1'b0 : s_out_valid_6;
  /* find_the_damn_issue_sky130.vhd:8261:17  */
  assign n6493_o = s_ret_2 ? 1'b0 : s_m_last_2;
  /* find_the_damn_issue_sky130.vhd:8266:42  */
  assign n6494_o = s_unnamed_20 & s_out_eop_5;
  /* find_the_damn_issue_sky130.vhd:8268:17  */
  assign n6496_o = s_se0_2 ? 1'b1 : s_unnamed_20;
  /* find_the_damn_issue_sky130.vhd:8273:17  */
  assign n6498_o = n6496_o ? 1'b0 : s_linein_valid;
  /* find_the_damn_issue_sky130.vhd:8278:17  */
  assign n6500_o = s_se0_2 ? 1'b0 : s_out_7;
  /* find_the_damn_issue_sky130.vhd:8286:57  */
  assign n6501_o = ~s_out_7;
  /* find_the_damn_issue_sky130.vhd:8283:17  */
  assign n6503_o = s_se0_2 ? 1'b0 : n6501_o;
  /* find_the_damn_issue_sky130.vhd:8291:38  */
  assign n6504_o = in_unnamed_4[6];
  /* find_the_damn_issue_sky130.vhd:8292:38  */
  assign n6505_o = in_unnamed_4[7];
  /* find_the_damn_issue_sky130.vhd:8295:71  */
  assign n6506_o = in_unnamed_5[7];
  /* find_the_damn_issue_sky130.vhd:8295:84  */
  assign n6507_o = {n6506_o, n6500_o};
  /* find_the_damn_issue_sky130.vhd:8295:122  */
  assign n6508_o = in_unnamed_5[5:0];
  /* find_the_damn_issue_sky130.vhd:8295:109  */
  assign n6509_o = {n6507_o, n6508_o};
  /* find_the_damn_issue_sky130.vhd:8296:77  */
  assign n6510_o = in_unnamed_6[7];
  /* find_the_damn_issue_sky130.vhd:8296:90  */
  assign n6511_o = {n6510_o, n6496_o};
  /* find_the_damn_issue_sky130.vhd:8296:134  */
  assign n6512_o = in_unnamed_6[5:0];
  /* find_the_damn_issue_sky130.vhd:8296:121  */
  assign n6513_o = {n6511_o, n6512_o};
  /* find_the_damn_issue_sky130.vhd:8297:178  */
  assign n6514_o = n6513_o[6:0];
  /* find_the_damn_issue_sky130.vhd:8297:132  */
  assign n6515_o = {n6496_o, n6514_o};
  /* find_the_damn_issue_sky130.vhd:8298:162  */
  assign n6516_o = n6509_o[6:0];
  /* find_the_damn_issue_sky130.vhd:8298:122  */
  assign n6517_o = {n6503_o, n6516_o};
  /* find_the_damn_issue_sky130.vhd:8299:75  */
  assign n6518_o = in_unnamed[1];
  /* find_the_damn_issue_sky130.vhd:8299:106  */
  assign n6519_o = ~s_linein_zero;
  /* find_the_damn_issue_sky130.vhd:8299:100  */
  assign n6520_o = s_linein & n6519_o;
  /* find_the_damn_issue_sky130.vhd:8299:88  */
  assign n6521_o = {n6518_o, n6520_o};
  /* find_the_damn_issue_sky130.vhd:8300:108  */
  assign n6522_o = ~s_linein;
  /* find_the_damn_issue_sky130.vhd:8300:128  */
  assign n6523_o = ~s_linein_zero;
  /* find_the_damn_issue_sky130.vhd:8300:122  */
  assign n6524_o = n6522_o & n6523_o;
  /* find_the_damn_issue_sky130.vhd:8300:194  */
  assign n6525_o = n6521_o[0];
  /* find_the_damn_issue_sky130.vhd:8300:148  */
  assign n6526_o = {n6524_o, n6525_o};
  /* find_the_damn_issue_sky130.vhd:8302:128  */
  assign n6527_o = s_out_valid & s_out_zero;
  /* find_the_damn_issue_sky130.vhd:8302:101  */
  assign n6528_o = ~n6527_o;
  /* find_the_damn_issue_sky130.vhd:8302:95  */
  assign n6529_o = in_unnamed_2 & n6528_o;
  /* find_the_damn_issue_sky130.vhd:8303:102  */
  assign n6530_o = s_rxdataactive | s_ret_valid;
  /* find_the_damn_issue_sky130.vhd:8303:137  */
  assign n6531_o = ~n6401_o;
  /* find_the_damn_issue_sky130.vhd:8303:131  */
  assign n6532_o = ~n6531_o;
  /* find_the_damn_issue_sky130.vhd:8303:125  */
  assign n6533_o = n6530_o & n6532_o;
  /* find_the_damn_issue_sky130.vhd:8304:243  */
  assign n6534_o = ~s_rxdataactive;
  /* find_the_damn_issue_sky130.vhd:8304:237  */
  assign n6535_o = s_ret_valid & n6534_o;
  /* find_the_damn_issue_sky130.vhd:8304:294  */
  assign n6537_o = s_ret[1:0];
  /* find_the_damn_issue_sky130.vhd:8304:307  */
  assign n6539_o = n6537_o != 2'b10;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n6546_o = n6539_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:8304:264  */
  assign n6547_o = n6535_o & n6546_o;
  /* find_the_damn_issue_sky130.vhd:8304:213  */
  assign n6548_o = s_requirecrccheck | n6547_o;
  /* find_the_damn_issue_sky130.vhd:8304:332  */
  assign n6549_o = ~n6401_o;
  /* find_the_damn_issue_sky130.vhd:8304:359  */
  assign n6550_o = n6549_o & s_m_status_rxactive_delayed1;
  /* find_the_damn_issue_sky130.vhd:8304:393  */
  assign n6551_o = n6550_o & s_rxdataactive;
  /* find_the_damn_issue_sky130.vhd:8304:324  */
  assign n6552_o = ~n6551_o;
  /* find_the_damn_issue_sky130.vhd:8304:318  */
  assign n6553_o = n6548_o & n6552_o;
  /* find_the_damn_issue_sky130.vhd:8305:67  */
  assign n6554_o = s_ret_valid & n6462_o;
  /* find_the_damn_issue_sky130.vhd:8305:48  */
  assign n6555_o = s_unnamed_11 | n6554_o;
  /* find_the_damn_issue_sky130.vhd:8305:110  */
  assign n6556_o = s_unnamed_11 & s_in_bit_masked_valid;
  /* find_the_damn_issue_sky130.vhd:8305:92  */
  assign n6557_o = ~n6556_o;
  /* find_the_damn_issue_sky130.vhd:8305:86  */
  assign n6558_o = n6555_o & n6557_o;
  /* find_the_damn_issue_sky130.vhd:8323:27  */
  assign n6573_o = ~rst_n;
  /* find_the_damn_issue_sky130.vhd:8346:9  */
  scl_decodenrzi scl_decodenrzi0 (
    .clk(clk),
    .rst_n(rst_n),
    .in_out_zero(s_linein_zero),
    .in_unnamed(s_linein),
    .in_unnamed_2(s_unnamed_7),
    .out_out_valid(scl_decodenrzi0_out_out_valid),
    .out_out_zero_2(scl_decodenrzi0_out_out_zero_2),
    .out_out(scl_decodenrzi0_out_out));
  /* find_the_damn_issue_sky130.vhd:8356:9  */
  combinedbitcrc combinedbitcrc0 (
    .clk(clk),
    .in_unnamed(s_m_crcmode_2),
    .in_unnamed_2(s_m_crcen_2),
    .in_unnamed_3(s_m_crcin_2),
    .in_unnamed_4(s_m_crcreset_2),
    .in_unnamed_5(s_m_crcshiftout_2),
    .out_m_out(combinedbitcrc0_out_m_out),
    .out_m_match(combinedbitcrc0_out_m_match));
  /* find_the_damn_issue_sky130.vhd:8366:9  */
  scl_counter_3 scl_counter0 (
    .clk(clk),
    .rst_n(rst_n),
    .in_unnamed(s_lineindecoded_valid_and_preamble_detection_state_eq_waitforlock),
    .in_unnamed_2(s_unnamed_9),
    .out_m_last(scl_counter0_out_m_last));
  /* find_the_damn_issue_sky130.vhd:8373:9  */
  scl_extendwidth scl_extendwidth0 (
    .clk(clk),
    .rst_n(rst_n),
    .in_unnamed(n6401_o),
    .in_unnamed_2(s_in_bit_masked_valid),
    .in_ret_zero(s_in_bit_masked_zero),
    .in_unnamed_3(s_in_bit_masked),
    .out_ret_valid(scl_extendwidth0_out_ret_valid),
    .out_ret_zero_2(),
    .out_ret(scl_extendwidth0_out_ret));
  /* find_the_damn_issue_sky130.vhd:8384:9  */
  scl_addeopdeferred scl_addeopdeferred0 (
    .clk(clk),
    .rst_n(rst_n),
    .in_in_valid(s_m_tx_valid_2),
    .in_in(s_m_tx_data_2),
    .in_unnamed(s_unnamed_15),
    .in_unnamed_2(s_unnamed_16),
    .out_unnamed_or_in_valid_mux1_delayed1_not_mux1(scl_addeopdeferred0_out_unnamed_or_in_valid_mux1_delayed1_not_mux1),
    .out_out_ready(),
    .out_out_valid(scl_addeopdeferred0_out_out_valid),
    .out_out_eop(scl_addeopdeferred0_out_out_eop),
    .out_out(scl_addeopdeferred0_out_out));
  /* find_the_damn_issue_sky130.vhd:8397:9  */
  scl_insertbeat scl_insertbeat0 (
    .clk(clk),
    .rst_n(rst_n),
    .in_unnamed(s_txpacketstream_valid),
    .in_unnamed_2(s_txpacketstream_eop),
    .in_unnamed_3(s_txpacketstream),
    .in_unnamed_4(s_unnamed_17),
    .out_unnamed_mux1(scl_insertbeat0_out_unnamed_mux1),
    .out_out_ready(),
    .out_out_valid(scl_insertbeat0_out_out_valid),
    .out_out_eop(scl_insertbeat0_out_out_eop),
    .out_out(scl_insertbeat0_out_out));
  /* find_the_damn_issue_sky130.vhd:8410:9  */
  scl_reducewidth scl_reducewidth0 (
    .clk(clk),
    .rst_n(rst_n),
    .in_out_valid(s_txpreambledstream_valid),
    .in_unnamed(s_txpreambledstream_eop),
    .in_unnamed_2(s_txpreambledstream),
    .in_unnamed_3(s_txbitvecstream_valid),
    .in_unnamed_4(s_unnamed_18),
    .out_unnamed_and_m_last(scl_reducewidth0_out_unnamed_and_m_last),
    .out_out_ready(),
    .out_out_valid_2(scl_reducewidth0_out_out_valid_2),
    .out_out_eop(scl_reducewidth0_out_out_eop),
    .out_out(scl_reducewidth0_out_out));
  /* find_the_damn_issue_sky130.vhd:8424:9  */
  generatetxcrcappend generatetxcrcappend0 (
    .clk(clk),
    .rst_n(rst_n),
    .in_unnamed(combinedbitcrc0_out_m_out),
    .in_unnamed_2(s_unnamed_8),
    .in_unnamed_3(s_unnamed_10),
    .in_unnamed_4(s_unnamed_12),
    .in_unnamed_5(s_unnamed_13),
    .in_unnamed_6(s_unnamed_14),
    .in_in_valid(s_txbitvecstream_valid),
    .in_in_eop(s_txbitvecstream_eop),
    .in_in(s_in),
    .in_unnamed_7(s_txbitstream_valid),
    .in_unnamed_8(s_unnamed_19),
    .out_unnamed_9(generatetxcrcappend0_out_unnamed_9),
    .out_unnamed_mux1(generatetxcrcappend0_out_unnamed_mux1),
    .out_unnamed_mux1_2(generatetxcrcappend0_out_unnamed_mux1_2),
    .out_firstdatabit_mux2(generatetxcrcappend0_out_firstdatabit_mux2),
    .out_unnamed_mux2(generatetxcrcappend0_out_unnamed_mux2),
    .out_unnamed_mux1_3(generatetxcrcappend0_out_unnamed_mux1_3),
    .out_out_ready(),
    .out_out_valid(generatetxcrcappend0_out_out_valid),
    .out_out_eop(generatetxcrcappend0_out_out_eop),
    .out_out(generatetxcrcappend0_out_out));
  /* find_the_damn_issue_sky130.vhd:8449:9  */
  bitstuff bitstuff0 (
    .clk(clk),
    .rst_n(rst_n),
    .in_unnamed(s_txbitstream_valid),
    .in_unnamed_2(s_txbitstream_eop),
    .in_unnamed_3(s_txbitstream),
    .in_unnamed_4(s_unnamed_20),
    .in_unnamed_5(s_unnamed_21),
    .out_unnamed_mux1(bitstuff0_out_unnamed_mux1),
    .out_out_ready(bitstuff0_out_out_ready),
    .out_out_valid(bitstuff0_out_out_valid),
    .out_out_eop(bitstuff0_out_out_eop),
    .out_out(bitstuff0_out_out));
  /* find_the_damn_issue_sky130.vhd:8463:9  */
  nrzi nrzi0 (
    .clk(clk),
    .rst_n(rst_n),
    .in_unnamed(s_out_ready_5),
    .in_unnamed_2(s_out_valid_6),
    .in_unnamed_3(s_out_eop_5),
    .in_unnamed_4(s_out_6),
    .out_out(nrzi0_out_out));
  /* find_the_damn_issue_sky130.vhd:8472:9  */
  scl_counter_9 scl_counter1 (
    .out_m_last(scl_counter1_out_m_last));
  /* find_the_damn_issue_sky130.vhd:8475:9  */
  scl_pulseextender scl_pulseextender0 (
    .clk(clk),
    .rst_n(rst_n),
    .in_input(s_m_se0),
    .out_ret(scl_pulseextender0_out_ret));
  /* find_the_damn_issue_sky130.vhd:8481:9  */
  scl_pulseextender_2 scl_pulseextender1 (
    .clk(clk),
    .rst_n(rst_n),
    .in_input(s_input),
    .out_ret(scl_pulseextender1_out_ret));
  /* find_the_damn_issue_sky130.vhd:8310:17  */
  assign n6644_o = s_linein_valid_mux1 ? s_linein_and_linein_zero_not_unnamed_rewired_linein_not_and_linein_zero_not_rewired : s_m_status_linestate_2;
  /* find_the_damn_issue_sky130.vhd:8310:17  */
  always @(posedge clk)
    n6645_q <= n6644_o;
  /* find_the_damn_issue_sky130.vhd:8332:17  */
  always @(posedge clk or posedge n6573_o)
    if (n6573_o)
      n6646_q <= 1'b0;
    else
      n6646_q <= s_unnamed_and_lineindecoded_valid_and_lineindecoded_zero_not;
  /* find_the_damn_issue_sky130.vhd:8310:17  */
  always @(posedge clk)
    n6647_q <= s_unnamed_22;
  /* find_the_damn_issue_sky130.vhd:8332:17  */
  always @(posedge clk or posedge n6573_o)
    if (n6573_o)
      n6648_q <= 3'b000;
    else
      n6648_q <= s_waitforlock_mux6;
  /* find_the_damn_issue_sky130.vhd:8332:17  */
  always @(posedge clk or posedge n6573_o)
    if (n6573_o)
      n6649_q <= 1'b0;
    else
      n6649_q <= s_rxdataactive_or_lineinword_valid_and_m_status_rxactive_not_not;
  /* find_the_damn_issue_sky130.vhd:8332:17  */
  always @(posedge clk or posedge n6573_o)
    if (n6573_o)
      n6650_q <= 1'b0;
    else
      n6650_q <= n6401_o;
  /* find_the_damn_issue_sky130.vhd:8332:17  */
  always @(posedge clk or posedge n6573_o)
    if (n6573_o)
      n6651_q <= 1'b0;
    else
      n6651_q <= s_requirecrccheck_or_lineinword_valid_and_rxdataactive_not_and_lineinword_rewired_neq_const_10_and_m_status_rxactive_not_and_m_status_rxactive_delayed1_and_rxdataactive_not;
  /* find_the_damn_issue_sky130.vhd:8332:17  */
  assign n6652_o = n6401_o ? s_unnamed_23 : s_unnamed_11;
  /* find_the_damn_issue_sky130.vhd:8332:17  */
  always @(posedge clk or posedge n6573_o)
    if (n6573_o)
      n6653_q <= 1'b0;
    else
      n6653_q <= n6652_o;
  /* find_the_damn_issue_sky130.vhd:8332:17  */
  always @(posedge clk or posedge n6573_o)
    if (n6573_o)
      n6654_q <= 1'b0;
    else
      n6654_q <= s_m_tx_valid_2;
  /* find_the_damn_issue_sky130.vhd:8332:17  */
  always @(posedge clk or posedge n6573_o)
    if (n6573_o)
      n6655_q <= 1'b0;
    else
      n6655_q <= s_ret_3;
  /* find_the_damn_issue_sky130.vhd:8310:17  */
  assign n6656_o = s_m_crcen_2 ? s_m_match : n6657_q;
  /* find_the_damn_issue_sky130.vhd:8310:17  */
  always @(posedge clk)
    n6657_q <= n6656_o;
endmodule

module scl_fifo_2
  (input  clk,
   input  rst_n,
   input  [4:0] in_m_pushcutoff,
   input  in_m_popvalid,
   input  in_m_popcommit,
   input  in_m_poprollback,
   input  in_m_pushvalid,
   input  [7:0] in_m_pushdata_data,
   input  [3:0] in_m_pushdata_endpoint,
   input  in_unnamed,
   output [7:0] out_m_peekdata_data,
   output [3:0] out_m_peekdata_endpoint,
   output out_m_pushfull,
   output out_m_popempty);
  wire s_m_pushvalid_2;
  wire [4:0] s_put_mux1_minus_m_pushcutoff;
  reg [4:0] s_put;
  wire [3:0] s_unnamed_2;
  wire [11:0] s_unnamed_3;
  reg s_m_pushfull_2;
  wire [4:0] s_pushput;
  wire [4:0] s_getcheckpoint_mux1;
  reg [4:0] s_get;
  reg [4:0] s_getcheckpoint;
  wire [3:0] s_getcheckpoint_mux1_rewired;
  reg s_m_popempty_2;
  wire [4:0] s_popget;
  reg [4:0] s_pushget;
  reg [4:0] s_popput;
  wire [11:0] s_unnamed_4;
  wire s_popput_bit_4_eq_getcheckpoint_mux1_bit_4_and_popput_rewired_eq_getcheckpoint_mux1_rewired;
  wire [4:0] s_get_mux1;
  wire s_unnamed_5;
  wire s_unnamed_6;
  wire [11:0] scl_memory0_out_unnamed_5;
  wire [7:0] n6227_o;
  wire [3:0] n6228_o;
  wire [3:0] n6229_o;
  wire [11:0] n6230_o;
  wire [4:0] n6232_o;
  wire [4:0] n6233_o;
  wire [4:0] n6234_o;
  wire [4:0] n6236_o;
  wire [4:0] n6237_o;
  wire [4:0] n6238_o;
  wire [4:0] n6239_o;
  wire [3:0] n6240_o;
  wire n6242_o;
  wire n6243_o;
  wire n6244_o;
  wire n6251_o;
  wire [3:0] n6253_o;
  wire n6254_o;
  wire n6261_o;
  wire n6262_o;
  wire n6263_o;
  wire n6264_o;
  wire n6266_o;
  wire n6267_o;
  wire n6268_o;
  wire n6275_o;
  wire [3:0] n6277_o;
  wire [3:0] n6278_o;
  wire n6279_o;
  wire n6286_o;
  wire n6287_o;
  wire n6294_o;
  reg [4:0] n6319_q;
  reg n6320_q;
  reg [4:0] n6321_q;
  wire [4:0] n6322_o;
  reg [4:0] n6323_q;
  reg n6324_q;
  reg [4:0] n6325_q;
  reg [4:0] n6326_q;
  assign out_m_peekdata_data = n6227_o;
  assign out_m_peekdata_endpoint = n6228_o;
  assign out_m_pushfull = s_m_pushfull_2;
  assign out_m_popempty = s_m_popempty_2;
  /* find_the_damn_issue_sky130.vhd:207:16  */
  assign s_m_pushvalid_2 = in_m_pushvalid; // (signal)
  /* find_the_damn_issue_sky130.vhd:208:16  */
  assign s_put_mux1_minus_m_pushcutoff = n6234_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:209:16  */
  always @*
    s_put = n6319_q; // (isignal)
  initial
    s_put = 5'b00000;
  /* find_the_damn_issue_sky130.vhd:210:16  */
  assign s_unnamed_2 = n6229_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:211:16  */
  assign s_unnamed_3 = n6230_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:212:16  */
  always @*
    s_m_pushfull_2 = n6320_q; // (isignal)
  initial
    s_m_pushfull_2 = 1'b0;
  /* find_the_damn_issue_sky130.vhd:213:16  */
  assign s_pushput = n6234_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:214:16  */
  assign s_getcheckpoint_mux1 = n6238_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:215:16  */
  always @*
    s_get = n6321_q; // (isignal)
  initial
    s_get = 5'b00000;
  /* find_the_damn_issue_sky130.vhd:216:16  */
  always @*
    s_getcheckpoint = n6323_q; // (isignal)
  initial
    s_getcheckpoint = 5'b00000;
  /* find_the_damn_issue_sky130.vhd:217:16  */
  assign s_getcheckpoint_mux1_rewired = n6240_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:218:16  */
  always @*
    s_m_popempty_2 = n6324_q; // (isignal)
  initial
    s_m_popempty_2 = 1'b1;
  /* find_the_damn_issue_sky130.vhd:219:16  */
  assign s_popget = n6239_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:220:16  */
  always @*
    s_pushget = n6325_q; // (isignal)
  initial
    s_pushget = 5'b00000;
  /* find_the_damn_issue_sky130.vhd:221:16  */
  always @*
    s_popput = n6326_q; // (isignal)
  initial
    s_popput = 5'b00000;
  /* find_the_damn_issue_sky130.vhd:222:16  */
  assign s_unnamed_4 = scl_memory0_out_unnamed_5; // (signal)
  /* find_the_damn_issue_sky130.vhd:223:16  */
  assign s_popput_bit_4_eq_getcheckpoint_mux1_bit_4_and_popput_rewired_eq_getcheckpoint_mux1_rewired = n6262_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:224:16  */
  assign s_get_mux1 = n6237_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:225:16  */
  assign s_unnamed_5 = n6264_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:226:16  */
  assign s_unnamed_6 = n6287_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:228:9  */
  scl_memory_3 scl_memory0 (
    .clk(clk),
    .in_unnamed(s_m_pushvalid_2),
    .in_unnamed_2(s_unnamed_2),
    .in_unnamed_3(s_unnamed_3),
    .in_unnamed_4(s_getcheckpoint_mux1_rewired),
    .out_unnamed_5(scl_memory0_out_unnamed_5));
  /* find_the_damn_issue_sky130.vhd:258:51  */
  assign n6227_o = s_unnamed_4[7:0];
  /* find_the_damn_issue_sky130.vhd:261:55  */
  assign n6228_o = s_unnamed_4[11:8];
  /* find_the_damn_issue_sky130.vhd:269:37  */
  assign n6229_o = s_put[3:0];
  /* find_the_damn_issue_sky130.vhd:270:55  */
  assign n6230_o = {in_m_pushdata_endpoint, in_m_pushdata_data};
  /* find_the_damn_issue_sky130.vhd:272:46  */
  assign n6232_o = s_put + 5'b00001;
  /* find_the_damn_issue_sky130.vhd:271:17  */
  assign n6233_o = s_m_pushvalid_2 ? n6232_o : s_put;
  /* find_the_damn_issue_sky130.vhd:276:62  */
  assign n6234_o = n6233_o - in_m_pushcutoff;
  /* find_the_damn_issue_sky130.vhd:285:46  */
  assign n6236_o = s_get + 5'b00001;
  /* find_the_damn_issue_sky130.vhd:284:17  */
  assign n6237_o = in_m_popvalid ? n6236_o : s_get;
  /* find_the_damn_issue_sky130.vhd:292:17  */
  assign n6238_o = in_m_poprollback ? s_getcheckpoint : s_get_mux1;
  /* find_the_damn_issue_sky130.vhd:299:17  */
  assign n6239_o = in_m_popcommit ? n6238_o : s_getcheckpoint;
  /* find_the_damn_issue_sky130.vhd:304:71  */
  assign n6240_o = n6238_o[3:0];
  /* find_the_damn_issue_sky130.vhd:306:135  */
  assign n6242_o = s_popput[4];
  /* find_the_damn_issue_sky130.vhd:306:163  */
  assign n6243_o = n6238_o[4];
  /* find_the_damn_issue_sky130.vhd:306:139  */
  assign n6244_o = n6242_o == n6243_o;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n6251_o = n6244_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:306:194  */
  assign n6253_o = s_popput[3:0];
  /* find_the_damn_issue_sky130.vhd:306:207  */
  assign n6254_o = n6253_o == s_getcheckpoint_mux1_rewired;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n6261_o = n6254_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:306:168  */
  assign n6262_o = n6251_o & n6261_o;
  /* find_the_damn_issue_sky130.vhd:307:50  */
  assign n6263_o = ~in_m_poprollback;
  /* find_the_damn_issue_sky130.vhd:307:44  */
  assign n6264_o = in_unnamed & n6263_o;
  /* find_the_damn_issue_sky130.vhd:309:78  */
  assign n6266_o = n6234_o[4];
  /* find_the_damn_issue_sky130.vhd:309:94  */
  assign n6267_o = s_pushget[4];
  /* find_the_damn_issue_sky130.vhd:309:82  */
  assign n6268_o = n6266_o != n6267_o;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n6275_o = n6268_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:309:148  */
  assign n6277_o = n6234_o[3:0];
  /* find_the_damn_issue_sky130.vhd:309:172  */
  assign n6278_o = s_pushget[3:0];
  /* find_the_damn_issue_sky130.vhd:309:161  */
  assign n6279_o = n6277_o == n6278_o;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n6286_o = n6279_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:309:99  */
  assign n6287_o = n6275_o & n6286_o;
  /* find_the_damn_issue_sky130.vhd:314:27  */
  assign n6294_o = ~rst_n;
  /* find_the_damn_issue_sky130.vhd:322:17  */
  always @(posedge clk or posedge n6294_o)
    if (n6294_o)
      n6319_q <= 5'b00000;
    else
      n6319_q <= s_put_mux1_minus_m_pushcutoff;
  /* find_the_damn_issue_sky130.vhd:322:17  */
  always @(posedge clk or posedge n6294_o)
    if (n6294_o)
      n6320_q <= 1'b0;
    else
      n6320_q <= s_unnamed_6;
  /* find_the_damn_issue_sky130.vhd:322:17  */
  always @(posedge clk or posedge n6294_o)
    if (n6294_o)
      n6321_q <= 5'b00000;
    else
      n6321_q <= s_getcheckpoint_mux1;
  /* find_the_damn_issue_sky130.vhd:322:17  */
  assign n6322_o = s_unnamed_5 ? s_get_mux1 : s_getcheckpoint;
  /* find_the_damn_issue_sky130.vhd:322:17  */
  always @(posedge clk or posedge n6294_o)
    if (n6294_o)
      n6323_q <= 5'b00000;
    else
      n6323_q <= n6322_o;
  /* find_the_damn_issue_sky130.vhd:322:17  */
  always @(posedge clk or posedge n6294_o)
    if (n6294_o)
      n6324_q <= 1'b1;
    else
      n6324_q <= s_popput_bit_4_eq_getcheckpoint_mux1_bit_4_and_popput_rewired_eq_getcheckpoint_mux1_rewired;
  /* find_the_damn_issue_sky130.vhd:322:17  */
  always @(posedge clk or posedge n6294_o)
    if (n6294_o)
      n6325_q <= 5'b00000;
    else
      n6325_q <= s_popget;
  /* find_the_damn_issue_sky130.vhd:322:17  */
  always @(posedge clk or posedge n6294_o)
    if (n6294_o)
      n6326_q <= 5'b00000;
    else
      n6326_q <= s_pushput;
endmodule

module scl_streamarbiter
  (input  clk,
   input  rst_n,
   input  in_unnamed,
   input  in_m_in1_stream_valid,
   input  [7:0] in_m_in1_stream,
   input  in_m_in0_stream_valid,
   input  [7:0] in_m_in0_stream,
   input  in_m_out_ready,
   output out_const_0_mux1,
   output out_m_out_valid,
   output [7:0] out_m_out);
  reg s_locked;
  reg s_unnamed_delayed1;
  reg s_unnamed_or_m_out_valid_not_delayed1;
  wire s_unnamed_2;
  wire s_locked_not_and_unnamed_or_m_out_valid_not_delayed1;
  wire s_unnamed_or_m_out_valid_not;
  wire s_locked_or_m_out_valid_and_unnamed_and_m_out_valid_not;
  wire n6144_o;
  wire n6145_o;
  wire n6146_o;
  wire n6148_o;
  localparam [8:0] n6149_o = 9'bX;
  wire [7:0] n6150_o;
  wire [7:0] n6151_o;
  wire n6153_o;
  wire n6155_o;
  wire n6157_o;
  wire [7:0] n6158_o;
  wire n6160_o;
  wire n6161_o;
  wire n6163_o;
  wire n6165_o;
  wire n6166_o;
  wire n6167_o;
  wire n6168_o;
  wire n6169_o;
  wire n6170_o;
  wire n6171_o;
  wire n6179_o;
  reg n6192_q;
  wire n6193_o;
  reg n6194_q;
  reg n6195_q;
  assign out_const_0_mux1 = n6165_o;
  assign out_m_out_valid = n6161_o;
  assign out_m_out = n6158_o;
  /* find_the_damn_issue_sky130.vhd:371:16  */
  always @*
    s_locked = n6192_q; // (isignal)
  initial
    s_locked = 1'b0;
  /* find_the_damn_issue_sky130.vhd:372:16  */
  always @*
    s_unnamed_delayed1 = n6194_q; // (isignal)
  initial
    s_unnamed_delayed1 = 1'b0;
  /* find_the_damn_issue_sky130.vhd:373:16  */
  always @*
    s_unnamed_or_m_out_valid_not_delayed1 = n6195_q; // (isignal)
  initial
    s_unnamed_or_m_out_valid_not_delayed1 = 1'b1;
  /* find_the_damn_issue_sky130.vhd:374:16  */
  assign s_unnamed_2 = in_unnamed; // (signal)
  /* find_the_damn_issue_sky130.vhd:375:16  */
  assign s_locked_not_and_unnamed_or_m_out_valid_not_delayed1 = n6145_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:376:16  */
  assign s_unnamed_or_m_out_valid_not = n6167_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:377:16  */
  assign s_locked_or_m_out_valid_and_unnamed_and_m_out_valid_not = n6171_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:404:76  */
  assign n6144_o = ~s_locked;
  /* find_the_damn_issue_sky130.vhd:404:90  */
  assign n6145_o = n6144_o & s_unnamed_or_m_out_valid_not_delayed1;
  /* find_the_damn_issue_sky130.vhd:405:17  */
  assign n6146_o = s_locked_not_and_unnamed_or_m_out_valid_not_delayed1 ? s_unnamed_2 : s_unnamed_delayed1;
  /* find_the_damn_issue_sky130.vhd:411:34  */
  assign n6148_o = n6146_o == 1'b0;
  /* find_the_damn_issue_sky130.vhd:414:65  */
  assign n6150_o = n6149_o[7:0];
  /* find_the_damn_issue_sky130.vhd:411:17  */
  assign n6151_o = n6148_o ? in_m_in0_stream : n6150_o;
  /* find_the_damn_issue_sky130.vhd:416:34  */
  assign n6153_o = n6146_o == 1'b0;
  /* find_the_damn_issue_sky130.vhd:416:17  */
  assign n6155_o = n6153_o ? in_m_in0_stream_valid : 1'b0;
  /* find_the_damn_issue_sky130.vhd:421:34  */
  assign n6157_o = n6146_o == 1'b1;
  /* find_the_damn_issue_sky130.vhd:421:17  */
  assign n6158_o = n6157_o ? in_m_in1_stream : n6151_o;
  /* find_the_damn_issue_sky130.vhd:426:34  */
  assign n6160_o = n6146_o == 1'b1;
  /* find_the_damn_issue_sky130.vhd:426:17  */
  assign n6161_o = n6160_o ? in_m_in1_stream_valid : n6155_o;
  /* find_the_damn_issue_sky130.vhd:431:34  */
  assign n6163_o = n6146_o == 1'b1;
  /* find_the_damn_issue_sky130.vhd:431:17  */
  assign n6165_o = n6163_o ? in_m_out_ready : 1'b0;
  /* find_the_damn_issue_sky130.vhd:438:70  */
  assign n6166_o = ~n6161_o;
  /* find_the_damn_issue_sky130.vhd:438:65  */
  assign n6167_o = in_m_out_ready | n6166_o;
  /* find_the_damn_issue_sky130.vhd:439:107  */
  assign n6168_o = n6161_o & in_m_out_ready;
  /* find_the_damn_issue_sky130.vhd:439:87  */
  assign n6169_o = s_locked | n6168_o;
  /* find_the_damn_issue_sky130.vhd:439:134  */
  assign n6170_o = ~n6161_o;
  /* find_the_damn_issue_sky130.vhd:439:128  */
  assign n6171_o = n6169_o & n6170_o;
  /* find_the_damn_issue_sky130.vhd:444:27  */
  assign n6179_o = ~rst_n;
  /* find_the_damn_issue_sky130.vhd:448:17  */
  always @(posedge clk or posedge n6179_o)
    if (n6179_o)
      n6192_q <= 1'b0;
    else
      n6192_q <= s_locked_or_m_out_valid_and_unnamed_and_m_out_valid_not;
  /* find_the_damn_issue_sky130.vhd:448:17  */
  assign n6193_o = s_locked_not_and_unnamed_or_m_out_valid_not_delayed1 ? s_unnamed_2 : s_unnamed_delayed1;
  /* find_the_damn_issue_sky130.vhd:448:17  */
  always @(posedge clk or posedge n6179_o)
    if (n6179_o)
      n6194_q <= 1'b0;
    else
      n6194_q <= n6193_o;
  /* find_the_damn_issue_sky130.vhd:448:17  */
  always @(posedge clk or posedge n6179_o)
    if (n6179_o)
      n6195_q <= 1'b1;
    else
      n6195_q <= s_unnamed_or_m_out_valid_not;
endmodule

module scl_uartrx
  (input  clk,
   input  rst_n,
   input  [23:0] in_baudrate,
   input  in_rx,
   output out_out_valid,
   output [7:0] out_out);
  wire s_rx_2;
  wire s_out_2;
  wire [1:0] s_start_mux5;
  reg [1:0] s_state;
  reg s_rx_delayed1;
  wire s_settohalf;
  wire s_unnamed;
  wire [2:0] s_m_value;
  wire s_m_last;
  wire s_out_valid_2;
  wire [7:0] s_out_3;
  wire [7:0] s_rx_out_rewired_mux1;
  wire s_baud_and_state_eq_data;
  wire s_const_0_mux1;
  wire s_state_eq_wait;
  wire scl_baudrategenerator0_out_out;
  wire n5991_o;
  wire n5998_o;
  wire n5999_o;
  wire [6:0] n6000_o;
  wire [7:0] n6001_o;
  wire n6003_o;
  wire [5:0] n6004_o;
  wire [6:0] n6005_o;
  wire n6006_o;
  wire [7:0] n6007_o;
  wire n6009_o;
  wire [4:0] n6010_o;
  wire [5:0] n6011_o;
  wire [1:0] n6012_o;
  wire [7:0] n6013_o;
  wire n6015_o;
  wire [3:0] n6016_o;
  wire [4:0] n6017_o;
  wire [2:0] n6018_o;
  wire [7:0] n6019_o;
  wire n6021_o;
  wire [2:0] n6022_o;
  wire [3:0] n6023_o;
  wire [3:0] n6024_o;
  wire [7:0] n6025_o;
  wire n6027_o;
  wire [1:0] n6028_o;
  wire [2:0] n6029_o;
  wire [4:0] n6030_o;
  wire [7:0] n6031_o;
  wire n6033_o;
  wire n6034_o;
  wire [1:0] n6035_o;
  wire [5:0] n6036_o;
  wire [7:0] n6037_o;
  wire n6039_o;
  wire [6:0] n6040_o;
  wire [7:0] n6041_o;
  wire n6043_o;
  wire [7:0] n6044_o;
  reg [7:0] n6046_o;
  wire n6047_o;
  wire n6050_o;
  wire n6053_o;
  wire n6060_o;
  wire n6061_o;
  wire n6062_o;
  wire n6063_o;
  wire n6066_o;
  wire n6067_o;
  wire n6068_o;
  wire n6069_o;
  wire [1:0] n6071_o;
  wire n6072_o;
  wire n6074_o;
  wire n6075_o;
  wire n6076_o;
  wire [1:0] n6078_o;
  wire n6079_o;
  wire n6080_o;
  wire n6082_o;
  wire n6083_o;
  wire n6084_o;
  wire [1:0] n6086_o;
  wire [1:0] n6088_o;
  wire n6090_o;
  wire n6091_o;
  wire n6092_o;
  wire [1:0] n6094_o;
  wire n6105_o;
  wire [2:0] scl_counter0_out_m_value;
  wire scl_counter0_out_m_last;
  reg [1:0] n6117_q;
  wire n6118_o;
  reg n6119_q;
  reg n6120_q;
  wire [7:0] n6121_o;
  reg [7:0] n6122_q;
  assign out_out_valid = s_out_valid_2;
  assign out_out = s_out_3;
  /* find_the_damn_issue_sky130.vhd:617:16  */
  assign s_rx_2 = in_rx; // (signal)
  /* find_the_damn_issue_sky130.vhd:618:16  */
  assign s_out_2 = scl_baudrategenerator0_out_out; // (signal)
  /* find_the_damn_issue_sky130.vhd:619:16  */
  assign s_start_mux5 = n6094_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:620:16  */
  always @*
    s_state = n6117_q; // (isignal)
  initial
    s_state = 2'b00;
  /* find_the_damn_issue_sky130.vhd:621:16  */
  always @*
    s_rx_delayed1 = n6119_q; // (isignal)
  initial
    s_rx_delayed1 = 1'b0;
  /* find_the_damn_issue_sky130.vhd:622:16  */
  assign s_settohalf = n6066_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:623:16  */
  assign s_unnamed = n5999_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:624:16  */
  assign s_m_value = scl_counter0_out_m_value; // (signal)
  /* find_the_damn_issue_sky130.vhd:625:16  */
  assign s_m_last = scl_counter0_out_m_last; // (signal)
  /* find_the_damn_issue_sky130.vhd:626:16  */
  assign s_out_valid_2 = n6120_q; // (signal)
  /* find_the_damn_issue_sky130.vhd:627:16  */
  assign s_out_3 = n6122_q; // (signal)
  /* find_the_damn_issue_sky130.vhd:628:16  */
  assign s_rx_out_rewired_mux1 = n6046_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:629:16  */
  assign s_baud_and_state_eq_data = s_unnamed; // (signal)
  /* find_the_damn_issue_sky130.vhd:630:16  */
  assign s_const_0_mux1 = n6050_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:631:16  */
  assign s_state_eq_wait = n6060_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:633:9  */
  scl_baudrategenerator_2 scl_baudrategenerator0 (
    .clk(clk),
    .rst_n(rst_n),
    .in_baudrate(in_baudrate),
    .in_settohalf(s_settohalf),
    .out_out(scl_baudrategenerator0_out_out));
  /* find_the_damn_issue_sky130.vhd:665:64  */
  assign n5991_o = s_state == 2'b10;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n5998_o = n5991_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:665:38  */
  assign n5999_o = s_out_2 & n5998_o;
  /* find_the_damn_issue_sky130.vhd:669:72  */
  assign n6000_o = s_out_3[7:1];
  /* find_the_damn_issue_sky130.vhd:669:85  */
  assign n6001_o = {n6000_o, s_rx_2};
  /* find_the_damn_issue_sky130.vhd:669:25  */
  assign n6003_o = s_m_value == 3'b000;
  /* find_the_damn_issue_sky130.vhd:670:72  */
  assign n6004_o = s_out_3[7:2];
  /* find_the_damn_issue_sky130.vhd:670:85  */
  assign n6005_o = {n6004_o, s_rx_2};
  /* find_the_damn_issue_sky130.vhd:670:103  */
  assign n6006_o = s_out_3[0];
  /* find_the_damn_issue_sky130.vhd:670:94  */
  assign n6007_o = {n6005_o, n6006_o};
  /* find_the_damn_issue_sky130.vhd:670:25  */
  assign n6009_o = s_m_value == 3'b001;
  /* find_the_damn_issue_sky130.vhd:671:72  */
  assign n6010_o = s_out_3[7:3];
  /* find_the_damn_issue_sky130.vhd:671:85  */
  assign n6011_o = {n6010_o, s_rx_2};
  /* find_the_damn_issue_sky130.vhd:671:103  */
  assign n6012_o = s_out_3[1:0];
  /* find_the_damn_issue_sky130.vhd:671:94  */
  assign n6013_o = {n6011_o, n6012_o};
  /* find_the_damn_issue_sky130.vhd:671:25  */
  assign n6015_o = s_m_value == 3'b010;
  /* find_the_damn_issue_sky130.vhd:672:72  */
  assign n6016_o = s_out_3[7:4];
  /* find_the_damn_issue_sky130.vhd:672:85  */
  assign n6017_o = {n6016_o, s_rx_2};
  /* find_the_damn_issue_sky130.vhd:672:103  */
  assign n6018_o = s_out_3[2:0];
  /* find_the_damn_issue_sky130.vhd:672:94  */
  assign n6019_o = {n6017_o, n6018_o};
  /* find_the_damn_issue_sky130.vhd:672:25  */
  assign n6021_o = s_m_value == 3'b011;
  /* find_the_damn_issue_sky130.vhd:673:72  */
  assign n6022_o = s_out_3[7:5];
  /* find_the_damn_issue_sky130.vhd:673:85  */
  assign n6023_o = {n6022_o, s_rx_2};
  /* find_the_damn_issue_sky130.vhd:673:103  */
  assign n6024_o = s_out_3[3:0];
  /* find_the_damn_issue_sky130.vhd:673:94  */
  assign n6025_o = {n6023_o, n6024_o};
  /* find_the_damn_issue_sky130.vhd:673:25  */
  assign n6027_o = s_m_value == 3'b100;
  /* find_the_damn_issue_sky130.vhd:674:72  */
  assign n6028_o = s_out_3[7:6];
  /* find_the_damn_issue_sky130.vhd:674:85  */
  assign n6029_o = {n6028_o, s_rx_2};
  /* find_the_damn_issue_sky130.vhd:674:103  */
  assign n6030_o = s_out_3[4:0];
  /* find_the_damn_issue_sky130.vhd:674:94  */
  assign n6031_o = {n6029_o, n6030_o};
  /* find_the_damn_issue_sky130.vhd:674:25  */
  assign n6033_o = s_m_value == 3'b101;
  /* find_the_damn_issue_sky130.vhd:675:72  */
  assign n6034_o = s_out_3[7];
  /* find_the_damn_issue_sky130.vhd:675:85  */
  assign n6035_o = {n6034_o, s_rx_2};
  /* find_the_damn_issue_sky130.vhd:675:103  */
  assign n6036_o = s_out_3[5:0];
  /* find_the_damn_issue_sky130.vhd:675:94  */
  assign n6037_o = {n6035_o, n6036_o};
  /* find_the_damn_issue_sky130.vhd:675:25  */
  assign n6039_o = s_m_value == 3'b110;
  /* find_the_damn_issue_sky130.vhd:676:81  */
  assign n6040_o = s_out_3[6:0];
  /* find_the_damn_issue_sky130.vhd:676:72  */
  assign n6041_o = {s_rx_2, n6040_o};
  /* find_the_damn_issue_sky130.vhd:676:25  */
  assign n6043_o = s_m_value == 3'b111;
  assign n6044_o = {n6043_o, n6039_o, n6033_o, n6027_o, n6021_o, n6015_o, n6009_o, n6003_o};
  /* find_the_damn_issue_sky130.vhd:668:17  */
  always @*
    case (n6044_o)
      8'b10000000: n6046_o = n6041_o;
      8'b01000000: n6046_o = n6037_o;
      8'b00100000: n6046_o = n6031_o;
      8'b00010000: n6046_o = n6025_o;
      8'b00001000: n6046_o = n6019_o;
      8'b00000100: n6046_o = n6013_o;
      8'b00000010: n6046_o = n6007_o;
      8'b00000001: n6046_o = n6001_o;
      default: n6046_o = 8'bX;
    endcase
  /* find_the_damn_issue_sky130.vhd:681:56  */
  assign n6047_o = s_m_last & s_baud_and_state_eq_data;
  /* find_the_damn_issue_sky130.vhd:682:17  */
  assign n6050_o = n6047_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:688:58  */
  assign n6053_o = s_state == 2'b00;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n6060_o = n6053_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:689:24  */
  assign n6061_o = ~s_rx_2;
  /* find_the_damn_issue_sky130.vhd:689:42  */
  assign n6062_o = n6061_o & s_rx_delayed1;
  /* find_the_damn_issue_sky130.vhd:689:67  */
  assign n6063_o = n6062_o & s_state_eq_wait;
  /* find_the_damn_issue_sky130.vhd:689:17  */
  assign n6066_o = n6063_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:694:24  */
  assign n6067_o = ~s_rx_2;
  /* find_the_damn_issue_sky130.vhd:694:42  */
  assign n6068_o = n6067_o & s_rx_delayed1;
  /* find_the_damn_issue_sky130.vhd:694:67  */
  assign n6069_o = n6068_o & s_state_eq_wait;
  /* find_the_damn_issue_sky130.vhd:694:17  */
  assign n6071_o = n6069_o ? 2'b01 : s_state;
  /* find_the_damn_issue_sky130.vhd:699:23  */
  assign n6072_o = ~s_rx_2;
  /* find_the_damn_issue_sky130.vhd:699:72  */
  assign n6074_o = s_state == 2'b01;
  /* find_the_damn_issue_sky130.vhd:699:59  */
  assign n6075_o = s_out_2 & n6074_o;
  /* find_the_damn_issue_sky130.vhd:699:41  */
  assign n6076_o = n6072_o & n6075_o;
  /* find_the_damn_issue_sky130.vhd:699:17  */
  assign n6078_o = n6076_o ? 2'b10 : n6071_o;
  /* find_the_damn_issue_sky130.vhd:704:29  */
  assign n6079_o = ~s_rx_2;
  /* find_the_damn_issue_sky130.vhd:704:23  */
  assign n6080_o = ~n6079_o;
  /* find_the_damn_issue_sky130.vhd:704:79  */
  assign n6082_o = s_state == 2'b01;
  /* find_the_damn_issue_sky130.vhd:704:66  */
  assign n6083_o = s_out_2 & n6082_o;
  /* find_the_damn_issue_sky130.vhd:704:48  */
  assign n6084_o = n6080_o & n6083_o;
  /* find_the_damn_issue_sky130.vhd:704:17  */
  assign n6086_o = n6084_o ? 2'b00 : n6078_o;
  /* find_the_damn_issue_sky130.vhd:709:17  */
  assign n6088_o = n6047_o ? 2'b11 : n6086_o;
  /* find_the_damn_issue_sky130.vhd:714:65  */
  assign n6090_o = s_state == 2'b11;
  /* find_the_damn_issue_sky130.vhd:714:52  */
  assign n6091_o = s_out_2 & n6090_o;
  /* find_the_damn_issue_sky130.vhd:714:34  */
  assign n6092_o = s_rx_2 & n6091_o;
  /* find_the_damn_issue_sky130.vhd:714:17  */
  assign n6094_o = n6092_o ? 2'b00 : n6088_o;
  /* find_the_damn_issue_sky130.vhd:735:27  */
  assign n6105_o = ~rst_n;
  /* find_the_damn_issue_sky130.vhd:746:9  */
  scl_counter_16 scl_counter0 (
    .clk(clk),
    .rst_n(rst_n),
    .in_unnamed(s_unnamed),
    .out_m_value(scl_counter0_out_m_value),
    .out_m_last(scl_counter0_out_m_last));
  /* find_the_damn_issue_sky130.vhd:738:17  */
  always @(posedge clk or posedge n6105_o)
    if (n6105_o)
      n6117_q <= 2'b00;
    else
      n6117_q <= s_start_mux5;
  /* find_the_damn_issue_sky130.vhd:738:17  */
  assign n6118_o = s_state_eq_wait ? s_rx_2 : s_rx_delayed1;
  /* find_the_damn_issue_sky130.vhd:738:17  */
  always @(posedge clk or posedge n6105_o)
    if (n6105_o)
      n6119_q <= 1'b0;
    else
      n6119_q <= n6118_o;
  /* find_the_damn_issue_sky130.vhd:725:17  */
  always @(posedge clk)
    n6120_q <= s_const_0_mux1;
  /* find_the_damn_issue_sky130.vhd:725:17  */
  assign n6121_o = s_baud_and_state_eq_data ? s_rx_out_rewired_mux1 : s_out_3;
  /* find_the_damn_issue_sky130.vhd:725:17  */
  always @(posedge clk)
    n6122_q <= n6121_o;
endmodule

module scl_bitbangengine
  (input  clk,
   input  rst_n,
   input  in_command_ready,
   input  in_command_valid,
   input  [7:0] in_command,
   input  in_unnamed,
   input  in_unnamed_2,
   input  in_unnamed_3,
   input  in_unnamed_4,
   input  in_unnamed_5,
   input  in_unnamed_6,
   input  in_unnamed_7,
   input  in_unnamed_8,
   input  in_unnamed_9,
   input  in_unnamed_10,
   input  in_unnamed_11,
   input  in_unnamed_12,
   input  in_unnamed_13,
   input  in_unnamed_14,
   input  in_unnamed_15,
   output out_const_0_mux13,
   output out_m_io0_out,
   output out_m_io0_en,
   output out_m_io0_opendrain,
   output out_m_io1_out,
   output out_m_io1_en,
   output out_m_io1_opendrain,
   output out_m_io2_out,
   output out_m_io2_en,
   output out_m_io2_opendrain,
   output out_m_io3_out,
   output out_m_io3_en,
   output out_m_io3_opendrain,
   output out_m_io4_out,
   output out_m_io4_en,
   output out_m_io4_opendrain,
   output out_m_io5_out,
   output out_m_io5_en,
   output out_m_io5_opendrain,
   output out_m_io8_out,
   output out_m_io9_out,
   output out_m_io10_out,
   output out_m_io11_out,
   output out_m_io12_out,
   output out_m_io13_out,
   output out_m_io14_out,
   output out_m_io15_out,
   output out_out_ready,
   output out_out_valid,
   output [7:0] out_out);
  wire [3:0] s_followupstate_mux1;
  reg [3:0] s_state;
  wire [3:0] s_clock_setup_mux3;
  reg [3:0] s_followupstate;
  wire s_m_last;
  wire s_tick;
  wire s_command_bit_7_not_and_state_eq_idle_and_command_valid_and_unnamed;
  wire s_command_rewired_eq_const_0_and_command_bit_7_not_not_and_state_eq_idle_and_command_valid_and_unnamed;
  wire s_command_rewired_eq_const_10_and_command_rewired_eq_const_0_or_command_bit_7_not_not_not_not_and_state_eq_idle_and_command_valid_and_unnamed;
  wire s_command_rewired_eq_const_110_and_unnamed_not_and_state_eq_idle_and_command_valid_and_unnamed;
  wire s_config_targetpingroup;
  wire s_config_stopclocksignal;
  wire s_config_stopclockonsignal;
  wire s_config_stopclockonlastbit;
  wire s_config_tmsoutmode;
  reg s_config_idleclockstate;
  reg s_config_dataloopback;
  wire s_config_shiftin;
  wire s_config_shiftout;
  reg s_config_clockthreephase;
  wire s_config_msbfirst;
  wire s_config_captureedge;
  wire s_config_clockdelay;
  wire s_const_0_eq_config_targetpingroup_and_state_eq_write_out_and_command_valid;
  wire s_const_0_eq_config_targetpingroup_and_state_eq_write_out_and_command_valid_2;
  wire s_const_1_eq_config_targetpingroup_and_state_eq_write_out_and_command_valid;
  wire s_const_1_eq_config_targetpingroup_and_state_eq_write_out_and_command_valid_2;
  wire s_const_1_eq_config_targetpingroup_and_state_eq_write_out_and_command_valid_3;
  wire s_const_1_eq_config_targetpingroup_and_state_eq_write_out_and_command_valid_4;
  wire s_const_1_eq_config_targetpingroup_and_state_eq_write_out_and_command_valid_5;
  wire s_const_1_eq_config_targetpingroup_and_state_eq_write_out_and_command_valid_6;
  wire s_const_1_eq_config_targetpingroup_and_state_eq_write_out_and_command_valid_7;
  wire s_const_1_eq_config_targetpingroup_and_state_eq_write_out_and_command_valid_8;
  wire s_const_0_eq_config_targetpingroup_and_state_eq_write_en_and_command_valid;
  wire s_const_0_eq_config_targetpingroup_and_state_eq_write_en_and_command_valid_2;
  wire s_const_0_eq_config_targetpingroup_and_state_eq_write_en_and_command_valid_3;
  wire s_const_0_eq_config_targetpingroup_and_state_eq_write_en_and_command_valid_4;
  wire s_const_0_eq_config_targetpingroup_and_state_eq_write_en_and_command_valid_5;
  wire s_const_0_eq_config_targetpingroup_and_state_eq_write_en_and_command_valid_6;
  wire s_carryin_mux2;
  reg s_carryin;
  wire [19:0] s_bitlength;
  reg [16:0] s_clockdiv;
  wire [16:0] s_clockdiv_2;
  reg s_toggleclockdelayed;
  wire s_toggleclock;
  wire s_setupedge;
  wire s_captureedge;
  wire [2:0] s_m_value;
  wire s_const_0;
  wire s_unnamed_16;
  wire [2:0] s_unnamed_17;
  wire [7:0] s_capturebuffer_mux1_unnamed_mux1_rewired_mux2;
  reg [7:0] s_capturebuffer;
  wire [2:0] s_m_value_2;
  wire s_const_0_2;
  wire s_unnamed_18;
  wire [2:0] s_unnamed_19;
  reg s_m_io0_out_2;
  reg s_m_io0_en_2;
  reg s_m_io0_opendrain_2;
  reg s_m_io1_out_2;
  reg s_m_io1_en_2;
  reg s_m_io1_opendrain_2;
  reg s_m_io2_out_2;
  reg s_m_io2_en_2;
  reg s_m_io2_opendrain_2;
  reg s_m_io3_out_2;
  reg s_m_io3_en_2;
  reg s_m_io3_opendrain_2;
  reg s_m_io4_out_2;
  reg s_m_io4_en_2;
  reg s_m_io4_opendrain_2;
  reg s_m_io5_out_2;
  reg s_m_io5_en_2;
  reg s_m_io5_opendrain_2;
  reg s_m_io8_out_2;
  reg s_m_io9_out_2;
  reg s_m_io10_out_2;
  reg s_m_io11_out_2;
  reg s_m_io12_out_2;
  reg s_m_io13_out_2;
  reg s_m_io14_out_2;
  reg s_m_io15_out_2;
  wire s_command_bit_7;
  wire s_command_bit_6;
  wire s_command_bit_5;
  wire s_command_bit_4;
  wire s_command_bit_3;
  wire s_command_bit_2;
  wire s_command_bit_1;
  wire s_command_bit_0;
  wire s_command_bit_5_2;
  wire s_state_eq_load_low_and_command_valid;
  wire s_command_bit_5_3;
  wire s_command_bit_5_4;
  wire s_command_bit_4_2;
  wire s_command_bit_4_3;
  wire s_m_io4_out_mux2;
  wire s_command_bit_3_2;
  wire s_command_bit_3_3;
  wire s_m_io3_out_mux2_xor_toggleclockdelayed_mux2;
  wire s_command_bit_2_2;
  wire s_command_bit_2_3;
  wire s_m_io2_out_mux2;
  wire s_command_bit_1_2;
  wire s_command_bit_1_3;
  wire s_command_bit_0_mux3;
  wire s_command_bit_0_2;
  wire s_command_bit_0_3;
  wire s_m_io0_out_mux2;
  wire [2:0] s_const_xxx;
  wire [2:0] s_const_xxx_2;
  wire [16:0] s_clockdiv_mux1_cmdinc_rewired_mux1;
  wire [19:0] s_cmdinc_bitlength_mux2_rewired_mux1_cmdinc_rewired_mux1_cmdinc_rewired_mux1;
  wire s_command_bit_3_4;
  wire s_config_clockdelay_mux2;
  wire s_command_bit_0_neq_command_bit_2;
  wire s_command_bit_3_not;
  wire s_command_bit_0_not;
  wire s_config_shiftout_mux2;
  wire s_config_shiftin_mux2;
  wire s_command_bit_0_not_2;
  wire s_config_tmsoutmode_mux2;
  wire s_config_stopclockonlastbit_mux3;
  wire s_config_stopclockonsignal_mux3;
  wire s_config_stopclocksignal_mux3;
  wire s_command_bit_1_4;
  wire scl_counter0_out_m_last;
  wire n3167_o;
  wire n3168_o;
  wire n3169_o;
  wire n3172_o;
  wire n3174_o;
  wire n3175_o;
  wire n3176_o;
  wire [3:0] n3178_o;
  wire n3179_o;
  wire n3180_o;
  wire n3183_o;
  wire n3190_o;
  wire n3191_o;
  wire n3192_o;
  wire n3193_o;
  wire [3:0] n3195_o;
  wire [3:0] n3197_o;
  wire n3198_o;
  wire n3199_o;
  wire [3:0] n3201_o;
  wire [4:0] n3203_o;
  wire n3205_o;
  wire n3212_o;
  wire n3213_o;
  wire n3214_o;
  wire n3215_o;
  wire n3218_o;
  wire n3225_o;
  wire n3226_o;
  wire n3227_o;
  wire n3228_o;
  wire n3229_o;
  wire n3230_o;
  wire n3231_o;
  wire [7:0] n3234_o;
  wire n3235_o;
  wire n3236_o;
  wire n3239_o;
  wire n3240_o;
  wire n3241_o;
  wire n3242_o;
  wire [3:0] n3244_o;
  wire n3246_o;
  wire n3247_o;
  wire n3248_o;
  wire n3250_o;
  wire n3252_o;
  wire n3253_o;
  wire n3254_o;
  wire n3256_o;
  wire n3257_o;
  wire n3258_o;
  wire n3259_o;
  wire n3260_o;
  wire n3262_o;
  wire n3263_o;
  wire n3264_o;
  wire n3266_o;
  wire n3267_o;
  wire n3268_o;
  wire n3270_o;
  wire n3271_o;
  wire n3272_o;
  wire n3274_o;
  wire n3275_o;
  wire n3276_o;
  wire n3278_o;
  wire n3279_o;
  wire n3280_o;
  wire n3282_o;
  wire n3284_o;
  wire n3285_o;
  wire n3286_o;
  wire n3288_o;
  wire n3289_o;
  wire n3292_o;
  wire n3299_o;
  wire n3302_o;
  wire n3309_o;
  wire n3310_o;
  wire n3311_o;
  wire n3314_o;
  wire n3321_o;
  wire n3324_o;
  wire n3331_o;
  wire n3332_o;
  wire n3333_o;
  wire n3336_o;
  wire n3343_o;
  wire n3346_o;
  wire n3353_o;
  wire n3354_o;
  wire n3355_o;
  wire n3358_o;
  wire n3365_o;
  wire n3368_o;
  wire n3375_o;
  wire n3376_o;
  wire n3377_o;
  wire n3380_o;
  wire n3387_o;
  wire n3390_o;
  wire n3397_o;
  wire n3398_o;
  wire n3399_o;
  wire n3402_o;
  wire n3409_o;
  wire n3412_o;
  wire n3419_o;
  wire n3420_o;
  wire n3421_o;
  wire n3424_o;
  wire n3431_o;
  wire n3434_o;
  wire n3441_o;
  wire n3442_o;
  wire n3443_o;
  wire n3446_o;
  wire n3453_o;
  wire n3456_o;
  wire n3463_o;
  wire n3464_o;
  wire n3465_o;
  wire n3468_o;
  wire n3475_o;
  wire n3478_o;
  wire n3485_o;
  wire n3486_o;
  wire n3487_o;
  wire n3490_o;
  wire n3497_o;
  wire n3500_o;
  wire n3507_o;
  wire n3508_o;
  wire n3509_o;
  wire n3512_o;
  wire n3519_o;
  wire n3522_o;
  wire n3529_o;
  wire n3530_o;
  wire n3531_o;
  wire n3534_o;
  wire n3541_o;
  wire n3544_o;
  wire n3551_o;
  wire n3552_o;
  wire n3553_o;
  wire n3556_o;
  wire n3563_o;
  wire n3566_o;
  wire n3573_o;
  wire n3574_o;
  wire n3575_o;
  wire n3578_o;
  wire n3585_o;
  wire n3588_o;
  wire n3595_o;
  wire n3596_o;
  wire n3597_o;
  wire n3600_o;
  wire n3607_o;
  wire n3610_o;
  wire n3617_o;
  wire n3618_o;
  wire n3619_o;
  wire n3622_o;
  wire n3629_o;
  wire n3632_o;
  wire n3639_o;
  wire n3640_o;
  wire n3641_o;
  wire [8:0] n3643_o;
  wire [8:0] n3645_o;
  wire [8:0] n3646_o;
  wire n3648_o;
  wire n3649_o;
  wire n3650_o;
  wire n3651_o;
  wire n3653_o;
  wire n3654_o;
  wire n3656_o;
  wire n3658_o;
  wire n3660_o;
  wire n3661_o;
  wire n3662_o;
  wire [8:0] n3663_o;
  wire [7:0] n3664_o;
  wire [16:0] n3665_o;
  wire [16:0] n3666_o;
  wire n3669_o;
  wire n3676_o;
  wire n3677_o;
  wire n3679_o;
  wire n3686_o;
  wire n3687_o;
  wire n3688_o;
  wire n3689_o;
  wire n3690_o;
  wire n3691_o;
  wire n3692_o;
  wire n3694_o;
  wire n3695_o;
  wire n3696_o;
  wire n3697_o;
  wire [19:0] n3699_o;
  wire [19:0] n3700_o;
  wire n3702_o;
  wire n3703_o;
  wire n3704_o;
  wire [19:0] n3706_o;
  wire n3709_o;
  wire n3716_o;
  wire n3717_o;
  wire n3718_o;
  wire n3719_o;
  wire n3720_o;
  wire [2:0] n3723_o;
  wire n3724_o;
  wire [2:0] n3726_o;
  wire [2:0] n3727_o;
  wire [1:0] n3728_o;
  wire [2:0] n3729_o;
  wire [2:0] n3730_o;
  wire n3731_o;
  wire n3733_o;
  wire n3734_o;
  wire n3736_o;
  wire n3737_o;
  wire n3739_o;
  wire n3740_o;
  wire n3742_o;
  wire n3743_o;
  wire n3745_o;
  wire n3746_o;
  wire n3748_o;
  wire n3749_o;
  wire n3751_o;
  wire n3752_o;
  wire n3754_o;
  wire [7:0] n3755_o;
  reg n3757_o;
  wire n3758_o;
  wire n3760_o;
  wire n3762_o;
  wire n3763_o;
  wire n3764_o;
  wire n3765_o;
  wire n3766_o;
  wire n3767_o;
  wire n3768_o;
  wire n3769_o;
  wire n3770_o;
  wire n3771_o;
  wire n3772_o;
  wire n3773_o;
  wire n3774_o;
  wire n3775_o;
  wire n3778_o;
  wire n3785_o;
  wire n3786_o;
  wire n3787_o;
  wire n3788_o;
  wire n3789_o;
  wire n3790_o;
  wire n3791_o;
  wire n3792_o;
  wire n3793_o;
  wire n3794_o;
  wire n3795_o;
  wire n3796_o;
  wire n3797_o;
  wire n3798_o;
  wire n3799_o;
  wire n3801_o;
  wire n3803_o;
  wire n3804_o;
  wire n3805_o;
  wire [7:0] n3806_o;
  wire [16:0] n3807_o;
  wire [16:0] n3808_o;
  wire n3810_o;
  wire n3811_o;
  wire [10:0] n3812_o;
  wire [19:0] n3813_o;
  wire [19:0] n3814_o;
  wire n3816_o;
  wire n3817_o;
  wire n3819_o;
  wire n3820_o;
  wire n3821_o;
  wire [8:0] n3822_o;
  wire [7:0] n3823_o;
  wire [16:0] n3824_o;
  wire [2:0] n3825_o;
  wire [19:0] n3826_o;
  wire [19:0] n3827_o;
  wire n3829_o;
  wire n3830_o;
  wire n3832_o;
  wire n3833_o;
  wire n3834_o;
  wire [10:0] n3835_o;
  wire [19:0] n3836_o;
  wire [19:0] n3837_o;
  wire n3838_o;
  wire n3839_o;
  wire n3841_o;
  wire n3842_o;
  wire n3849_o;
  wire n3850_o;
  wire n3851_o;
  wire n3852_o;
  wire n3854_o;
  wire n3855_o;
  wire n3856_o;
  wire n3863_o;
  wire n3864_o;
  wire n3865_o;
  wire n3866_o;
  wire n3867_o;
  wire n3868_o;
  wire n3869_o;
  wire n3870_o;
  wire n3871_o;
  wire [7:0] n3873_o;
  wire [5:0] n3874_o;
  wire [6:0] n3875_o;
  wire n3876_o;
  wire [7:0] n3877_o;
  wire [4:0] n3878_o;
  wire [5:0] n3879_o;
  wire [1:0] n3880_o;
  wire [7:0] n3881_o;
  wire [3:0] n3882_o;
  wire [4:0] n3883_o;
  wire [2:0] n3884_o;
  wire [7:0] n3885_o;
  wire [2:0] n3886_o;
  wire [3:0] n3887_o;
  wire [3:0] n3888_o;
  wire [7:0] n3889_o;
  wire [1:0] n3890_o;
  wire [2:0] n3891_o;
  wire [4:0] n3892_o;
  wire [7:0] n3893_o;
  wire n3894_o;
  wire [1:0] n3896_o;
  wire [5:0] n3897_o;
  wire [7:0] n3898_o;
  wire [6:0] n3899_o;
  wire [5:0] n3900_o;
  wire n3903_o;
  wire n3910_o;
  wire [4:0] n3912_o;
  wire n3914_o;
  wire n3921_o;
  wire n3922_o;
  wire n3923_o;
  wire n3924_o;
  wire n3925_o;
  wire n3926_o;
  wire n3927_o;
  wire n3930_o;
  wire n3937_o;
  wire n3938_o;
  wire n3939_o;
  wire n3940_o;
  wire n3941_o;
  wire n3943_o;
  wire n3945_o;
  wire [4:0] n3946_o;
  wire n3948_o;
  wire n3949_o;
  wire n3950_o;
  wire n3951_o;
  wire n3952_o;
  wire n3953_o;
  wire n3954_o;
  wire n3955_o;
  wire n3956_o;
  wire n3957_o;
  wire n3959_o;
  wire n3960_o;
  wire n3961_o;
  wire n3962_o;
  wire n3963_o;
  wire [3:0] n3965_o;
  wire n3967_o;
  wire n3969_o;
  wire n3971_o;
  wire n3973_o;
  wire [4:0] n3974_o;
  wire n3976_o;
  wire n3977_o;
  wire n3978_o;
  wire n3979_o;
  wire n3980_o;
  wire n3981_o;
  wire n3982_o;
  wire n3983_o;
  wire n3984_o;
  wire n3985_o;
  wire n3986_o;
  wire n3987_o;
  wire n3988_o;
  wire n3989_o;
  wire n3990_o;
  wire n3991_o;
  wire n3993_o;
  wire n3994_o;
  wire n3995_o;
  wire n3996_o;
  wire n3997_o;
  wire n3998_o;
  wire n3999_o;
  wire n4000_o;
  wire n4002_o;
  wire n4004_o;
  wire n4006_o;
  wire n4008_o;
  wire [4:0] n4009_o;
  wire n4011_o;
  wire n4012_o;
  wire n4013_o;
  wire n4014_o;
  wire n4015_o;
  wire n4016_o;
  wire n4017_o;
  wire n4018_o;
  wire n4019_o;
  wire n4020_o;
  wire n4021_o;
  wire n4022_o;
  wire n4023_o;
  wire n4024_o;
  wire n4025_o;
  wire n4026_o;
  wire n4028_o;
  wire n4029_o;
  wire n4030_o;
  wire n4031_o;
  wire n4032_o;
  wire [3:0] n4034_o;
  wire n4037_o;
  wire n4044_o;
  wire n4047_o;
  wire n4054_o;
  wire n4057_o;
  wire n4064_o;
  wire n4067_o;
  wire n4074_o;
  wire n4077_o;
  wire n4084_o;
  wire [4:0] n4086_o;
  wire n4088_o;
  wire n4095_o;
  wire n4096_o;
  wire n4097_o;
  wire n4098_o;
  wire n4099_o;
  wire n4100_o;
  wire n4101_o;
  wire n4102_o;
  wire n4103_o;
  wire n4104_o;
  wire n4105_o;
  wire n4106_o;
  wire n4107_o;
  wire n4108_o;
  wire n4109_o;
  wire n4110_o;
  wire n4111_o;
  wire n4112_o;
  wire n4113_o;
  wire n4116_o;
  wire n4123_o;
  wire n4124_o;
  wire n4125_o;
  wire n4126_o;
  wire n4127_o;
  wire n4129_o;
  wire n4131_o;
  wire n4133_o;
  wire n4135_o;
  wire n4137_o;
  wire n4139_o;
  wire [4:0] n4140_o;
  wire n4142_o;
  wire n4143_o;
  wire n4144_o;
  wire n4145_o;
  wire n4146_o;
  wire n4147_o;
  wire n4148_o;
  wire n4149_o;
  wire n4150_o;
  wire n4151_o;
  wire n4152_o;
  wire n4153_o;
  wire n4154_o;
  wire n4155_o;
  wire n4156_o;
  wire n4157_o;
  wire n4158_o;
  wire n4159_o;
  wire n4160_o;
  wire n4161_o;
  wire n4162_o;
  wire n4163_o;
  wire n4165_o;
  wire n4166_o;
  wire n4167_o;
  wire n4168_o;
  wire n4169_o;
  wire [3:0] n4171_o;
  wire n4173_o;
  wire n4175_o;
  wire n4177_o;
  wire n4179_o;
  wire n4181_o;
  wire n4183_o;
  wire [4:0] n4184_o;
  wire n4186_o;
  wire n4187_o;
  wire n4188_o;
  wire n4189_o;
  wire n4190_o;
  wire n4191_o;
  wire n4192_o;
  wire n4193_o;
  wire n4194_o;
  wire n4195_o;
  wire n4196_o;
  wire n4197_o;
  wire n4198_o;
  wire n4199_o;
  wire n4200_o;
  wire n4201_o;
  wire n4202_o;
  wire n4203_o;
  wire n4204_o;
  wire n4205_o;
  wire n4206_o;
  wire n4207_o;
  wire n4209_o;
  wire n4210_o;
  wire n4211_o;
  wire n4212_o;
  wire n4213_o;
  wire [3:0] n4215_o;
  wire n4216_o;
  wire n4218_o;
  wire n4220_o;
  wire n4222_o;
  wire n4224_o;
  wire n4226_o;
  wire n4228_o;
  wire [4:0] n4229_o;
  wire n4231_o;
  wire n4232_o;
  wire n4233_o;
  wire n4234_o;
  wire n4235_o;
  wire n4236_o;
  wire n4237_o;
  wire n4238_o;
  wire n4239_o;
  wire n4240_o;
  wire n4241_o;
  wire n4242_o;
  wire n4243_o;
  wire n4244_o;
  wire n4245_o;
  wire n4246_o;
  wire n4247_o;
  wire n4248_o;
  wire n4249_o;
  wire n4250_o;
  wire n4251_o;
  wire n4252_o;
  wire n4254_o;
  wire n4255_o;
  wire n4256_o;
  wire n4257_o;
  wire n4258_o;
  wire n4259_o;
  wire [3:0] n4261_o;
  wire n4263_o;
  wire n4265_o;
  wire n4267_o;
  wire n4269_o;
  wire n4271_o;
  wire n4273_o;
  wire n4275_o;
  wire [4:0] n4276_o;
  wire n4278_o;
  wire n4279_o;
  wire n4280_o;
  wire n4281_o;
  wire n4282_o;
  wire n4283_o;
  wire n4284_o;
  wire n4285_o;
  wire n4286_o;
  wire n4287_o;
  wire n4288_o;
  wire n4289_o;
  wire n4290_o;
  wire n4291_o;
  wire n4292_o;
  wire n4293_o;
  wire n4294_o;
  wire n4295_o;
  wire n4296_o;
  wire n4297_o;
  wire n4298_o;
  wire n4299_o;
  wire n4300_o;
  wire n4301_o;
  wire n4302_o;
  wire n4304_o;
  wire n4305_o;
  wire n4306_o;
  wire n4307_o;
  wire n4308_o;
  wire n4310_o;
  wire n4312_o;
  wire n4314_o;
  wire n4316_o;
  wire n4318_o;
  wire n4320_o;
  wire n4322_o;
  wire n4324_o;
  wire [4:0] n4325_o;
  wire n4327_o;
  wire n4328_o;
  wire n4329_o;
  wire n4330_o;
  wire n4331_o;
  wire n4332_o;
  wire n4333_o;
  wire n4334_o;
  wire n4335_o;
  wire n4336_o;
  wire n4337_o;
  wire n4338_o;
  wire n4339_o;
  wire n4340_o;
  wire n4341_o;
  wire n4342_o;
  wire n4343_o;
  wire n4344_o;
  wire n4345_o;
  wire n4346_o;
  wire n4347_o;
  wire n4348_o;
  wire n4349_o;
  wire n4350_o;
  wire n4351_o;
  wire n4353_o;
  wire n4354_o;
  wire n4355_o;
  wire n4356_o;
  wire n4357_o;
  wire n4359_o;
  wire n4361_o;
  wire n4363_o;
  wire n4365_o;
  wire n4367_o;
  wire n4369_o;
  wire n4371_o;
  wire n4373_o;
  wire [4:0] n4374_o;
  wire n4376_o;
  wire n4377_o;
  wire n4378_o;
  wire n4379_o;
  wire n4380_o;
  wire n4381_o;
  wire n4382_o;
  wire n4383_o;
  wire n4384_o;
  wire n4385_o;
  wire n4386_o;
  wire n4387_o;
  wire n4388_o;
  wire n4389_o;
  wire n4390_o;
  wire n4391_o;
  wire n4392_o;
  wire n4393_o;
  wire n4394_o;
  wire n4395_o;
  wire n4396_o;
  wire n4397_o;
  wire n4398_o;
  wire n4399_o;
  wire n4400_o;
  wire n4402_o;
  wire n4403_o;
  wire n4404_o;
  wire n4405_o;
  wire n4406_o;
  wire n4407_o;
  wire n4408_o;
  wire n4409_o;
  wire n4411_o;
  wire n4413_o;
  wire n4415_o;
  wire n4417_o;
  wire n4419_o;
  wire n4421_o;
  wire n4423_o;
  wire [4:0] n4424_o;
  wire n4426_o;
  wire n4427_o;
  wire n4428_o;
  wire n4429_o;
  wire n4430_o;
  wire n4431_o;
  wire n4432_o;
  wire n4433_o;
  wire n4434_o;
  wire n4435_o;
  wire n4436_o;
  wire n4437_o;
  wire n4438_o;
  wire n4439_o;
  wire n4440_o;
  wire n4441_o;
  wire n4442_o;
  wire n4443_o;
  wire n4444_o;
  wire n4445_o;
  wire n4446_o;
  wire n4447_o;
  wire n4448_o;
  wire n4449_o;
  wire n4450_o;
  wire n4452_o;
  wire n4453_o;
  wire n4454_o;
  wire n4455_o;
  wire n4456_o;
  wire [3:0] n4458_o;
  wire n4460_o;
  wire n4462_o;
  wire n4464_o;
  wire n4466_o;
  wire n4468_o;
  wire n4470_o;
  wire n4472_o;
  wire n4474_o;
  wire [4:0] n4475_o;
  wire n4477_o;
  wire n4478_o;
  wire n4479_o;
  wire n4480_o;
  wire n4481_o;
  wire n4482_o;
  wire n4483_o;
  wire n4484_o;
  wire n4485_o;
  wire n4486_o;
  wire n4487_o;
  wire n4488_o;
  wire n4489_o;
  wire n4490_o;
  wire n4491_o;
  wire n4492_o;
  wire n4493_o;
  wire n4494_o;
  wire n4495_o;
  wire n4496_o;
  wire n4497_o;
  wire n4498_o;
  wire n4499_o;
  wire n4500_o;
  wire n4501_o;
  wire n4502_o;
  wire n4503_o;
  wire n4504_o;
  wire n4506_o;
  wire n4507_o;
  wire n4508_o;
  wire n4509_o;
  wire n4510_o;
  wire n4512_o;
  wire n4514_o;
  wire n4516_o;
  wire n4518_o;
  wire n4520_o;
  wire n4522_o;
  wire n4524_o;
  wire n4526_o;
  wire n4528_o;
  wire [4:0] n4529_o;
  wire n4531_o;
  wire n4532_o;
  wire n4533_o;
  wire n4534_o;
  wire n4535_o;
  wire n4536_o;
  wire n4537_o;
  wire n4538_o;
  wire n4539_o;
  wire n4540_o;
  wire n4541_o;
  wire n4542_o;
  wire n4543_o;
  wire n4544_o;
  wire n4545_o;
  wire n4546_o;
  wire n4547_o;
  wire n4548_o;
  wire n4549_o;
  wire n4550_o;
  wire n4551_o;
  wire n4552_o;
  wire n4553_o;
  wire n4554_o;
  wire n4555_o;
  wire n4556_o;
  wire n4557_o;
  wire n4558_o;
  wire n4560_o;
  wire n4561_o;
  wire n4562_o;
  wire n4563_o;
  wire n4564_o;
  wire n4566_o;
  wire n4568_o;
  wire n4570_o;
  wire n4572_o;
  wire n4574_o;
  wire n4576_o;
  wire n4578_o;
  wire n4580_o;
  wire n4582_o;
  wire [4:0] n4583_o;
  wire n4585_o;
  wire n4586_o;
  wire n4587_o;
  wire n4588_o;
  wire n4589_o;
  wire n4590_o;
  wire n4591_o;
  wire n4592_o;
  wire n4593_o;
  wire n4594_o;
  wire n4595_o;
  wire n4596_o;
  wire n4597_o;
  wire n4598_o;
  wire n4599_o;
  wire n4600_o;
  wire n4601_o;
  wire n4602_o;
  wire n4603_o;
  wire n4604_o;
  wire n4605_o;
  wire n4606_o;
  wire n4607_o;
  wire n4608_o;
  wire n4609_o;
  wire n4610_o;
  wire n4611_o;
  wire n4612_o;
  wire n4614_o;
  wire n4615_o;
  wire n4616_o;
  wire n4617_o;
  wire n4618_o;
  wire n4619_o;
  wire n4620_o;
  wire n4621_o;
  wire n4623_o;
  wire n4625_o;
  wire n4627_o;
  wire n4629_o;
  wire n4631_o;
  wire n4633_o;
  wire n4635_o;
  wire n4637_o;
  wire [4:0] n4638_o;
  wire n4640_o;
  wire n4641_o;
  wire n4642_o;
  wire n4643_o;
  wire n4644_o;
  wire n4645_o;
  wire n4646_o;
  wire n4647_o;
  wire n4648_o;
  wire n4649_o;
  wire n4650_o;
  wire n4651_o;
  wire n4652_o;
  wire n4653_o;
  wire n4654_o;
  wire n4655_o;
  wire n4656_o;
  wire n4657_o;
  wire n4658_o;
  wire n4659_o;
  wire n4660_o;
  wire n4661_o;
  wire n4662_o;
  wire n4663_o;
  wire n4664_o;
  wire n4665_o;
  wire n4666_o;
  wire n4667_o;
  wire n4669_o;
  wire n4670_o;
  wire n4671_o;
  wire n4672_o;
  wire n4673_o;
  wire [3:0] n4675_o;
  wire n4677_o;
  wire n4679_o;
  wire n4681_o;
  wire n4683_o;
  wire n4685_o;
  wire n4687_o;
  wire n4689_o;
  wire n4691_o;
  wire [4:0] n4692_o;
  wire n4694_o;
  wire n4695_o;
  wire n4696_o;
  wire n4697_o;
  wire n4698_o;
  wire n4699_o;
  wire n4700_o;
  wire n4701_o;
  wire n4702_o;
  wire n4703_o;
  wire n4704_o;
  wire n4705_o;
  wire n4706_o;
  wire n4707_o;
  wire n4708_o;
  wire n4709_o;
  wire n4710_o;
  wire n4711_o;
  wire n4712_o;
  wire n4713_o;
  wire n4714_o;
  wire n4715_o;
  wire n4716_o;
  wire n4717_o;
  wire n4718_o;
  wire n4719_o;
  wire n4720_o;
  wire n4721_o;
  wire n4723_o;
  wire n4724_o;
  wire n4725_o;
  wire n4726_o;
  wire n4727_o;
  wire [3:0] n4729_o;
  wire n4731_o;
  wire n4733_o;
  wire n4735_o;
  wire n4737_o;
  wire n4739_o;
  wire n4741_o;
  wire n4743_o;
  wire n4745_o;
  wire n4747_o;
  wire [4:0] n4748_o;
  wire n4750_o;
  wire n4751_o;
  wire n4752_o;
  wire n4753_o;
  wire n4754_o;
  wire n4755_o;
  wire n4756_o;
  wire n4757_o;
  wire n4758_o;
  wire n4759_o;
  wire n4760_o;
  wire n4761_o;
  wire n4762_o;
  wire n4763_o;
  wire n4764_o;
  wire n4765_o;
  wire n4766_o;
  wire n4767_o;
  wire n4768_o;
  wire n4769_o;
  wire n4770_o;
  wire n4771_o;
  wire n4772_o;
  wire n4773_o;
  wire n4774_o;
  wire n4775_o;
  wire n4776_o;
  wire n4777_o;
  wire n4778_o;
  wire n4779_o;
  wire n4780_o;
  wire n4782_o;
  wire n4783_o;
  wire n4784_o;
  wire n4785_o;
  wire n4786_o;
  wire [3:0] n4788_o;
  wire [1:0] n4789_o;
  wire n4791_o;
  wire n4793_o;
  wire n4795_o;
  wire n4797_o;
  wire n4799_o;
  wire n4801_o;
  wire n4803_o;
  wire n4805_o;
  wire n4807_o;
  wire n4809_o;
  wire [4:0] n4810_o;
  wire n4812_o;
  wire n4813_o;
  wire n4814_o;
  wire n4815_o;
  wire n4816_o;
  wire n4817_o;
  wire n4818_o;
  wire n4819_o;
  wire n4820_o;
  wire n4821_o;
  wire n4822_o;
  wire n4823_o;
  wire n4824_o;
  wire n4825_o;
  wire n4826_o;
  wire n4827_o;
  wire n4828_o;
  wire n4829_o;
  wire n4830_o;
  wire n4831_o;
  wire n4832_o;
  wire n4833_o;
  wire n4834_o;
  wire n4835_o;
  wire n4836_o;
  wire n4837_o;
  wire n4838_o;
  wire n4839_o;
  wire n4840_o;
  wire n4841_o;
  wire n4842_o;
  wire n4843_o;
  wire n4844_o;
  wire n4845_o;
  wire n4847_o;
  wire n4848_o;
  wire n4849_o;
  wire n4850_o;
  wire n4851_o;
  wire n4853_o;
  wire [1:0] n4855_o;
  wire n4857_o;
  wire n4864_o;
  wire n4867_o;
  wire n4874_o;
  wire n4877_o;
  wire n4884_o;
  wire n4887_o;
  wire n4894_o;
  wire n4897_o;
  wire n4904_o;
  wire n4907_o;
  wire n4914_o;
  wire n4917_o;
  wire n4924_o;
  wire n4927_o;
  wire n4934_o;
  wire n4937_o;
  wire n4944_o;
  wire n4947_o;
  wire n4954_o;
  wire [4:0] n4956_o;
  wire n4958_o;
  wire n4965_o;
  wire n4966_o;
  wire n4967_o;
  wire n4968_o;
  wire n4969_o;
  wire n4970_o;
  wire n4971_o;
  wire n4972_o;
  wire n4973_o;
  wire n4974_o;
  wire n4975_o;
  wire n4976_o;
  wire n4977_o;
  wire n4978_o;
  wire n4979_o;
  wire n4980_o;
  wire n4981_o;
  wire n4982_o;
  wire n4983_o;
  wire n4984_o;
  wire n4985_o;
  wire n4986_o;
  wire n4987_o;
  wire n4988_o;
  wire n4989_o;
  wire n4990_o;
  wire n4991_o;
  wire n4992_o;
  wire n4993_o;
  wire n4994_o;
  wire n4995_o;
  wire n4996_o;
  wire n4997_o;
  wire n4998_o;
  wire n5001_o;
  wire n5008_o;
  wire n5009_o;
  wire n5010_o;
  wire n5011_o;
  wire n5012_o;
  wire n5013_o;
  wire n5014_o;
  wire n5015_o;
  wire n5016_o;
  wire n5017_o;
  wire n5018_o;
  wire n5019_o;
  wire n5020_o;
  wire n5021_o;
  wire n5023_o;
  wire n5024_o;
  wire n5025_o;
  wire [1:0] n5026_o;
  wire n5028_o;
  wire n5030_o;
  wire n5032_o;
  wire n5034_o;
  wire n5036_o;
  wire n5038_o;
  wire n5040_o;
  wire n5042_o;
  wire n5044_o;
  wire n5046_o;
  wire [4:0] n5047_o;
  wire n5049_o;
  wire n5050_o;
  wire n5051_o;
  wire n5052_o;
  wire n5053_o;
  wire n5054_o;
  wire n5055_o;
  wire n5056_o;
  wire n5057_o;
  wire n5058_o;
  wire n5059_o;
  wire n5060_o;
  wire n5061_o;
  wire n5062_o;
  wire n5063_o;
  wire n5064_o;
  wire n5065_o;
  wire n5066_o;
  wire n5067_o;
  wire n5068_o;
  wire n5069_o;
  wire n5070_o;
  wire n5071_o;
  wire n5072_o;
  wire n5073_o;
  wire n5074_o;
  wire n5075_o;
  wire n5076_o;
  wire n5077_o;
  wire n5078_o;
  wire n5079_o;
  wire n5080_o;
  wire n5081_o;
  wire n5082_o;
  wire n5083_o;
  wire n5084_o;
  wire n5085_o;
  wire n5087_o;
  wire n5088_o;
  wire n5089_o;
  wire n5090_o;
  wire n5092_o;
  wire [1:0] n5093_o;
  wire n5095_o;
  wire n5097_o;
  wire n5099_o;
  wire n5101_o;
  wire n5103_o;
  wire n5105_o;
  wire n5107_o;
  wire n5109_o;
  wire n5111_o;
  wire n5113_o;
  wire [4:0] n5114_o;
  wire n5116_o;
  wire n5117_o;
  wire n5118_o;
  wire n5119_o;
  wire n5120_o;
  wire n5121_o;
  wire n5122_o;
  wire n5123_o;
  wire n5124_o;
  wire n5125_o;
  wire n5126_o;
  wire n5127_o;
  wire n5128_o;
  wire n5129_o;
  wire n5130_o;
  wire n5131_o;
  wire n5132_o;
  wire n5133_o;
  wire n5134_o;
  wire n5135_o;
  wire n5136_o;
  wire n5137_o;
  wire n5138_o;
  wire n5139_o;
  wire n5140_o;
  wire n5141_o;
  wire n5142_o;
  wire n5143_o;
  wire n5144_o;
  wire n5145_o;
  wire n5146_o;
  wire n5147_o;
  wire n5148_o;
  wire n5149_o;
  wire n5150_o;
  wire n5151_o;
  wire n5152_o;
  wire n5154_o;
  wire n5155_o;
  wire n5156_o;
  wire n5157_o;
  wire n5159_o;
  wire [1:0] n5160_o;
  wire n5162_o;
  wire n5164_o;
  wire n5166_o;
  wire n5168_o;
  wire n5170_o;
  wire n5172_o;
  wire n5174_o;
  wire n5176_o;
  wire n5178_o;
  wire n5180_o;
  wire [4:0] n5181_o;
  wire n5183_o;
  wire n5184_o;
  wire n5185_o;
  wire n5186_o;
  wire n5187_o;
  wire n5188_o;
  wire n5189_o;
  wire n5190_o;
  wire n5191_o;
  wire n5192_o;
  wire n5193_o;
  wire n5194_o;
  wire n5195_o;
  wire n5196_o;
  wire n5197_o;
  wire n5198_o;
  wire n5199_o;
  wire n5200_o;
  wire n5201_o;
  wire n5202_o;
  wire n5203_o;
  wire n5204_o;
  wire n5205_o;
  wire n5206_o;
  wire n5207_o;
  wire n5208_o;
  wire n5209_o;
  wire n5210_o;
  wire n5211_o;
  wire n5212_o;
  wire n5213_o;
  wire n5214_o;
  wire n5215_o;
  wire n5216_o;
  wire n5217_o;
  wire n5218_o;
  wire n5219_o;
  wire n5221_o;
  wire n5222_o;
  wire n5223_o;
  wire n5224_o;
  wire [3:0] n5226_o;
  wire n5228_o;
  wire n5229_o;
  wire n5231_o;
  wire n5233_o;
  wire n5234_o;
  wire n5236_o;
  wire n5238_o;
  wire n5239_o;
  wire [3:0] n5241_o;
  wire n5242_o;
  wire n5244_o;
  wire n5245_o;
  wire [3:0] n5247_o;
  wire n5249_o;
  wire n5251_o;
  wire n5252_o;
  wire n5253_o;
  wire n5254_o;
  wire n5255_o;
  wire n5257_o;
  wire n5259_o;
  wire n5260_o;
  wire n5261_o;
  wire n5262_o;
  wire n5263_o;
  wire n5265_o;
  wire n5267_o;
  wire n5268_o;
  wire n5269_o;
  wire n5270_o;
  wire n5271_o;
  wire n5272_o;
  wire n5273_o;
  wire n5275_o;
  wire n5276_o;
  wire n5278_o;
  wire n5280_o;
  wire n5281_o;
  wire [3:0] n5283_o;
  wire n5285_o;
  wire n5286_o;
  wire n5288_o;
  wire n5290_o;
  wire n5291_o;
  wire [3:0] n5293_o;
  wire n5295_o;
  wire n5296_o;
  wire n5298_o;
  wire n5300_o;
  wire n5301_o;
  wire [3:0] n5302_o;
  wire n5304_o;
  wire n5305_o;
  wire n5307_o;
  wire n5309_o;
  wire n5310_o;
  wire [3:0] n5312_o;
  wire n5314_o;
  wire n5315_o;
  wire n5317_o;
  wire n5319_o;
  wire n5320_o;
  wire [3:0] n5321_o;
  wire n5322_o;
  wire n5324_o;
  wire n5331_o;
  wire n5332_o;
  wire n5335_o;
  wire n5342_o;
  wire n5343_o;
  wire n5344_o;
  wire n5345_o;
  wire n5346_o;
  wire n5347_o;
  wire n5348_o;
  wire n5350_o;
  wire n5351_o;
  wire n5352_o;
  wire n5354_o;
  wire [3:0] n5356_o;
  wire n5357_o;
  wire n5358_o;
  wire n5361_o;
  wire n5362_o;
  wire n5363_o;
  wire [3:0] n5365_o;
  wire n5367_o;
  wire n5368_o;
  wire n5369_o;
  wire n5370_o;
  wire n5371_o;
  wire n5372_o;
  wire n5374_o;
  wire n5375_o;
  wire n5376_o;
  wire n5377_o;
  wire n5379_o;
  wire n5381_o;
  wire n5382_o;
  wire n5383_o;
  wire n5384_o;
  wire [3:0] n5386_o;
  wire [3:0] n5388_o;
  wire n5390_o;
  wire n5391_o;
  wire n5393_o;
  wire n5395_o;
  wire n5396_o;
  wire [3:0] n5398_o;
  wire n5399_o;
  wire n5400_o;
  wire n5401_o;
  wire n5402_o;
  wire n5403_o;
  wire n5404_o;
  wire n5406_o;
  wire n5407_o;
  wire n5408_o;
  wire n5409_o;
  wire n5411_o;
  wire n5412_o;
  wire n5413_o;
  wire n5414_o;
  wire [2:0] n5416_o;
  wire n5417_o;
  wire n5418_o;
  wire n5419_o;
  wire n5420_o;
  wire n5421_o;
  wire n5422_o;
  wire [6:0] n5423_o;
  wire [7:0] n5424_o;
  wire [7:0] n5425_o;
  wire n5426_o;
  wire n5427_o;
  wire n5428_o;
  wire n5429_o;
  wire n5431_o;
  wire n5432_o;
  wire n5433_o;
  wire n5434_o;
  wire n5436_o;
  wire n5437_o;
  wire n5438_o;
  wire n5439_o;
  wire [2:0] n5441_o;
  wire n5443_o;
  wire [3:0] n5445_o;
  wire n5447_o;
  wire n5448_o;
  wire n5450_o;
  wire n5452_o;
  wire n5453_o;
  wire [3:0] n5454_o;
  wire [6:0] n5455_o;
  wire [7:0] n5456_o;
  wire [7:0] n5457_o;
  wire n5458_o;
  wire n5459_o;
  wire n5460_o;
  wire [7:0] n5462_o;
  wire n5464_o;
  wire n5465_o;
  wire n5466_o;
  wire n5467_o;
  wire [6:0] n5468_o;
  wire [7:0] n5469_o;
  wire [7:0] n5470_o;
  wire n5472_o;
  wire n5473_o;
  wire n5474_o;
  wire n5475_o;
  wire [5:0] n5476_o;
  wire [6:0] n5477_o;
  wire n5478_o;
  wire [7:0] n5479_o;
  wire [7:0] n5480_o;
  wire n5482_o;
  wire n5483_o;
  wire n5484_o;
  wire n5485_o;
  wire [4:0] n5486_o;
  wire [5:0] n5487_o;
  wire [1:0] n5488_o;
  wire [7:0] n5489_o;
  wire [7:0] n5490_o;
  wire n5492_o;
  wire n5493_o;
  wire n5494_o;
  wire n5495_o;
  wire [3:0] n5496_o;
  wire [4:0] n5497_o;
  wire [2:0] n5498_o;
  wire [7:0] n5499_o;
  wire [7:0] n5500_o;
  wire n5502_o;
  wire n5503_o;
  wire n5504_o;
  wire n5505_o;
  wire [2:0] n5506_o;
  wire [3:0] n5507_o;
  wire [3:0] n5508_o;
  wire [7:0] n5509_o;
  wire [7:0] n5510_o;
  wire n5512_o;
  wire n5513_o;
  wire n5514_o;
  wire n5515_o;
  wire [1:0] n5516_o;
  wire [2:0] n5517_o;
  wire [4:0] n5518_o;
  wire [7:0] n5519_o;
  wire [7:0] n5520_o;
  wire n5522_o;
  wire n5523_o;
  wire n5524_o;
  wire n5525_o;
  wire n5526_o;
  wire [1:0] n5528_o;
  wire [5:0] n5529_o;
  wire [7:0] n5530_o;
  wire [7:0] n5531_o;
  wire n5533_o;
  wire n5534_o;
  wire n5535_o;
  wire n5536_o;
  wire [6:0] n5537_o;
  wire [7:0] n5539_o;
  wire [7:0] n5540_o;
  wire n5542_o;
  wire n5543_o;
  wire n5544_o;
  wire n5545_o;
  wire [6:0] n5546_o;
  wire [7:0] n5547_o;
  wire [7:0] n5548_o;
  wire n5550_o;
  wire n5551_o;
  wire n5552_o;
  wire n5553_o;
  wire [5:0] n5554_o;
  wire [6:0] n5555_o;
  wire n5556_o;
  wire [7:0] n5557_o;
  wire [7:0] n5558_o;
  wire n5560_o;
  wire n5561_o;
  wire n5562_o;
  wire n5563_o;
  wire [4:0] n5564_o;
  wire [5:0] n5565_o;
  wire [1:0] n5566_o;
  wire [7:0] n5567_o;
  wire [7:0] n5568_o;
  wire n5570_o;
  wire n5571_o;
  wire n5572_o;
  wire n5573_o;
  wire [3:0] n5574_o;
  wire [4:0] n5575_o;
  wire [2:0] n5576_o;
  wire [7:0] n5577_o;
  wire [7:0] n5578_o;
  wire n5580_o;
  wire n5581_o;
  wire n5582_o;
  wire n5583_o;
  wire [2:0] n5584_o;
  wire [3:0] n5585_o;
  wire [3:0] n5586_o;
  wire [7:0] n5587_o;
  wire [7:0] n5588_o;
  wire n5590_o;
  wire n5591_o;
  wire n5592_o;
  wire n5593_o;
  wire [1:0] n5594_o;
  wire [2:0] n5595_o;
  wire [4:0] n5596_o;
  wire [7:0] n5597_o;
  wire [7:0] n5598_o;
  wire n5600_o;
  wire n5601_o;
  wire n5602_o;
  wire n5603_o;
  wire n5604_o;
  wire [1:0] n5605_o;
  wire [5:0] n5606_o;
  wire [7:0] n5607_o;
  wire [7:0] n5608_o;
  wire n5610_o;
  wire n5611_o;
  wire n5612_o;
  wire n5613_o;
  wire [6:0] n5614_o;
  wire [7:0] n5615_o;
  wire [7:0] n5616_o;
  wire [6:0] n5617_o;
  wire [7:0] n5619_o;
  wire [7:0] n5620_o;
  wire [1:0] n5621_o;
  wire n5623_o;
  wire n5625_o;
  wire n5627_o;
  wire n5629_o;
  wire n5631_o;
  wire n5633_o;
  wire n5635_o;
  wire n5637_o;
  wire n5639_o;
  wire n5641_o;
  wire [4:0] n5642_o;
  wire n5644_o;
  wire n5645_o;
  wire n5646_o;
  wire n5647_o;
  wire n5648_o;
  wire n5649_o;
  wire n5650_o;
  wire n5651_o;
  wire n5652_o;
  wire n5653_o;
  wire n5654_o;
  wire n5655_o;
  wire n5656_o;
  wire n5657_o;
  wire n5658_o;
  wire n5659_o;
  wire n5660_o;
  wire n5661_o;
  wire n5662_o;
  wire n5663_o;
  wire n5664_o;
  wire n5665_o;
  wire n5666_o;
  wire n5667_o;
  wire n5668_o;
  wire n5669_o;
  wire n5670_o;
  wire n5671_o;
  wire n5672_o;
  wire n5673_o;
  wire n5674_o;
  wire n5675_o;
  wire n5676_o;
  wire n5677_o;
  wire n5678_o;
  wire n5679_o;
  wire n5680_o;
  wire n5682_o;
  wire n5683_o;
  wire n5684_o;
  wire n5685_o;
  wire [7:0] n5687_o;
  wire n5689_o;
  wire n5690_o;
  wire [7:0] n5691_o;
  wire [7:0] n5692_o;
  wire n5759_o;
  wire [2:0] scl_counter1_out_m_value;
  wire scl_counter1_out_const_0;
  wire [2:0] scl_counter1_out_const_xxx;
  wire [2:0] scl_counter2_out_m_value;
  wire scl_counter2_out_const_0;
  wire [2:0] scl_counter2_out_const_xxx;
  reg [3:0] n5898_q;
  reg [3:0] n5899_q;
  wire n5900_o;
  reg n5901_q;
  reg n5902_q;
  reg n5903_q;
  reg n5904_q;
  reg n5905_q;
  wire n5906_o;
  reg n5907_q;
  wire n5908_o;
  reg n5909_q;
  reg n5910_q;
  reg n5911_q;
  wire n5912_o;
  reg n5913_q;
  wire n5914_o;
  reg n5915_q;
  wire n5916_o;
  reg n5917_q;
  reg n5918_q;
  reg n5919_q;
  reg [19:0] n5920_q;
  reg [16:0] n5921_q;
  wire n5922_o;
  reg n5923_q;
  reg [7:0] n5924_q;
  reg n5925_q;
  wire n5926_o;
  reg n5927_q;
  wire n5928_o;
  reg n5929_q;
  reg n5930_q;
  wire n5931_o;
  reg n5932_q;
  wire n5933_o;
  reg n5934_q;
  reg n5935_q;
  wire n5936_o;
  reg n5937_q;
  wire n5938_o;
  reg n5939_q;
  reg n5940_q;
  wire n5941_o;
  reg n5942_q;
  wire n5943_o;
  reg n5944_q;
  reg n5945_q;
  wire n5946_o;
  reg n5947_q;
  wire n5948_o;
  reg n5949_q;
  wire n5950_o;
  reg n5951_q;
  wire n5952_o;
  reg n5953_q;
  wire n5954_o;
  reg n5955_q;
  wire n5956_o;
  reg n5957_q;
  wire n5958_o;
  reg n5959_q;
  wire n5960_o;
  reg n5961_q;
  wire n5962_o;
  reg n5963_q;
  wire n5964_o;
  reg n5965_q;
  wire n5966_o;
  reg n5967_q;
  wire n5968_o;
  reg n5969_q;
  wire n5970_o;
  reg n5971_q;
  assign out_const_0_mux13 = n5450_o;
  assign out_m_io0_out = s_m_io0_out_2;
  assign out_m_io0_en = s_m_io0_en_2;
  assign out_m_io0_opendrain = s_m_io0_opendrain_2;
  assign out_m_io1_out = s_m_io1_out_2;
  assign out_m_io1_en = s_m_io1_en_2;
  assign out_m_io1_opendrain = s_m_io1_opendrain_2;
  assign out_m_io2_out = s_m_io2_out_2;
  assign out_m_io2_en = s_m_io2_en_2;
  assign out_m_io2_opendrain = s_m_io2_opendrain_2;
  assign out_m_io3_out = s_m_io3_out_2;
  assign out_m_io3_en = s_m_io3_en_2;
  assign out_m_io3_opendrain = s_m_io3_opendrain_2;
  assign out_m_io4_out = s_m_io4_out_2;
  assign out_m_io4_en = s_m_io4_en_2;
  assign out_m_io4_opendrain = s_m_io4_opendrain_2;
  assign out_m_io5_out = s_m_io5_out_2;
  assign out_m_io5_en = s_m_io5_en_2;
  assign out_m_io5_opendrain = s_m_io5_opendrain_2;
  assign out_m_io8_out = s_m_io8_out_2;
  assign out_m_io9_out = s_m_io9_out_2;
  assign out_m_io10_out = s_m_io10_out_2;
  assign out_m_io11_out = s_m_io11_out_2;
  assign out_m_io12_out = s_m_io12_out_2;
  assign out_m_io13_out = s_m_io13_out_2;
  assign out_m_io14_out = s_m_io14_out_2;
  assign out_m_io15_out = s_m_io15_out_2;
  assign out_out_ready = in_unnamed;
  assign out_out_valid = n5431_o;
  assign out_out = n5692_o;
  /* find_the_damn_issue_sky130.vhd:1033:16  */
  assign s_followupstate_mux1 = n5454_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:1034:16  */
  always @*
    s_state = n5898_q; // (isignal)
  initial
    s_state = 4'b0000;
  /* find_the_damn_issue_sky130.vhd:1035:16  */
  assign s_clock_setup_mux3 = n4675_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:1036:16  */
  always @*
    s_followupstate = n5899_q; // (isignal)
  initial
    s_followupstate = 4'b0000;
  /* find_the_damn_issue_sky130.vhd:1037:16  */
  assign s_m_last = scl_counter0_out_m_last; // (signal)
  /* find_the_damn_issue_sky130.vhd:1038:16  */
  assign s_tick = s_m_last; // (signal)
  /* find_the_damn_issue_sky130.vhd:1039:16  */
  assign s_command_bit_7_not_and_state_eq_idle_and_command_valid_and_unnamed = n3193_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:1040:16  */
  assign s_command_rewired_eq_const_0_and_command_bit_7_not_not_and_state_eq_idle_and_command_valid_and_unnamed = n3229_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:1041:16  */
  assign s_command_rewired_eq_const_10_and_command_rewired_eq_const_0_or_command_bit_7_not_not_not_not_and_state_eq_idle_and_command_valid_and_unnamed = n3941_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:1042:16  */
  assign s_command_rewired_eq_const_110_and_unnamed_not_and_state_eq_idle_and_command_valid_and_unnamed = n4127_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:1043:16  */
  assign s_config_targetpingroup = n5901_q; // (signal)
  /* find_the_damn_issue_sky130.vhd:1044:16  */
  assign s_config_stopclocksignal = n5902_q; // (signal)
  /* find_the_damn_issue_sky130.vhd:1045:16  */
  assign s_config_stopclockonsignal = n5903_q; // (signal)
  /* find_the_damn_issue_sky130.vhd:1046:16  */
  assign s_config_stopclockonlastbit = n5904_q; // (signal)
  /* find_the_damn_issue_sky130.vhd:1047:16  */
  assign s_config_tmsoutmode = n5905_q; // (signal)
  /* find_the_damn_issue_sky130.vhd:1048:16  */
  always @*
    s_config_idleclockstate = n5907_q; // (isignal)
  initial
    s_config_idleclockstate = 1'b0;
  /* find_the_damn_issue_sky130.vhd:1049:16  */
  always @*
    s_config_dataloopback = n5909_q; // (isignal)
  initial
    s_config_dataloopback = 1'b0;
  /* find_the_damn_issue_sky130.vhd:1050:16  */
  assign s_config_shiftin = n5910_q; // (signal)
  /* find_the_damn_issue_sky130.vhd:1051:16  */
  assign s_config_shiftout = n5911_q; // (signal)
  /* find_the_damn_issue_sky130.vhd:1052:16  */
  always @*
    s_config_clockthreephase = n5913_q; // (isignal)
  initial
    s_config_clockthreephase = 1'b0;
  /* find_the_damn_issue_sky130.vhd:1053:16  */
  assign s_config_msbfirst = n5915_q; // (signal)
  /* find_the_damn_issue_sky130.vhd:1054:16  */
  assign s_config_captureedge = n5917_q; // (signal)
  /* find_the_damn_issue_sky130.vhd:1055:16  */
  assign s_config_clockdelay = n5918_q; // (signal)
  /* find_the_damn_issue_sky130.vhd:1056:16  */
  assign s_const_0_eq_config_targetpingroup_and_state_eq_write_out_and_command_valid = n3311_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:1057:16  */
  assign s_const_0_eq_config_targetpingroup_and_state_eq_write_out_and_command_valid_2 = n3333_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:1058:16  */
  assign s_const_1_eq_config_targetpingroup_and_state_eq_write_out_and_command_valid = n3355_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:1059:16  */
  assign s_const_1_eq_config_targetpingroup_and_state_eq_write_out_and_command_valid_2 = n3377_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:1060:16  */
  assign s_const_1_eq_config_targetpingroup_and_state_eq_write_out_and_command_valid_3 = n3399_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:1061:16  */
  assign s_const_1_eq_config_targetpingroup_and_state_eq_write_out_and_command_valid_4 = n3421_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:1062:16  */
  assign s_const_1_eq_config_targetpingroup_and_state_eq_write_out_and_command_valid_5 = n3443_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:1063:16  */
  assign s_const_1_eq_config_targetpingroup_and_state_eq_write_out_and_command_valid_6 = n3465_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:1064:16  */
  assign s_const_1_eq_config_targetpingroup_and_state_eq_write_out_and_command_valid_7 = n3487_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:1065:16  */
  assign s_const_1_eq_config_targetpingroup_and_state_eq_write_out_and_command_valid_8 = n3509_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:1066:16  */
  assign s_const_0_eq_config_targetpingroup_and_state_eq_write_en_and_command_valid = n3531_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:1067:16  */
  assign s_const_0_eq_config_targetpingroup_and_state_eq_write_en_and_command_valid_2 = n3553_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:1068:16  */
  assign s_const_0_eq_config_targetpingroup_and_state_eq_write_en_and_command_valid_3 = n3575_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:1069:16  */
  assign s_const_0_eq_config_targetpingroup_and_state_eq_write_en_and_command_valid_4 = n3597_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:1070:16  */
  assign s_const_0_eq_config_targetpingroup_and_state_eq_write_en_and_command_valid_5 = n3619_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:1071:16  */
  assign s_const_0_eq_config_targetpingroup_and_state_eq_write_en_and_command_valid_6 = n3641_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:1072:16  */
  assign s_carryin_mux2 = n3656_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:1073:16  */
  always @*
    s_carryin = n5919_q; // (isignal)
  initial
    s_carryin = 1'b1;
  /* find_the_damn_issue_sky130.vhd:1074:16  */
  assign s_bitlength = n5920_q; // (signal)
  /* find_the_damn_issue_sky130.vhd:1075:16  */
  always @*
    s_clockdiv = n5921_q; // (isignal)
  initial
    s_clockdiv = 17'b00000000000000001;
  /* find_the_damn_issue_sky130.vhd:1076:16  */
  assign s_clockdiv_2 = s_clockdiv; // (signal)
  /* find_the_damn_issue_sky130.vhd:1077:16  */
  always @*
    s_toggleclockdelayed = n5923_q; // (isignal)
  initial
    s_toggleclockdelayed = 1'b0;
  /* find_the_damn_issue_sky130.vhd:1078:16  */
  assign s_toggleclock = n5393_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:1079:16  */
  assign s_setupedge = n5350_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:1080:16  */
  assign s_captureedge = n5372_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:1081:16  */
  assign s_m_value = scl_counter1_out_m_value; // (signal)
  /* find_the_damn_issue_sky130.vhd:1082:16  */
  assign s_const_0 = scl_counter1_out_const_0; // (signal)
  /* find_the_damn_issue_sky130.vhd:1083:16  */
  assign s_unnamed_16 = n5411_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:1084:16  */
  assign s_unnamed_17 = n5416_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:1085:16  */
  assign s_capturebuffer_mux1_unnamed_mux1_rewired_mux2 = n5462_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:1086:16  */
  always @*
    s_capturebuffer = n5924_q; // (isignal)
  initial
    s_capturebuffer = 8'b00000000;
  /* find_the_damn_issue_sky130.vhd:1087:16  */
  assign s_m_value_2 = scl_counter2_out_m_value; // (signal)
  /* find_the_damn_issue_sky130.vhd:1088:16  */
  assign s_const_0_2 = scl_counter2_out_const_0; // (signal)
  /* find_the_damn_issue_sky130.vhd:1089:16  */
  assign s_unnamed_18 = n5436_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:1090:16  */
  assign s_unnamed_19 = n5441_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:1091:16  */
  always @*
    s_m_io0_out_2 = n5925_q; // (isignal)
  initial
    s_m_io0_out_2 = 1'b0;
  /* find_the_damn_issue_sky130.vhd:1092:16  */
  always @*
    s_m_io0_en_2 = n5927_q; // (isignal)
  initial
    s_m_io0_en_2 = 1'b0;
  /* find_the_damn_issue_sky130.vhd:1093:16  */
  always @*
    s_m_io0_opendrain_2 = n5929_q; // (isignal)
  initial
    s_m_io0_opendrain_2 = 1'b0;
  /* find_the_damn_issue_sky130.vhd:1094:16  */
  always @*
    s_m_io1_out_2 = n5930_q; // (isignal)
  initial
    s_m_io1_out_2 = 1'b0;
  /* find_the_damn_issue_sky130.vhd:1095:16  */
  always @*
    s_m_io1_en_2 = n5932_q; // (isignal)
  initial
    s_m_io1_en_2 = 1'b0;
  /* find_the_damn_issue_sky130.vhd:1096:16  */
  always @*
    s_m_io1_opendrain_2 = n5934_q; // (isignal)
  initial
    s_m_io1_opendrain_2 = 1'b0;
  /* find_the_damn_issue_sky130.vhd:1097:16  */
  always @*
    s_m_io2_out_2 = n5935_q; // (isignal)
  initial
    s_m_io2_out_2 = 1'b0;
  /* find_the_damn_issue_sky130.vhd:1098:16  */
  always @*
    s_m_io2_en_2 = n5937_q; // (isignal)
  initial
    s_m_io2_en_2 = 1'b0;
  /* find_the_damn_issue_sky130.vhd:1099:16  */
  always @*
    s_m_io2_opendrain_2 = n5939_q; // (isignal)
  initial
    s_m_io2_opendrain_2 = 1'b0;
  /* find_the_damn_issue_sky130.vhd:1100:16  */
  always @*
    s_m_io3_out_2 = n5940_q; // (isignal)
  initial
    s_m_io3_out_2 = 1'b0;
  /* find_the_damn_issue_sky130.vhd:1101:16  */
  always @*
    s_m_io3_en_2 = n5942_q; // (isignal)
  initial
    s_m_io3_en_2 = 1'b0;
  /* find_the_damn_issue_sky130.vhd:1102:16  */
  always @*
    s_m_io3_opendrain_2 = n5944_q; // (isignal)
  initial
    s_m_io3_opendrain_2 = 1'b0;
  /* find_the_damn_issue_sky130.vhd:1103:16  */
  always @*
    s_m_io4_out_2 = n5945_q; // (isignal)
  initial
    s_m_io4_out_2 = 1'b0;
  /* find_the_damn_issue_sky130.vhd:1104:16  */
  always @*
    s_m_io4_en_2 = n5947_q; // (isignal)
  initial
    s_m_io4_en_2 = 1'b0;
  /* find_the_damn_issue_sky130.vhd:1105:16  */
  always @*
    s_m_io4_opendrain_2 = n5949_q; // (isignal)
  initial
    s_m_io4_opendrain_2 = 1'b0;
  /* find_the_damn_issue_sky130.vhd:1106:16  */
  always @*
    s_m_io5_out_2 = n5951_q; // (isignal)
  initial
    s_m_io5_out_2 = 1'b0;
  /* find_the_damn_issue_sky130.vhd:1107:16  */
  always @*
    s_m_io5_en_2 = n5953_q; // (isignal)
  initial
    s_m_io5_en_2 = 1'b0;
  /* find_the_damn_issue_sky130.vhd:1108:16  */
  always @*
    s_m_io5_opendrain_2 = n5955_q; // (isignal)
  initial
    s_m_io5_opendrain_2 = 1'b0;
  /* find_the_damn_issue_sky130.vhd:1109:16  */
  always @*
    s_m_io8_out_2 = n5957_q; // (isignal)
  initial
    s_m_io8_out_2 = 1'b0;
  /* find_the_damn_issue_sky130.vhd:1110:16  */
  always @*
    s_m_io9_out_2 = n5959_q; // (isignal)
  initial
    s_m_io9_out_2 = 1'b0;
  /* find_the_damn_issue_sky130.vhd:1111:16  */
  always @*
    s_m_io10_out_2 = n5961_q; // (isignal)
  initial
    s_m_io10_out_2 = 1'b0;
  /* find_the_damn_issue_sky130.vhd:1112:16  */
  always @*
    s_m_io11_out_2 = n5963_q; // (isignal)
  initial
    s_m_io11_out_2 = 1'b0;
  /* find_the_damn_issue_sky130.vhd:1113:16  */
  always @*
    s_m_io12_out_2 = n5965_q; // (isignal)
  initial
    s_m_io12_out_2 = 1'b0;
  /* find_the_damn_issue_sky130.vhd:1114:16  */
  always @*
    s_m_io13_out_2 = n5967_q; // (isignal)
  initial
    s_m_io13_out_2 = 1'b0;
  /* find_the_damn_issue_sky130.vhd:1115:16  */
  always @*
    s_m_io14_out_2 = n5969_q; // (isignal)
  initial
    s_m_io14_out_2 = 1'b0;
  /* find_the_damn_issue_sky130.vhd:1116:16  */
  always @*
    s_m_io15_out_2 = n5971_q; // (isignal)
  initial
    s_m_io15_out_2 = 1'b0;
  /* find_the_damn_issue_sky130.vhd:1117:16  */
  assign s_command_bit_7 = n3767_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:1118:16  */
  assign s_command_bit_6 = n3768_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:1119:16  */
  assign s_command_bit_5 = n3769_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:1120:16  */
  assign s_command_bit_4 = n3770_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:1121:16  */
  assign s_command_bit_3 = n3771_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:1122:16  */
  assign s_command_bit_2 = n3772_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:1123:16  */
  assign s_command_bit_1 = n3773_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:1124:16  */
  assign s_command_bit_0 = n3774_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:1125:16  */
  assign s_command_bit_5_2 = n3775_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:1126:16  */
  assign s_state_eq_load_low_and_command_valid = n3786_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:1127:16  */
  assign s_command_bit_5_3 = n3787_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:1128:16  */
  assign s_command_bit_5_4 = n3788_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:1129:16  */
  assign s_command_bit_4_2 = n3789_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:1130:16  */
  assign s_command_bit_4_3 = n3790_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:1131:16  */
  assign s_m_io4_out_mux2 = n5421_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:1132:16  */
  assign s_command_bit_3_2 = n3791_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:1133:16  */
  assign s_command_bit_3_3 = n3792_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:1134:16  */
  assign s_m_io3_out_mux2_xor_toggleclockdelayed_mux2 = n5401_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:1135:16  */
  assign s_command_bit_2_2 = n3794_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:1136:16  */
  assign s_command_bit_2_3 = n3795_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:1137:16  */
  assign s_m_io2_out_mux2 = n5271_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:1138:16  */
  assign s_command_bit_1_2 = n3796_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:1139:16  */
  assign s_command_bit_1_3 = n3797_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:1140:16  */
  assign s_command_bit_0_mux3 = n5420_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:1141:16  */
  assign s_command_bit_0_2 = n3798_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:1142:16  */
  assign s_command_bit_0_3 = n3799_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:1143:16  */
  assign s_m_io0_out_mux2 = n5255_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:1144:16  */
  assign s_const_xxx = scl_counter2_out_const_xxx; // (signal)
  /* find_the_damn_issue_sky130.vhd:1145:16  */
  assign s_const_xxx_2 = scl_counter1_out_const_xxx; // (signal)
  /* find_the_damn_issue_sky130.vhd:1146:16  */
  assign s_clockdiv_mux1_cmdinc_rewired_mux1 = n3808_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:1147:16  */
  assign s_cmdinc_bitlength_mux2_rewired_mux1_cmdinc_rewired_mux1_cmdinc_rewired_mux1 = n3837_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:1148:16  */
  assign s_command_bit_3_4 = n3838_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:1149:16  */
  assign s_config_clockdelay_mux2 = n3852_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:1150:16  */
  assign s_command_bit_0_neq_command_bit_2 = n3863_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:1151:16  */
  assign s_command_bit_3_not = n3865_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:1152:16  */
  assign s_command_bit_0_not = n3867_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:1153:16  */
  assign s_config_shiftout_mux2 = n3260_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:1154:16  */
  assign s_config_shiftin_mux2 = n3268_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:1155:16  */
  assign s_command_bit_0_not_2 = n3869_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:1156:16  */
  assign s_config_tmsoutmode_mux2 = n3276_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:1157:16  */
  assign s_config_stopclockonlastbit_mux3 = n4512_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:1158:16  */
  assign s_config_stopclockonsignal_mux3 = n4566_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:1159:16  */
  assign s_config_stopclocksignal_mux3 = n4621_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:1160:16  */
  assign s_command_bit_1_4 = n3870_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:1162:9  */
  scl_counter_13 scl_counter0 (
    .clk(clk),
    .rst_n(rst_n),
    .in_unnamed(s_clockdiv_2),
    .out_m_last(scl_counter0_out_m_last));
  /* find_the_damn_issue_sky130.vhd:1423:31  */
  assign n3167_o = s_state == 4'b0000;
  /* find_the_damn_issue_sky130.vhd:1423:41  */
  assign n3168_o = n3167_o & in_command_valid;
  /* find_the_damn_issue_sky130.vhd:1423:68  */
  assign n3169_o = n3168_o & in_unnamed;
  /* find_the_damn_issue_sky130.vhd:1423:17  */
  assign n3172_o = n3169_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:1428:31  */
  assign n3174_o = s_state == 4'b0000;
  /* find_the_damn_issue_sky130.vhd:1428:41  */
  assign n3175_o = n3174_o & in_command_valid;
  /* find_the_damn_issue_sky130.vhd:1428:68  */
  assign n3176_o = n3175_o & in_unnamed;
  /* find_the_damn_issue_sky130.vhd:1428:17  */
  assign n3178_o = n3176_o ? 4'b0000 : s_followupstate;
  /* find_the_damn_issue_sky130.vhd:1433:104  */
  assign n3179_o = in_command[7];
  /* find_the_damn_issue_sky130.vhd:1433:91  */
  assign n3180_o = ~n3179_o;
  /* find_the_damn_issue_sky130.vhd:1433:137  */
  assign n3183_o = s_state == 4'b0000;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n3190_o = n3183_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:1433:147  */
  assign n3191_o = n3190_o & in_command_valid;
  /* find_the_damn_issue_sky130.vhd:1433:168  */
  assign n3192_o = n3191_o & in_unnamed;
  /* find_the_damn_issue_sky130.vhd:1433:109  */
  assign n3193_o = n3180_o & n3192_o;
  /* find_the_damn_issue_sky130.vhd:1434:17  */
  assign n3195_o = s_command_bit_7_not_and_state_eq_idle_and_command_valid_and_unnamed ? 4'b1001 : n3178_o;
  /* find_the_damn_issue_sky130.vhd:1439:17  */
  assign n3197_o = s_command_bit_7_not_and_state_eq_idle_and_command_valid_and_unnamed ? 4'b0111 : s_state;
  /* find_the_damn_issue_sky130.vhd:1444:30  */
  assign n3198_o = in_command[1];
  /* find_the_damn_issue_sky130.vhd:1444:40  */
  assign n3199_o = n3198_o & s_command_bit_7_not_and_state_eq_idle_and_command_valid_and_unnamed;
  /* find_the_damn_issue_sky130.vhd:1444:17  */
  assign n3201_o = n3199_o ? 4'b0110 : n3197_o;
  /* find_the_damn_issue_sky130.vhd:1449:147  */
  assign n3203_o = in_command[6:2];
  /* find_the_damn_issue_sky130.vhd:1449:160  */
  assign n3205_o = n3203_o == 5'b00000;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n3212_o = n3205_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:1449:197  */
  assign n3213_o = in_command[7];
  /* find_the_damn_issue_sky130.vhd:1449:184  */
  assign n3214_o = ~n3213_o;
  /* find_the_damn_issue_sky130.vhd:1449:178  */
  assign n3215_o = ~n3214_o;
  /* find_the_damn_issue_sky130.vhd:1449:231  */
  assign n3218_o = s_state == 4'b0000;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n3225_o = n3218_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:1449:241  */
  assign n3226_o = n3225_o & in_command_valid;
  /* find_the_damn_issue_sky130.vhd:1449:262  */
  assign n3227_o = n3226_o & in_unnamed;
  /* find_the_damn_issue_sky130.vhd:1449:203  */
  assign n3228_o = n3215_o & n3227_o;
  /* find_the_damn_issue_sky130.vhd:1449:171  */
  assign n3229_o = n3212_o & n3228_o;
  /* find_the_damn_issue_sky130.vhd:1450:30  */
  assign n3230_o = in_command[0];
  /* find_the_damn_issue_sky130.vhd:1450:40  */
  assign n3231_o = n3230_o & s_command_rewired_eq_const_0_and_command_bit_7_not_not_and_state_eq_idle_and_command_valid_and_unnamed;
  /* find_the_damn_issue_sky130.vhd:1450:17  */
  assign n3234_o = n3231_o ? 8'b00000000 : 8'bX;
  /* find_the_damn_issue_sky130.vhd:1455:30  */
  assign n3235_o = in_command[0];
  /* find_the_damn_issue_sky130.vhd:1455:40  */
  assign n3236_o = n3235_o & s_command_rewired_eq_const_0_and_command_bit_7_not_not_and_state_eq_idle_and_command_valid_and_unnamed;
  /* find_the_damn_issue_sky130.vhd:1455:17  */
  assign n3239_o = n3236_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:1460:36  */
  assign n3240_o = in_command[0];
  /* find_the_damn_issue_sky130.vhd:1460:23  */
  assign n3241_o = ~n3240_o;
  /* find_the_damn_issue_sky130.vhd:1460:47  */
  assign n3242_o = n3241_o & s_command_rewired_eq_const_0_and_command_bit_7_not_not_and_state_eq_idle_and_command_valid_and_unnamed;
  /* find_the_damn_issue_sky130.vhd:1460:17  */
  assign n3244_o = n3242_o ? 4'b0010 : n3201_o;
  /* find_the_damn_issue_sky130.vhd:1466:31  */
  assign n3246_o = s_state == 4'b0000;
  /* find_the_damn_issue_sky130.vhd:1466:41  */
  assign n3247_o = n3246_o & in_command_valid;
  /* find_the_damn_issue_sky130.vhd:1466:68  */
  assign n3248_o = n3247_o & in_unnamed;
  /* find_the_damn_issue_sky130.vhd:1466:17  */
  assign n3250_o = n3248_o ? 1'b0 : s_config_clockdelay;
  /* find_the_damn_issue_sky130.vhd:1475:31  */
  assign n3252_o = s_state == 4'b0000;
  /* find_the_damn_issue_sky130.vhd:1475:41  */
  assign n3253_o = n3252_o & in_command_valid;
  /* find_the_damn_issue_sky130.vhd:1475:68  */
  assign n3254_o = n3253_o & in_unnamed;
  /* find_the_damn_issue_sky130.vhd:1475:17  */
  assign n3256_o = n3254_o ? 1'b0 : s_config_shiftout;
  /* find_the_damn_issue_sky130.vhd:1481:61  */
  assign n3257_o = in_command[4];
  /* find_the_damn_issue_sky130.vhd:1481:77  */
  assign n3258_o = in_command[6];
  /* find_the_damn_issue_sky130.vhd:1481:65  */
  assign n3259_o = n3257_o | n3258_o;
  /* find_the_damn_issue_sky130.vhd:1480:17  */
  assign n3260_o = s_command_bit_7_not_and_state_eq_idle_and_command_valid_and_unnamed ? n3259_o : n3256_o;
  /* find_the_damn_issue_sky130.vhd:1486:31  */
  assign n3262_o = s_state == 4'b0000;
  /* find_the_damn_issue_sky130.vhd:1486:41  */
  assign n3263_o = n3262_o & in_command_valid;
  /* find_the_damn_issue_sky130.vhd:1486:68  */
  assign n3264_o = n3263_o & in_unnamed;
  /* find_the_damn_issue_sky130.vhd:1486:17  */
  assign n3266_o = n3264_o ? 1'b0 : s_config_shiftin;
  /* find_the_damn_issue_sky130.vhd:1492:59  */
  assign n3267_o = in_command[5];
  /* find_the_damn_issue_sky130.vhd:1491:17  */
  assign n3268_o = s_command_bit_7_not_and_state_eq_idle_and_command_valid_and_unnamed ? n3267_o : n3266_o;
  /* find_the_damn_issue_sky130.vhd:1499:31  */
  assign n3270_o = s_state == 4'b0000;
  /* find_the_damn_issue_sky130.vhd:1499:41  */
  assign n3271_o = n3270_o & in_command_valid;
  /* find_the_damn_issue_sky130.vhd:1499:68  */
  assign n3272_o = n3271_o & in_unnamed;
  /* find_the_damn_issue_sky130.vhd:1499:17  */
  assign n3274_o = n3272_o ? 1'b0 : s_config_tmsoutmode;
  /* find_the_damn_issue_sky130.vhd:1505:62  */
  assign n3275_o = in_command[6];
  /* find_the_damn_issue_sky130.vhd:1504:17  */
  assign n3276_o = s_command_bit_7_not_and_state_eq_idle_and_command_valid_and_unnamed ? n3275_o : n3274_o;
  /* find_the_damn_issue_sky130.vhd:1510:31  */
  assign n3278_o = s_state == 4'b0000;
  /* find_the_damn_issue_sky130.vhd:1510:41  */
  assign n3279_o = n3278_o & in_command_valid;
  /* find_the_damn_issue_sky130.vhd:1510:68  */
  assign n3280_o = n3279_o & in_unnamed;
  /* find_the_damn_issue_sky130.vhd:1510:17  */
  assign n3282_o = n3280_o ? 1'b1 : s_config_stopclockonlastbit;
  /* find_the_damn_issue_sky130.vhd:1516:31  */
  assign n3284_o = s_state == 4'b0000;
  /* find_the_damn_issue_sky130.vhd:1516:41  */
  assign n3285_o = n3284_o & in_command_valid;
  /* find_the_damn_issue_sky130.vhd:1516:68  */
  assign n3286_o = n3285_o & in_unnamed;
  /* find_the_damn_issue_sky130.vhd:1516:17  */
  assign n3288_o = n3286_o ? 1'b0 : s_config_stopclockonsignal;
  /* find_the_damn_issue_sky130.vhd:1523:17  */
  assign n3289_o = s_config_dataloopback ? in_unnamed_3 : in_unnamed_4;
  /* find_the_damn_issue_sky130.vhd:1528:115  */
  assign n3292_o = 1'b0 == s_config_targetpingroup;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n3299_o = n3292_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:1528:169  */
  assign n3302_o = s_state == 4'b0010;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n3309_o = n3302_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:1528:186  */
  assign n3310_o = n3309_o & in_command_valid;
  /* find_the_damn_issue_sky130.vhd:1528:142  */
  assign n3311_o = n3299_o & n3310_o;
  /* find_the_damn_issue_sky130.vhd:1529:117  */
  assign n3314_o = 1'b0 == s_config_targetpingroup;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n3321_o = n3314_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:1529:171  */
  assign n3324_o = s_state == 4'b0010;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n3331_o = n3324_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:1529:188  */
  assign n3332_o = n3331_o & in_command_valid;
  /* find_the_damn_issue_sky130.vhd:1529:144  */
  assign n3333_o = n3321_o & n3332_o;
  /* find_the_damn_issue_sky130.vhd:1530:115  */
  assign n3336_o = 1'b1 == s_config_targetpingroup;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n3343_o = n3336_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:1530:169  */
  assign n3346_o = s_state == 4'b0010;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n3353_o = n3346_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:1530:186  */
  assign n3354_o = n3353_o & in_command_valid;
  /* find_the_damn_issue_sky130.vhd:1530:142  */
  assign n3355_o = n3343_o & n3354_o;
  /* find_the_damn_issue_sky130.vhd:1531:117  */
  assign n3358_o = 1'b1 == s_config_targetpingroup;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n3365_o = n3358_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:1531:171  */
  assign n3368_o = s_state == 4'b0010;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n3375_o = n3368_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:1531:188  */
  assign n3376_o = n3375_o & in_command_valid;
  /* find_the_damn_issue_sky130.vhd:1531:144  */
  assign n3377_o = n3365_o & n3376_o;
  /* find_the_damn_issue_sky130.vhd:1532:117  */
  assign n3380_o = 1'b1 == s_config_targetpingroup;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n3387_o = n3380_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:1532:171  */
  assign n3390_o = s_state == 4'b0010;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n3397_o = n3390_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:1532:188  */
  assign n3398_o = n3397_o & in_command_valid;
  /* find_the_damn_issue_sky130.vhd:1532:144  */
  assign n3399_o = n3387_o & n3398_o;
  /* find_the_damn_issue_sky130.vhd:1533:117  */
  assign n3402_o = 1'b1 == s_config_targetpingroup;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n3409_o = n3402_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:1533:171  */
  assign n3412_o = s_state == 4'b0010;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n3419_o = n3412_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:1533:188  */
  assign n3420_o = n3419_o & in_command_valid;
  /* find_the_damn_issue_sky130.vhd:1533:144  */
  assign n3421_o = n3409_o & n3420_o;
  /* find_the_damn_issue_sky130.vhd:1534:117  */
  assign n3424_o = 1'b1 == s_config_targetpingroup;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n3431_o = n3424_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:1534:171  */
  assign n3434_o = s_state == 4'b0010;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n3441_o = n3434_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:1534:188  */
  assign n3442_o = n3441_o & in_command_valid;
  /* find_the_damn_issue_sky130.vhd:1534:144  */
  assign n3443_o = n3431_o & n3442_o;
  /* find_the_damn_issue_sky130.vhd:1535:117  */
  assign n3446_o = 1'b1 == s_config_targetpingroup;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n3453_o = n3446_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:1535:171  */
  assign n3456_o = s_state == 4'b0010;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n3463_o = n3456_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:1535:188  */
  assign n3464_o = n3463_o & in_command_valid;
  /* find_the_damn_issue_sky130.vhd:1535:144  */
  assign n3465_o = n3453_o & n3464_o;
  /* find_the_damn_issue_sky130.vhd:1536:117  */
  assign n3468_o = 1'b1 == s_config_targetpingroup;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n3475_o = n3468_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:1536:171  */
  assign n3478_o = s_state == 4'b0010;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n3485_o = n3478_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:1536:188  */
  assign n3486_o = n3485_o & in_command_valid;
  /* find_the_damn_issue_sky130.vhd:1536:144  */
  assign n3487_o = n3475_o & n3486_o;
  /* find_the_damn_issue_sky130.vhd:1537:117  */
  assign n3490_o = 1'b1 == s_config_targetpingroup;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n3497_o = n3490_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:1537:171  */
  assign n3500_o = s_state == 4'b0010;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n3507_o = n3500_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:1537:188  */
  assign n3508_o = n3507_o & in_command_valid;
  /* find_the_damn_issue_sky130.vhd:1537:144  */
  assign n3509_o = n3497_o & n3508_o;
  /* find_the_damn_issue_sky130.vhd:1538:114  */
  assign n3512_o = 1'b0 == s_config_targetpingroup;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n3519_o = n3512_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:1538:168  */
  assign n3522_o = s_state == 4'b0011;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n3529_o = n3522_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:1538:184  */
  assign n3530_o = n3529_o & in_command_valid;
  /* find_the_damn_issue_sky130.vhd:1538:141  */
  assign n3531_o = n3519_o & n3530_o;
  /* find_the_damn_issue_sky130.vhd:1539:116  */
  assign n3534_o = 1'b0 == s_config_targetpingroup;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n3541_o = n3534_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:1539:170  */
  assign n3544_o = s_state == 4'b0011;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n3551_o = n3544_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:1539:186  */
  assign n3552_o = n3551_o & in_command_valid;
  /* find_the_damn_issue_sky130.vhd:1539:143  */
  assign n3553_o = n3541_o & n3552_o;
  /* find_the_damn_issue_sky130.vhd:1540:116  */
  assign n3556_o = 1'b0 == s_config_targetpingroup;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n3563_o = n3556_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:1540:170  */
  assign n3566_o = s_state == 4'b0011;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n3573_o = n3566_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:1540:186  */
  assign n3574_o = n3573_o & in_command_valid;
  /* find_the_damn_issue_sky130.vhd:1540:143  */
  assign n3575_o = n3563_o & n3574_o;
  /* find_the_damn_issue_sky130.vhd:1541:116  */
  assign n3578_o = 1'b0 == s_config_targetpingroup;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n3585_o = n3578_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:1541:170  */
  assign n3588_o = s_state == 4'b0011;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n3595_o = n3588_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:1541:186  */
  assign n3596_o = n3595_o & in_command_valid;
  /* find_the_damn_issue_sky130.vhd:1541:143  */
  assign n3597_o = n3585_o & n3596_o;
  /* find_the_damn_issue_sky130.vhd:1542:116  */
  assign n3600_o = 1'b0 == s_config_targetpingroup;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n3607_o = n3600_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:1542:170  */
  assign n3610_o = s_state == 4'b0011;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n3617_o = n3610_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:1542:186  */
  assign n3618_o = n3617_o & in_command_valid;
  /* find_the_damn_issue_sky130.vhd:1542:143  */
  assign n3619_o = n3607_o & n3618_o;
  /* find_the_damn_issue_sky130.vhd:1543:116  */
  assign n3622_o = 1'b0 == s_config_targetpingroup;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n3629_o = n3622_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:1543:170  */
  assign n3632_o = s_state == 4'b0011;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n3639_o = n3632_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:1543:186  */
  assign n3640_o = n3639_o & in_command_valid;
  /* find_the_damn_issue_sky130.vhd:1543:143  */
  assign n3641_o = n3629_o & n3640_o;
  /* find_the_damn_issue_sky130.vhd:1545:35  */
  assign n3643_o = {1'b0, in_command};
  /* find_the_damn_issue_sky130.vhd:1545:62  */
  assign n3645_o = {8'b00000000, s_carryin};
  /* find_the_damn_issue_sky130.vhd:1545:48  */
  assign n3646_o = n3643_o + n3645_o;
  /* find_the_damn_issue_sky130.vhd:1546:30  */
  assign n3648_o = s_state == 4'b0111;
  /* find_the_damn_issue_sky130.vhd:1546:45  */
  assign n3649_o = n3648_o & in_command_valid;
  /* find_the_damn_issue_sky130.vhd:1547:51  */
  assign n3650_o = n3646_o[8];
  /* find_the_damn_issue_sky130.vhd:1546:17  */
  assign n3651_o = n3649_o ? n3650_o : s_carryin;
  /* find_the_damn_issue_sky130.vhd:1551:30  */
  assign n3653_o = s_state == 4'b1000;
  /* find_the_damn_issue_sky130.vhd:1551:46  */
  assign n3654_o = n3653_o & in_command_valid;
  /* find_the_damn_issue_sky130.vhd:1551:17  */
  assign n3656_o = n3654_o ? 1'b1 : n3651_o;
  /* find_the_damn_issue_sky130.vhd:1559:38  */
  assign n3658_o = s_followupstate == 4'b0000;
  /* find_the_damn_issue_sky130.vhd:1559:64  */
  assign n3660_o = s_state == 4'b0111;
  /* find_the_damn_issue_sky130.vhd:1559:79  */
  assign n3661_o = n3660_o & in_command_valid;
  /* find_the_damn_issue_sky130.vhd:1559:50  */
  assign n3662_o = n3658_o & n3661_o;
  /* find_the_damn_issue_sky130.vhd:1560:57  */
  assign n3663_o = s_clockdiv_2[16:8];
  /* find_the_damn_issue_sky130.vhd:1560:81  */
  assign n3664_o = n3646_o[7:0];
  /* find_the_damn_issue_sky130.vhd:1560:71  */
  assign n3665_o = {n3663_o, n3664_o};
  /* find_the_damn_issue_sky130.vhd:1559:17  */
  assign n3666_o = n3662_o ? n3665_o : s_clockdiv_2;
  /* find_the_damn_issue_sky130.vhd:1564:91  */
  assign n3669_o = s_bitlength == 20'b00000000000000000001;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n3676_o = n3669_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:1564:61  */
  assign n3677_o = s_config_stopclockonlastbit & n3676_o;
  /* find_the_damn_issue_sky130.vhd:1564:180  */
  assign n3679_o = in_unnamed_7 == s_config_stopclocksignal;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n3686_o = n3679_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:1564:149  */
  assign n3687_o = s_config_stopclockonsignal & n3686_o;
  /* find_the_damn_issue_sky130.vhd:1564:118  */
  assign n3688_o = n3677_o | n3687_o;
  /* find_the_damn_issue_sky130.vhd:1565:59  */
  assign n3689_o = ~in_command_valid;
  /* find_the_damn_issue_sky130.vhd:1565:53  */
  assign n3690_o = s_config_shiftout & n3689_o;
  /* find_the_damn_issue_sky130.vhd:1566:59  */
  assign n3691_o = ~in_unnamed;
  /* find_the_damn_issue_sky130.vhd:1566:53  */
  assign n3692_o = s_config_shiftin & n3691_o;
  /* find_the_damn_issue_sky130.vhd:1567:31  */
  assign n3694_o = s_state == 4'b1010;
  /* find_the_damn_issue_sky130.vhd:1567:57  */
  assign n3695_o = ~n3692_o;
  /* find_the_damn_issue_sky130.vhd:1567:51  */
  assign n3696_o = n3694_o & n3695_o;
  /* find_the_damn_issue_sky130.vhd:1567:84  */
  assign n3697_o = n3696_o & s_tick;
  /* find_the_damn_issue_sky130.vhd:1568:58  */
  assign n3699_o = s_bitlength - 20'b00000000000000000001;
  /* find_the_damn_issue_sky130.vhd:1567:17  */
  assign n3700_o = n3697_o ? n3699_o : s_bitlength;
  /* find_the_damn_issue_sky130.vhd:1572:31  */
  assign n3702_o = s_state == 4'b0000;
  /* find_the_damn_issue_sky130.vhd:1572:41  */
  assign n3703_o = n3702_o & in_command_valid;
  /* find_the_damn_issue_sky130.vhd:1572:68  */
  assign n3704_o = n3703_o & in_unnamed;
  /* find_the_damn_issue_sky130.vhd:1572:17  */
  assign n3706_o = n3704_o ? 20'b00000000000000000000 : n3700_o;
  /* find_the_damn_issue_sky130.vhd:1577:88  */
  assign n3709_o = s_state == 4'b1010;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n3716_o = n3709_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:1577:114  */
  assign n3717_o = ~n3692_o;
  /* find_the_damn_issue_sky130.vhd:1577:108  */
  assign n3718_o = n3716_o & n3717_o;
  /* find_the_damn_issue_sky130.vhd:1577:135  */
  assign n3719_o = n3718_o & s_tick;
  /* find_the_damn_issue_sky130.vhd:1577:60  */
  assign n3720_o = n3688_o & n3719_o;
  /* find_the_damn_issue_sky130.vhd:1579:17  */
  assign n3723_o = s_config_tmsoutmode ? 3'b110 : 3'b111;
  /* find_the_damn_issue_sky130.vhd:1585:77  */
  assign n3724_o = s_config_tmsoutmode & s_config_msbfirst;
  /* find_the_damn_issue_sky130.vhd:1585:54  */
  assign n3726_o = {2'b00, n3724_o};
  /* find_the_damn_issue_sky130.vhd:1585:46  */
  assign n3727_o = s_m_value + n3726_o;
  /* find_the_damn_issue_sky130.vhd:1585:125  */
  assign n3728_o = {s_config_msbfirst, s_config_msbfirst};
  /* find_the_damn_issue_sky130.vhd:1585:145  */
  assign n3729_o = {n3728_o, s_config_msbfirst};
  /* find_the_damn_issue_sky130.vhd:1585:102  */
  assign n3730_o = n3727_o ^ n3729_o;
  /* find_the_damn_issue_sky130.vhd:1587:72  */
  assign n3731_o = in_command[0];
  /* find_the_damn_issue_sky130.vhd:1587:25  */
  assign n3733_o = n3730_o == 3'b000;
  /* find_the_damn_issue_sky130.vhd:1588:72  */
  assign n3734_o = in_command[1];
  /* find_the_damn_issue_sky130.vhd:1588:25  */
  assign n3736_o = n3730_o == 3'b001;
  /* find_the_damn_issue_sky130.vhd:1589:72  */
  assign n3737_o = in_command[2];
  /* find_the_damn_issue_sky130.vhd:1589:25  */
  assign n3739_o = n3730_o == 3'b010;
  /* find_the_damn_issue_sky130.vhd:1590:72  */
  assign n3740_o = in_command[3];
  /* find_the_damn_issue_sky130.vhd:1590:25  */
  assign n3742_o = n3730_o == 3'b011;
  /* find_the_damn_issue_sky130.vhd:1591:72  */
  assign n3743_o = in_command[4];
  /* find_the_damn_issue_sky130.vhd:1591:25  */
  assign n3745_o = n3730_o == 3'b100;
  /* find_the_damn_issue_sky130.vhd:1592:72  */
  assign n3746_o = in_command[5];
  /* find_the_damn_issue_sky130.vhd:1592:25  */
  assign n3748_o = n3730_o == 3'b101;
  /* find_the_damn_issue_sky130.vhd:1593:72  */
  assign n3749_o = in_command[6];
  /* find_the_damn_issue_sky130.vhd:1593:25  */
  assign n3751_o = n3730_o == 3'b110;
  /* find_the_damn_issue_sky130.vhd:1594:72  */
  assign n3752_o = in_command[7];
  /* find_the_damn_issue_sky130.vhd:1594:25  */
  assign n3754_o = n3730_o == 3'b111;
  assign n3755_o = {n3754_o, n3751_o, n3748_o, n3745_o, n3742_o, n3739_o, n3736_o, n3733_o};
  /* find_the_damn_issue_sky130.vhd:1586:17  */
  always @*
    case (n3755_o)
      8'b10000000: n3757_o = n3752_o;
      8'b01000000: n3757_o = n3749_o;
      8'b00100000: n3757_o = n3746_o;
      8'b00010000: n3757_o = n3743_o;
      8'b00001000: n3757_o = n3740_o;
      8'b00000100: n3757_o = n3737_o;
      8'b00000010: n3757_o = n3734_o;
      8'b00000001: n3757_o = n3731_o;
      default: n3757_o = 1'bX;
    endcase
  /* find_the_damn_issue_sky130.vhd:1598:44  */
  assign n3758_o = ~s_config_msbfirst;
  /* find_the_damn_issue_sky130.vhd:1616:26  */
  assign n3760_o = 1'b0 == s_config_targetpingroup;
  /* find_the_damn_issue_sky130.vhd:1616:67  */
  assign n3762_o = s_state == 4'b0010;
  /* find_the_damn_issue_sky130.vhd:1616:84  */
  assign n3763_o = n3762_o & in_command_valid;
  /* find_the_damn_issue_sky130.vhd:1616:53  */
  assign n3764_o = n3760_o & n3763_o;
  /* find_the_damn_issue_sky130.vhd:1617:54  */
  assign n3765_o = in_command[4];
  /* find_the_damn_issue_sky130.vhd:1616:17  */
  assign n3766_o = n3764_o ? n3765_o : s_m_io4_out_2;
  /* find_the_damn_issue_sky130.vhd:1645:45  */
  assign n3767_o = in_command[7];
  /* find_the_damn_issue_sky130.vhd:1646:45  */
  assign n3768_o = in_command[6];
  /* find_the_damn_issue_sky130.vhd:1647:45  */
  assign n3769_o = in_command[5];
  /* find_the_damn_issue_sky130.vhd:1648:45  */
  assign n3770_o = in_command[4];
  /* find_the_damn_issue_sky130.vhd:1649:45  */
  assign n3771_o = in_command[3];
  /* find_the_damn_issue_sky130.vhd:1650:45  */
  assign n3772_o = in_command[2];
  /* find_the_damn_issue_sky130.vhd:1651:45  */
  assign n3773_o = in_command[1];
  /* find_the_damn_issue_sky130.vhd:1652:45  */
  assign n3774_o = in_command[0];
  /* find_the_damn_issue_sky130.vhd:1653:47  */
  assign n3775_o = in_command[5];
  /* find_the_damn_issue_sky130.vhd:1654:81  */
  assign n3778_o = s_state == 4'b0100;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n3785_o = n3778_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:1654:97  */
  assign n3786_o = n3785_o & in_command_valid;
  /* find_the_damn_issue_sky130.vhd:1655:47  */
  assign n3787_o = in_command[5];
  /* find_the_damn_issue_sky130.vhd:1656:47  */
  assign n3788_o = in_command[5];
  /* find_the_damn_issue_sky130.vhd:1657:47  */
  assign n3789_o = in_command[4];
  /* find_the_damn_issue_sky130.vhd:1658:47  */
  assign n3790_o = in_command[4];
  /* find_the_damn_issue_sky130.vhd:1659:47  */
  assign n3791_o = in_command[3];
  /* find_the_damn_issue_sky130.vhd:1660:47  */
  assign n3792_o = in_command[3];
  /* find_the_damn_issue_sky130.vhd:1661:17  */
  assign n3793_o = s_const_0_eq_config_targetpingroup_and_state_eq_write_en_and_command_valid_4 ? s_command_bit_3_3 : s_m_io3_en_2;
  /* find_the_damn_issue_sky130.vhd:1666:47  */
  assign n3794_o = in_command[2];
  /* find_the_damn_issue_sky130.vhd:1667:47  */
  assign n3795_o = in_command[2];
  /* find_the_damn_issue_sky130.vhd:1668:47  */
  assign n3796_o = in_command[1];
  /* find_the_damn_issue_sky130.vhd:1669:47  */
  assign n3797_o = in_command[1];
  /* find_the_damn_issue_sky130.vhd:1670:47  */
  assign n3798_o = in_command[0];
  /* find_the_damn_issue_sky130.vhd:1671:47  */
  assign n3799_o = in_command[0];
  /* find_the_damn_issue_sky130.vhd:1673:38  */
  assign n3801_o = s_followupstate == 4'b0000;
  /* find_the_damn_issue_sky130.vhd:1673:64  */
  assign n3803_o = s_state == 4'b1000;
  /* find_the_damn_issue_sky130.vhd:1673:80  */
  assign n3804_o = n3803_o & in_command_valid;
  /* find_the_damn_issue_sky130.vhd:1673:50  */
  assign n3805_o = n3801_o & n3804_o;
  /* find_the_damn_issue_sky130.vhd:1674:93  */
  assign n3806_o = n3666_o[7:0];
  /* find_the_damn_issue_sky130.vhd:1674:74  */
  assign n3807_o = {n3646_o, n3806_o};
  /* find_the_damn_issue_sky130.vhd:1673:17  */
  assign n3808_o = n3805_o ? n3807_o : n3666_o;
  /* find_the_damn_issue_sky130.vhd:1680:30  */
  assign n3810_o = s_state == 4'b0110;
  /* find_the_damn_issue_sky130.vhd:1680:46  */
  assign n3811_o = n3810_o & in_command_valid;
  /* find_the_damn_issue_sky130.vhd:1681:84  */
  assign n3812_o = n3706_o[19:9];
  /* find_the_damn_issue_sky130.vhd:1681:98  */
  assign n3813_o = {n3812_o, n3646_o};
  /* find_the_damn_issue_sky130.vhd:1680:17  */
  assign n3814_o = n3811_o ? n3813_o : n3706_o;
  /* find_the_damn_issue_sky130.vhd:1686:44  */
  assign n3816_o = s_followupstate == 4'b0000;
  /* find_the_damn_issue_sky130.vhd:1686:23  */
  assign n3817_o = ~n3816_o;
  /* find_the_damn_issue_sky130.vhd:1686:71  */
  assign n3819_o = s_state == 4'b0111;
  /* find_the_damn_issue_sky130.vhd:1686:86  */
  assign n3820_o = n3819_o & in_command_valid;
  /* find_the_damn_issue_sky130.vhd:1686:57  */
  assign n3821_o = n3817_o & n3820_o;
  /* find_the_damn_issue_sky130.vhd:1687:124  */
  assign n3822_o = n3814_o[19:11];
  /* find_the_damn_issue_sky130.vhd:1687:149  */
  assign n3823_o = n3646_o[7:0];
  /* find_the_damn_issue_sky130.vhd:1687:139  */
  assign n3824_o = {n3822_o, n3823_o};
  /* find_the_damn_issue_sky130.vhd:1687:202  */
  assign n3825_o = n3814_o[2:0];
  /* find_the_damn_issue_sky130.vhd:1687:162  */
  assign n3826_o = {n3824_o, n3825_o};
  /* find_the_damn_issue_sky130.vhd:1686:17  */
  assign n3827_o = n3821_o ? n3826_o : n3814_o;
  /* find_the_damn_issue_sky130.vhd:1692:44  */
  assign n3829_o = s_followupstate == 4'b0000;
  /* find_the_damn_issue_sky130.vhd:1692:23  */
  assign n3830_o = ~n3829_o;
  /* find_the_damn_issue_sky130.vhd:1692:71  */
  assign n3832_o = s_state == 4'b1000;
  /* find_the_damn_issue_sky130.vhd:1692:87  */
  assign n3833_o = n3832_o & in_command_valid;
  /* find_the_damn_issue_sky130.vhd:1692:57  */
  assign n3834_o = n3830_o & n3833_o;
  /* find_the_damn_issue_sky130.vhd:1693:175  */
  assign n3835_o = n3827_o[10:0];
  /* find_the_damn_issue_sky130.vhd:1693:115  */
  assign n3836_o = {n3646_o, n3835_o};
  /* find_the_damn_issue_sky130.vhd:1692:17  */
  assign n3837_o = n3834_o ? n3836_o : n3827_o;
  /* find_the_damn_issue_sky130.vhd:1698:47  */
  assign n3838_o = in_command[3];
  /* find_the_damn_issue_sky130.vhd:1699:17  */
  assign n3839_o = s_const_0_eq_config_targetpingroup_and_state_eq_write_out_and_command_valid ? s_command_bit_3_4 : s_config_idleclockstate;
  /* find_the_damn_issue_sky130.vhd:1705:77  */
  assign n3841_o = in_command[0];
  /* find_the_damn_issue_sky130.vhd:1705:81  */
  assign n3842_o = n3841_o != n3839_o;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n3849_o = n3842_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:1705:120  */
  assign n3850_o = ~s_config_clockthreephase;
  /* find_the_damn_issue_sky130.vhd:1705:114  */
  assign n3851_o = n3849_o & n3850_o;
  /* find_the_damn_issue_sky130.vhd:1704:17  */
  assign n3852_o = s_command_bit_7_not_and_state_eq_idle_and_command_valid_and_unnamed ? n3851_o : n3250_o;
  /* find_the_damn_issue_sky130.vhd:1710:77  */
  assign n3854_o = in_command[0];
  /* find_the_damn_issue_sky130.vhd:1710:93  */
  assign n3855_o = in_command[2];
  /* find_the_damn_issue_sky130.vhd:1710:81  */
  assign n3856_o = n3854_o != n3855_o;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n3863_o = n3856_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:1711:55  */
  assign n3864_o = in_command[3];
  /* find_the_damn_issue_sky130.vhd:1711:42  */
  assign n3865_o = ~n3864_o;
  /* find_the_damn_issue_sky130.vhd:1712:55  */
  assign n3866_o = in_command[0];
  /* find_the_damn_issue_sky130.vhd:1712:42  */
  assign n3867_o = ~n3866_o;
  /* find_the_damn_issue_sky130.vhd:1715:57  */
  assign n3868_o = in_command[0];
  /* find_the_damn_issue_sky130.vhd:1715:44  */
  assign n3869_o = ~n3868_o;
  /* find_the_damn_issue_sky130.vhd:1717:47  */
  assign n3870_o = in_command[1];
  /* find_the_damn_issue_sky130.vhd:1718:17  */
  assign n3871_o = s_command_rewired_eq_const_0_and_command_bit_7_not_not_and_state_eq_idle_and_command_valid_and_unnamed ? s_command_bit_1_4 : s_config_targetpingroup;
  /* find_the_damn_issue_sky130.vhd:1723:49  */
  assign n3873_o = {7'b0000000, in_unnamed_2};
  /* find_the_damn_issue_sky130.vhd:1724:72  */
  assign n3874_o = n3873_o[7:2];
  /* find_the_damn_issue_sky130.vhd:1724:85  */
  assign n3875_o = {n3874_o, in_unnamed_3};
  /* find_the_damn_issue_sky130.vhd:1724:119  */
  assign n3876_o = n3873_o[0];
  /* find_the_damn_issue_sky130.vhd:1724:100  */
  assign n3877_o = {n3875_o, n3876_o};
  /* find_the_damn_issue_sky130.vhd:1725:104  */
  assign n3878_o = n3877_o[7:3];
  /* find_the_damn_issue_sky130.vhd:1725:117  */
  assign n3879_o = {n3878_o, in_unnamed_4};
  /* find_the_damn_issue_sky130.vhd:1725:167  */
  assign n3880_o = n3877_o[1:0];
  /* find_the_damn_issue_sky130.vhd:1725:132  */
  assign n3881_o = {n3879_o, n3880_o};
  /* find_the_damn_issue_sky130.vhd:1726:136  */
  assign n3882_o = n3881_o[7:4];
  /* find_the_damn_issue_sky130.vhd:1726:149  */
  assign n3883_o = {n3882_o, in_unnamed_5};
  /* find_the_damn_issue_sky130.vhd:1726:215  */
  assign n3884_o = n3881_o[2:0];
  /* find_the_damn_issue_sky130.vhd:1726:164  */
  assign n3885_o = {n3883_o, n3884_o};
  /* find_the_damn_issue_sky130.vhd:1727:168  */
  assign n3886_o = n3885_o[7:5];
  /* find_the_damn_issue_sky130.vhd:1727:181  */
  assign n3887_o = {n3886_o, in_unnamed_6};
  /* find_the_damn_issue_sky130.vhd:1727:263  */
  assign n3888_o = n3885_o[3:0];
  /* find_the_damn_issue_sky130.vhd:1727:196  */
  assign n3889_o = {n3887_o, n3888_o};
  /* find_the_damn_issue_sky130.vhd:1728:200  */
  assign n3890_o = n3889_o[7:6];
  /* find_the_damn_issue_sky130.vhd:1728:213  */
  assign n3891_o = {n3890_o, in_unnamed_7};
  /* find_the_damn_issue_sky130.vhd:1728:311  */
  assign n3892_o = n3889_o[4:0];
  /* find_the_damn_issue_sky130.vhd:1728:228  */
  assign n3893_o = {n3891_o, n3892_o};
  /* find_the_damn_issue_sky130.vhd:1729:224  */
  assign n3894_o = n3893_o[7];
  /* find_the_damn_issue_sky130.vhd:1729:237  */
  assign n3896_o = {n3894_o, 1'b0};
  /* find_the_damn_issue_sky130.vhd:1729:342  */
  assign n3897_o = n3893_o[5:0];
  /* find_the_damn_issue_sky130.vhd:1729:243  */
  assign n3898_o = {n3896_o, n3897_o};
  /* find_the_damn_issue_sky130.vhd:1730:47  */
  assign n3899_o = in_command[6:0];
  /* find_the_damn_issue_sky130.vhd:1731:49  */
  assign n3900_o = in_command[6:1];
  /* find_the_damn_issue_sky130.vhd:1732:197  */
  assign n3903_o = n3900_o == 6'b000010;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n3910_o = n3903_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:1732:244  */
  assign n3912_o = in_command[6:2];
  /* find_the_damn_issue_sky130.vhd:1732:257  */
  assign n3914_o = n3912_o == 5'b00000;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n3921_o = n3914_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:1732:298  */
  assign n3922_o = in_command[7];
  /* find_the_damn_issue_sky130.vhd:1732:285  */
  assign n3923_o = ~n3922_o;
  /* find_the_damn_issue_sky130.vhd:1732:279  */
  assign n3924_o = ~n3923_o;
  /* find_the_damn_issue_sky130.vhd:1732:273  */
  assign n3925_o = ~n3924_o;
  /* find_the_damn_issue_sky130.vhd:1732:268  */
  assign n3926_o = n3921_o | n3925_o;
  /* find_the_damn_issue_sky130.vhd:1732:216  */
  assign n3927_o = ~n3926_o;
  /* find_the_damn_issue_sky130.vhd:1732:335  */
  assign n3930_o = s_state == 4'b0000;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n3937_o = n3930_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:1732:345  */
  assign n3938_o = n3937_o & in_command_valid;
  /* find_the_damn_issue_sky130.vhd:1732:366  */
  assign n3939_o = n3938_o & in_unnamed;
  /* find_the_damn_issue_sky130.vhd:1732:307  */
  assign n3940_o = n3927_o & n3939_o;
  /* find_the_damn_issue_sky130.vhd:1732:209  */
  assign n3941_o = n3910_o & n3940_o;
  /* find_the_damn_issue_sky130.vhd:1733:40  */
  assign n3943_o = n3899_o == 7'b0000110;
  /* find_the_damn_issue_sky130.vhd:1733:86  */
  assign n3945_o = n3900_o == 6'b000010;
  /* find_the_damn_issue_sky130.vhd:1733:124  */
  assign n3946_o = in_command[6:2];
  /* find_the_damn_issue_sky130.vhd:1733:137  */
  assign n3948_o = n3946_o == 5'b00000;
  /* find_the_damn_issue_sky130.vhd:1733:178  */
  assign n3949_o = in_command[7];
  /* find_the_damn_issue_sky130.vhd:1733:165  */
  assign n3950_o = ~n3949_o;
  /* find_the_damn_issue_sky130.vhd:1733:159  */
  assign n3951_o = ~n3950_o;
  /* find_the_damn_issue_sky130.vhd:1733:153  */
  assign n3952_o = ~n3951_o;
  /* find_the_damn_issue_sky130.vhd:1733:148  */
  assign n3953_o = n3948_o | n3952_o;
  /* find_the_damn_issue_sky130.vhd:1733:109  */
  assign n3954_o = ~n3953_o;
  /* find_the_damn_issue_sky130.vhd:1733:103  */
  assign n3955_o = ~n3954_o;
  /* find_the_damn_issue_sky130.vhd:1733:98  */
  assign n3956_o = n3945_o | n3955_o;
  /* find_the_damn_issue_sky130.vhd:1733:60  */
  assign n3957_o = ~n3956_o;
  /* find_the_damn_issue_sky130.vhd:1733:211  */
  assign n3959_o = s_state == 4'b0000;
  /* find_the_damn_issue_sky130.vhd:1733:221  */
  assign n3960_o = n3959_o & in_command_valid;
  /* find_the_damn_issue_sky130.vhd:1733:248  */
  assign n3961_o = n3960_o & in_unnamed;
  /* find_the_damn_issue_sky130.vhd:1733:196  */
  assign n3962_o = n3957_o & n3961_o;
  /* find_the_damn_issue_sky130.vhd:1733:53  */
  assign n3963_o = n3943_o & n3962_o;
  /* find_the_damn_issue_sky130.vhd:1733:17  */
  assign n3965_o = n3963_o ? 4'b0111 : n3244_o;
  /* find_the_damn_issue_sky130.vhd:1738:42  */
  assign n3967_o = n3900_o == 6'b000100;
  /* find_the_damn_issue_sky130.vhd:1738:85  */
  assign n3969_o = n3899_o == 7'b0000111;
  /* find_the_damn_issue_sky130.vhd:1738:133  */
  assign n3971_o = n3899_o == 7'b0000110;
  /* find_the_damn_issue_sky130.vhd:1738:183  */
  assign n3973_o = n3900_o == 6'b000010;
  /* find_the_damn_issue_sky130.vhd:1738:221  */
  assign n3974_o = in_command[6:2];
  /* find_the_damn_issue_sky130.vhd:1738:234  */
  assign n3976_o = n3974_o == 5'b00000;
  /* find_the_damn_issue_sky130.vhd:1738:275  */
  assign n3977_o = in_command[7];
  /* find_the_damn_issue_sky130.vhd:1738:262  */
  assign n3978_o = ~n3977_o;
  /* find_the_damn_issue_sky130.vhd:1738:256  */
  assign n3979_o = ~n3978_o;
  /* find_the_damn_issue_sky130.vhd:1738:250  */
  assign n3980_o = ~n3979_o;
  /* find_the_damn_issue_sky130.vhd:1738:245  */
  assign n3981_o = n3976_o | n3980_o;
  /* find_the_damn_issue_sky130.vhd:1738:206  */
  assign n3982_o = ~n3981_o;
  /* find_the_damn_issue_sky130.vhd:1738:200  */
  assign n3983_o = ~n3982_o;
  /* find_the_damn_issue_sky130.vhd:1738:195  */
  assign n3984_o = n3973_o | n3983_o;
  /* find_the_damn_issue_sky130.vhd:1738:157  */
  assign n3985_o = ~n3984_o;
  /* find_the_damn_issue_sky130.vhd:1738:151  */
  assign n3986_o = ~n3985_o;
  /* find_the_damn_issue_sky130.vhd:1738:146  */
  assign n3987_o = n3971_o | n3986_o;
  /* find_the_damn_issue_sky130.vhd:1738:109  */
  assign n3988_o = ~n3987_o;
  /* find_the_damn_issue_sky130.vhd:1738:103  */
  assign n3989_o = ~n3988_o;
  /* find_the_damn_issue_sky130.vhd:1738:98  */
  assign n3990_o = n3969_o | n3989_o;
  /* find_the_damn_issue_sky130.vhd:1738:61  */
  assign n3991_o = ~n3990_o;
  /* find_the_damn_issue_sky130.vhd:1738:314  */
  assign n3993_o = s_state == 4'b0000;
  /* find_the_damn_issue_sky130.vhd:1738:324  */
  assign n3994_o = n3993_o & in_command_valid;
  /* find_the_damn_issue_sky130.vhd:1738:351  */
  assign n3995_o = n3994_o & in_unnamed;
  /* find_the_damn_issue_sky130.vhd:1738:299  */
  assign n3996_o = n3991_o & n3995_o;
  /* find_the_damn_issue_sky130.vhd:1738:54  */
  assign n3997_o = n3967_o & n3996_o;
  /* find_the_damn_issue_sky130.vhd:1739:73  */
  assign n3998_o = in_command[0];
  /* find_the_damn_issue_sky130.vhd:1739:60  */
  assign n3999_o = ~n3998_o;
  /* find_the_damn_issue_sky130.vhd:1738:17  */
  assign n4000_o = n3997_o ? n3999_o : s_config_stopclocksignal;
  /* find_the_damn_issue_sky130.vhd:1743:42  */
  assign n4002_o = n3900_o == 6'b000100;
  /* find_the_damn_issue_sky130.vhd:1743:85  */
  assign n4004_o = n3899_o == 7'b0000111;
  /* find_the_damn_issue_sky130.vhd:1743:133  */
  assign n4006_o = n3899_o == 7'b0000110;
  /* find_the_damn_issue_sky130.vhd:1743:183  */
  assign n4008_o = n3900_o == 6'b000010;
  /* find_the_damn_issue_sky130.vhd:1743:221  */
  assign n4009_o = in_command[6:2];
  /* find_the_damn_issue_sky130.vhd:1743:234  */
  assign n4011_o = n4009_o == 5'b00000;
  /* find_the_damn_issue_sky130.vhd:1743:275  */
  assign n4012_o = in_command[7];
  /* find_the_damn_issue_sky130.vhd:1743:262  */
  assign n4013_o = ~n4012_o;
  /* find_the_damn_issue_sky130.vhd:1743:256  */
  assign n4014_o = ~n4013_o;
  /* find_the_damn_issue_sky130.vhd:1743:250  */
  assign n4015_o = ~n4014_o;
  /* find_the_damn_issue_sky130.vhd:1743:245  */
  assign n4016_o = n4011_o | n4015_o;
  /* find_the_damn_issue_sky130.vhd:1743:206  */
  assign n4017_o = ~n4016_o;
  /* find_the_damn_issue_sky130.vhd:1743:200  */
  assign n4018_o = ~n4017_o;
  /* find_the_damn_issue_sky130.vhd:1743:195  */
  assign n4019_o = n4008_o | n4018_o;
  /* find_the_damn_issue_sky130.vhd:1743:157  */
  assign n4020_o = ~n4019_o;
  /* find_the_damn_issue_sky130.vhd:1743:151  */
  assign n4021_o = ~n4020_o;
  /* find_the_damn_issue_sky130.vhd:1743:146  */
  assign n4022_o = n4006_o | n4021_o;
  /* find_the_damn_issue_sky130.vhd:1743:109  */
  assign n4023_o = ~n4022_o;
  /* find_the_damn_issue_sky130.vhd:1743:103  */
  assign n4024_o = ~n4023_o;
  /* find_the_damn_issue_sky130.vhd:1743:98  */
  assign n4025_o = n4004_o | n4024_o;
  /* find_the_damn_issue_sky130.vhd:1743:61  */
  assign n4026_o = ~n4025_o;
  /* find_the_damn_issue_sky130.vhd:1743:314  */
  assign n4028_o = s_state == 4'b0000;
  /* find_the_damn_issue_sky130.vhd:1743:324  */
  assign n4029_o = n4028_o & in_command_valid;
  /* find_the_damn_issue_sky130.vhd:1743:351  */
  assign n4030_o = n4029_o & in_unnamed;
  /* find_the_damn_issue_sky130.vhd:1743:299  */
  assign n4031_o = n4026_o & n4030_o;
  /* find_the_damn_issue_sky130.vhd:1743:54  */
  assign n4032_o = n4002_o & n4031_o;
  /* find_the_damn_issue_sky130.vhd:1743:17  */
  assign n4034_o = n4032_o ? 4'b1100 : n3965_o;
  /* find_the_damn_issue_sky130.vhd:1748:150  */
  assign n4037_o = n3900_o == 6'b000110;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n4044_o = n4037_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:1748:208  */
  assign n4047_o = n3900_o == 6'b000100;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n4054_o = n4047_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:1748:268  */
  assign n4057_o = n3899_o == 7'b0000111;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n4064_o = n4057_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:1748:329  */
  assign n4067_o = n3899_o == 7'b0000110;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n4074_o = n4067_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:1748:392  */
  assign n4077_o = n3900_o == 6'b000010;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n4084_o = n4077_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:1748:443  */
  assign n4086_o = in_command[6:2];
  /* find_the_damn_issue_sky130.vhd:1748:456  */
  assign n4088_o = n4086_o == 5'b00000;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n4095_o = n4088_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:1748:497  */
  assign n4096_o = in_command[7];
  /* find_the_damn_issue_sky130.vhd:1748:484  */
  assign n4097_o = ~n4096_o;
  /* find_the_damn_issue_sky130.vhd:1748:478  */
  assign n4098_o = ~n4097_o;
  /* find_the_damn_issue_sky130.vhd:1748:472  */
  assign n4099_o = ~n4098_o;
  /* find_the_damn_issue_sky130.vhd:1748:467  */
  assign n4100_o = n4095_o | n4099_o;
  /* find_the_damn_issue_sky130.vhd:1748:415  */
  assign n4101_o = ~n4100_o;
  /* find_the_damn_issue_sky130.vhd:1748:409  */
  assign n4102_o = ~n4101_o;
  /* find_the_damn_issue_sky130.vhd:1748:404  */
  assign n4103_o = n4084_o | n4102_o;
  /* find_the_damn_issue_sky130.vhd:1748:353  */
  assign n4104_o = ~n4103_o;
  /* find_the_damn_issue_sky130.vhd:1748:347  */
  assign n4105_o = ~n4104_o;
  /* find_the_damn_issue_sky130.vhd:1748:342  */
  assign n4106_o = n4074_o | n4105_o;
  /* find_the_damn_issue_sky130.vhd:1748:292  */
  assign n4107_o = ~n4106_o;
  /* find_the_damn_issue_sky130.vhd:1748:286  */
  assign n4108_o = ~n4107_o;
  /* find_the_damn_issue_sky130.vhd:1748:281  */
  assign n4109_o = n4064_o | n4108_o;
  /* find_the_damn_issue_sky130.vhd:1748:231  */
  assign n4110_o = ~n4109_o;
  /* find_the_damn_issue_sky130.vhd:1748:225  */
  assign n4111_o = ~n4110_o;
  /* find_the_damn_issue_sky130.vhd:1748:220  */
  assign n4112_o = n4054_o | n4111_o;
  /* find_the_damn_issue_sky130.vhd:1748:169  */
  assign n4113_o = ~n4112_o;
  /* find_the_damn_issue_sky130.vhd:1748:546  */
  assign n4116_o = s_state == 4'b0000;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n4123_o = n4116_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:1748:556  */
  assign n4124_o = n4123_o & in_command_valid;
  /* find_the_damn_issue_sky130.vhd:1748:577  */
  assign n4125_o = n4124_o & in_unnamed;
  /* find_the_damn_issue_sky130.vhd:1748:518  */
  assign n4126_o = n4113_o & n4125_o;
  /* find_the_damn_issue_sky130.vhd:1748:162  */
  assign n4127_o = n4044_o & n4126_o;
  /* find_the_damn_issue_sky130.vhd:1749:42  */
  assign n4129_o = n3900_o == 6'b000111;
  /* find_the_damn_issue_sky130.vhd:1749:87  */
  assign n4131_o = n3900_o == 6'b000110;
  /* find_the_damn_issue_sky130.vhd:1749:136  */
  assign n4133_o = n3900_o == 6'b000100;
  /* find_the_damn_issue_sky130.vhd:1749:183  */
  assign n4135_o = n3899_o == 7'b0000111;
  /* find_the_damn_issue_sky130.vhd:1749:231  */
  assign n4137_o = n3899_o == 7'b0000110;
  /* find_the_damn_issue_sky130.vhd:1749:281  */
  assign n4139_o = n3900_o == 6'b000010;
  /* find_the_damn_issue_sky130.vhd:1749:319  */
  assign n4140_o = in_command[6:2];
  /* find_the_damn_issue_sky130.vhd:1749:332  */
  assign n4142_o = n4140_o == 5'b00000;
  /* find_the_damn_issue_sky130.vhd:1749:373  */
  assign n4143_o = in_command[7];
  /* find_the_damn_issue_sky130.vhd:1749:360  */
  assign n4144_o = ~n4143_o;
  /* find_the_damn_issue_sky130.vhd:1749:354  */
  assign n4145_o = ~n4144_o;
  /* find_the_damn_issue_sky130.vhd:1749:348  */
  assign n4146_o = ~n4145_o;
  /* find_the_damn_issue_sky130.vhd:1749:343  */
  assign n4147_o = n4142_o | n4146_o;
  /* find_the_damn_issue_sky130.vhd:1749:304  */
  assign n4148_o = ~n4147_o;
  /* find_the_damn_issue_sky130.vhd:1749:298  */
  assign n4149_o = ~n4148_o;
  /* find_the_damn_issue_sky130.vhd:1749:293  */
  assign n4150_o = n4139_o | n4149_o;
  /* find_the_damn_issue_sky130.vhd:1749:255  */
  assign n4151_o = ~n4150_o;
  /* find_the_damn_issue_sky130.vhd:1749:249  */
  assign n4152_o = ~n4151_o;
  /* find_the_damn_issue_sky130.vhd:1749:244  */
  assign n4153_o = n4137_o | n4152_o;
  /* find_the_damn_issue_sky130.vhd:1749:207  */
  assign n4154_o = ~n4153_o;
  /* find_the_damn_issue_sky130.vhd:1749:201  */
  assign n4155_o = ~n4154_o;
  /* find_the_damn_issue_sky130.vhd:1749:196  */
  assign n4156_o = n4135_o | n4155_o;
  /* find_the_damn_issue_sky130.vhd:1749:159  */
  assign n4157_o = ~n4156_o;
  /* find_the_damn_issue_sky130.vhd:1749:153  */
  assign n4158_o = ~n4157_o;
  /* find_the_damn_issue_sky130.vhd:1749:148  */
  assign n4159_o = n4133_o | n4158_o;
  /* find_the_damn_issue_sky130.vhd:1749:110  */
  assign n4160_o = ~n4159_o;
  /* find_the_damn_issue_sky130.vhd:1749:104  */
  assign n4161_o = ~n4160_o;
  /* find_the_damn_issue_sky130.vhd:1749:99  */
  assign n4162_o = n4131_o | n4161_o;
  /* find_the_damn_issue_sky130.vhd:1749:61  */
  assign n4163_o = ~n4162_o;
  /* find_the_damn_issue_sky130.vhd:1749:418  */
  assign n4165_o = s_state == 4'b0000;
  /* find_the_damn_issue_sky130.vhd:1749:428  */
  assign n4166_o = n4165_o & in_command_valid;
  /* find_the_damn_issue_sky130.vhd:1749:455  */
  assign n4167_o = n4166_o & in_unnamed;
  /* find_the_damn_issue_sky130.vhd:1749:403  */
  assign n4168_o = n4163_o & n4167_o;
  /* find_the_damn_issue_sky130.vhd:1749:54  */
  assign n4169_o = n4129_o & n4168_o;
  /* find_the_damn_issue_sky130.vhd:1749:17  */
  assign n4171_o = n4169_o ? 4'b1001 : n3195_o;
  /* find_the_damn_issue_sky130.vhd:1754:42  */
  assign n4173_o = n3900_o == 6'b000111;
  /* find_the_damn_issue_sky130.vhd:1754:87  */
  assign n4175_o = n3900_o == 6'b000110;
  /* find_the_damn_issue_sky130.vhd:1754:136  */
  assign n4177_o = n3900_o == 6'b000100;
  /* find_the_damn_issue_sky130.vhd:1754:183  */
  assign n4179_o = n3899_o == 7'b0000111;
  /* find_the_damn_issue_sky130.vhd:1754:231  */
  assign n4181_o = n3899_o == 7'b0000110;
  /* find_the_damn_issue_sky130.vhd:1754:281  */
  assign n4183_o = n3900_o == 6'b000010;
  /* find_the_damn_issue_sky130.vhd:1754:319  */
  assign n4184_o = in_command[6:2];
  /* find_the_damn_issue_sky130.vhd:1754:332  */
  assign n4186_o = n4184_o == 5'b00000;
  /* find_the_damn_issue_sky130.vhd:1754:373  */
  assign n4187_o = in_command[7];
  /* find_the_damn_issue_sky130.vhd:1754:360  */
  assign n4188_o = ~n4187_o;
  /* find_the_damn_issue_sky130.vhd:1754:354  */
  assign n4189_o = ~n4188_o;
  /* find_the_damn_issue_sky130.vhd:1754:348  */
  assign n4190_o = ~n4189_o;
  /* find_the_damn_issue_sky130.vhd:1754:343  */
  assign n4191_o = n4186_o | n4190_o;
  /* find_the_damn_issue_sky130.vhd:1754:304  */
  assign n4192_o = ~n4191_o;
  /* find_the_damn_issue_sky130.vhd:1754:298  */
  assign n4193_o = ~n4192_o;
  /* find_the_damn_issue_sky130.vhd:1754:293  */
  assign n4194_o = n4183_o | n4193_o;
  /* find_the_damn_issue_sky130.vhd:1754:255  */
  assign n4195_o = ~n4194_o;
  /* find_the_damn_issue_sky130.vhd:1754:249  */
  assign n4196_o = ~n4195_o;
  /* find_the_damn_issue_sky130.vhd:1754:244  */
  assign n4197_o = n4181_o | n4196_o;
  /* find_the_damn_issue_sky130.vhd:1754:207  */
  assign n4198_o = ~n4197_o;
  /* find_the_damn_issue_sky130.vhd:1754:201  */
  assign n4199_o = ~n4198_o;
  /* find_the_damn_issue_sky130.vhd:1754:196  */
  assign n4200_o = n4179_o | n4199_o;
  /* find_the_damn_issue_sky130.vhd:1754:159  */
  assign n4201_o = ~n4200_o;
  /* find_the_damn_issue_sky130.vhd:1754:153  */
  assign n4202_o = ~n4201_o;
  /* find_the_damn_issue_sky130.vhd:1754:148  */
  assign n4203_o = n4177_o | n4202_o;
  /* find_the_damn_issue_sky130.vhd:1754:110  */
  assign n4204_o = ~n4203_o;
  /* find_the_damn_issue_sky130.vhd:1754:104  */
  assign n4205_o = ~n4204_o;
  /* find_the_damn_issue_sky130.vhd:1754:99  */
  assign n4206_o = n4175_o | n4205_o;
  /* find_the_damn_issue_sky130.vhd:1754:61  */
  assign n4207_o = ~n4206_o;
  /* find_the_damn_issue_sky130.vhd:1754:418  */
  assign n4209_o = s_state == 4'b0000;
  /* find_the_damn_issue_sky130.vhd:1754:428  */
  assign n4210_o = n4209_o & in_command_valid;
  /* find_the_damn_issue_sky130.vhd:1754:455  */
  assign n4211_o = n4210_o & in_unnamed;
  /* find_the_damn_issue_sky130.vhd:1754:403  */
  assign n4212_o = n4207_o & n4211_o;
  /* find_the_damn_issue_sky130.vhd:1754:54  */
  assign n4213_o = n4173_o & n4212_o;
  /* find_the_damn_issue_sky130.vhd:1754:17  */
  assign n4215_o = n4213_o ? 4'b0110 : n4034_o;
  /* find_the_damn_issue_sky130.vhd:1759:30  */
  assign n4216_o = in_command[0];
  /* find_the_damn_issue_sky130.vhd:1759:66  */
  assign n4218_o = n3900_o == 6'b000111;
  /* find_the_damn_issue_sky130.vhd:1759:111  */
  assign n4220_o = n3900_o == 6'b000110;
  /* find_the_damn_issue_sky130.vhd:1759:160  */
  assign n4222_o = n3900_o == 6'b000100;
  /* find_the_damn_issue_sky130.vhd:1759:207  */
  assign n4224_o = n3899_o == 7'b0000111;
  /* find_the_damn_issue_sky130.vhd:1759:255  */
  assign n4226_o = n3899_o == 7'b0000110;
  /* find_the_damn_issue_sky130.vhd:1759:305  */
  assign n4228_o = n3900_o == 6'b000010;
  /* find_the_damn_issue_sky130.vhd:1759:343  */
  assign n4229_o = in_command[6:2];
  /* find_the_damn_issue_sky130.vhd:1759:356  */
  assign n4231_o = n4229_o == 5'b00000;
  /* find_the_damn_issue_sky130.vhd:1759:397  */
  assign n4232_o = in_command[7];
  /* find_the_damn_issue_sky130.vhd:1759:384  */
  assign n4233_o = ~n4232_o;
  /* find_the_damn_issue_sky130.vhd:1759:378  */
  assign n4234_o = ~n4233_o;
  /* find_the_damn_issue_sky130.vhd:1759:372  */
  assign n4235_o = ~n4234_o;
  /* find_the_damn_issue_sky130.vhd:1759:367  */
  assign n4236_o = n4231_o | n4235_o;
  /* find_the_damn_issue_sky130.vhd:1759:328  */
  assign n4237_o = ~n4236_o;
  /* find_the_damn_issue_sky130.vhd:1759:322  */
  assign n4238_o = ~n4237_o;
  /* find_the_damn_issue_sky130.vhd:1759:317  */
  assign n4239_o = n4228_o | n4238_o;
  /* find_the_damn_issue_sky130.vhd:1759:279  */
  assign n4240_o = ~n4239_o;
  /* find_the_damn_issue_sky130.vhd:1759:273  */
  assign n4241_o = ~n4240_o;
  /* find_the_damn_issue_sky130.vhd:1759:268  */
  assign n4242_o = n4226_o | n4241_o;
  /* find_the_damn_issue_sky130.vhd:1759:231  */
  assign n4243_o = ~n4242_o;
  /* find_the_damn_issue_sky130.vhd:1759:225  */
  assign n4244_o = ~n4243_o;
  /* find_the_damn_issue_sky130.vhd:1759:220  */
  assign n4245_o = n4224_o | n4244_o;
  /* find_the_damn_issue_sky130.vhd:1759:183  */
  assign n4246_o = ~n4245_o;
  /* find_the_damn_issue_sky130.vhd:1759:177  */
  assign n4247_o = ~n4246_o;
  /* find_the_damn_issue_sky130.vhd:1759:172  */
  assign n4248_o = n4222_o | n4247_o;
  /* find_the_damn_issue_sky130.vhd:1759:134  */
  assign n4249_o = ~n4248_o;
  /* find_the_damn_issue_sky130.vhd:1759:128  */
  assign n4250_o = ~n4249_o;
  /* find_the_damn_issue_sky130.vhd:1759:123  */
  assign n4251_o = n4220_o | n4250_o;
  /* find_the_damn_issue_sky130.vhd:1759:85  */
  assign n4252_o = ~n4251_o;
  /* find_the_damn_issue_sky130.vhd:1759:442  */
  assign n4254_o = s_state == 4'b0000;
  /* find_the_damn_issue_sky130.vhd:1759:452  */
  assign n4255_o = n4254_o & in_command_valid;
  /* find_the_damn_issue_sky130.vhd:1759:479  */
  assign n4256_o = n4255_o & in_unnamed;
  /* find_the_damn_issue_sky130.vhd:1759:427  */
  assign n4257_o = n4252_o & n4256_o;
  /* find_the_damn_issue_sky130.vhd:1759:78  */
  assign n4258_o = n4218_o & n4257_o;
  /* find_the_damn_issue_sky130.vhd:1759:40  */
  assign n4259_o = n4216_o & n4258_o;
  /* find_the_damn_issue_sky130.vhd:1759:17  */
  assign n4261_o = n4259_o ? 4'b0111 : n4215_o;
  /* find_the_damn_issue_sky130.vhd:1764:42  */
  assign n4263_o = n3900_o == 6'b001010;
  /* find_the_damn_issue_sky130.vhd:1764:87  */
  assign n4265_o = n3900_o == 6'b000111;
  /* find_the_damn_issue_sky130.vhd:1764:136  */
  assign n4267_o = n3900_o == 6'b000110;
  /* find_the_damn_issue_sky130.vhd:1764:185  */
  assign n4269_o = n3900_o == 6'b000100;
  /* find_the_damn_issue_sky130.vhd:1764:232  */
  assign n4271_o = n3899_o == 7'b0000111;
  /* find_the_damn_issue_sky130.vhd:1764:280  */
  assign n4273_o = n3899_o == 7'b0000110;
  /* find_the_damn_issue_sky130.vhd:1764:330  */
  assign n4275_o = n3900_o == 6'b000010;
  /* find_the_damn_issue_sky130.vhd:1764:368  */
  assign n4276_o = in_command[6:2];
  /* find_the_damn_issue_sky130.vhd:1764:381  */
  assign n4278_o = n4276_o == 5'b00000;
  /* find_the_damn_issue_sky130.vhd:1764:422  */
  assign n4279_o = in_command[7];
  /* find_the_damn_issue_sky130.vhd:1764:409  */
  assign n4280_o = ~n4279_o;
  /* find_the_damn_issue_sky130.vhd:1764:403  */
  assign n4281_o = ~n4280_o;
  /* find_the_damn_issue_sky130.vhd:1764:397  */
  assign n4282_o = ~n4281_o;
  /* find_the_damn_issue_sky130.vhd:1764:392  */
  assign n4283_o = n4278_o | n4282_o;
  /* find_the_damn_issue_sky130.vhd:1764:353  */
  assign n4284_o = ~n4283_o;
  /* find_the_damn_issue_sky130.vhd:1764:347  */
  assign n4285_o = ~n4284_o;
  /* find_the_damn_issue_sky130.vhd:1764:342  */
  assign n4286_o = n4275_o | n4285_o;
  /* find_the_damn_issue_sky130.vhd:1764:304  */
  assign n4287_o = ~n4286_o;
  /* find_the_damn_issue_sky130.vhd:1764:298  */
  assign n4288_o = ~n4287_o;
  /* find_the_damn_issue_sky130.vhd:1764:293  */
  assign n4289_o = n4273_o | n4288_o;
  /* find_the_damn_issue_sky130.vhd:1764:256  */
  assign n4290_o = ~n4289_o;
  /* find_the_damn_issue_sky130.vhd:1764:250  */
  assign n4291_o = ~n4290_o;
  /* find_the_damn_issue_sky130.vhd:1764:245  */
  assign n4292_o = n4271_o | n4291_o;
  /* find_the_damn_issue_sky130.vhd:1764:208  */
  assign n4293_o = ~n4292_o;
  /* find_the_damn_issue_sky130.vhd:1764:202  */
  assign n4294_o = ~n4293_o;
  /* find_the_damn_issue_sky130.vhd:1764:197  */
  assign n4295_o = n4269_o | n4294_o;
  /* find_the_damn_issue_sky130.vhd:1764:159  */
  assign n4296_o = ~n4295_o;
  /* find_the_damn_issue_sky130.vhd:1764:153  */
  assign n4297_o = ~n4296_o;
  /* find_the_damn_issue_sky130.vhd:1764:148  */
  assign n4298_o = n4267_o | n4297_o;
  /* find_the_damn_issue_sky130.vhd:1764:110  */
  assign n4299_o = ~n4298_o;
  /* find_the_damn_issue_sky130.vhd:1764:104  */
  assign n4300_o = ~n4299_o;
  /* find_the_damn_issue_sky130.vhd:1764:99  */
  assign n4301_o = n4265_o | n4300_o;
  /* find_the_damn_issue_sky130.vhd:1764:61  */
  assign n4302_o = ~n4301_o;
  /* find_the_damn_issue_sky130.vhd:1764:470  */
  assign n4304_o = s_state == 4'b0000;
  /* find_the_damn_issue_sky130.vhd:1764:480  */
  assign n4305_o = n4304_o & in_command_valid;
  /* find_the_damn_issue_sky130.vhd:1764:507  */
  assign n4306_o = n4305_o & in_unnamed;
  /* find_the_damn_issue_sky130.vhd:1764:455  */
  assign n4307_o = n4302_o & n4306_o;
  /* find_the_damn_issue_sky130.vhd:1764:54  */
  assign n4308_o = n4263_o & n4307_o;
  /* find_the_damn_issue_sky130.vhd:1764:17  */
  assign n4310_o = n4308_o ? 1'b0 : n3282_o;
  /* find_the_damn_issue_sky130.vhd:1769:42  */
  assign n4312_o = n3900_o == 6'b001010;
  /* find_the_damn_issue_sky130.vhd:1769:87  */
  assign n4314_o = n3900_o == 6'b000111;
  /* find_the_damn_issue_sky130.vhd:1769:136  */
  assign n4316_o = n3900_o == 6'b000110;
  /* find_the_damn_issue_sky130.vhd:1769:185  */
  assign n4318_o = n3900_o == 6'b000100;
  /* find_the_damn_issue_sky130.vhd:1769:232  */
  assign n4320_o = n3899_o == 7'b0000111;
  /* find_the_damn_issue_sky130.vhd:1769:280  */
  assign n4322_o = n3899_o == 7'b0000110;
  /* find_the_damn_issue_sky130.vhd:1769:330  */
  assign n4324_o = n3900_o == 6'b000010;
  /* find_the_damn_issue_sky130.vhd:1769:368  */
  assign n4325_o = in_command[6:2];
  /* find_the_damn_issue_sky130.vhd:1769:381  */
  assign n4327_o = n4325_o == 5'b00000;
  /* find_the_damn_issue_sky130.vhd:1769:422  */
  assign n4328_o = in_command[7];
  /* find_the_damn_issue_sky130.vhd:1769:409  */
  assign n4329_o = ~n4328_o;
  /* find_the_damn_issue_sky130.vhd:1769:403  */
  assign n4330_o = ~n4329_o;
  /* find_the_damn_issue_sky130.vhd:1769:397  */
  assign n4331_o = ~n4330_o;
  /* find_the_damn_issue_sky130.vhd:1769:392  */
  assign n4332_o = n4327_o | n4331_o;
  /* find_the_damn_issue_sky130.vhd:1769:353  */
  assign n4333_o = ~n4332_o;
  /* find_the_damn_issue_sky130.vhd:1769:347  */
  assign n4334_o = ~n4333_o;
  /* find_the_damn_issue_sky130.vhd:1769:342  */
  assign n4335_o = n4324_o | n4334_o;
  /* find_the_damn_issue_sky130.vhd:1769:304  */
  assign n4336_o = ~n4335_o;
  /* find_the_damn_issue_sky130.vhd:1769:298  */
  assign n4337_o = ~n4336_o;
  /* find_the_damn_issue_sky130.vhd:1769:293  */
  assign n4338_o = n4322_o | n4337_o;
  /* find_the_damn_issue_sky130.vhd:1769:256  */
  assign n4339_o = ~n4338_o;
  /* find_the_damn_issue_sky130.vhd:1769:250  */
  assign n4340_o = ~n4339_o;
  /* find_the_damn_issue_sky130.vhd:1769:245  */
  assign n4341_o = n4320_o | n4340_o;
  /* find_the_damn_issue_sky130.vhd:1769:208  */
  assign n4342_o = ~n4341_o;
  /* find_the_damn_issue_sky130.vhd:1769:202  */
  assign n4343_o = ~n4342_o;
  /* find_the_damn_issue_sky130.vhd:1769:197  */
  assign n4344_o = n4318_o | n4343_o;
  /* find_the_damn_issue_sky130.vhd:1769:159  */
  assign n4345_o = ~n4344_o;
  /* find_the_damn_issue_sky130.vhd:1769:153  */
  assign n4346_o = ~n4345_o;
  /* find_the_damn_issue_sky130.vhd:1769:148  */
  assign n4347_o = n4316_o | n4346_o;
  /* find_the_damn_issue_sky130.vhd:1769:110  */
  assign n4348_o = ~n4347_o;
  /* find_the_damn_issue_sky130.vhd:1769:104  */
  assign n4349_o = ~n4348_o;
  /* find_the_damn_issue_sky130.vhd:1769:99  */
  assign n4350_o = n4314_o | n4349_o;
  /* find_the_damn_issue_sky130.vhd:1769:61  */
  assign n4351_o = ~n4350_o;
  /* find_the_damn_issue_sky130.vhd:1769:470  */
  assign n4353_o = s_state == 4'b0000;
  /* find_the_damn_issue_sky130.vhd:1769:480  */
  assign n4354_o = n4353_o & in_command_valid;
  /* find_the_damn_issue_sky130.vhd:1769:507  */
  assign n4355_o = n4354_o & in_unnamed;
  /* find_the_damn_issue_sky130.vhd:1769:455  */
  assign n4356_o = n4351_o & n4355_o;
  /* find_the_damn_issue_sky130.vhd:1769:54  */
  assign n4357_o = n4312_o & n4356_o;
  /* find_the_damn_issue_sky130.vhd:1769:17  */
  assign n4359_o = n4357_o ? 1'b1 : n3288_o;
  /* find_the_damn_issue_sky130.vhd:1774:42  */
  assign n4361_o = n3900_o == 6'b001010;
  /* find_the_damn_issue_sky130.vhd:1774:87  */
  assign n4363_o = n3900_o == 6'b000111;
  /* find_the_damn_issue_sky130.vhd:1774:136  */
  assign n4365_o = n3900_o == 6'b000110;
  /* find_the_damn_issue_sky130.vhd:1774:185  */
  assign n4367_o = n3900_o == 6'b000100;
  /* find_the_damn_issue_sky130.vhd:1774:232  */
  assign n4369_o = n3899_o == 7'b0000111;
  /* find_the_damn_issue_sky130.vhd:1774:280  */
  assign n4371_o = n3899_o == 7'b0000110;
  /* find_the_damn_issue_sky130.vhd:1774:330  */
  assign n4373_o = n3900_o == 6'b000010;
  /* find_the_damn_issue_sky130.vhd:1774:368  */
  assign n4374_o = in_command[6:2];
  /* find_the_damn_issue_sky130.vhd:1774:381  */
  assign n4376_o = n4374_o == 5'b00000;
  /* find_the_damn_issue_sky130.vhd:1774:422  */
  assign n4377_o = in_command[7];
  /* find_the_damn_issue_sky130.vhd:1774:409  */
  assign n4378_o = ~n4377_o;
  /* find_the_damn_issue_sky130.vhd:1774:403  */
  assign n4379_o = ~n4378_o;
  /* find_the_damn_issue_sky130.vhd:1774:397  */
  assign n4380_o = ~n4379_o;
  /* find_the_damn_issue_sky130.vhd:1774:392  */
  assign n4381_o = n4376_o | n4380_o;
  /* find_the_damn_issue_sky130.vhd:1774:353  */
  assign n4382_o = ~n4381_o;
  /* find_the_damn_issue_sky130.vhd:1774:347  */
  assign n4383_o = ~n4382_o;
  /* find_the_damn_issue_sky130.vhd:1774:342  */
  assign n4384_o = n4373_o | n4383_o;
  /* find_the_damn_issue_sky130.vhd:1774:304  */
  assign n4385_o = ~n4384_o;
  /* find_the_damn_issue_sky130.vhd:1774:298  */
  assign n4386_o = ~n4385_o;
  /* find_the_damn_issue_sky130.vhd:1774:293  */
  assign n4387_o = n4371_o | n4386_o;
  /* find_the_damn_issue_sky130.vhd:1774:256  */
  assign n4388_o = ~n4387_o;
  /* find_the_damn_issue_sky130.vhd:1774:250  */
  assign n4389_o = ~n4388_o;
  /* find_the_damn_issue_sky130.vhd:1774:245  */
  assign n4390_o = n4369_o | n4389_o;
  /* find_the_damn_issue_sky130.vhd:1774:208  */
  assign n4391_o = ~n4390_o;
  /* find_the_damn_issue_sky130.vhd:1774:202  */
  assign n4392_o = ~n4391_o;
  /* find_the_damn_issue_sky130.vhd:1774:197  */
  assign n4393_o = n4367_o | n4392_o;
  /* find_the_damn_issue_sky130.vhd:1774:159  */
  assign n4394_o = ~n4393_o;
  /* find_the_damn_issue_sky130.vhd:1774:153  */
  assign n4395_o = ~n4394_o;
  /* find_the_damn_issue_sky130.vhd:1774:148  */
  assign n4396_o = n4365_o | n4395_o;
  /* find_the_damn_issue_sky130.vhd:1774:110  */
  assign n4397_o = ~n4396_o;
  /* find_the_damn_issue_sky130.vhd:1774:104  */
  assign n4398_o = ~n4397_o;
  /* find_the_damn_issue_sky130.vhd:1774:99  */
  assign n4399_o = n4363_o | n4398_o;
  /* find_the_damn_issue_sky130.vhd:1774:61  */
  assign n4400_o = ~n4399_o;
  /* find_the_damn_issue_sky130.vhd:1774:470  */
  assign n4402_o = s_state == 4'b0000;
  /* find_the_damn_issue_sky130.vhd:1774:480  */
  assign n4403_o = n4402_o & in_command_valid;
  /* find_the_damn_issue_sky130.vhd:1774:507  */
  assign n4404_o = n4403_o & in_unnamed;
  /* find_the_damn_issue_sky130.vhd:1774:455  */
  assign n4405_o = n4400_o & n4404_o;
  /* find_the_damn_issue_sky130.vhd:1774:54  */
  assign n4406_o = n4361_o & n4405_o;
  /* find_the_damn_issue_sky130.vhd:1775:73  */
  assign n4407_o = in_command[0];
  /* find_the_damn_issue_sky130.vhd:1775:60  */
  assign n4408_o = ~n4407_o;
  /* find_the_damn_issue_sky130.vhd:1774:17  */
  assign n4409_o = n4406_o ? n4408_o : n4000_o;
  /* find_the_damn_issue_sky130.vhd:1779:42  */
  assign n4411_o = n3900_o == 6'b001010;
  /* find_the_damn_issue_sky130.vhd:1779:87  */
  assign n4413_o = n3900_o == 6'b000111;
  /* find_the_damn_issue_sky130.vhd:1779:136  */
  assign n4415_o = n3900_o == 6'b000110;
  /* find_the_damn_issue_sky130.vhd:1779:185  */
  assign n4417_o = n3900_o == 6'b000100;
  /* find_the_damn_issue_sky130.vhd:1779:232  */
  assign n4419_o = n3899_o == 7'b0000111;
  /* find_the_damn_issue_sky130.vhd:1779:280  */
  assign n4421_o = n3899_o == 7'b0000110;
  /* find_the_damn_issue_sky130.vhd:1779:330  */
  assign n4423_o = n3900_o == 6'b000010;
  /* find_the_damn_issue_sky130.vhd:1779:368  */
  assign n4424_o = in_command[6:2];
  /* find_the_damn_issue_sky130.vhd:1779:381  */
  assign n4426_o = n4424_o == 5'b00000;
  /* find_the_damn_issue_sky130.vhd:1779:422  */
  assign n4427_o = in_command[7];
  /* find_the_damn_issue_sky130.vhd:1779:409  */
  assign n4428_o = ~n4427_o;
  /* find_the_damn_issue_sky130.vhd:1779:403  */
  assign n4429_o = ~n4428_o;
  /* find_the_damn_issue_sky130.vhd:1779:397  */
  assign n4430_o = ~n4429_o;
  /* find_the_damn_issue_sky130.vhd:1779:392  */
  assign n4431_o = n4426_o | n4430_o;
  /* find_the_damn_issue_sky130.vhd:1779:353  */
  assign n4432_o = ~n4431_o;
  /* find_the_damn_issue_sky130.vhd:1779:347  */
  assign n4433_o = ~n4432_o;
  /* find_the_damn_issue_sky130.vhd:1779:342  */
  assign n4434_o = n4423_o | n4433_o;
  /* find_the_damn_issue_sky130.vhd:1779:304  */
  assign n4435_o = ~n4434_o;
  /* find_the_damn_issue_sky130.vhd:1779:298  */
  assign n4436_o = ~n4435_o;
  /* find_the_damn_issue_sky130.vhd:1779:293  */
  assign n4437_o = n4421_o | n4436_o;
  /* find_the_damn_issue_sky130.vhd:1779:256  */
  assign n4438_o = ~n4437_o;
  /* find_the_damn_issue_sky130.vhd:1779:250  */
  assign n4439_o = ~n4438_o;
  /* find_the_damn_issue_sky130.vhd:1779:245  */
  assign n4440_o = n4419_o | n4439_o;
  /* find_the_damn_issue_sky130.vhd:1779:208  */
  assign n4441_o = ~n4440_o;
  /* find_the_damn_issue_sky130.vhd:1779:202  */
  assign n4442_o = ~n4441_o;
  /* find_the_damn_issue_sky130.vhd:1779:197  */
  assign n4443_o = n4417_o | n4442_o;
  /* find_the_damn_issue_sky130.vhd:1779:159  */
  assign n4444_o = ~n4443_o;
  /* find_the_damn_issue_sky130.vhd:1779:153  */
  assign n4445_o = ~n4444_o;
  /* find_the_damn_issue_sky130.vhd:1779:148  */
  assign n4446_o = n4415_o | n4445_o;
  /* find_the_damn_issue_sky130.vhd:1779:110  */
  assign n4447_o = ~n4446_o;
  /* find_the_damn_issue_sky130.vhd:1779:104  */
  assign n4448_o = ~n4447_o;
  /* find_the_damn_issue_sky130.vhd:1779:99  */
  assign n4449_o = n4413_o | n4448_o;
  /* find_the_damn_issue_sky130.vhd:1779:61  */
  assign n4450_o = ~n4449_o;
  /* find_the_damn_issue_sky130.vhd:1779:470  */
  assign n4452_o = s_state == 4'b0000;
  /* find_the_damn_issue_sky130.vhd:1779:480  */
  assign n4453_o = n4452_o & in_command_valid;
  /* find_the_damn_issue_sky130.vhd:1779:507  */
  assign n4454_o = n4453_o & in_unnamed;
  /* find_the_damn_issue_sky130.vhd:1779:455  */
  assign n4455_o = n4450_o & n4454_o;
  /* find_the_damn_issue_sky130.vhd:1779:54  */
  assign n4456_o = n4411_o & n4455_o;
  /* find_the_damn_issue_sky130.vhd:1779:17  */
  assign n4458_o = n4456_o ? 4'b1001 : n4261_o;
  /* find_the_damn_issue_sky130.vhd:1784:42  */
  assign n4460_o = n3900_o == 6'b001110;
  /* find_the_damn_issue_sky130.vhd:1784:87  */
  assign n4462_o = n3900_o == 6'b001010;
  /* find_the_damn_issue_sky130.vhd:1784:136  */
  assign n4464_o = n3900_o == 6'b000111;
  /* find_the_damn_issue_sky130.vhd:1784:185  */
  assign n4466_o = n3900_o == 6'b000110;
  /* find_the_damn_issue_sky130.vhd:1784:234  */
  assign n4468_o = n3900_o == 6'b000100;
  /* find_the_damn_issue_sky130.vhd:1784:281  */
  assign n4470_o = n3899_o == 7'b0000111;
  /* find_the_damn_issue_sky130.vhd:1784:329  */
  assign n4472_o = n3899_o == 7'b0000110;
  /* find_the_damn_issue_sky130.vhd:1784:379  */
  assign n4474_o = n3900_o == 6'b000010;
  /* find_the_damn_issue_sky130.vhd:1784:417  */
  assign n4475_o = in_command[6:2];
  /* find_the_damn_issue_sky130.vhd:1784:430  */
  assign n4477_o = n4475_o == 5'b00000;
  /* find_the_damn_issue_sky130.vhd:1784:471  */
  assign n4478_o = in_command[7];
  /* find_the_damn_issue_sky130.vhd:1784:458  */
  assign n4479_o = ~n4478_o;
  /* find_the_damn_issue_sky130.vhd:1784:452  */
  assign n4480_o = ~n4479_o;
  /* find_the_damn_issue_sky130.vhd:1784:446  */
  assign n4481_o = ~n4480_o;
  /* find_the_damn_issue_sky130.vhd:1784:441  */
  assign n4482_o = n4477_o | n4481_o;
  /* find_the_damn_issue_sky130.vhd:1784:402  */
  assign n4483_o = ~n4482_o;
  /* find_the_damn_issue_sky130.vhd:1784:396  */
  assign n4484_o = ~n4483_o;
  /* find_the_damn_issue_sky130.vhd:1784:391  */
  assign n4485_o = n4474_o | n4484_o;
  /* find_the_damn_issue_sky130.vhd:1784:353  */
  assign n4486_o = ~n4485_o;
  /* find_the_damn_issue_sky130.vhd:1784:347  */
  assign n4487_o = ~n4486_o;
  /* find_the_damn_issue_sky130.vhd:1784:342  */
  assign n4488_o = n4472_o | n4487_o;
  /* find_the_damn_issue_sky130.vhd:1784:305  */
  assign n4489_o = ~n4488_o;
  /* find_the_damn_issue_sky130.vhd:1784:299  */
  assign n4490_o = ~n4489_o;
  /* find_the_damn_issue_sky130.vhd:1784:294  */
  assign n4491_o = n4470_o | n4490_o;
  /* find_the_damn_issue_sky130.vhd:1784:257  */
  assign n4492_o = ~n4491_o;
  /* find_the_damn_issue_sky130.vhd:1784:251  */
  assign n4493_o = ~n4492_o;
  /* find_the_damn_issue_sky130.vhd:1784:246  */
  assign n4494_o = n4468_o | n4493_o;
  /* find_the_damn_issue_sky130.vhd:1784:208  */
  assign n4495_o = ~n4494_o;
  /* find_the_damn_issue_sky130.vhd:1784:202  */
  assign n4496_o = ~n4495_o;
  /* find_the_damn_issue_sky130.vhd:1784:197  */
  assign n4497_o = n4466_o | n4496_o;
  /* find_the_damn_issue_sky130.vhd:1784:159  */
  assign n4498_o = ~n4497_o;
  /* find_the_damn_issue_sky130.vhd:1784:153  */
  assign n4499_o = ~n4498_o;
  /* find_the_damn_issue_sky130.vhd:1784:148  */
  assign n4500_o = n4464_o | n4499_o;
  /* find_the_damn_issue_sky130.vhd:1784:110  */
  assign n4501_o = ~n4500_o;
  /* find_the_damn_issue_sky130.vhd:1784:104  */
  assign n4502_o = ~n4501_o;
  /* find_the_damn_issue_sky130.vhd:1784:99  */
  assign n4503_o = n4462_o | n4502_o;
  /* find_the_damn_issue_sky130.vhd:1784:61  */
  assign n4504_o = ~n4503_o;
  /* find_the_damn_issue_sky130.vhd:1784:522  */
  assign n4506_o = s_state == 4'b0000;
  /* find_the_damn_issue_sky130.vhd:1784:532  */
  assign n4507_o = n4506_o & in_command_valid;
  /* find_the_damn_issue_sky130.vhd:1784:559  */
  assign n4508_o = n4507_o & in_unnamed;
  /* find_the_damn_issue_sky130.vhd:1784:507  */
  assign n4509_o = n4504_o & n4508_o;
  /* find_the_damn_issue_sky130.vhd:1784:54  */
  assign n4510_o = n4460_o & n4509_o;
  /* find_the_damn_issue_sky130.vhd:1784:17  */
  assign n4512_o = n4510_o ? 1'b1 : n4310_o;
  /* find_the_damn_issue_sky130.vhd:1789:42  */
  assign n4514_o = n3900_o == 6'b001110;
  /* find_the_damn_issue_sky130.vhd:1789:87  */
  assign n4516_o = n3900_o == 6'b001010;
  /* find_the_damn_issue_sky130.vhd:1789:136  */
  assign n4518_o = n3900_o == 6'b000111;
  /* find_the_damn_issue_sky130.vhd:1789:185  */
  assign n4520_o = n3900_o == 6'b000110;
  /* find_the_damn_issue_sky130.vhd:1789:234  */
  assign n4522_o = n3900_o == 6'b000100;
  /* find_the_damn_issue_sky130.vhd:1789:281  */
  assign n4524_o = n3899_o == 7'b0000111;
  /* find_the_damn_issue_sky130.vhd:1789:329  */
  assign n4526_o = n3899_o == 7'b0000110;
  /* find_the_damn_issue_sky130.vhd:1789:379  */
  assign n4528_o = n3900_o == 6'b000010;
  /* find_the_damn_issue_sky130.vhd:1789:417  */
  assign n4529_o = in_command[6:2];
  /* find_the_damn_issue_sky130.vhd:1789:430  */
  assign n4531_o = n4529_o == 5'b00000;
  /* find_the_damn_issue_sky130.vhd:1789:471  */
  assign n4532_o = in_command[7];
  /* find_the_damn_issue_sky130.vhd:1789:458  */
  assign n4533_o = ~n4532_o;
  /* find_the_damn_issue_sky130.vhd:1789:452  */
  assign n4534_o = ~n4533_o;
  /* find_the_damn_issue_sky130.vhd:1789:446  */
  assign n4535_o = ~n4534_o;
  /* find_the_damn_issue_sky130.vhd:1789:441  */
  assign n4536_o = n4531_o | n4535_o;
  /* find_the_damn_issue_sky130.vhd:1789:402  */
  assign n4537_o = ~n4536_o;
  /* find_the_damn_issue_sky130.vhd:1789:396  */
  assign n4538_o = ~n4537_o;
  /* find_the_damn_issue_sky130.vhd:1789:391  */
  assign n4539_o = n4528_o | n4538_o;
  /* find_the_damn_issue_sky130.vhd:1789:353  */
  assign n4540_o = ~n4539_o;
  /* find_the_damn_issue_sky130.vhd:1789:347  */
  assign n4541_o = ~n4540_o;
  /* find_the_damn_issue_sky130.vhd:1789:342  */
  assign n4542_o = n4526_o | n4541_o;
  /* find_the_damn_issue_sky130.vhd:1789:305  */
  assign n4543_o = ~n4542_o;
  /* find_the_damn_issue_sky130.vhd:1789:299  */
  assign n4544_o = ~n4543_o;
  /* find_the_damn_issue_sky130.vhd:1789:294  */
  assign n4545_o = n4524_o | n4544_o;
  /* find_the_damn_issue_sky130.vhd:1789:257  */
  assign n4546_o = ~n4545_o;
  /* find_the_damn_issue_sky130.vhd:1789:251  */
  assign n4547_o = ~n4546_o;
  /* find_the_damn_issue_sky130.vhd:1789:246  */
  assign n4548_o = n4522_o | n4547_o;
  /* find_the_damn_issue_sky130.vhd:1789:208  */
  assign n4549_o = ~n4548_o;
  /* find_the_damn_issue_sky130.vhd:1789:202  */
  assign n4550_o = ~n4549_o;
  /* find_the_damn_issue_sky130.vhd:1789:197  */
  assign n4551_o = n4520_o | n4550_o;
  /* find_the_damn_issue_sky130.vhd:1789:159  */
  assign n4552_o = ~n4551_o;
  /* find_the_damn_issue_sky130.vhd:1789:153  */
  assign n4553_o = ~n4552_o;
  /* find_the_damn_issue_sky130.vhd:1789:148  */
  assign n4554_o = n4518_o | n4553_o;
  /* find_the_damn_issue_sky130.vhd:1789:110  */
  assign n4555_o = ~n4554_o;
  /* find_the_damn_issue_sky130.vhd:1789:104  */
  assign n4556_o = ~n4555_o;
  /* find_the_damn_issue_sky130.vhd:1789:99  */
  assign n4557_o = n4516_o | n4556_o;
  /* find_the_damn_issue_sky130.vhd:1789:61  */
  assign n4558_o = ~n4557_o;
  /* find_the_damn_issue_sky130.vhd:1789:522  */
  assign n4560_o = s_state == 4'b0000;
  /* find_the_damn_issue_sky130.vhd:1789:532  */
  assign n4561_o = n4560_o & in_command_valid;
  /* find_the_damn_issue_sky130.vhd:1789:559  */
  assign n4562_o = n4561_o & in_unnamed;
  /* find_the_damn_issue_sky130.vhd:1789:507  */
  assign n4563_o = n4558_o & n4562_o;
  /* find_the_damn_issue_sky130.vhd:1789:54  */
  assign n4564_o = n4514_o & n4563_o;
  /* find_the_damn_issue_sky130.vhd:1789:17  */
  assign n4566_o = n4564_o ? 1'b1 : n4359_o;
  /* find_the_damn_issue_sky130.vhd:1794:42  */
  assign n4568_o = n3900_o == 6'b001110;
  /* find_the_damn_issue_sky130.vhd:1794:87  */
  assign n4570_o = n3900_o == 6'b001010;
  /* find_the_damn_issue_sky130.vhd:1794:136  */
  assign n4572_o = n3900_o == 6'b000111;
  /* find_the_damn_issue_sky130.vhd:1794:185  */
  assign n4574_o = n3900_o == 6'b000110;
  /* find_the_damn_issue_sky130.vhd:1794:234  */
  assign n4576_o = n3900_o == 6'b000100;
  /* find_the_damn_issue_sky130.vhd:1794:281  */
  assign n4578_o = n3899_o == 7'b0000111;
  /* find_the_damn_issue_sky130.vhd:1794:329  */
  assign n4580_o = n3899_o == 7'b0000110;
  /* find_the_damn_issue_sky130.vhd:1794:379  */
  assign n4582_o = n3900_o == 6'b000010;
  /* find_the_damn_issue_sky130.vhd:1794:417  */
  assign n4583_o = in_command[6:2];
  /* find_the_damn_issue_sky130.vhd:1794:430  */
  assign n4585_o = n4583_o == 5'b00000;
  /* find_the_damn_issue_sky130.vhd:1794:471  */
  assign n4586_o = in_command[7];
  /* find_the_damn_issue_sky130.vhd:1794:458  */
  assign n4587_o = ~n4586_o;
  /* find_the_damn_issue_sky130.vhd:1794:452  */
  assign n4588_o = ~n4587_o;
  /* find_the_damn_issue_sky130.vhd:1794:446  */
  assign n4589_o = ~n4588_o;
  /* find_the_damn_issue_sky130.vhd:1794:441  */
  assign n4590_o = n4585_o | n4589_o;
  /* find_the_damn_issue_sky130.vhd:1794:402  */
  assign n4591_o = ~n4590_o;
  /* find_the_damn_issue_sky130.vhd:1794:396  */
  assign n4592_o = ~n4591_o;
  /* find_the_damn_issue_sky130.vhd:1794:391  */
  assign n4593_o = n4582_o | n4592_o;
  /* find_the_damn_issue_sky130.vhd:1794:353  */
  assign n4594_o = ~n4593_o;
  /* find_the_damn_issue_sky130.vhd:1794:347  */
  assign n4595_o = ~n4594_o;
  /* find_the_damn_issue_sky130.vhd:1794:342  */
  assign n4596_o = n4580_o | n4595_o;
  /* find_the_damn_issue_sky130.vhd:1794:305  */
  assign n4597_o = ~n4596_o;
  /* find_the_damn_issue_sky130.vhd:1794:299  */
  assign n4598_o = ~n4597_o;
  /* find_the_damn_issue_sky130.vhd:1794:294  */
  assign n4599_o = n4578_o | n4598_o;
  /* find_the_damn_issue_sky130.vhd:1794:257  */
  assign n4600_o = ~n4599_o;
  /* find_the_damn_issue_sky130.vhd:1794:251  */
  assign n4601_o = ~n4600_o;
  /* find_the_damn_issue_sky130.vhd:1794:246  */
  assign n4602_o = n4576_o | n4601_o;
  /* find_the_damn_issue_sky130.vhd:1794:208  */
  assign n4603_o = ~n4602_o;
  /* find_the_damn_issue_sky130.vhd:1794:202  */
  assign n4604_o = ~n4603_o;
  /* find_the_damn_issue_sky130.vhd:1794:197  */
  assign n4605_o = n4574_o | n4604_o;
  /* find_the_damn_issue_sky130.vhd:1794:159  */
  assign n4606_o = ~n4605_o;
  /* find_the_damn_issue_sky130.vhd:1794:153  */
  assign n4607_o = ~n4606_o;
  /* find_the_damn_issue_sky130.vhd:1794:148  */
  assign n4608_o = n4572_o | n4607_o;
  /* find_the_damn_issue_sky130.vhd:1794:110  */
  assign n4609_o = ~n4608_o;
  /* find_the_damn_issue_sky130.vhd:1794:104  */
  assign n4610_o = ~n4609_o;
  /* find_the_damn_issue_sky130.vhd:1794:99  */
  assign n4611_o = n4570_o | n4610_o;
  /* find_the_damn_issue_sky130.vhd:1794:61  */
  assign n4612_o = ~n4611_o;
  /* find_the_damn_issue_sky130.vhd:1794:522  */
  assign n4614_o = s_state == 4'b0000;
  /* find_the_damn_issue_sky130.vhd:1794:532  */
  assign n4615_o = n4614_o & in_command_valid;
  /* find_the_damn_issue_sky130.vhd:1794:559  */
  assign n4616_o = n4615_o & in_unnamed;
  /* find_the_damn_issue_sky130.vhd:1794:507  */
  assign n4617_o = n4612_o & n4616_o;
  /* find_the_damn_issue_sky130.vhd:1794:54  */
  assign n4618_o = n4568_o & n4617_o;
  /* find_the_damn_issue_sky130.vhd:1795:73  */
  assign n4619_o = in_command[0];
  /* find_the_damn_issue_sky130.vhd:1795:60  */
  assign n4620_o = ~n4619_o;
  /* find_the_damn_issue_sky130.vhd:1794:17  */
  assign n4621_o = n4618_o ? n4620_o : n4409_o;
  /* find_the_damn_issue_sky130.vhd:1799:42  */
  assign n4623_o = n3900_o == 6'b001110;
  /* find_the_damn_issue_sky130.vhd:1799:87  */
  assign n4625_o = n3900_o == 6'b001010;
  /* find_the_damn_issue_sky130.vhd:1799:136  */
  assign n4627_o = n3900_o == 6'b000111;
  /* find_the_damn_issue_sky130.vhd:1799:185  */
  assign n4629_o = n3900_o == 6'b000110;
  /* find_the_damn_issue_sky130.vhd:1799:234  */
  assign n4631_o = n3900_o == 6'b000100;
  /* find_the_damn_issue_sky130.vhd:1799:281  */
  assign n4633_o = n3899_o == 7'b0000111;
  /* find_the_damn_issue_sky130.vhd:1799:329  */
  assign n4635_o = n3899_o == 7'b0000110;
  /* find_the_damn_issue_sky130.vhd:1799:379  */
  assign n4637_o = n3900_o == 6'b000010;
  /* find_the_damn_issue_sky130.vhd:1799:417  */
  assign n4638_o = in_command[6:2];
  /* find_the_damn_issue_sky130.vhd:1799:430  */
  assign n4640_o = n4638_o == 5'b00000;
  /* find_the_damn_issue_sky130.vhd:1799:471  */
  assign n4641_o = in_command[7];
  /* find_the_damn_issue_sky130.vhd:1799:458  */
  assign n4642_o = ~n4641_o;
  /* find_the_damn_issue_sky130.vhd:1799:452  */
  assign n4643_o = ~n4642_o;
  /* find_the_damn_issue_sky130.vhd:1799:446  */
  assign n4644_o = ~n4643_o;
  /* find_the_damn_issue_sky130.vhd:1799:441  */
  assign n4645_o = n4640_o | n4644_o;
  /* find_the_damn_issue_sky130.vhd:1799:402  */
  assign n4646_o = ~n4645_o;
  /* find_the_damn_issue_sky130.vhd:1799:396  */
  assign n4647_o = ~n4646_o;
  /* find_the_damn_issue_sky130.vhd:1799:391  */
  assign n4648_o = n4637_o | n4647_o;
  /* find_the_damn_issue_sky130.vhd:1799:353  */
  assign n4649_o = ~n4648_o;
  /* find_the_damn_issue_sky130.vhd:1799:347  */
  assign n4650_o = ~n4649_o;
  /* find_the_damn_issue_sky130.vhd:1799:342  */
  assign n4651_o = n4635_o | n4650_o;
  /* find_the_damn_issue_sky130.vhd:1799:305  */
  assign n4652_o = ~n4651_o;
  /* find_the_damn_issue_sky130.vhd:1799:299  */
  assign n4653_o = ~n4652_o;
  /* find_the_damn_issue_sky130.vhd:1799:294  */
  assign n4654_o = n4633_o | n4653_o;
  /* find_the_damn_issue_sky130.vhd:1799:257  */
  assign n4655_o = ~n4654_o;
  /* find_the_damn_issue_sky130.vhd:1799:251  */
  assign n4656_o = ~n4655_o;
  /* find_the_damn_issue_sky130.vhd:1799:246  */
  assign n4657_o = n4631_o | n4656_o;
  /* find_the_damn_issue_sky130.vhd:1799:208  */
  assign n4658_o = ~n4657_o;
  /* find_the_damn_issue_sky130.vhd:1799:202  */
  assign n4659_o = ~n4658_o;
  /* find_the_damn_issue_sky130.vhd:1799:197  */
  assign n4660_o = n4629_o | n4659_o;
  /* find_the_damn_issue_sky130.vhd:1799:159  */
  assign n4661_o = ~n4660_o;
  /* find_the_damn_issue_sky130.vhd:1799:153  */
  assign n4662_o = ~n4661_o;
  /* find_the_damn_issue_sky130.vhd:1799:148  */
  assign n4663_o = n4627_o | n4662_o;
  /* find_the_damn_issue_sky130.vhd:1799:110  */
  assign n4664_o = ~n4663_o;
  /* find_the_damn_issue_sky130.vhd:1799:104  */
  assign n4665_o = ~n4664_o;
  /* find_the_damn_issue_sky130.vhd:1799:99  */
  assign n4666_o = n4625_o | n4665_o;
  /* find_the_damn_issue_sky130.vhd:1799:61  */
  assign n4667_o = ~n4666_o;
  /* find_the_damn_issue_sky130.vhd:1799:522  */
  assign n4669_o = s_state == 4'b0000;
  /* find_the_damn_issue_sky130.vhd:1799:532  */
  assign n4670_o = n4669_o & in_command_valid;
  /* find_the_damn_issue_sky130.vhd:1799:559  */
  assign n4671_o = n4670_o & in_unnamed;
  /* find_the_damn_issue_sky130.vhd:1799:507  */
  assign n4672_o = n4667_o & n4671_o;
  /* find_the_damn_issue_sky130.vhd:1799:54  */
  assign n4673_o = n4623_o & n4672_o;
  /* find_the_damn_issue_sky130.vhd:1799:17  */
  assign n4675_o = n4673_o ? 4'b1001 : n4171_o;
  /* find_the_damn_issue_sky130.vhd:1806:42  */
  assign n4677_o = n3900_o == 6'b001110;
  /* find_the_damn_issue_sky130.vhd:1806:87  */
  assign n4679_o = n3900_o == 6'b001010;
  /* find_the_damn_issue_sky130.vhd:1806:136  */
  assign n4681_o = n3900_o == 6'b000111;
  /* find_the_damn_issue_sky130.vhd:1806:185  */
  assign n4683_o = n3900_o == 6'b000110;
  /* find_the_damn_issue_sky130.vhd:1806:234  */
  assign n4685_o = n3900_o == 6'b000100;
  /* find_the_damn_issue_sky130.vhd:1806:281  */
  assign n4687_o = n3899_o == 7'b0000111;
  /* find_the_damn_issue_sky130.vhd:1806:329  */
  assign n4689_o = n3899_o == 7'b0000110;
  /* find_the_damn_issue_sky130.vhd:1806:379  */
  assign n4691_o = n3900_o == 6'b000010;
  /* find_the_damn_issue_sky130.vhd:1806:417  */
  assign n4692_o = in_command[6:2];
  /* find_the_damn_issue_sky130.vhd:1806:430  */
  assign n4694_o = n4692_o == 5'b00000;
  /* find_the_damn_issue_sky130.vhd:1806:471  */
  assign n4695_o = in_command[7];
  /* find_the_damn_issue_sky130.vhd:1806:458  */
  assign n4696_o = ~n4695_o;
  /* find_the_damn_issue_sky130.vhd:1806:452  */
  assign n4697_o = ~n4696_o;
  /* find_the_damn_issue_sky130.vhd:1806:446  */
  assign n4698_o = ~n4697_o;
  /* find_the_damn_issue_sky130.vhd:1806:441  */
  assign n4699_o = n4694_o | n4698_o;
  /* find_the_damn_issue_sky130.vhd:1806:402  */
  assign n4700_o = ~n4699_o;
  /* find_the_damn_issue_sky130.vhd:1806:396  */
  assign n4701_o = ~n4700_o;
  /* find_the_damn_issue_sky130.vhd:1806:391  */
  assign n4702_o = n4691_o | n4701_o;
  /* find_the_damn_issue_sky130.vhd:1806:353  */
  assign n4703_o = ~n4702_o;
  /* find_the_damn_issue_sky130.vhd:1806:347  */
  assign n4704_o = ~n4703_o;
  /* find_the_damn_issue_sky130.vhd:1806:342  */
  assign n4705_o = n4689_o | n4704_o;
  /* find_the_damn_issue_sky130.vhd:1806:305  */
  assign n4706_o = ~n4705_o;
  /* find_the_damn_issue_sky130.vhd:1806:299  */
  assign n4707_o = ~n4706_o;
  /* find_the_damn_issue_sky130.vhd:1806:294  */
  assign n4708_o = n4687_o | n4707_o;
  /* find_the_damn_issue_sky130.vhd:1806:257  */
  assign n4709_o = ~n4708_o;
  /* find_the_damn_issue_sky130.vhd:1806:251  */
  assign n4710_o = ~n4709_o;
  /* find_the_damn_issue_sky130.vhd:1806:246  */
  assign n4711_o = n4685_o | n4710_o;
  /* find_the_damn_issue_sky130.vhd:1806:208  */
  assign n4712_o = ~n4711_o;
  /* find_the_damn_issue_sky130.vhd:1806:202  */
  assign n4713_o = ~n4712_o;
  /* find_the_damn_issue_sky130.vhd:1806:197  */
  assign n4714_o = n4683_o | n4713_o;
  /* find_the_damn_issue_sky130.vhd:1806:159  */
  assign n4715_o = ~n4714_o;
  /* find_the_damn_issue_sky130.vhd:1806:153  */
  assign n4716_o = ~n4715_o;
  /* find_the_damn_issue_sky130.vhd:1806:148  */
  assign n4717_o = n4681_o | n4716_o;
  /* find_the_damn_issue_sky130.vhd:1806:110  */
  assign n4718_o = ~n4717_o;
  /* find_the_damn_issue_sky130.vhd:1806:104  */
  assign n4719_o = ~n4718_o;
  /* find_the_damn_issue_sky130.vhd:1806:99  */
  assign n4720_o = n4679_o | n4719_o;
  /* find_the_damn_issue_sky130.vhd:1806:61  */
  assign n4721_o = ~n4720_o;
  /* find_the_damn_issue_sky130.vhd:1806:522  */
  assign n4723_o = s_state == 4'b0000;
  /* find_the_damn_issue_sky130.vhd:1806:532  */
  assign n4724_o = n4723_o & in_command_valid;
  /* find_the_damn_issue_sky130.vhd:1806:559  */
  assign n4725_o = n4724_o & in_unnamed;
  /* find_the_damn_issue_sky130.vhd:1806:507  */
  assign n4726_o = n4721_o & n4725_o;
  /* find_the_damn_issue_sky130.vhd:1806:54  */
  assign n4727_o = n4677_o & n4726_o;
  /* find_the_damn_issue_sky130.vhd:1806:17  */
  assign n4729_o = n4727_o ? 4'b0111 : n4458_o;
  /* find_the_damn_issue_sky130.vhd:1811:40  */
  assign n4731_o = n3899_o == 7'b0011110;
  /* find_the_damn_issue_sky130.vhd:1811:86  */
  assign n4733_o = n3900_o == 6'b001110;
  /* find_the_damn_issue_sky130.vhd:1811:135  */
  assign n4735_o = n3900_o == 6'b001010;
  /* find_the_damn_issue_sky130.vhd:1811:184  */
  assign n4737_o = n3900_o == 6'b000111;
  /* find_the_damn_issue_sky130.vhd:1811:233  */
  assign n4739_o = n3900_o == 6'b000110;
  /* find_the_damn_issue_sky130.vhd:1811:282  */
  assign n4741_o = n3900_o == 6'b000100;
  /* find_the_damn_issue_sky130.vhd:1811:329  */
  assign n4743_o = n3899_o == 7'b0000111;
  /* find_the_damn_issue_sky130.vhd:1811:377  */
  assign n4745_o = n3899_o == 7'b0000110;
  /* find_the_damn_issue_sky130.vhd:1811:427  */
  assign n4747_o = n3900_o == 6'b000010;
  /* find_the_damn_issue_sky130.vhd:1811:465  */
  assign n4748_o = in_command[6:2];
  /* find_the_damn_issue_sky130.vhd:1811:478  */
  assign n4750_o = n4748_o == 5'b00000;
  /* find_the_damn_issue_sky130.vhd:1811:519  */
  assign n4751_o = in_command[7];
  /* find_the_damn_issue_sky130.vhd:1811:506  */
  assign n4752_o = ~n4751_o;
  /* find_the_damn_issue_sky130.vhd:1811:500  */
  assign n4753_o = ~n4752_o;
  /* find_the_damn_issue_sky130.vhd:1811:494  */
  assign n4754_o = ~n4753_o;
  /* find_the_damn_issue_sky130.vhd:1811:489  */
  assign n4755_o = n4750_o | n4754_o;
  /* find_the_damn_issue_sky130.vhd:1811:450  */
  assign n4756_o = ~n4755_o;
  /* find_the_damn_issue_sky130.vhd:1811:444  */
  assign n4757_o = ~n4756_o;
  /* find_the_damn_issue_sky130.vhd:1811:439  */
  assign n4758_o = n4747_o | n4757_o;
  /* find_the_damn_issue_sky130.vhd:1811:401  */
  assign n4759_o = ~n4758_o;
  /* find_the_damn_issue_sky130.vhd:1811:395  */
  assign n4760_o = ~n4759_o;
  /* find_the_damn_issue_sky130.vhd:1811:390  */
  assign n4761_o = n4745_o | n4760_o;
  /* find_the_damn_issue_sky130.vhd:1811:353  */
  assign n4762_o = ~n4761_o;
  /* find_the_damn_issue_sky130.vhd:1811:347  */
  assign n4763_o = ~n4762_o;
  /* find_the_damn_issue_sky130.vhd:1811:342  */
  assign n4764_o = n4743_o | n4763_o;
  /* find_the_damn_issue_sky130.vhd:1811:305  */
  assign n4765_o = ~n4764_o;
  /* find_the_damn_issue_sky130.vhd:1811:299  */
  assign n4766_o = ~n4765_o;
  /* find_the_damn_issue_sky130.vhd:1811:294  */
  assign n4767_o = n4741_o | n4766_o;
  /* find_the_damn_issue_sky130.vhd:1811:256  */
  assign n4768_o = ~n4767_o;
  /* find_the_damn_issue_sky130.vhd:1811:250  */
  assign n4769_o = ~n4768_o;
  /* find_the_damn_issue_sky130.vhd:1811:245  */
  assign n4770_o = n4739_o | n4769_o;
  /* find_the_damn_issue_sky130.vhd:1811:207  */
  assign n4771_o = ~n4770_o;
  /* find_the_damn_issue_sky130.vhd:1811:201  */
  assign n4772_o = ~n4771_o;
  /* find_the_damn_issue_sky130.vhd:1811:196  */
  assign n4773_o = n4737_o | n4772_o;
  /* find_the_damn_issue_sky130.vhd:1811:158  */
  assign n4774_o = ~n4773_o;
  /* find_the_damn_issue_sky130.vhd:1811:152  */
  assign n4775_o = ~n4774_o;
  /* find_the_damn_issue_sky130.vhd:1811:147  */
  assign n4776_o = n4735_o | n4775_o;
  /* find_the_damn_issue_sky130.vhd:1811:109  */
  assign n4777_o = ~n4776_o;
  /* find_the_damn_issue_sky130.vhd:1811:103  */
  assign n4778_o = ~n4777_o;
  /* find_the_damn_issue_sky130.vhd:1811:98  */
  assign n4779_o = n4733_o | n4778_o;
  /* find_the_damn_issue_sky130.vhd:1811:60  */
  assign n4780_o = ~n4779_o;
  /* find_the_damn_issue_sky130.vhd:1811:573  */
  assign n4782_o = s_state == 4'b0000;
  /* find_the_damn_issue_sky130.vhd:1811:583  */
  assign n4783_o = n4782_o & in_command_valid;
  /* find_the_damn_issue_sky130.vhd:1811:610  */
  assign n4784_o = n4783_o & in_unnamed;
  /* find_the_damn_issue_sky130.vhd:1811:558  */
  assign n4785_o = n4780_o & n4784_o;
  /* find_the_damn_issue_sky130.vhd:1811:53  */
  assign n4786_o = n4731_o & n4785_o;
  /* find_the_damn_issue_sky130.vhd:1811:17  */
  assign n4788_o = n4786_o ? 4'b0100 : n4729_o;
  /* find_the_damn_issue_sky130.vhd:1816:31  */
  assign n4789_o = in_command[6:5];
  /* find_the_damn_issue_sky130.vhd:1816:44  */
  assign n4791_o = n4789_o == 2'b10;
  /* find_the_damn_issue_sky130.vhd:1816:83  */
  assign n4793_o = n3899_o == 7'b0011110;
  /* find_the_damn_issue_sky130.vhd:1816:133  */
  assign n4795_o = n3900_o == 6'b001110;
  /* find_the_damn_issue_sky130.vhd:1816:182  */
  assign n4797_o = n3900_o == 6'b001010;
  /* find_the_damn_issue_sky130.vhd:1816:231  */
  assign n4799_o = n3900_o == 6'b000111;
  /* find_the_damn_issue_sky130.vhd:1816:280  */
  assign n4801_o = n3900_o == 6'b000110;
  /* find_the_damn_issue_sky130.vhd:1816:329  */
  assign n4803_o = n3900_o == 6'b000100;
  /* find_the_damn_issue_sky130.vhd:1816:376  */
  assign n4805_o = n3899_o == 7'b0000111;
  /* find_the_damn_issue_sky130.vhd:1816:424  */
  assign n4807_o = n3899_o == 7'b0000110;
  /* find_the_damn_issue_sky130.vhd:1816:474  */
  assign n4809_o = n3900_o == 6'b000010;
  /* find_the_damn_issue_sky130.vhd:1816:512  */
  assign n4810_o = in_command[6:2];
  /* find_the_damn_issue_sky130.vhd:1816:525  */
  assign n4812_o = n4810_o == 5'b00000;
  /* find_the_damn_issue_sky130.vhd:1816:566  */
  assign n4813_o = in_command[7];
  /* find_the_damn_issue_sky130.vhd:1816:553  */
  assign n4814_o = ~n4813_o;
  /* find_the_damn_issue_sky130.vhd:1816:547  */
  assign n4815_o = ~n4814_o;
  /* find_the_damn_issue_sky130.vhd:1816:541  */
  assign n4816_o = ~n4815_o;
  /* find_the_damn_issue_sky130.vhd:1816:536  */
  assign n4817_o = n4812_o | n4816_o;
  /* find_the_damn_issue_sky130.vhd:1816:497  */
  assign n4818_o = ~n4817_o;
  /* find_the_damn_issue_sky130.vhd:1816:491  */
  assign n4819_o = ~n4818_o;
  /* find_the_damn_issue_sky130.vhd:1816:486  */
  assign n4820_o = n4809_o | n4819_o;
  /* find_the_damn_issue_sky130.vhd:1816:448  */
  assign n4821_o = ~n4820_o;
  /* find_the_damn_issue_sky130.vhd:1816:442  */
  assign n4822_o = ~n4821_o;
  /* find_the_damn_issue_sky130.vhd:1816:437  */
  assign n4823_o = n4807_o | n4822_o;
  /* find_the_damn_issue_sky130.vhd:1816:400  */
  assign n4824_o = ~n4823_o;
  /* find_the_damn_issue_sky130.vhd:1816:394  */
  assign n4825_o = ~n4824_o;
  /* find_the_damn_issue_sky130.vhd:1816:389  */
  assign n4826_o = n4805_o | n4825_o;
  /* find_the_damn_issue_sky130.vhd:1816:352  */
  assign n4827_o = ~n4826_o;
  /* find_the_damn_issue_sky130.vhd:1816:346  */
  assign n4828_o = ~n4827_o;
  /* find_the_damn_issue_sky130.vhd:1816:341  */
  assign n4829_o = n4803_o | n4828_o;
  /* find_the_damn_issue_sky130.vhd:1816:303  */
  assign n4830_o = ~n4829_o;
  /* find_the_damn_issue_sky130.vhd:1816:297  */
  assign n4831_o = ~n4830_o;
  /* find_the_damn_issue_sky130.vhd:1816:292  */
  assign n4832_o = n4801_o | n4831_o;
  /* find_the_damn_issue_sky130.vhd:1816:254  */
  assign n4833_o = ~n4832_o;
  /* find_the_damn_issue_sky130.vhd:1816:248  */
  assign n4834_o = ~n4833_o;
  /* find_the_damn_issue_sky130.vhd:1816:243  */
  assign n4835_o = n4799_o | n4834_o;
  /* find_the_damn_issue_sky130.vhd:1816:205  */
  assign n4836_o = ~n4835_o;
  /* find_the_damn_issue_sky130.vhd:1816:199  */
  assign n4837_o = ~n4836_o;
  /* find_the_damn_issue_sky130.vhd:1816:194  */
  assign n4838_o = n4797_o | n4837_o;
  /* find_the_damn_issue_sky130.vhd:1816:156  */
  assign n4839_o = ~n4838_o;
  /* find_the_damn_issue_sky130.vhd:1816:150  */
  assign n4840_o = ~n4839_o;
  /* find_the_damn_issue_sky130.vhd:1816:145  */
  assign n4841_o = n4795_o | n4840_o;
  /* find_the_damn_issue_sky130.vhd:1816:107  */
  assign n4842_o = ~n4841_o;
  /* find_the_damn_issue_sky130.vhd:1816:101  */
  assign n4843_o = ~n4842_o;
  /* find_the_damn_issue_sky130.vhd:1816:96  */
  assign n4844_o = n4793_o | n4843_o;
  /* find_the_damn_issue_sky130.vhd:1816:59  */
  assign n4845_o = ~n4844_o;
  /* find_the_damn_issue_sky130.vhd:1816:623  */
  assign n4847_o = s_state == 4'b0000;
  /* find_the_damn_issue_sky130.vhd:1816:633  */
  assign n4848_o = n4847_o & in_command_valid;
  /* find_the_damn_issue_sky130.vhd:1816:660  */
  assign n4849_o = n4848_o & in_unnamed;
  /* find_the_damn_issue_sky130.vhd:1816:608  */
  assign n4850_o = n4845_o & n4849_o;
  /* find_the_damn_issue_sky130.vhd:1816:52  */
  assign n4851_o = n4791_o & n4850_o;
  /* find_the_damn_issue_sky130.vhd:1816:17  */
  assign n4853_o = n4851_o ? 1'b0 : n3172_o;
  /* find_the_damn_issue_sky130.vhd:1821:80  */
  assign n4855_o = in_command[6:5];
  /* find_the_damn_issue_sky130.vhd:1821:93  */
  assign n4857_o = n4855_o == 2'b10;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n4864_o = n4857_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:1821:145  */
  assign n4867_o = n3899_o == 7'b0011110;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n4874_o = n4867_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:1821:208  */
  assign n4877_o = n3900_o == 6'b001110;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n4884_o = n4877_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:1821:270  */
  assign n4887_o = n3900_o == 6'b001010;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n4894_o = n4887_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:1821:332  */
  assign n4897_o = n3900_o == 6'b000111;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n4904_o = n4897_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:1821:394  */
  assign n4907_o = n3900_o == 6'b000110;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n4914_o = n4907_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:1821:456  */
  assign n4917_o = n3900_o == 6'b000100;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n4924_o = n4917_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:1821:516  */
  assign n4927_o = n3899_o == 7'b0000111;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n4934_o = n4927_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:1821:577  */
  assign n4937_o = n3899_o == 7'b0000110;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n4944_o = n4937_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:1821:640  */
  assign n4947_o = n3900_o == 6'b000010;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n4954_o = n4947_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:1821:691  */
  assign n4956_o = in_command[6:2];
  /* find_the_damn_issue_sky130.vhd:1821:704  */
  assign n4958_o = n4956_o == 5'b00000;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n4965_o = n4958_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:1821:745  */
  assign n4966_o = in_command[7];
  /* find_the_damn_issue_sky130.vhd:1821:732  */
  assign n4967_o = ~n4966_o;
  /* find_the_damn_issue_sky130.vhd:1821:726  */
  assign n4968_o = ~n4967_o;
  /* find_the_damn_issue_sky130.vhd:1821:720  */
  assign n4969_o = ~n4968_o;
  /* find_the_damn_issue_sky130.vhd:1821:715  */
  assign n4970_o = n4965_o | n4969_o;
  /* find_the_damn_issue_sky130.vhd:1821:663  */
  assign n4971_o = ~n4970_o;
  /* find_the_damn_issue_sky130.vhd:1821:657  */
  assign n4972_o = ~n4971_o;
  /* find_the_damn_issue_sky130.vhd:1821:652  */
  assign n4973_o = n4954_o | n4972_o;
  /* find_the_damn_issue_sky130.vhd:1821:601  */
  assign n4974_o = ~n4973_o;
  /* find_the_damn_issue_sky130.vhd:1821:595  */
  assign n4975_o = ~n4974_o;
  /* find_the_damn_issue_sky130.vhd:1821:590  */
  assign n4976_o = n4944_o | n4975_o;
  /* find_the_damn_issue_sky130.vhd:1821:540  */
  assign n4977_o = ~n4976_o;
  /* find_the_damn_issue_sky130.vhd:1821:534  */
  assign n4978_o = ~n4977_o;
  /* find_the_damn_issue_sky130.vhd:1821:529  */
  assign n4979_o = n4934_o | n4978_o;
  /* find_the_damn_issue_sky130.vhd:1821:479  */
  assign n4980_o = ~n4979_o;
  /* find_the_damn_issue_sky130.vhd:1821:473  */
  assign n4981_o = ~n4980_o;
  /* find_the_damn_issue_sky130.vhd:1821:468  */
  assign n4982_o = n4924_o | n4981_o;
  /* find_the_damn_issue_sky130.vhd:1821:417  */
  assign n4983_o = ~n4982_o;
  /* find_the_damn_issue_sky130.vhd:1821:411  */
  assign n4984_o = ~n4983_o;
  /* find_the_damn_issue_sky130.vhd:1821:406  */
  assign n4985_o = n4914_o | n4984_o;
  /* find_the_damn_issue_sky130.vhd:1821:355  */
  assign n4986_o = ~n4985_o;
  /* find_the_damn_issue_sky130.vhd:1821:349  */
  assign n4987_o = ~n4986_o;
  /* find_the_damn_issue_sky130.vhd:1821:344  */
  assign n4988_o = n4904_o | n4987_o;
  /* find_the_damn_issue_sky130.vhd:1821:293  */
  assign n4989_o = ~n4988_o;
  /* find_the_damn_issue_sky130.vhd:1821:287  */
  assign n4990_o = ~n4989_o;
  /* find_the_damn_issue_sky130.vhd:1821:282  */
  assign n4991_o = n4894_o | n4990_o;
  /* find_the_damn_issue_sky130.vhd:1821:231  */
  assign n4992_o = ~n4991_o;
  /* find_the_damn_issue_sky130.vhd:1821:225  */
  assign n4993_o = ~n4992_o;
  /* find_the_damn_issue_sky130.vhd:1821:220  */
  assign n4994_o = n4884_o | n4993_o;
  /* find_the_damn_issue_sky130.vhd:1821:169  */
  assign n4995_o = ~n4994_o;
  /* find_the_damn_issue_sky130.vhd:1821:163  */
  assign n4996_o = ~n4995_o;
  /* find_the_damn_issue_sky130.vhd:1821:158  */
  assign n4997_o = n4874_o | n4996_o;
  /* find_the_damn_issue_sky130.vhd:1821:108  */
  assign n4998_o = ~n4997_o;
  /* find_the_damn_issue_sky130.vhd:1821:809  */
  assign n5001_o = s_state == 4'b0000;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n5008_o = n5001_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:1821:819  */
  assign n5009_o = n5008_o & in_command_valid;
  /* find_the_damn_issue_sky130.vhd:1821:840  */
  assign n5010_o = n5009_o & in_unnamed;
  /* find_the_damn_issue_sky130.vhd:1821:781  */
  assign n5011_o = n4998_o & n5010_o;
  /* find_the_damn_issue_sky130.vhd:1821:101  */
  assign n5012_o = n4864_o & n5011_o;
  /* find_the_damn_issue_sky130.vhd:1821:52  */
  assign n5013_o = s_tick & n5012_o;
  /* find_the_damn_issue_sky130.vhd:1823:54  */
  assign n5014_o = in_command[0];
  /* find_the_damn_issue_sky130.vhd:1822:17  */
  assign n5015_o = n5013_o ? n5014_o : s_m_io0_out_2;
  /* find_the_damn_issue_sky130.vhd:1828:54  */
  assign n5016_o = in_command[1];
  /* find_the_damn_issue_sky130.vhd:1827:17  */
  assign n5017_o = n5013_o ? n5016_o : s_m_io1_out_2;
  /* find_the_damn_issue_sky130.vhd:1833:54  */
  assign n5018_o = in_command[2];
  /* find_the_damn_issue_sky130.vhd:1832:17  */
  assign n5019_o = n5013_o ? n5018_o : s_m_io2_out_2;
  /* find_the_damn_issue_sky130.vhd:1838:54  */
  assign n5020_o = in_command[3];
  /* find_the_damn_issue_sky130.vhd:1837:17  */
  assign n5021_o = n5013_o ? n5020_o : s_m_io3_out_2;
  /* find_the_damn_issue_sky130.vhd:1842:17  */
  assign n5023_o = n5013_o ? 1'b1 : n4853_o;
  /* find_the_damn_issue_sky130.vhd:1848:58  */
  assign n5024_o = in_command[4];
  /* find_the_damn_issue_sky130.vhd:1847:17  */
  assign n5025_o = n5013_o ? n5024_o : n3239_o;
  /* find_the_damn_issue_sky130.vhd:1852:38  */
  assign n5026_o = in_command[6:5];
  /* find_the_damn_issue_sky130.vhd:1852:51  */
  assign n5028_o = n5026_o == 2'b10;
  /* find_the_damn_issue_sky130.vhd:1852:94  */
  assign n5030_o = n3899_o == 7'b0011110;
  /* find_the_damn_issue_sky130.vhd:1852:144  */
  assign n5032_o = n3900_o == 6'b001110;
  /* find_the_damn_issue_sky130.vhd:1852:193  */
  assign n5034_o = n3900_o == 6'b001010;
  /* find_the_damn_issue_sky130.vhd:1852:242  */
  assign n5036_o = n3900_o == 6'b000111;
  /* find_the_damn_issue_sky130.vhd:1852:291  */
  assign n5038_o = n3900_o == 6'b000110;
  /* find_the_damn_issue_sky130.vhd:1852:340  */
  assign n5040_o = n3900_o == 6'b000100;
  /* find_the_damn_issue_sky130.vhd:1852:387  */
  assign n5042_o = n3899_o == 7'b0000111;
  /* find_the_damn_issue_sky130.vhd:1852:435  */
  assign n5044_o = n3899_o == 7'b0000110;
  /* find_the_damn_issue_sky130.vhd:1852:485  */
  assign n5046_o = n3900_o == 6'b000010;
  /* find_the_damn_issue_sky130.vhd:1852:523  */
  assign n5047_o = in_command[6:2];
  /* find_the_damn_issue_sky130.vhd:1852:536  */
  assign n5049_o = n5047_o == 5'b00000;
  /* find_the_damn_issue_sky130.vhd:1852:577  */
  assign n5050_o = in_command[7];
  /* find_the_damn_issue_sky130.vhd:1852:564  */
  assign n5051_o = ~n5050_o;
  /* find_the_damn_issue_sky130.vhd:1852:558  */
  assign n5052_o = ~n5051_o;
  /* find_the_damn_issue_sky130.vhd:1852:552  */
  assign n5053_o = ~n5052_o;
  /* find_the_damn_issue_sky130.vhd:1852:547  */
  assign n5054_o = n5049_o | n5053_o;
  /* find_the_damn_issue_sky130.vhd:1852:508  */
  assign n5055_o = ~n5054_o;
  /* find_the_damn_issue_sky130.vhd:1852:502  */
  assign n5056_o = ~n5055_o;
  /* find_the_damn_issue_sky130.vhd:1852:497  */
  assign n5057_o = n5046_o | n5056_o;
  /* find_the_damn_issue_sky130.vhd:1852:459  */
  assign n5058_o = ~n5057_o;
  /* find_the_damn_issue_sky130.vhd:1852:453  */
  assign n5059_o = ~n5058_o;
  /* find_the_damn_issue_sky130.vhd:1852:448  */
  assign n5060_o = n5044_o | n5059_o;
  /* find_the_damn_issue_sky130.vhd:1852:411  */
  assign n5061_o = ~n5060_o;
  /* find_the_damn_issue_sky130.vhd:1852:405  */
  assign n5062_o = ~n5061_o;
  /* find_the_damn_issue_sky130.vhd:1852:400  */
  assign n5063_o = n5042_o | n5062_o;
  /* find_the_damn_issue_sky130.vhd:1852:363  */
  assign n5064_o = ~n5063_o;
  /* find_the_damn_issue_sky130.vhd:1852:357  */
  assign n5065_o = ~n5064_o;
  /* find_the_damn_issue_sky130.vhd:1852:352  */
  assign n5066_o = n5040_o | n5065_o;
  /* find_the_damn_issue_sky130.vhd:1852:314  */
  assign n5067_o = ~n5066_o;
  /* find_the_damn_issue_sky130.vhd:1852:308  */
  assign n5068_o = ~n5067_o;
  /* find_the_damn_issue_sky130.vhd:1852:303  */
  assign n5069_o = n5038_o | n5068_o;
  /* find_the_damn_issue_sky130.vhd:1852:265  */
  assign n5070_o = ~n5069_o;
  /* find_the_damn_issue_sky130.vhd:1852:259  */
  assign n5071_o = ~n5070_o;
  /* find_the_damn_issue_sky130.vhd:1852:254  */
  assign n5072_o = n5036_o | n5071_o;
  /* find_the_damn_issue_sky130.vhd:1852:216  */
  assign n5073_o = ~n5072_o;
  /* find_the_damn_issue_sky130.vhd:1852:210  */
  assign n5074_o = ~n5073_o;
  /* find_the_damn_issue_sky130.vhd:1852:205  */
  assign n5075_o = n5034_o | n5074_o;
  /* find_the_damn_issue_sky130.vhd:1852:167  */
  assign n5076_o = ~n5075_o;
  /* find_the_damn_issue_sky130.vhd:1852:161  */
  assign n5077_o = ~n5076_o;
  /* find_the_damn_issue_sky130.vhd:1852:156  */
  assign n5078_o = n5032_o | n5077_o;
  /* find_the_damn_issue_sky130.vhd:1852:118  */
  assign n5079_o = ~n5078_o;
  /* find_the_damn_issue_sky130.vhd:1852:112  */
  assign n5080_o = ~n5079_o;
  /* find_the_damn_issue_sky130.vhd:1852:107  */
  assign n5081_o = n5030_o | n5080_o;
  /* find_the_damn_issue_sky130.vhd:1852:70  */
  assign n5082_o = ~n5081_o;
  /* find_the_damn_issue_sky130.vhd:1852:64  */
  assign n5083_o = ~n5082_o;
  /* find_the_damn_issue_sky130.vhd:1852:59  */
  assign n5084_o = n5028_o | n5083_o;
  /* find_the_damn_issue_sky130.vhd:1852:23  */
  assign n5085_o = ~n5084_o;
  /* find_the_damn_issue_sky130.vhd:1852:637  */
  assign n5087_o = s_state == 4'b0000;
  /* find_the_damn_issue_sky130.vhd:1852:647  */
  assign n5088_o = n5087_o & in_command_valid;
  /* find_the_damn_issue_sky130.vhd:1852:674  */
  assign n5089_o = n5088_o & in_unnamed;
  /* find_the_damn_issue_sky130.vhd:1852:622  */
  assign n5090_o = n5085_o & n5089_o;
  /* find_the_damn_issue_sky130.vhd:1852:17  */
  assign n5092_o = n5090_o ? 1'b1 : n5025_o;
  /* find_the_damn_issue_sky130.vhd:1857:38  */
  assign n5093_o = in_command[6:5];
  /* find_the_damn_issue_sky130.vhd:1857:51  */
  assign n5095_o = n5093_o == 2'b10;
  /* find_the_damn_issue_sky130.vhd:1857:94  */
  assign n5097_o = n3899_o == 7'b0011110;
  /* find_the_damn_issue_sky130.vhd:1857:144  */
  assign n5099_o = n3900_o == 6'b001110;
  /* find_the_damn_issue_sky130.vhd:1857:193  */
  assign n5101_o = n3900_o == 6'b001010;
  /* find_the_damn_issue_sky130.vhd:1857:242  */
  assign n5103_o = n3900_o == 6'b000111;
  /* find_the_damn_issue_sky130.vhd:1857:291  */
  assign n5105_o = n3900_o == 6'b000110;
  /* find_the_damn_issue_sky130.vhd:1857:340  */
  assign n5107_o = n3900_o == 6'b000100;
  /* find_the_damn_issue_sky130.vhd:1857:387  */
  assign n5109_o = n3899_o == 7'b0000111;
  /* find_the_damn_issue_sky130.vhd:1857:435  */
  assign n5111_o = n3899_o == 7'b0000110;
  /* find_the_damn_issue_sky130.vhd:1857:485  */
  assign n5113_o = n3900_o == 6'b000010;
  /* find_the_damn_issue_sky130.vhd:1857:523  */
  assign n5114_o = in_command[6:2];
  /* find_the_damn_issue_sky130.vhd:1857:536  */
  assign n5116_o = n5114_o == 5'b00000;
  /* find_the_damn_issue_sky130.vhd:1857:577  */
  assign n5117_o = in_command[7];
  /* find_the_damn_issue_sky130.vhd:1857:564  */
  assign n5118_o = ~n5117_o;
  /* find_the_damn_issue_sky130.vhd:1857:558  */
  assign n5119_o = ~n5118_o;
  /* find_the_damn_issue_sky130.vhd:1857:552  */
  assign n5120_o = ~n5119_o;
  /* find_the_damn_issue_sky130.vhd:1857:547  */
  assign n5121_o = n5116_o | n5120_o;
  /* find_the_damn_issue_sky130.vhd:1857:508  */
  assign n5122_o = ~n5121_o;
  /* find_the_damn_issue_sky130.vhd:1857:502  */
  assign n5123_o = ~n5122_o;
  /* find_the_damn_issue_sky130.vhd:1857:497  */
  assign n5124_o = n5113_o | n5123_o;
  /* find_the_damn_issue_sky130.vhd:1857:459  */
  assign n5125_o = ~n5124_o;
  /* find_the_damn_issue_sky130.vhd:1857:453  */
  assign n5126_o = ~n5125_o;
  /* find_the_damn_issue_sky130.vhd:1857:448  */
  assign n5127_o = n5111_o | n5126_o;
  /* find_the_damn_issue_sky130.vhd:1857:411  */
  assign n5128_o = ~n5127_o;
  /* find_the_damn_issue_sky130.vhd:1857:405  */
  assign n5129_o = ~n5128_o;
  /* find_the_damn_issue_sky130.vhd:1857:400  */
  assign n5130_o = n5109_o | n5129_o;
  /* find_the_damn_issue_sky130.vhd:1857:363  */
  assign n5131_o = ~n5130_o;
  /* find_the_damn_issue_sky130.vhd:1857:357  */
  assign n5132_o = ~n5131_o;
  /* find_the_damn_issue_sky130.vhd:1857:352  */
  assign n5133_o = n5107_o | n5132_o;
  /* find_the_damn_issue_sky130.vhd:1857:314  */
  assign n5134_o = ~n5133_o;
  /* find_the_damn_issue_sky130.vhd:1857:308  */
  assign n5135_o = ~n5134_o;
  /* find_the_damn_issue_sky130.vhd:1857:303  */
  assign n5136_o = n5105_o | n5135_o;
  /* find_the_damn_issue_sky130.vhd:1857:265  */
  assign n5137_o = ~n5136_o;
  /* find_the_damn_issue_sky130.vhd:1857:259  */
  assign n5138_o = ~n5137_o;
  /* find_the_damn_issue_sky130.vhd:1857:254  */
  assign n5139_o = n5103_o | n5138_o;
  /* find_the_damn_issue_sky130.vhd:1857:216  */
  assign n5140_o = ~n5139_o;
  /* find_the_damn_issue_sky130.vhd:1857:210  */
  assign n5141_o = ~n5140_o;
  /* find_the_damn_issue_sky130.vhd:1857:205  */
  assign n5142_o = n5101_o | n5141_o;
  /* find_the_damn_issue_sky130.vhd:1857:167  */
  assign n5143_o = ~n5142_o;
  /* find_the_damn_issue_sky130.vhd:1857:161  */
  assign n5144_o = ~n5143_o;
  /* find_the_damn_issue_sky130.vhd:1857:156  */
  assign n5145_o = n5099_o | n5144_o;
  /* find_the_damn_issue_sky130.vhd:1857:118  */
  assign n5146_o = ~n5145_o;
  /* find_the_damn_issue_sky130.vhd:1857:112  */
  assign n5147_o = ~n5146_o;
  /* find_the_damn_issue_sky130.vhd:1857:107  */
  assign n5148_o = n5097_o | n5147_o;
  /* find_the_damn_issue_sky130.vhd:1857:70  */
  assign n5149_o = ~n5148_o;
  /* find_the_damn_issue_sky130.vhd:1857:64  */
  assign n5150_o = ~n5149_o;
  /* find_the_damn_issue_sky130.vhd:1857:59  */
  assign n5151_o = n5095_o | n5150_o;
  /* find_the_damn_issue_sky130.vhd:1857:23  */
  assign n5152_o = ~n5151_o;
  /* find_the_damn_issue_sky130.vhd:1857:637  */
  assign n5154_o = s_state == 4'b0000;
  /* find_the_damn_issue_sky130.vhd:1857:647  */
  assign n5155_o = n5154_o & in_command_valid;
  /* find_the_damn_issue_sky130.vhd:1857:674  */
  assign n5156_o = n5155_o & in_unnamed;
  /* find_the_damn_issue_sky130.vhd:1857:622  */
  assign n5157_o = n5152_o & n5156_o;
  /* find_the_damn_issue_sky130.vhd:1857:17  */
  assign n5159_o = n5157_o ? 1'b0 : n5023_o;
  /* find_the_damn_issue_sky130.vhd:1862:38  */
  assign n5160_o = in_command[6:5];
  /* find_the_damn_issue_sky130.vhd:1862:51  */
  assign n5162_o = n5160_o == 2'b10;
  /* find_the_damn_issue_sky130.vhd:1862:94  */
  assign n5164_o = n3899_o == 7'b0011110;
  /* find_the_damn_issue_sky130.vhd:1862:144  */
  assign n5166_o = n3900_o == 6'b001110;
  /* find_the_damn_issue_sky130.vhd:1862:193  */
  assign n5168_o = n3900_o == 6'b001010;
  /* find_the_damn_issue_sky130.vhd:1862:242  */
  assign n5170_o = n3900_o == 6'b000111;
  /* find_the_damn_issue_sky130.vhd:1862:291  */
  assign n5172_o = n3900_o == 6'b000110;
  /* find_the_damn_issue_sky130.vhd:1862:340  */
  assign n5174_o = n3900_o == 6'b000100;
  /* find_the_damn_issue_sky130.vhd:1862:387  */
  assign n5176_o = n3899_o == 7'b0000111;
  /* find_the_damn_issue_sky130.vhd:1862:435  */
  assign n5178_o = n3899_o == 7'b0000110;
  /* find_the_damn_issue_sky130.vhd:1862:485  */
  assign n5180_o = n3900_o == 6'b000010;
  /* find_the_damn_issue_sky130.vhd:1862:523  */
  assign n5181_o = in_command[6:2];
  /* find_the_damn_issue_sky130.vhd:1862:536  */
  assign n5183_o = n5181_o == 5'b00000;
  /* find_the_damn_issue_sky130.vhd:1862:577  */
  assign n5184_o = in_command[7];
  /* find_the_damn_issue_sky130.vhd:1862:564  */
  assign n5185_o = ~n5184_o;
  /* find_the_damn_issue_sky130.vhd:1862:558  */
  assign n5186_o = ~n5185_o;
  /* find_the_damn_issue_sky130.vhd:1862:552  */
  assign n5187_o = ~n5186_o;
  /* find_the_damn_issue_sky130.vhd:1862:547  */
  assign n5188_o = n5183_o | n5187_o;
  /* find_the_damn_issue_sky130.vhd:1862:508  */
  assign n5189_o = ~n5188_o;
  /* find_the_damn_issue_sky130.vhd:1862:502  */
  assign n5190_o = ~n5189_o;
  /* find_the_damn_issue_sky130.vhd:1862:497  */
  assign n5191_o = n5180_o | n5190_o;
  /* find_the_damn_issue_sky130.vhd:1862:459  */
  assign n5192_o = ~n5191_o;
  /* find_the_damn_issue_sky130.vhd:1862:453  */
  assign n5193_o = ~n5192_o;
  /* find_the_damn_issue_sky130.vhd:1862:448  */
  assign n5194_o = n5178_o | n5193_o;
  /* find_the_damn_issue_sky130.vhd:1862:411  */
  assign n5195_o = ~n5194_o;
  /* find_the_damn_issue_sky130.vhd:1862:405  */
  assign n5196_o = ~n5195_o;
  /* find_the_damn_issue_sky130.vhd:1862:400  */
  assign n5197_o = n5176_o | n5196_o;
  /* find_the_damn_issue_sky130.vhd:1862:363  */
  assign n5198_o = ~n5197_o;
  /* find_the_damn_issue_sky130.vhd:1862:357  */
  assign n5199_o = ~n5198_o;
  /* find_the_damn_issue_sky130.vhd:1862:352  */
  assign n5200_o = n5174_o | n5199_o;
  /* find_the_damn_issue_sky130.vhd:1862:314  */
  assign n5201_o = ~n5200_o;
  /* find_the_damn_issue_sky130.vhd:1862:308  */
  assign n5202_o = ~n5201_o;
  /* find_the_damn_issue_sky130.vhd:1862:303  */
  assign n5203_o = n5172_o | n5202_o;
  /* find_the_damn_issue_sky130.vhd:1862:265  */
  assign n5204_o = ~n5203_o;
  /* find_the_damn_issue_sky130.vhd:1862:259  */
  assign n5205_o = ~n5204_o;
  /* find_the_damn_issue_sky130.vhd:1862:254  */
  assign n5206_o = n5170_o | n5205_o;
  /* find_the_damn_issue_sky130.vhd:1862:216  */
  assign n5207_o = ~n5206_o;
  /* find_the_damn_issue_sky130.vhd:1862:210  */
  assign n5208_o = ~n5207_o;
  /* find_the_damn_issue_sky130.vhd:1862:205  */
  assign n5209_o = n5168_o | n5208_o;
  /* find_the_damn_issue_sky130.vhd:1862:167  */
  assign n5210_o = ~n5209_o;
  /* find_the_damn_issue_sky130.vhd:1862:161  */
  assign n5211_o = ~n5210_o;
  /* find_the_damn_issue_sky130.vhd:1862:156  */
  assign n5212_o = n5166_o | n5211_o;
  /* find_the_damn_issue_sky130.vhd:1862:118  */
  assign n5213_o = ~n5212_o;
  /* find_the_damn_issue_sky130.vhd:1862:112  */
  assign n5214_o = ~n5213_o;
  /* find_the_damn_issue_sky130.vhd:1862:107  */
  assign n5215_o = n5164_o | n5214_o;
  /* find_the_damn_issue_sky130.vhd:1862:70  */
  assign n5216_o = ~n5215_o;
  /* find_the_damn_issue_sky130.vhd:1862:64  */
  assign n5217_o = ~n5216_o;
  /* find_the_damn_issue_sky130.vhd:1862:59  */
  assign n5218_o = n5162_o | n5217_o;
  /* find_the_damn_issue_sky130.vhd:1862:23  */
  assign n5219_o = ~n5218_o;
  /* find_the_damn_issue_sky130.vhd:1862:637  */
  assign n5221_o = s_state == 4'b0000;
  /* find_the_damn_issue_sky130.vhd:1862:647  */
  assign n5222_o = n5221_o & in_command_valid;
  /* find_the_damn_issue_sky130.vhd:1862:674  */
  assign n5223_o = n5222_o & in_unnamed;
  /* find_the_damn_issue_sky130.vhd:1862:622  */
  assign n5224_o = n5219_o & n5223_o;
  /* find_the_damn_issue_sky130.vhd:1862:17  */
  assign n5226_o = n5224_o ? 4'b0001 : n4788_o;
  /* find_the_damn_issue_sky130.vhd:1867:30  */
  assign n5228_o = s_state == 4'b0001;
  /* find_the_damn_issue_sky130.vhd:1867:45  */
  assign n5229_o = n5228_o & in_unnamed;
  /* find_the_damn_issue_sky130.vhd:1867:17  */
  assign n5231_o = n5229_o ? 1'b1 : n5092_o;
  /* find_the_damn_issue_sky130.vhd:1872:30  */
  assign n5233_o = s_state == 4'b0001;
  /* find_the_damn_issue_sky130.vhd:1872:45  */
  assign n5234_o = n5233_o & in_unnamed;
  /* find_the_damn_issue_sky130.vhd:1872:17  */
  assign n5236_o = n5234_o ? 1'b1 : n5159_o;
  /* find_the_damn_issue_sky130.vhd:1877:30  */
  assign n5238_o = s_state == 4'b0001;
  /* find_the_damn_issue_sky130.vhd:1877:45  */
  assign n5239_o = n5238_o & in_unnamed;
  /* find_the_damn_issue_sky130.vhd:1877:17  */
  assign n5241_o = n5239_o ? 4'b0000 : n5226_o;
  /* find_the_damn_issue_sky130.vhd:1882:35  */
  assign n5242_o = in_unnamed_7 == s_config_stopclocksignal;
  /* find_the_damn_issue_sky130.vhd:1882:76  */
  assign n5244_o = s_state == 4'b1100;
  /* find_the_damn_issue_sky130.vhd:1882:63  */
  assign n5245_o = n5242_o & n5244_o;
  /* find_the_damn_issue_sky130.vhd:1882:17  */
  assign n5247_o = n5245_o ? 4'b0000 : n5241_o;
  /* find_the_damn_issue_sky130.vhd:1887:26  */
  assign n5249_o = 1'b0 == s_config_targetpingroup;
  /* find_the_damn_issue_sky130.vhd:1887:67  */
  assign n5251_o = s_state == 4'b0010;
  /* find_the_damn_issue_sky130.vhd:1887:84  */
  assign n5252_o = n5251_o & in_command_valid;
  /* find_the_damn_issue_sky130.vhd:1887:53  */
  assign n5253_o = n5249_o & n5252_o;
  /* find_the_damn_issue_sky130.vhd:1888:54  */
  assign n5254_o = in_command[0];
  /* find_the_damn_issue_sky130.vhd:1887:17  */
  assign n5255_o = n5253_o ? n5254_o : n5015_o;
  /* find_the_damn_issue_sky130.vhd:1892:26  */
  assign n5257_o = 1'b0 == s_config_targetpingroup;
  /* find_the_damn_issue_sky130.vhd:1892:67  */
  assign n5259_o = s_state == 4'b0010;
  /* find_the_damn_issue_sky130.vhd:1892:84  */
  assign n5260_o = n5259_o & in_command_valid;
  /* find_the_damn_issue_sky130.vhd:1892:53  */
  assign n5261_o = n5257_o & n5260_o;
  /* find_the_damn_issue_sky130.vhd:1893:54  */
  assign n5262_o = in_command[1];
  /* find_the_damn_issue_sky130.vhd:1892:17  */
  assign n5263_o = n5261_o ? n5262_o : n5017_o;
  /* find_the_damn_issue_sky130.vhd:1897:26  */
  assign n5265_o = 1'b0 == s_config_targetpingroup;
  /* find_the_damn_issue_sky130.vhd:1897:67  */
  assign n5267_o = s_state == 4'b0010;
  /* find_the_damn_issue_sky130.vhd:1897:84  */
  assign n5268_o = n5267_o & in_command_valid;
  /* find_the_damn_issue_sky130.vhd:1897:53  */
  assign n5269_o = n5265_o & n5268_o;
  /* find_the_damn_issue_sky130.vhd:1898:54  */
  assign n5270_o = in_command[2];
  /* find_the_damn_issue_sky130.vhd:1897:17  */
  assign n5271_o = n5269_o ? n5270_o : n5019_o;
  /* find_the_damn_issue_sky130.vhd:1903:54  */
  assign n5272_o = in_command[3];
  /* find_the_damn_issue_sky130.vhd:1902:17  */
  assign n5273_o = s_const_0_eq_config_targetpingroup_and_state_eq_write_out_and_command_valid ? n5272_o : n5021_o;
  /* find_the_damn_issue_sky130.vhd:1907:30  */
  assign n5275_o = s_state == 4'b0010;
  /* find_the_damn_issue_sky130.vhd:1907:47  */
  assign n5276_o = n5275_o & in_command_valid;
  /* find_the_damn_issue_sky130.vhd:1907:17  */
  assign n5278_o = n5276_o ? 1'b1 : n5236_o;
  /* find_the_damn_issue_sky130.vhd:1912:30  */
  assign n5280_o = s_state == 4'b0010;
  /* find_the_damn_issue_sky130.vhd:1912:47  */
  assign n5281_o = n5280_o & in_command_valid;
  /* find_the_damn_issue_sky130.vhd:1912:17  */
  assign n5283_o = n5281_o ? 4'b0011 : n5247_o;
  /* find_the_damn_issue_sky130.vhd:1917:30  */
  assign n5285_o = s_state == 4'b0011;
  /* find_the_damn_issue_sky130.vhd:1917:46  */
  assign n5286_o = n5285_o & in_command_valid;
  /* find_the_damn_issue_sky130.vhd:1917:17  */
  assign n5288_o = n5286_o ? 1'b1 : n5278_o;
  /* find_the_damn_issue_sky130.vhd:1922:30  */
  assign n5290_o = s_state == 4'b0011;
  /* find_the_damn_issue_sky130.vhd:1922:46  */
  assign n5291_o = n5290_o & in_command_valid;
  /* find_the_damn_issue_sky130.vhd:1922:17  */
  assign n5293_o = n5291_o ? 4'b0000 : n5283_o;
  /* find_the_damn_issue_sky130.vhd:1927:30  */
  assign n5295_o = s_state == 4'b0110;
  /* find_the_damn_issue_sky130.vhd:1927:46  */
  assign n5296_o = n5295_o & in_command_valid;
  /* find_the_damn_issue_sky130.vhd:1927:17  */
  assign n5298_o = n5296_o ? 1'b1 : n5288_o;
  /* find_the_damn_issue_sky130.vhd:1932:30  */
  assign n5300_o = s_state == 4'b0110;
  /* find_the_damn_issue_sky130.vhd:1932:46  */
  assign n5301_o = n5300_o & in_command_valid;
  /* find_the_damn_issue_sky130.vhd:1932:17  */
  assign n5302_o = n5301_o ? s_followupstate : n5293_o;
  /* find_the_damn_issue_sky130.vhd:1937:30  */
  assign n5304_o = s_state == 4'b0111;
  /* find_the_damn_issue_sky130.vhd:1937:45  */
  assign n5305_o = n5304_o & in_command_valid;
  /* find_the_damn_issue_sky130.vhd:1937:17  */
  assign n5307_o = n5305_o ? 1'b1 : n5298_o;
  /* find_the_damn_issue_sky130.vhd:1942:30  */
  assign n5309_o = s_state == 4'b0111;
  /* find_the_damn_issue_sky130.vhd:1942:45  */
  assign n5310_o = n5309_o & in_command_valid;
  /* find_the_damn_issue_sky130.vhd:1942:17  */
  assign n5312_o = n5310_o ? 4'b1000 : n5302_o;
  /* find_the_damn_issue_sky130.vhd:1947:30  */
  assign n5314_o = s_state == 4'b1000;
  /* find_the_damn_issue_sky130.vhd:1947:46  */
  assign n5315_o = n5314_o & in_command_valid;
  /* find_the_damn_issue_sky130.vhd:1947:17  */
  assign n5317_o = n5315_o ? 1'b1 : n5307_o;
  /* find_the_damn_issue_sky130.vhd:1952:30  */
  assign n5319_o = s_state == 4'b1000;
  /* find_the_damn_issue_sky130.vhd:1952:46  */
  assign n5320_o = n5319_o & in_command_valid;
  /* find_the_damn_issue_sky130.vhd:1952:17  */
  assign n5321_o = n5320_o ? s_followupstate : n5312_o;
  /* find_the_damn_issue_sky130.vhd:1957:40  */
  assign n5322_o = ~n3793_o;
  /* find_the_damn_issue_sky130.vhd:1957:100  */
  assign n5324_o = n5273_o == in_unnamed_5;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n5331_o = n5324_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:1957:66  */
  assign n5332_o = n5322_o | n5331_o;
  /* find_the_damn_issue_sky130.vhd:1958:101  */
  assign n5335_o = s_state == 4'b1001;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n5342_o = n5335_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:1958:126  */
  assign n5343_o = ~n3690_o;
  /* find_the_damn_issue_sky130.vhd:1958:120  */
  assign n5344_o = n5342_o & n5343_o;
  /* find_the_damn_issue_sky130.vhd:1958:152  */
  assign n5345_o = ~n3692_o;
  /* find_the_damn_issue_sky130.vhd:1958:146  */
  assign n5346_o = n5344_o & n5345_o;
  /* find_the_damn_issue_sky130.vhd:1958:173  */
  assign n5347_o = n5346_o & s_tick;
  /* find_the_damn_issue_sky130.vhd:1958:72  */
  assign n5348_o = n5332_o & n5347_o;
  /* find_the_damn_issue_sky130.vhd:1959:17  */
  assign n5350_o = n5348_o ? s_config_shiftout : 1'b0;
  /* find_the_damn_issue_sky130.vhd:1965:101  */
  assign n5351_o = ~s_config_captureedge;
  /* find_the_damn_issue_sky130.vhd:1965:95  */
  assign n5352_o = s_config_shiftin & n5351_o;
  /* find_the_damn_issue_sky130.vhd:1964:17  */
  assign n5354_o = n5348_o ? n5352_o : 1'b0;
  /* find_the_damn_issue_sky130.vhd:1969:17  */
  assign n5356_o = n5348_o ? 4'b1011 : n5321_o;
  /* find_the_damn_issue_sky130.vhd:1974:23  */
  assign n5357_o = ~s_config_clockthreephase;
  /* find_the_damn_issue_sky130.vhd:1974:59  */
  assign n5358_o = n5357_o & n5348_o;
  /* find_the_damn_issue_sky130.vhd:1974:17  */
  assign n5361_o = n5358_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:1979:23  */
  assign n5362_o = ~s_config_clockthreephase;
  /* find_the_damn_issue_sky130.vhd:1979:59  */
  assign n5363_o = n5362_o & n5348_o;
  /* find_the_damn_issue_sky130.vhd:1979:17  */
  assign n5365_o = n5363_o ? 4'b1010 : n5356_o;
  /* find_the_damn_issue_sky130.vhd:1984:31  */
  assign n5367_o = s_state == 4'b1010;
  /* find_the_damn_issue_sky130.vhd:1984:57  */
  assign n5368_o = ~n3692_o;
  /* find_the_damn_issue_sky130.vhd:1984:51  */
  assign n5369_o = n5367_o & n5368_o;
  /* find_the_damn_issue_sky130.vhd:1984:84  */
  assign n5370_o = n5369_o & s_tick;
  /* find_the_damn_issue_sky130.vhd:1985:60  */
  assign n5371_o = s_config_shiftin & s_config_captureedge;
  /* find_the_damn_issue_sky130.vhd:1984:17  */
  assign n5372_o = n5370_o ? n5371_o : n5354_o;
  /* find_the_damn_issue_sky130.vhd:1989:31  */
  assign n5374_o = s_state == 4'b1010;
  /* find_the_damn_issue_sky130.vhd:1989:57  */
  assign n5375_o = ~n3692_o;
  /* find_the_damn_issue_sky130.vhd:1989:51  */
  assign n5376_o = n5374_o & n5375_o;
  /* find_the_damn_issue_sky130.vhd:1989:84  */
  assign n5377_o = n5376_o & s_tick;
  /* find_the_damn_issue_sky130.vhd:1989:17  */
  assign n5379_o = n5377_o ? 1'b1 : n5361_o;
  /* find_the_damn_issue_sky130.vhd:1994:31  */
  assign n5381_o = s_state == 4'b1010;
  /* find_the_damn_issue_sky130.vhd:1994:57  */
  assign n5382_o = ~n3692_o;
  /* find_the_damn_issue_sky130.vhd:1994:51  */
  assign n5383_o = n5381_o & n5382_o;
  /* find_the_damn_issue_sky130.vhd:1994:84  */
  assign n5384_o = n5383_o & s_tick;
  /* find_the_damn_issue_sky130.vhd:1994:17  */
  assign n5386_o = n5384_o ? 4'b1001 : n5365_o;
  /* find_the_damn_issue_sky130.vhd:1999:17  */
  assign n5388_o = n3720_o ? 4'b0000 : n5386_o;
  /* find_the_damn_issue_sky130.vhd:2004:30  */
  assign n5390_o = s_state == 4'b1011;
  /* find_the_damn_issue_sky130.vhd:2004:48  */
  assign n5391_o = n5390_o & s_tick;
  /* find_the_damn_issue_sky130.vhd:2004:17  */
  assign n5393_o = n5391_o ? 1'b1 : n5379_o;
  /* find_the_damn_issue_sky130.vhd:2009:30  */
  assign n5395_o = s_state == 4'b1011;
  /* find_the_damn_issue_sky130.vhd:2009:48  */
  assign n5396_o = n5395_o & s_tick;
  /* find_the_damn_issue_sky130.vhd:2009:17  */
  assign n5398_o = n5396_o ? 4'b1010 : n5388_o;
  /* find_the_damn_issue_sky130.vhd:2015:17  */
  assign n5399_o = s_config_clockdelay ? s_toggleclockdelayed : s_toggleclock;
  /* find_the_damn_issue_sky130.vhd:2021:91  */
  assign n5400_o = n5273_o ^ n5399_o;
  /* find_the_damn_issue_sky130.vhd:2020:17  */
  assign n5401_o = s_tick ? n5400_o : n5273_o;
  /* find_the_damn_issue_sky130.vhd:2027:53  */
  assign n5402_o = s_m_value == n3723_o;
  /* find_the_damn_issue_sky130.vhd:2027:39  */
  assign n5403_o = n3688_o | n5402_o;
  /* find_the_damn_issue_sky130.vhd:2027:74  */
  assign n5404_o = n5403_o & s_setupedge;
  /* find_the_damn_issue_sky130.vhd:2027:17  */
  assign n5406_o = n5404_o ? 1'b1 : n5317_o;
  /* find_the_damn_issue_sky130.vhd:2032:53  */
  assign n5407_o = s_m_value == n3723_o;
  /* find_the_damn_issue_sky130.vhd:2032:39  */
  assign n5408_o = n3688_o | n5407_o;
  /* find_the_damn_issue_sky130.vhd:2032:74  */
  assign n5409_o = n5408_o & s_setupedge;
  /* find_the_damn_issue_sky130.vhd:2032:17  */
  assign n5411_o = n5409_o ? 1'b1 : s_const_0;
  /* find_the_damn_issue_sky130.vhd:2037:53  */
  assign n5412_o = s_m_value == n3723_o;
  /* find_the_damn_issue_sky130.vhd:2037:39  */
  assign n5413_o = n3688_o | n5412_o;
  /* find_the_damn_issue_sky130.vhd:2037:74  */
  assign n5414_o = n5413_o & s_setupedge;
  /* find_the_damn_issue_sky130.vhd:2037:17  */
  assign n5416_o = n5414_o ? 3'b000 : s_const_xxx_2;
  /* find_the_damn_issue_sky130.vhd:2042:17  */
  assign n5417_o = s_setupedge ? n3757_o : n5263_o;
  /* find_the_damn_issue_sky130.vhd:2047:78  */
  assign n5418_o = s_config_tmsoutmode & s_setupedge;
  /* find_the_damn_issue_sky130.vhd:2049:58  */
  assign n5419_o = in_command[7];
  /* find_the_damn_issue_sky130.vhd:2048:17  */
  assign n5420_o = n5418_o ? n5419_o : n5417_o;
  /* find_the_damn_issue_sky130.vhd:2053:17  */
  assign n5421_o = n5418_o ? n3757_o : n3766_o;
  /* find_the_damn_issue_sky130.vhd:2058:74  */
  assign n5422_o = s_config_msbfirst & s_captureedge;
  /* find_the_damn_issue_sky130.vhd:2060:65  */
  assign n5423_o = s_capturebuffer[6:0];
  /* find_the_damn_issue_sky130.vhd:2060:78  */
  assign n5424_o = {n5423_o, n3289_o};
  /* find_the_damn_issue_sky130.vhd:2059:17  */
  assign n5425_o = n5422_o ? n5424_o : s_capturebuffer;
  /* find_the_damn_issue_sky130.vhd:2064:82  */
  assign n5426_o = n3758_o & s_captureedge;
  /* find_the_damn_issue_sky130.vhd:2065:55  */
  assign n5427_o = s_m_value_2 == n3723_o;
  /* find_the_damn_issue_sky130.vhd:2065:39  */
  assign n5428_o = n3688_o | n5427_o;
  /* find_the_damn_issue_sky130.vhd:2065:76  */
  assign n5429_o = n5428_o & s_captureedge;
  /* find_the_damn_issue_sky130.vhd:2065:17  */
  assign n5431_o = n5429_o ? 1'b1 : n5231_o;
  /* find_the_damn_issue_sky130.vhd:2070:55  */
  assign n5432_o = s_m_value_2 == n3723_o;
  /* find_the_damn_issue_sky130.vhd:2070:39  */
  assign n5433_o = n3688_o | n5432_o;
  /* find_the_damn_issue_sky130.vhd:2070:76  */
  assign n5434_o = n5433_o & s_captureedge;
  /* find_the_damn_issue_sky130.vhd:2070:17  */
  assign n5436_o = n5434_o ? 1'b1 : s_const_0_2;
  /* find_the_damn_issue_sky130.vhd:2075:55  */
  assign n5437_o = s_m_value_2 == n3723_o;
  /* find_the_damn_issue_sky130.vhd:2075:39  */
  assign n5438_o = n3688_o | n5437_o;
  /* find_the_damn_issue_sky130.vhd:2075:76  */
  assign n5439_o = n5438_o & s_captureedge;
  /* find_the_damn_issue_sky130.vhd:2075:17  */
  assign n5441_o = n5439_o ? 3'b000 : s_const_xxx;
  /* find_the_damn_issue_sky130.vhd:2080:17  */
  assign n5443_o = s_state_eq_load_low_and_command_valid ? 1'b1 : n5406_o;
  /* find_the_damn_issue_sky130.vhd:2085:17  */
  assign n5445_o = s_state_eq_load_low_and_command_valid ? 4'b0101 : n5398_o;
  /* find_the_damn_issue_sky130.vhd:2090:30  */
  assign n5447_o = s_state == 4'b0101;
  /* find_the_damn_issue_sky130.vhd:2090:47  */
  assign n5448_o = n5447_o & in_command_valid;
  /* find_the_damn_issue_sky130.vhd:2090:17  */
  assign n5450_o = n5448_o ? 1'b1 : n5443_o;
  /* find_the_damn_issue_sky130.vhd:2095:30  */
  assign n5452_o = s_state == 4'b0101;
  /* find_the_damn_issue_sky130.vhd:2095:47  */
  assign n5453_o = n5452_o & in_command_valid;
  /* find_the_damn_issue_sky130.vhd:2095:17  */
  assign n5454_o = n5453_o ? s_followupstate : n5445_o;
  /* find_the_damn_issue_sky130.vhd:2110:115  */
  assign n5455_o = n5425_o[7:1];
  /* find_the_damn_issue_sky130.vhd:2110:91  */
  assign n5456_o = {n3289_o, n5455_o};
  /* find_the_damn_issue_sky130.vhd:2109:17  */
  assign n5457_o = n5426_o ? n5456_o : n5425_o;
  /* find_the_damn_issue_sky130.vhd:2115:55  */
  assign n5458_o = s_m_value_2 == n3723_o;
  /* find_the_damn_issue_sky130.vhd:2115:39  */
  assign n5459_o = n3688_o | n5458_o;
  /* find_the_damn_issue_sky130.vhd:2115:76  */
  assign n5460_o = n5459_o & s_captureedge;
  /* find_the_damn_issue_sky130.vhd:2115:17  */
  assign n5462_o = n5460_o ? 8'b00000000 : n5457_o;
  /* find_the_damn_issue_sky130.vhd:2126:26  */
  assign n5464_o = 1'b0 == n3871_o;
  /* find_the_damn_issue_sky130.vhd:2126:74  */
  assign n5465_o = in_command[0];
  /* find_the_damn_issue_sky130.vhd:2126:84  */
  assign n5466_o = n5465_o & s_command_rewired_eq_const_0_and_command_bit_7_not_not_and_state_eq_idle_and_command_valid_and_unnamed;
  /* find_the_damn_issue_sky130.vhd:2126:60  */
  assign n5467_o = n5464_o & n5466_o;
  /* find_the_damn_issue_sky130.vhd:2127:81  */
  assign n5468_o = n3234_o[7:1];
  /* find_the_damn_issue_sky130.vhd:2127:94  */
  assign n5469_o = {n5468_o, in_unnamed_2};
  /* find_the_damn_issue_sky130.vhd:2126:17  */
  assign n5470_o = n5467_o ? n5469_o : n3234_o;
  /* find_the_damn_issue_sky130.vhd:2132:26  */
  assign n5472_o = 1'b0 == n3871_o;
  /* find_the_damn_issue_sky130.vhd:2132:74  */
  assign n5473_o = in_command[0];
  /* find_the_damn_issue_sky130.vhd:2132:84  */
  assign n5474_o = n5473_o & s_command_rewired_eq_const_0_and_command_bit_7_not_not_and_state_eq_idle_and_command_valid_and_unnamed;
  /* find_the_damn_issue_sky130.vhd:2132:60  */
  assign n5475_o = n5472_o & n5474_o;
  /* find_the_damn_issue_sky130.vhd:2133:123  */
  assign n5476_o = n5470_o[7:2];
  /* find_the_damn_issue_sky130.vhd:2133:136  */
  assign n5477_o = {n5476_o, in_unnamed_3};
  /* find_the_damn_issue_sky130.vhd:2133:190  */
  assign n5478_o = n5470_o[0];
  /* find_the_damn_issue_sky130.vhd:2133:151  */
  assign n5479_o = {n5477_o, n5478_o};
  /* find_the_damn_issue_sky130.vhd:2132:17  */
  assign n5480_o = n5475_o ? n5479_o : n5470_o;
  /* find_the_damn_issue_sky130.vhd:2138:26  */
  assign n5482_o = 1'b0 == n3871_o;
  /* find_the_damn_issue_sky130.vhd:2138:74  */
  assign n5483_o = in_command[0];
  /* find_the_damn_issue_sky130.vhd:2138:84  */
  assign n5484_o = n5483_o & s_command_rewired_eq_const_0_and_command_bit_7_not_not_and_state_eq_idle_and_command_valid_and_unnamed;
  /* find_the_damn_issue_sky130.vhd:2138:60  */
  assign n5485_o = n5482_o & n5484_o;
  /* find_the_damn_issue_sky130.vhd:2139:165  */
  assign n5486_o = n5480_o[7:3];
  /* find_the_damn_issue_sky130.vhd:2139:178  */
  assign n5487_o = {n5486_o, in_unnamed_4};
  /* find_the_damn_issue_sky130.vhd:2139:253  */
  assign n5488_o = n5480_o[1:0];
  /* find_the_damn_issue_sky130.vhd:2139:193  */
  assign n5489_o = {n5487_o, n5488_o};
  /* find_the_damn_issue_sky130.vhd:2138:17  */
  assign n5490_o = n5485_o ? n5489_o : n5480_o;
  /* find_the_damn_issue_sky130.vhd:2144:26  */
  assign n5492_o = 1'b0 == n3871_o;
  /* find_the_damn_issue_sky130.vhd:2144:74  */
  assign n5493_o = in_command[0];
  /* find_the_damn_issue_sky130.vhd:2144:84  */
  assign n5494_o = n5493_o & s_command_rewired_eq_const_0_and_command_bit_7_not_not_and_state_eq_idle_and_command_valid_and_unnamed;
  /* find_the_damn_issue_sky130.vhd:2144:60  */
  assign n5495_o = n5492_o & n5494_o;
  /* find_the_damn_issue_sky130.vhd:2145:207  */
  assign n5496_o = n5490_o[7:4];
  /* find_the_damn_issue_sky130.vhd:2145:220  */
  assign n5497_o = {n5496_o, in_unnamed_5};
  /* find_the_damn_issue_sky130.vhd:2145:316  */
  assign n5498_o = n5490_o[2:0];
  /* find_the_damn_issue_sky130.vhd:2145:235  */
  assign n5499_o = {n5497_o, n5498_o};
  /* find_the_damn_issue_sky130.vhd:2144:17  */
  assign n5500_o = n5495_o ? n5499_o : n5490_o;
  /* find_the_damn_issue_sky130.vhd:2150:26  */
  assign n5502_o = 1'b0 == n3871_o;
  /* find_the_damn_issue_sky130.vhd:2150:74  */
  assign n5503_o = in_command[0];
  /* find_the_damn_issue_sky130.vhd:2150:84  */
  assign n5504_o = n5503_o & s_command_rewired_eq_const_0_and_command_bit_7_not_not_and_state_eq_idle_and_command_valid_and_unnamed;
  /* find_the_damn_issue_sky130.vhd:2150:60  */
  assign n5505_o = n5502_o & n5504_o;
  /* find_the_damn_issue_sky130.vhd:2151:249  */
  assign n5506_o = n5500_o[7:5];
  /* find_the_damn_issue_sky130.vhd:2151:262  */
  assign n5507_o = {n5506_o, in_unnamed_6};
  /* find_the_damn_issue_sky130.vhd:2151:379  */
  assign n5508_o = n5500_o[3:0];
  /* find_the_damn_issue_sky130.vhd:2151:277  */
  assign n5509_o = {n5507_o, n5508_o};
  /* find_the_damn_issue_sky130.vhd:2150:17  */
  assign n5510_o = n5505_o ? n5509_o : n5500_o;
  /* find_the_damn_issue_sky130.vhd:2156:26  */
  assign n5512_o = 1'b0 == n3871_o;
  /* find_the_damn_issue_sky130.vhd:2156:74  */
  assign n5513_o = in_command[0];
  /* find_the_damn_issue_sky130.vhd:2156:84  */
  assign n5514_o = n5513_o & s_command_rewired_eq_const_0_and_command_bit_7_not_not_and_state_eq_idle_and_command_valid_and_unnamed;
  /* find_the_damn_issue_sky130.vhd:2156:60  */
  assign n5515_o = n5512_o & n5514_o;
  /* find_the_damn_issue_sky130.vhd:2157:291  */
  assign n5516_o = n5510_o[7:6];
  /* find_the_damn_issue_sky130.vhd:2157:304  */
  assign n5517_o = {n5516_o, in_unnamed_7};
  /* find_the_damn_issue_sky130.vhd:2157:442  */
  assign n5518_o = n5510_o[4:0];
  /* find_the_damn_issue_sky130.vhd:2157:319  */
  assign n5519_o = {n5517_o, n5518_o};
  /* find_the_damn_issue_sky130.vhd:2156:17  */
  assign n5520_o = n5515_o ? n5519_o : n5510_o;
  /* find_the_damn_issue_sky130.vhd:2162:26  */
  assign n5522_o = 1'b0 == n3871_o;
  /* find_the_damn_issue_sky130.vhd:2162:74  */
  assign n5523_o = in_command[0];
  /* find_the_damn_issue_sky130.vhd:2162:84  */
  assign n5524_o = n5523_o & s_command_rewired_eq_const_0_and_command_bit_7_not_not_and_state_eq_idle_and_command_valid_and_unnamed;
  /* find_the_damn_issue_sky130.vhd:2162:60  */
  assign n5525_o = n5522_o & n5524_o;
  /* find_the_damn_issue_sky130.vhd:2163:325  */
  assign n5526_o = n5520_o[7];
  /* find_the_damn_issue_sky130.vhd:2163:338  */
  assign n5528_o = {n5526_o, 1'b0};
  /* find_the_damn_issue_sky130.vhd:2163:488  */
  assign n5529_o = n5520_o[5:0];
  /* find_the_damn_issue_sky130.vhd:2163:344  */
  assign n5530_o = {n5528_o, n5529_o};
  /* find_the_damn_issue_sky130.vhd:2162:17  */
  assign n5531_o = n5525_o ? n5530_o : n5520_o;
  /* find_the_damn_issue_sky130.vhd:2168:26  */
  assign n5533_o = 1'b0 == n3871_o;
  /* find_the_damn_issue_sky130.vhd:2168:74  */
  assign n5534_o = in_command[0];
  /* find_the_damn_issue_sky130.vhd:2168:84  */
  assign n5535_o = n5534_o & s_command_rewired_eq_const_0_and_command_bit_7_not_not_and_state_eq_idle_and_command_valid_and_unnamed;
  /* find_the_damn_issue_sky130.vhd:2168:60  */
  assign n5536_o = n5533_o & n5535_o;
  /* find_the_damn_issue_sky130.vhd:2169:357  */
  assign n5537_o = n5531_o[6:0];
  /* find_the_damn_issue_sky130.vhd:2169:200  */
  assign n5539_o = {1'b0, n5537_o};
  /* find_the_damn_issue_sky130.vhd:2168:17  */
  assign n5540_o = n5536_o ? n5539_o : n5531_o;
  /* find_the_damn_issue_sky130.vhd:2174:26  */
  assign n5542_o = 1'b1 == n3871_o;
  /* find_the_damn_issue_sky130.vhd:2174:74  */
  assign n5543_o = in_command[0];
  /* find_the_damn_issue_sky130.vhd:2174:84  */
  assign n5544_o = n5543_o & s_command_rewired_eq_const_0_and_command_bit_7_not_not_and_state_eq_idle_and_command_valid_and_unnamed;
  /* find_the_damn_issue_sky130.vhd:2174:60  */
  assign n5545_o = n5542_o & n5544_o;
  /* find_the_damn_issue_sky130.vhd:2175:385  */
  assign n5546_o = n5540_o[7:1];
  /* find_the_damn_issue_sky130.vhd:2175:398  */
  assign n5547_o = {n5546_o, in_unnamed_8};
  /* find_the_damn_issue_sky130.vhd:2174:17  */
  assign n5548_o = n5545_o ? n5547_o : n5540_o;
  /* find_the_damn_issue_sky130.vhd:2180:26  */
  assign n5550_o = 1'b1 == n3871_o;
  /* find_the_damn_issue_sky130.vhd:2180:74  */
  assign n5551_o = in_command[0];
  /* find_the_damn_issue_sky130.vhd:2180:84  */
  assign n5552_o = n5551_o & s_command_rewired_eq_const_0_and_command_bit_7_not_not_and_state_eq_idle_and_command_valid_and_unnamed;
  /* find_the_damn_issue_sky130.vhd:2180:60  */
  assign n5553_o = n5550_o & n5552_o;
  /* find_the_damn_issue_sky130.vhd:2181:406  */
  assign n5554_o = n5548_o[7:2];
  /* find_the_damn_issue_sky130.vhd:2181:419  */
  assign n5555_o = {n5554_o, in_unnamed_9};
  /* find_the_damn_issue_sky130.vhd:2181:625  */
  assign n5556_o = n5548_o[0];
  /* find_the_damn_issue_sky130.vhd:2181:434  */
  assign n5557_o = {n5555_o, n5556_o};
  /* find_the_damn_issue_sky130.vhd:2180:17  */
  assign n5558_o = n5553_o ? n5557_o : n5548_o;
  /* find_the_damn_issue_sky130.vhd:2186:26  */
  assign n5560_o = 1'b1 == n3871_o;
  /* find_the_damn_issue_sky130.vhd:2186:74  */
  assign n5561_o = in_command[0];
  /* find_the_damn_issue_sky130.vhd:2186:84  */
  assign n5562_o = n5561_o & s_command_rewired_eq_const_0_and_command_bit_7_not_not_and_state_eq_idle_and_command_valid_and_unnamed;
  /* find_the_damn_issue_sky130.vhd:2186:60  */
  assign n5563_o = n5560_o & n5562_o;
  /* find_the_damn_issue_sky130.vhd:2187:406  */
  assign n5564_o = n5558_o[7:3];
  /* find_the_damn_issue_sky130.vhd:2187:419  */
  assign n5565_o = {n5564_o, in_unnamed_10};
  /* find_the_damn_issue_sky130.vhd:2187:626  */
  assign n5566_o = n5558_o[1:0];
  /* find_the_damn_issue_sky130.vhd:2187:435  */
  assign n5567_o = {n5565_o, n5566_o};
  /* find_the_damn_issue_sky130.vhd:2186:17  */
  assign n5568_o = n5563_o ? n5567_o : n5558_o;
  /* find_the_damn_issue_sky130.vhd:2192:26  */
  assign n5570_o = 1'b1 == n3871_o;
  /* find_the_damn_issue_sky130.vhd:2192:74  */
  assign n5571_o = in_command[0];
  /* find_the_damn_issue_sky130.vhd:2192:84  */
  assign n5572_o = n5571_o & s_command_rewired_eq_const_0_and_command_bit_7_not_not_and_state_eq_idle_and_command_valid_and_unnamed;
  /* find_the_damn_issue_sky130.vhd:2192:60  */
  assign n5573_o = n5570_o & n5572_o;
  /* find_the_damn_issue_sky130.vhd:2193:406  */
  assign n5574_o = n5568_o[7:4];
  /* find_the_damn_issue_sky130.vhd:2193:419  */
  assign n5575_o = {n5574_o, in_unnamed_11};
  /* find_the_damn_issue_sky130.vhd:2193:626  */
  assign n5576_o = n5568_o[2:0];
  /* find_the_damn_issue_sky130.vhd:2193:435  */
  assign n5577_o = {n5575_o, n5576_o};
  /* find_the_damn_issue_sky130.vhd:2192:17  */
  assign n5578_o = n5573_o ? n5577_o : n5568_o;
  /* find_the_damn_issue_sky130.vhd:2198:26  */
  assign n5580_o = 1'b1 == n3871_o;
  /* find_the_damn_issue_sky130.vhd:2198:74  */
  assign n5581_o = in_command[0];
  /* find_the_damn_issue_sky130.vhd:2198:84  */
  assign n5582_o = n5581_o & s_command_rewired_eq_const_0_and_command_bit_7_not_not_and_state_eq_idle_and_command_valid_and_unnamed;
  /* find_the_damn_issue_sky130.vhd:2198:60  */
  assign n5583_o = n5580_o & n5582_o;
  /* find_the_damn_issue_sky130.vhd:2199:406  */
  assign n5584_o = n5578_o[7:5];
  /* find_the_damn_issue_sky130.vhd:2199:419  */
  assign n5585_o = {n5584_o, in_unnamed_12};
  /* find_the_damn_issue_sky130.vhd:2199:626  */
  assign n5586_o = n5578_o[3:0];
  /* find_the_damn_issue_sky130.vhd:2199:435  */
  assign n5587_o = {n5585_o, n5586_o};
  /* find_the_damn_issue_sky130.vhd:2198:17  */
  assign n5588_o = n5583_o ? n5587_o : n5578_o;
  /* find_the_damn_issue_sky130.vhd:2204:26  */
  assign n5590_o = 1'b1 == n3871_o;
  /* find_the_damn_issue_sky130.vhd:2204:74  */
  assign n5591_o = in_command[0];
  /* find_the_damn_issue_sky130.vhd:2204:84  */
  assign n5592_o = n5591_o & s_command_rewired_eq_const_0_and_command_bit_7_not_not_and_state_eq_idle_and_command_valid_and_unnamed;
  /* find_the_damn_issue_sky130.vhd:2204:60  */
  assign n5593_o = n5590_o & n5592_o;
  /* find_the_damn_issue_sky130.vhd:2205:406  */
  assign n5594_o = n5588_o[7:6];
  /* find_the_damn_issue_sky130.vhd:2205:419  */
  assign n5595_o = {n5594_o, in_unnamed_13};
  /* find_the_damn_issue_sky130.vhd:2205:626  */
  assign n5596_o = n5588_o[4:0];
  /* find_the_damn_issue_sky130.vhd:2205:435  */
  assign n5597_o = {n5595_o, n5596_o};
  /* find_the_damn_issue_sky130.vhd:2204:17  */
  assign n5598_o = n5593_o ? n5597_o : n5588_o;
  /* find_the_damn_issue_sky130.vhd:2210:26  */
  assign n5600_o = 1'b1 == n3871_o;
  /* find_the_damn_issue_sky130.vhd:2210:74  */
  assign n5601_o = in_command[0];
  /* find_the_damn_issue_sky130.vhd:2210:84  */
  assign n5602_o = n5601_o & s_command_rewired_eq_const_0_and_command_bit_7_not_not_and_state_eq_idle_and_command_valid_and_unnamed;
  /* find_the_damn_issue_sky130.vhd:2210:60  */
  assign n5603_o = n5600_o & n5602_o;
  /* find_the_damn_issue_sky130.vhd:2211:406  */
  assign n5604_o = n5598_o[7];
  /* find_the_damn_issue_sky130.vhd:2211:419  */
  assign n5605_o = {n5604_o, in_unnamed_14};
  /* find_the_damn_issue_sky130.vhd:2211:626  */
  assign n5606_o = n5598_o[5:0];
  /* find_the_damn_issue_sky130.vhd:2211:435  */
  assign n5607_o = {n5605_o, n5606_o};
  /* find_the_damn_issue_sky130.vhd:2210:17  */
  assign n5608_o = n5603_o ? n5607_o : n5598_o;
  /* find_the_damn_issue_sky130.vhd:2216:26  */
  assign n5610_o = 1'b1 == n3871_o;
  /* find_the_damn_issue_sky130.vhd:2216:74  */
  assign n5611_o = in_command[0];
  /* find_the_damn_issue_sky130.vhd:2216:84  */
  assign n5612_o = n5611_o & s_command_rewired_eq_const_0_and_command_bit_7_not_not_and_state_eq_idle_and_command_valid_and_unnamed;
  /* find_the_damn_issue_sky130.vhd:2216:60  */
  assign n5613_o = n5610_o & n5612_o;
  /* find_the_damn_issue_sky130.vhd:2217:422  */
  assign n5614_o = n5608_o[6:0];
  /* find_the_damn_issue_sky130.vhd:2217:231  */
  assign n5615_o = {in_unnamed_15, n5614_o};
  /* find_the_damn_issue_sky130.vhd:2216:17  */
  assign n5616_o = n5613_o ? n5615_o : n5608_o;
  /* find_the_damn_issue_sky130.vhd:2222:328  */
  assign n5617_o = n3898_o[6:0];
  /* find_the_damn_issue_sky130.vhd:2222:221  */
  assign n5619_o = {1'b0, n5617_o};
  /* find_the_damn_issue_sky130.vhd:2221:17  */
  assign n5620_o = n5013_o ? n5619_o : n5616_o;
  /* find_the_damn_issue_sky130.vhd:2226:38  */
  assign n5621_o = in_command[6:5];
  /* find_the_damn_issue_sky130.vhd:2226:51  */
  assign n5623_o = n5621_o == 2'b10;
  /* find_the_damn_issue_sky130.vhd:2226:94  */
  assign n5625_o = n3899_o == 7'b0011110;
  /* find_the_damn_issue_sky130.vhd:2226:144  */
  assign n5627_o = n3900_o == 6'b001110;
  /* find_the_damn_issue_sky130.vhd:2226:193  */
  assign n5629_o = n3900_o == 6'b001010;
  /* find_the_damn_issue_sky130.vhd:2226:242  */
  assign n5631_o = n3900_o == 6'b000111;
  /* find_the_damn_issue_sky130.vhd:2226:291  */
  assign n5633_o = n3900_o == 6'b000110;
  /* find_the_damn_issue_sky130.vhd:2226:340  */
  assign n5635_o = n3900_o == 6'b000100;
  /* find_the_damn_issue_sky130.vhd:2226:387  */
  assign n5637_o = n3899_o == 7'b0000111;
  /* find_the_damn_issue_sky130.vhd:2226:435  */
  assign n5639_o = n3899_o == 7'b0000110;
  /* find_the_damn_issue_sky130.vhd:2226:485  */
  assign n5641_o = n3900_o == 6'b000010;
  /* find_the_damn_issue_sky130.vhd:2226:523  */
  assign n5642_o = in_command[6:2];
  /* find_the_damn_issue_sky130.vhd:2226:536  */
  assign n5644_o = n5642_o == 5'b00000;
  /* find_the_damn_issue_sky130.vhd:2226:577  */
  assign n5645_o = in_command[7];
  /* find_the_damn_issue_sky130.vhd:2226:564  */
  assign n5646_o = ~n5645_o;
  /* find_the_damn_issue_sky130.vhd:2226:558  */
  assign n5647_o = ~n5646_o;
  /* find_the_damn_issue_sky130.vhd:2226:552  */
  assign n5648_o = ~n5647_o;
  /* find_the_damn_issue_sky130.vhd:2226:547  */
  assign n5649_o = n5644_o | n5648_o;
  /* find_the_damn_issue_sky130.vhd:2226:508  */
  assign n5650_o = ~n5649_o;
  /* find_the_damn_issue_sky130.vhd:2226:502  */
  assign n5651_o = ~n5650_o;
  /* find_the_damn_issue_sky130.vhd:2226:497  */
  assign n5652_o = n5641_o | n5651_o;
  /* find_the_damn_issue_sky130.vhd:2226:459  */
  assign n5653_o = ~n5652_o;
  /* find_the_damn_issue_sky130.vhd:2226:453  */
  assign n5654_o = ~n5653_o;
  /* find_the_damn_issue_sky130.vhd:2226:448  */
  assign n5655_o = n5639_o | n5654_o;
  /* find_the_damn_issue_sky130.vhd:2226:411  */
  assign n5656_o = ~n5655_o;
  /* find_the_damn_issue_sky130.vhd:2226:405  */
  assign n5657_o = ~n5656_o;
  /* find_the_damn_issue_sky130.vhd:2226:400  */
  assign n5658_o = n5637_o | n5657_o;
  /* find_the_damn_issue_sky130.vhd:2226:363  */
  assign n5659_o = ~n5658_o;
  /* find_the_damn_issue_sky130.vhd:2226:357  */
  assign n5660_o = ~n5659_o;
  /* find_the_damn_issue_sky130.vhd:2226:352  */
  assign n5661_o = n5635_o | n5660_o;
  /* find_the_damn_issue_sky130.vhd:2226:314  */
  assign n5662_o = ~n5661_o;
  /* find_the_damn_issue_sky130.vhd:2226:308  */
  assign n5663_o = ~n5662_o;
  /* find_the_damn_issue_sky130.vhd:2226:303  */
  assign n5664_o = n5633_o | n5663_o;
  /* find_the_damn_issue_sky130.vhd:2226:265  */
  assign n5665_o = ~n5664_o;
  /* find_the_damn_issue_sky130.vhd:2226:259  */
  assign n5666_o = ~n5665_o;
  /* find_the_damn_issue_sky130.vhd:2226:254  */
  assign n5667_o = n5631_o | n5666_o;
  /* find_the_damn_issue_sky130.vhd:2226:216  */
  assign n5668_o = ~n5667_o;
  /* find_the_damn_issue_sky130.vhd:2226:210  */
  assign n5669_o = ~n5668_o;
  /* find_the_damn_issue_sky130.vhd:2226:205  */
  assign n5670_o = n5629_o | n5669_o;
  /* find_the_damn_issue_sky130.vhd:2226:167  */
  assign n5671_o = ~n5670_o;
  /* find_the_damn_issue_sky130.vhd:2226:161  */
  assign n5672_o = ~n5671_o;
  /* find_the_damn_issue_sky130.vhd:2226:156  */
  assign n5673_o = n5627_o | n5672_o;
  /* find_the_damn_issue_sky130.vhd:2226:118  */
  assign n5674_o = ~n5673_o;
  /* find_the_damn_issue_sky130.vhd:2226:112  */
  assign n5675_o = ~n5674_o;
  /* find_the_damn_issue_sky130.vhd:2226:107  */
  assign n5676_o = n5625_o | n5675_o;
  /* find_the_damn_issue_sky130.vhd:2226:70  */
  assign n5677_o = ~n5676_o;
  /* find_the_damn_issue_sky130.vhd:2226:64  */
  assign n5678_o = ~n5677_o;
  /* find_the_damn_issue_sky130.vhd:2226:59  */
  assign n5679_o = n5623_o | n5678_o;
  /* find_the_damn_issue_sky130.vhd:2226:23  */
  assign n5680_o = ~n5679_o;
  /* find_the_damn_issue_sky130.vhd:2226:637  */
  assign n5682_o = s_state == 4'b0000;
  /* find_the_damn_issue_sky130.vhd:2226:647  */
  assign n5683_o = n5682_o & in_command_valid;
  /* find_the_damn_issue_sky130.vhd:2226:674  */
  assign n5684_o = n5683_o & in_unnamed;
  /* find_the_damn_issue_sky130.vhd:2226:622  */
  assign n5685_o = n5680_o & n5684_o;
  /* find_the_damn_issue_sky130.vhd:2226:17  */
  assign n5687_o = n5685_o ? 8'b11111010 : n5620_o;
  /* find_the_damn_issue_sky130.vhd:2231:30  */
  assign n5689_o = s_state == 4'b0001;
  /* find_the_damn_issue_sky130.vhd:2231:45  */
  assign n5690_o = n5689_o & in_unnamed;
  /* find_the_damn_issue_sky130.vhd:2231:17  */
  assign n5691_o = n5690_o ? in_command : n5687_o;
  /* find_the_damn_issue_sky130.vhd:2236:17  */
  assign n5692_o = s_captureedge ? n5457_o : n5691_o;
  /* find_the_damn_issue_sky130.vhd:2269:27  */
  assign n5759_o = ~rst_n;
  /* find_the_damn_issue_sky130.vhd:2394:9  */
  scl_counter_14 scl_counter1 (
    .clk(clk),
    .rst_n(rst_n),
    .in_unnamed(s_setupedge),
    .in_unnamed_2(s_unnamed_16),
    .in_unnamed_3(s_unnamed_17),
    .out_m_value(scl_counter1_out_m_value),
    .out_const_0(scl_counter1_out_const_0),
    .out_const_xxx(scl_counter1_out_const_xxx));
  /* find_the_damn_issue_sky130.vhd:2404:9  */
  scl_counter_15 scl_counter2 (
    .clk(clk),
    .rst_n(rst_n),
    .in_unnamed(s_captureedge),
    .in_unnamed_2(s_unnamed_18),
    .in_unnamed_3(s_unnamed_19),
    .out_m_value(scl_counter2_out_m_value),
    .out_const_0(scl_counter2_out_const_0),
    .out_const_xxx(scl_counter2_out_const_xxx));
  /* find_the_damn_issue_sky130.vhd:2305:17  */
  always @(posedge clk or posedge n5759_o)
    if (n5759_o)
      n5898_q <= 4'b0000;
    else
      n5898_q <= s_followupstate_mux1;
  /* find_the_damn_issue_sky130.vhd:2305:17  */
  always @(posedge clk or posedge n5759_o)
    if (n5759_o)
      n5899_q <= 4'b0000;
    else
      n5899_q <= s_clock_setup_mux3;
  /* find_the_damn_issue_sky130.vhd:2246:17  */
  assign n5900_o = s_command_rewired_eq_const_0_and_command_bit_7_not_not_and_state_eq_idle_and_command_valid_and_unnamed ? s_command_bit_1_4 : s_config_targetpingroup;
  /* find_the_damn_issue_sky130.vhd:2246:17  */
  always @(posedge clk)
    n5901_q <= n5900_o;
  /* find_the_damn_issue_sky130.vhd:2246:17  */
  always @(posedge clk)
    n5902_q <= s_config_stopclocksignal_mux3;
  /* find_the_damn_issue_sky130.vhd:2246:17  */
  always @(posedge clk)
    n5903_q <= s_config_stopclockonsignal_mux3;
  /* find_the_damn_issue_sky130.vhd:2246:17  */
  always @(posedge clk)
    n5904_q <= s_config_stopclockonlastbit_mux3;
  /* find_the_damn_issue_sky130.vhd:2246:17  */
  always @(posedge clk)
    n5905_q <= s_config_tmsoutmode_mux2;
  /* find_the_damn_issue_sky130.vhd:2305:17  */
  assign n5906_o = s_const_0_eq_config_targetpingroup_and_state_eq_write_out_and_command_valid ? s_command_bit_3_4 : s_config_idleclockstate;
  /* find_the_damn_issue_sky130.vhd:2305:17  */
  always @(posedge clk or posedge n5759_o)
    if (n5759_o)
      n5907_q <= 1'b0;
    else
      n5907_q <= n5906_o;
  /* find_the_damn_issue_sky130.vhd:2305:17  */
  assign n5908_o = s_command_rewired_eq_const_10_and_command_rewired_eq_const_0_or_command_bit_7_not_not_not_not_and_state_eq_idle_and_command_valid_and_unnamed ? s_command_bit_0_not_2 : s_config_dataloopback;
  /* find_the_damn_issue_sky130.vhd:2305:17  */
  always @(posedge clk or posedge n5759_o)
    if (n5759_o)
      n5909_q <= 1'b0;
    else
      n5909_q <= n5908_o;
  /* find_the_damn_issue_sky130.vhd:2246:17  */
  always @(posedge clk)
    n5910_q <= s_config_shiftin_mux2;
  /* find_the_damn_issue_sky130.vhd:2246:17  */
  always @(posedge clk)
    n5911_q <= s_config_shiftout_mux2;
  /* find_the_damn_issue_sky130.vhd:2305:17  */
  assign n5912_o = s_command_rewired_eq_const_110_and_unnamed_not_and_state_eq_idle_and_command_valid_and_unnamed ? s_command_bit_0_not : s_config_clockthreephase;
  /* find_the_damn_issue_sky130.vhd:2305:17  */
  always @(posedge clk or posedge n5759_o)
    if (n5759_o)
      n5913_q <= 1'b0;
    else
      n5913_q <= n5912_o;
  /* find_the_damn_issue_sky130.vhd:2246:17  */
  assign n5914_o = s_command_bit_7_not_and_state_eq_idle_and_command_valid_and_unnamed ? s_command_bit_3_not : s_config_msbfirst;
  /* find_the_damn_issue_sky130.vhd:2246:17  */
  always @(posedge clk)
    n5915_q <= n5914_o;
  /* find_the_damn_issue_sky130.vhd:2246:17  */
  assign n5916_o = s_command_bit_7_not_and_state_eq_idle_and_command_valid_and_unnamed ? s_command_bit_0_neq_command_bit_2 : s_config_captureedge;
  /* find_the_damn_issue_sky130.vhd:2246:17  */
  always @(posedge clk)
    n5917_q <= n5916_o;
  /* find_the_damn_issue_sky130.vhd:2246:17  */
  always @(posedge clk)
    n5918_q <= s_config_clockdelay_mux2;
  /* find_the_damn_issue_sky130.vhd:2305:17  */
  always @(posedge clk or posedge n5759_o)
    if (n5759_o)
      n5919_q <= 1'b1;
    else
      n5919_q <= s_carryin_mux2;
  /* find_the_damn_issue_sky130.vhd:2246:17  */
  always @(posedge clk)
    n5920_q <= s_cmdinc_bitlength_mux2_rewired_mux1_cmdinc_rewired_mux1_cmdinc_rewired_mux1;
  /* find_the_damn_issue_sky130.vhd:2305:17  */
  always @(posedge clk or posedge n5759_o)
    if (n5759_o)
      n5921_q <= 17'b00000000000000001;
    else
      n5921_q <= s_clockdiv_mux1_cmdinc_rewired_mux1;
  /* find_the_damn_issue_sky130.vhd:2305:17  */
  assign n5922_o = s_tick ? s_toggleclock : s_toggleclockdelayed;
  /* find_the_damn_issue_sky130.vhd:2305:17  */
  always @(posedge clk or posedge n5759_o)
    if (n5759_o)
      n5923_q <= 1'b0;
    else
      n5923_q <= n5922_o;
  /* find_the_damn_issue_sky130.vhd:2305:17  */
  always @(posedge clk or posedge n5759_o)
    if (n5759_o)
      n5924_q <= 8'b00000000;
    else
      n5924_q <= s_capturebuffer_mux1_unnamed_mux1_rewired_mux2;
  /* find_the_damn_issue_sky130.vhd:2305:17  */
  always @(posedge clk or posedge n5759_o)
    if (n5759_o)
      n5925_q <= 1'b0;
    else
      n5925_q <= s_m_io0_out_mux2;
  /* find_the_damn_issue_sky130.vhd:2305:17  */
  assign n5926_o = s_const_0_eq_config_targetpingroup_and_state_eq_write_en_and_command_valid ? s_command_bit_0_3 : s_m_io0_en_2;
  /* find_the_damn_issue_sky130.vhd:2305:17  */
  always @(posedge clk or posedge n5759_o)
    if (n5759_o)
      n5927_q <= 1'b0;
    else
      n5927_q <= n5926_o;
  /* find_the_damn_issue_sky130.vhd:2305:17  */
  assign n5928_o = s_state_eq_load_low_and_command_valid ? s_command_bit_0_2 : s_m_io0_opendrain_2;
  /* find_the_damn_issue_sky130.vhd:2305:17  */
  always @(posedge clk or posedge n5759_o)
    if (n5759_o)
      n5929_q <= 1'b0;
    else
      n5929_q <= n5928_o;
  /* find_the_damn_issue_sky130.vhd:2305:17  */
  always @(posedge clk or posedge n5759_o)
    if (n5759_o)
      n5930_q <= 1'b0;
    else
      n5930_q <= s_command_bit_0_mux3;
  /* find_the_damn_issue_sky130.vhd:2305:17  */
  assign n5931_o = s_const_0_eq_config_targetpingroup_and_state_eq_write_en_and_command_valid_2 ? s_command_bit_1_3 : s_m_io1_en_2;
  /* find_the_damn_issue_sky130.vhd:2305:17  */
  always @(posedge clk or posedge n5759_o)
    if (n5759_o)
      n5932_q <= 1'b0;
    else
      n5932_q <= n5931_o;
  /* find_the_damn_issue_sky130.vhd:2305:17  */
  assign n5933_o = s_state_eq_load_low_and_command_valid ? s_command_bit_1_2 : s_m_io1_opendrain_2;
  /* find_the_damn_issue_sky130.vhd:2305:17  */
  always @(posedge clk or posedge n5759_o)
    if (n5759_o)
      n5934_q <= 1'b0;
    else
      n5934_q <= n5933_o;
  /* find_the_damn_issue_sky130.vhd:2305:17  */
  always @(posedge clk or posedge n5759_o)
    if (n5759_o)
      n5935_q <= 1'b0;
    else
      n5935_q <= s_m_io2_out_mux2;
  /* find_the_damn_issue_sky130.vhd:2305:17  */
  assign n5936_o = s_const_0_eq_config_targetpingroup_and_state_eq_write_en_and_command_valid_3 ? s_command_bit_2_3 : s_m_io2_en_2;
  /* find_the_damn_issue_sky130.vhd:2305:17  */
  always @(posedge clk or posedge n5759_o)
    if (n5759_o)
      n5937_q <= 1'b0;
    else
      n5937_q <= n5936_o;
  /* find_the_damn_issue_sky130.vhd:2305:17  */
  assign n5938_o = s_state_eq_load_low_and_command_valid ? s_command_bit_2_2 : s_m_io2_opendrain_2;
  /* find_the_damn_issue_sky130.vhd:2305:17  */
  always @(posedge clk or posedge n5759_o)
    if (n5759_o)
      n5939_q <= 1'b0;
    else
      n5939_q <= n5938_o;
  /* find_the_damn_issue_sky130.vhd:2305:17  */
  always @(posedge clk or posedge n5759_o)
    if (n5759_o)
      n5940_q <= 1'b0;
    else
      n5940_q <= s_m_io3_out_mux2_xor_toggleclockdelayed_mux2;
  /* find_the_damn_issue_sky130.vhd:2305:17  */
  assign n5941_o = s_const_0_eq_config_targetpingroup_and_state_eq_write_en_and_command_valid_4 ? s_command_bit_3_3 : s_m_io3_en_2;
  /* find_the_damn_issue_sky130.vhd:2305:17  */
  always @(posedge clk or posedge n5759_o)
    if (n5759_o)
      n5942_q <= 1'b0;
    else
      n5942_q <= n5941_o;
  /* find_the_damn_issue_sky130.vhd:2305:17  */
  assign n5943_o = s_state_eq_load_low_and_command_valid ? s_command_bit_3_2 : s_m_io3_opendrain_2;
  /* find_the_damn_issue_sky130.vhd:2305:17  */
  always @(posedge clk or posedge n5759_o)
    if (n5759_o)
      n5944_q <= 1'b0;
    else
      n5944_q <= n5943_o;
  /* find_the_damn_issue_sky130.vhd:2305:17  */
  always @(posedge clk or posedge n5759_o)
    if (n5759_o)
      n5945_q <= 1'b0;
    else
      n5945_q <= s_m_io4_out_mux2;
  /* find_the_damn_issue_sky130.vhd:2305:17  */
  assign n5946_o = s_const_0_eq_config_targetpingroup_and_state_eq_write_en_and_command_valid_5 ? s_command_bit_4_3 : s_m_io4_en_2;
  /* find_the_damn_issue_sky130.vhd:2305:17  */
  always @(posedge clk or posedge n5759_o)
    if (n5759_o)
      n5947_q <= 1'b0;
    else
      n5947_q <= n5946_o;
  /* find_the_damn_issue_sky130.vhd:2305:17  */
  assign n5948_o = s_state_eq_load_low_and_command_valid ? s_command_bit_4_2 : s_m_io4_opendrain_2;
  /* find_the_damn_issue_sky130.vhd:2305:17  */
  always @(posedge clk or posedge n5759_o)
    if (n5759_o)
      n5949_q <= 1'b0;
    else
      n5949_q <= n5948_o;
  /* find_the_damn_issue_sky130.vhd:2305:17  */
  assign n5950_o = s_const_0_eq_config_targetpingroup_and_state_eq_write_out_and_command_valid_2 ? s_command_bit_5_4 : s_m_io5_out_2;
  /* find_the_damn_issue_sky130.vhd:2305:17  */
  always @(posedge clk or posedge n5759_o)
    if (n5759_o)
      n5951_q <= 1'b0;
    else
      n5951_q <= n5950_o;
  /* find_the_damn_issue_sky130.vhd:2305:17  */
  assign n5952_o = s_const_0_eq_config_targetpingroup_and_state_eq_write_en_and_command_valid_6 ? s_command_bit_5_3 : s_m_io5_en_2;
  /* find_the_damn_issue_sky130.vhd:2305:17  */
  always @(posedge clk or posedge n5759_o)
    if (n5759_o)
      n5953_q <= 1'b0;
    else
      n5953_q <= n5952_o;
  /* find_the_damn_issue_sky130.vhd:2305:17  */
  assign n5954_o = s_state_eq_load_low_and_command_valid ? s_command_bit_5_2 : s_m_io5_opendrain_2;
  /* find_the_damn_issue_sky130.vhd:2305:17  */
  always @(posedge clk or posedge n5759_o)
    if (n5759_o)
      n5955_q <= 1'b0;
    else
      n5955_q <= n5954_o;
  /* find_the_damn_issue_sky130.vhd:2305:17  */
  assign n5956_o = s_const_1_eq_config_targetpingroup_and_state_eq_write_out_and_command_valid ? s_command_bit_0 : s_m_io8_out_2;
  /* find_the_damn_issue_sky130.vhd:2305:17  */
  always @(posedge clk or posedge n5759_o)
    if (n5759_o)
      n5957_q <= 1'b0;
    else
      n5957_q <= n5956_o;
  /* find_the_damn_issue_sky130.vhd:2305:17  */
  assign n5958_o = s_const_1_eq_config_targetpingroup_and_state_eq_write_out_and_command_valid_2 ? s_command_bit_1 : s_m_io9_out_2;
  /* find_the_damn_issue_sky130.vhd:2305:17  */
  always @(posedge clk or posedge n5759_o)
    if (n5759_o)
      n5959_q <= 1'b0;
    else
      n5959_q <= n5958_o;
  /* find_the_damn_issue_sky130.vhd:2305:17  */
  assign n5960_o = s_const_1_eq_config_targetpingroup_and_state_eq_write_out_and_command_valid_3 ? s_command_bit_2 : s_m_io10_out_2;
  /* find_the_damn_issue_sky130.vhd:2305:17  */
  always @(posedge clk or posedge n5759_o)
    if (n5759_o)
      n5961_q <= 1'b0;
    else
      n5961_q <= n5960_o;
  /* find_the_damn_issue_sky130.vhd:2305:17  */
  assign n5962_o = s_const_1_eq_config_targetpingroup_and_state_eq_write_out_and_command_valid_4 ? s_command_bit_3 : s_m_io11_out_2;
  /* find_the_damn_issue_sky130.vhd:2305:17  */
  always @(posedge clk or posedge n5759_o)
    if (n5759_o)
      n5963_q <= 1'b0;
    else
      n5963_q <= n5962_o;
  /* find_the_damn_issue_sky130.vhd:2305:17  */
  assign n5964_o = s_const_1_eq_config_targetpingroup_and_state_eq_write_out_and_command_valid_5 ? s_command_bit_4 : s_m_io12_out_2;
  /* find_the_damn_issue_sky130.vhd:2305:17  */
  always @(posedge clk or posedge n5759_o)
    if (n5759_o)
      n5965_q <= 1'b0;
    else
      n5965_q <= n5964_o;
  /* find_the_damn_issue_sky130.vhd:2305:17  */
  assign n5966_o = s_const_1_eq_config_targetpingroup_and_state_eq_write_out_and_command_valid_6 ? s_command_bit_5 : s_m_io13_out_2;
  /* find_the_damn_issue_sky130.vhd:2305:17  */
  always @(posedge clk or posedge n5759_o)
    if (n5759_o)
      n5967_q <= 1'b0;
    else
      n5967_q <= n5966_o;
  /* find_the_damn_issue_sky130.vhd:2305:17  */
  assign n5968_o = s_const_1_eq_config_targetpingroup_and_state_eq_write_out_and_command_valid_7 ? s_command_bit_6 : s_m_io14_out_2;
  /* find_the_damn_issue_sky130.vhd:2305:17  */
  always @(posedge clk or posedge n5759_o)
    if (n5759_o)
      n5969_q <= 1'b0;
    else
      n5969_q <= n5968_o;
  /* find_the_damn_issue_sky130.vhd:2305:17  */
  assign n5970_o = s_const_1_eq_config_targetpingroup_and_state_eq_write_out_and_command_valid_8 ? s_command_bit_7 : s_m_io15_out_2;
  /* find_the_damn_issue_sky130.vhd:2305:17  */
  always @(posedge clk or posedge n5759_o)
    if (n5759_o)
      n5971_q <= 1'b0;
    else
      n5971_q <= n5970_o;
endmodule

module scl_uarttx
  (input  clk,
   input  rst_n,
   input  [23:0] in_baudrate,
   input  in_data_ready,
   input  in_data_valid,
   input  [7:0] in_data,
   output out_baud_and_m_last,
   output out_out);
  wire s_out_2;
  wire [3:0] s_m_value;
  wire s_m_last;
  wire s_const_0;
  wire s_const_0_2;
  wire s_unnamed;
  wire s_unnamed_2;
  wire [3:0] s_unnamed_3;
  wire [3:0] s_const_x;
  wire scl_baudrategenerator0_out_out;
  wire n2835_o;
  wire n2837_o;
  wire n2839_o;
  wire n2840_o;
  wire n2841_o;
  wire n2843_o;
  wire n2845_o;
  wire n2846_o;
  wire n2847_o;
  wire [3:0] n2849_o;
  wire n2850_o;
  wire n2852_o;
  wire n2855_o;
  wire [2:0] n2856_o;
  wire n2857_o;
  wire n2859_o;
  wire n2860_o;
  wire n2862_o;
  wire n2863_o;
  wire n2865_o;
  wire n2866_o;
  wire n2868_o;
  wire n2869_o;
  wire n2871_o;
  wire n2872_o;
  wire n2874_o;
  wire n2875_o;
  wire n2877_o;
  wire n2878_o;
  wire n2880_o;
  wire [7:0] n2881_o;
  reg n2883_o;
  wire n2884_o;
  wire n2885_o;
  wire [3:0] scl_counter0_out_m_value;
  wire scl_counter0_out_m_last;
  wire scl_counter0_out_const_0;
  wire scl_counter0_out_const_0_2;
  wire [3:0] scl_counter0_out_const_x;
  assign out_baud_and_m_last = n2850_o;
  assign out_out = n2885_o;
  /* find_the_damn_issue_sky130.vhd:2583:16  */
  assign s_out_2 = scl_baudrategenerator0_out_out; // (signal)
  /* find_the_damn_issue_sky130.vhd:2584:16  */
  assign s_m_value = scl_counter0_out_m_value; // (signal)
  /* find_the_damn_issue_sky130.vhd:2585:16  */
  assign s_m_last = scl_counter0_out_m_last; // (signal)
  /* find_the_damn_issue_sky130.vhd:2586:16  */
  assign s_const_0 = scl_counter0_out_const_0; // (signal)
  /* find_the_damn_issue_sky130.vhd:2587:16  */
  assign s_const_0_2 = scl_counter0_out_const_0_2; // (signal)
  /* find_the_damn_issue_sky130.vhd:2588:16  */
  assign s_unnamed = n2837_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:2589:16  */
  assign s_unnamed_2 = n2843_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:2590:16  */
  assign s_unnamed_3 = n2849_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:2591:16  */
  assign s_const_x = scl_counter0_out_const_x; // (signal)
  /* find_the_damn_issue_sky130.vhd:2593:9  */
  scl_baudrategenerator scl_baudrategenerator0 (
    .clk(clk),
    .rst_n(rst_n),
    .in_baudrate(in_baudrate),
    .out_out(scl_baudrategenerator0_out_out));
  /* find_the_damn_issue_sky130.vhd:2612:40  */
  assign n2835_o = in_data_valid & s_out_2;
  /* find_the_damn_issue_sky130.vhd:2612:17  */
  assign n2837_o = n2835_o ? 1'b1 : s_const_0_2;
  /* find_the_damn_issue_sky130.vhd:2617:32  */
  assign n2839_o = s_m_value == 4'b0001;
  /* find_the_damn_issue_sky130.vhd:2617:66  */
  assign n2840_o = in_data_valid & s_out_2;
  /* find_the_damn_issue_sky130.vhd:2617:42  */
  assign n2841_o = n2839_o & n2840_o;
  /* find_the_damn_issue_sky130.vhd:2617:17  */
  assign n2843_o = n2841_o ? 1'b1 : s_const_0;
  /* find_the_damn_issue_sky130.vhd:2622:32  */
  assign n2845_o = s_m_value == 4'b0001;
  /* find_the_damn_issue_sky130.vhd:2622:66  */
  assign n2846_o = in_data_valid & s_out_2;
  /* find_the_damn_issue_sky130.vhd:2622:42  */
  assign n2847_o = n2845_o & n2846_o;
  /* find_the_damn_issue_sky130.vhd:2622:17  */
  assign n2849_o = n2847_o ? 4'b0110 : s_const_x;
  /* find_the_damn_issue_sky130.vhd:2627:48  */
  assign n2850_o = s_out_2 & s_m_last;
  /* find_the_damn_issue_sky130.vhd:2628:31  */
  assign n2852_o = s_m_value == 4'b0111;
  /* find_the_damn_issue_sky130.vhd:2628:17  */
  assign n2855_o = n2852_o ? 1'b0 : 1'b1;
  /* find_the_damn_issue_sky130.vhd:2633:31  */
  assign n2856_o = s_m_value[2:0];
  /* find_the_damn_issue_sky130.vhd:2634:66  */
  assign n2857_o = in_data[0];
  /* find_the_damn_issue_sky130.vhd:2634:25  */
  assign n2859_o = n2856_o == 3'b000;
  /* find_the_damn_issue_sky130.vhd:2635:66  */
  assign n2860_o = in_data[1];
  /* find_the_damn_issue_sky130.vhd:2635:25  */
  assign n2862_o = n2856_o == 3'b001;
  /* find_the_damn_issue_sky130.vhd:2636:66  */
  assign n2863_o = in_data[2];
  /* find_the_damn_issue_sky130.vhd:2636:25  */
  assign n2865_o = n2856_o == 3'b010;
  /* find_the_damn_issue_sky130.vhd:2637:66  */
  assign n2866_o = in_data[3];
  /* find_the_damn_issue_sky130.vhd:2637:25  */
  assign n2868_o = n2856_o == 3'b011;
  /* find_the_damn_issue_sky130.vhd:2638:66  */
  assign n2869_o = in_data[4];
  /* find_the_damn_issue_sky130.vhd:2638:25  */
  assign n2871_o = n2856_o == 3'b100;
  /* find_the_damn_issue_sky130.vhd:2639:66  */
  assign n2872_o = in_data[5];
  /* find_the_damn_issue_sky130.vhd:2639:25  */
  assign n2874_o = n2856_o == 3'b101;
  /* find_the_damn_issue_sky130.vhd:2640:66  */
  assign n2875_o = in_data[6];
  /* find_the_damn_issue_sky130.vhd:2640:25  */
  assign n2877_o = n2856_o == 3'b110;
  /* find_the_damn_issue_sky130.vhd:2641:66  */
  assign n2878_o = in_data[7];
  /* find_the_damn_issue_sky130.vhd:2641:25  */
  assign n2880_o = n2856_o == 3'b111;
  assign n2881_o = {n2880_o, n2877_o, n2874_o, n2871_o, n2868_o, n2865_o, n2862_o, n2859_o};
  /* find_the_damn_issue_sky130.vhd:2633:17  */
  always @*
    case (n2881_o)
      8'b10000000: n2883_o = n2878_o;
      8'b01000000: n2883_o = n2875_o;
      8'b00100000: n2883_o = n2872_o;
      8'b00010000: n2883_o = n2869_o;
      8'b00001000: n2883_o = n2866_o;
      8'b00000100: n2883_o = n2863_o;
      8'b00000010: n2883_o = n2860_o;
      8'b00000001: n2883_o = n2857_o;
      default: n2883_o = 1'bX;
    endcase
  /* find_the_damn_issue_sky130.vhd:2644:29  */
  assign n2884_o = s_m_value[3];
  /* find_the_damn_issue_sky130.vhd:2644:17  */
  assign n2885_o = n2884_o ? n2883_o : n2855_o;
  /* find_the_damn_issue_sky130.vhd:2652:9  */
  scl_counter_12 scl_counter0 (
    .clk(clk),
    .rst_n(rst_n),
    .in_unnamed(s_unnamed),
    .in_unnamed_2(s_unnamed_2),
    .in_unnamed_3(s_unnamed_3),
    .out_m_value(scl_counter0_out_m_value),
    .out_m_last(scl_counter0_out_m_last),
    .out_const_0(scl_counter0_out_const_0),
    .out_const_0_2(scl_counter0_out_const_0_2),
    .out_const_x(scl_counter0_out_const_x));
endmodule

module scl_streamdemux
  (input  in_m_in_valid,
   input  [7:0] in_m_in,
   input  in_unnamed,
   input  in_unnamed_2,
   input  in_unnamed_3,
   output out_out_0_ready,
   output out_out_0_valid,
   output [7:0] out_out_0,
   output out_m_in_ready_mux2,
   output out_out_1_ready,
   output out_out_1_valid,
   output [7:0] out_out_1);
  wire n2806_o;
  wire n2808_o;
  wire n2810_o;
  wire n2812_o;
  wire n2814_o;
  wire n2816_o;
  wire n2818_o;
  wire n2819_o;
  assign out_out_0_ready = in_unnamed_2;
  assign out_out_0_valid = n2808_o;
  assign out_out_0 = in_m_in;
  assign out_m_in_ready_mux2 = n2819_o;
  assign out_out_1_ready = in_unnamed_3;
  assign out_out_1_valid = n2816_o;
  assign out_out_1 = in_m_in;
  /* find_the_damn_issue_sky130.vhd:2719:25  */
  assign n2806_o = 1'b0 == in_unnamed;
  /* find_the_damn_issue_sky130.vhd:2719:17  */
  assign n2808_o = n2806_o ? in_m_in_valid : 1'b0;
  /* find_the_damn_issue_sky130.vhd:2724:25  */
  assign n2810_o = 1'b0 == in_unnamed;
  /* find_the_damn_issue_sky130.vhd:2724:17  */
  assign n2812_o = n2810_o ? in_unnamed_2 : 1'b1;
  /* find_the_damn_issue_sky130.vhd:2730:25  */
  assign n2814_o = 1'b1 == in_unnamed;
  /* find_the_damn_issue_sky130.vhd:2730:17  */
  assign n2816_o = n2814_o ? in_m_in_valid : 1'b0;
  /* find_the_damn_issue_sky130.vhd:2735:25  */
  assign n2818_o = 1'b1 == in_unnamed;
  /* find_the_damn_issue_sky130.vhd:2735:17  */
  assign n2819_o = n2818_o ? in_unnamed_3 : n2812_o;
endmodule

module scl_fifo
  (input  clk,
   input  rst_n,
   input  in_m_pushvalid,
   input  [7:0] in_m_pushdata_data,
   input  [3:0] in_m_pushdata_endpoint,
   input  in_m_pushcommit,
   input  in_m_pushrollack,
   input  [4:0] in_m_pushcutoff,
   input  in_m_popvalid,
   output [7:0] out_m_peekdata_data,
   output out_m_pushfull,
   output out_m_popempty);
  wire s_m_pushvalid_2;
  wire s_m_pushcommit_2;
  wire [4:0] s_putcheckpoint_mux1_minus_m_pushcutoff_mux1;
  reg [4:0] s_put;
  wire [3:0] s_unnamed;
  wire [11:0] s_unnamed_2;
  reg [4:0] s_putcheckpoint;
  reg s_m_pushfull_2;
  wire [4:0] s_pushput;
  wire s_m_popvalid_2;
  reg [4:0] s_get;
  wire [3:0] s_get_mux1_rewired;
  reg s_m_popempty_2;
  wire [4:0] s_popget;
  reg [4:0] s_pushget;
  reg [4:0] s_popput;
  wire [11:0] s_unnamed_3;
  wire s_popput_bit_4_eq_get_mux1_bit_4_and_popput_rewired_eq_get_mux1_rewired;
  wire [4:0] s_get_plus_const_1;
  wire s_unnamed_4;
  wire [4:0] s_putcheckpoint_mux1_minus_m_pushcutoff;
  wire [11:0] scl_memory0_out_unnamed_5;
  wire [7:0] n2688_o;
  wire [3:0] n2689_o;
  wire [11:0] n2690_o;
  wire [4:0] n2692_o;
  wire [4:0] n2693_o;
  wire [4:0] n2694_o;
  wire [4:0] n2696_o;
  wire [4:0] n2697_o;
  wire [3:0] n2698_o;
  wire n2700_o;
  wire n2701_o;
  wire n2702_o;
  wire n2709_o;
  wire [3:0] n2711_o;
  wire n2712_o;
  wire n2719_o;
  wire n2720_o;
  wire [4:0] n2721_o;
  wire [4:0] n2722_o;
  wire [4:0] n2723_o;
  wire n2725_o;
  wire n2726_o;
  wire n2727_o;
  wire n2734_o;
  wire [3:0] n2736_o;
  wire [3:0] n2737_o;
  wire n2738_o;
  wire n2745_o;
  wire n2746_o;
  wire n2755_o;
  reg [4:0] n2781_q;
  wire [4:0] n2782_o;
  reg [4:0] n2783_q;
  reg n2784_q;
  wire [4:0] n2785_o;
  reg [4:0] n2786_q;
  reg n2787_q;
  reg [4:0] n2788_q;
  reg [4:0] n2789_q;
  assign out_m_peekdata_data = n2688_o;
  assign out_m_pushfull = s_m_pushfull_2;
  assign out_m_popempty = s_m_popempty_2;
  /* find_the_damn_issue_sky130.vhd:2879:16  */
  assign s_m_pushvalid_2 = in_m_pushvalid; // (signal)
  /* find_the_damn_issue_sky130.vhd:2880:16  */
  assign s_m_pushcommit_2 = in_m_pushcommit; // (signal)
  /* find_the_damn_issue_sky130.vhd:2881:16  */
  assign s_putcheckpoint_mux1_minus_m_pushcutoff_mux1 = n2722_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:2882:16  */
  always @*
    s_put = n2781_q; // (isignal)
  initial
    s_put = 5'b00000;
  /* find_the_damn_issue_sky130.vhd:2883:16  */
  assign s_unnamed = n2689_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:2884:16  */
  assign s_unnamed_2 = n2690_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:2885:16  */
  always @*
    s_putcheckpoint = n2783_q; // (isignal)
  initial
    s_putcheckpoint = 5'b00000;
  /* find_the_damn_issue_sky130.vhd:2886:16  */
  always @*
    s_m_pushfull_2 = n2784_q; // (isignal)
  initial
    s_m_pushfull_2 = 1'b0;
  /* find_the_damn_issue_sky130.vhd:2887:16  */
  assign s_pushput = n2723_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:2888:16  */
  assign s_m_popvalid_2 = in_m_popvalid; // (signal)
  /* find_the_damn_issue_sky130.vhd:2889:16  */
  always @*
    s_get = n2786_q; // (isignal)
  initial
    s_get = 5'b00000;
  /* find_the_damn_issue_sky130.vhd:2890:16  */
  assign s_get_mux1_rewired = n2698_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:2891:16  */
  always @*
    s_m_popempty_2 = n2787_q; // (isignal)
  initial
    s_m_popempty_2 = 1'b1;
  /* find_the_damn_issue_sky130.vhd:2892:16  */
  assign s_popget = n2697_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:2893:16  */
  always @*
    s_pushget = n2788_q; // (isignal)
  initial
    s_pushget = 5'b00000;
  /* find_the_damn_issue_sky130.vhd:2894:16  */
  always @*
    s_popput = n2789_q; // (isignal)
  initial
    s_popput = 5'b00000;
  /* find_the_damn_issue_sky130.vhd:2895:16  */
  assign s_unnamed_3 = scl_memory0_out_unnamed_5; // (signal)
  /* find_the_damn_issue_sky130.vhd:2896:16  */
  assign s_popput_bit_4_eq_get_mux1_bit_4_and_popput_rewired_eq_get_mux1_rewired = n2720_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:2897:16  */
  assign s_get_plus_const_1 = n2696_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:2898:16  */
  assign s_unnamed_4 = n2746_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:2899:16  */
  assign s_putcheckpoint_mux1_minus_m_pushcutoff = n2721_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:2901:9  */
  scl_memory_2 scl_memory0 (
    .clk(clk),
    .in_unnamed(s_m_pushvalid_2),
    .in_unnamed_2(s_unnamed),
    .in_unnamed_3(s_unnamed_2),
    .in_unnamed_4(s_get_mux1_rewired),
    .out_unnamed_5(scl_memory0_out_unnamed_5));
  /* find_the_damn_issue_sky130.vhd:2930:51  */
  assign n2688_o = s_unnamed_3[7:0];
  /* find_the_damn_issue_sky130.vhd:2940:35  */
  assign n2689_o = s_put[3:0];
  /* find_the_damn_issue_sky130.vhd:2941:55  */
  assign n2690_o = {in_m_pushdata_endpoint, in_m_pushdata_data};
  /* find_the_damn_issue_sky130.vhd:2943:46  */
  assign n2692_o = s_put + 5'b00001;
  /* find_the_damn_issue_sky130.vhd:2942:17  */
  assign n2693_o = s_m_pushvalid_2 ? n2692_o : s_put;
  /* find_the_damn_issue_sky130.vhd:2948:17  */
  assign n2694_o = in_m_pushrollack ? s_putcheckpoint : n2693_o;
  /* find_the_damn_issue_sky130.vhd:2957:46  */
  assign n2696_o = s_get + 5'b00001;
  /* find_the_damn_issue_sky130.vhd:2958:17  */
  assign n2697_o = s_m_popvalid_2 ? s_get_plus_const_1 : s_get;
  /* find_the_damn_issue_sky130.vhd:2965:51  */
  assign n2698_o = n2697_o[3:0];
  /* find_the_damn_issue_sky130.vhd:2966:115  */
  assign n2700_o = s_popput[4];
  /* find_the_damn_issue_sky130.vhd:2966:133  */
  assign n2701_o = n2697_o[4];
  /* find_the_damn_issue_sky130.vhd:2966:119  */
  assign n2702_o = n2700_o == n2701_o;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n2709_o = n2702_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:2966:164  */
  assign n2711_o = s_popput[3:0];
  /* find_the_damn_issue_sky130.vhd:2966:177  */
  assign n2712_o = n2711_o == s_get_mux1_rewired;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n2719_o = n2712_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:2966:138  */
  assign n2720_o = n2709_o & n2719_o;
  /* find_the_damn_issue_sky130.vhd:2968:84  */
  assign n2721_o = n2694_o - in_m_pushcutoff;
  /* find_the_damn_issue_sky130.vhd:2969:17  */
  assign n2722_o = s_m_pushcommit_2 ? s_putcheckpoint_mux1_minus_m_pushcutoff : n2694_o;
  /* find_the_damn_issue_sky130.vhd:2975:17  */
  assign n2723_o = s_m_pushcommit_2 ? s_putcheckpoint_mux1_minus_m_pushcutoff : s_putcheckpoint;
  /* find_the_damn_issue_sky130.vhd:2982:93  */
  assign n2725_o = n2722_o[4];
  /* find_the_damn_issue_sky130.vhd:2982:109  */
  assign n2726_o = s_pushget[4];
  /* find_the_damn_issue_sky130.vhd:2982:97  */
  assign n2727_o = n2725_o != n2726_o;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n2734_o = n2727_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:2982:178  */
  assign n2736_o = n2722_o[3:0];
  /* find_the_damn_issue_sky130.vhd:2982:202  */
  assign n2737_o = s_pushget[3:0];
  /* find_the_damn_issue_sky130.vhd:2982:191  */
  assign n2738_o = n2736_o == n2737_o;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n2745_o = n2738_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:2982:114  */
  assign n2746_o = n2734_o & n2745_o;
  /* find_the_damn_issue_sky130.vhd:2987:27  */
  assign n2755_o = ~rst_n;
  /* find_the_damn_issue_sky130.vhd:2995:17  */
  always @(posedge clk or posedge n2755_o)
    if (n2755_o)
      n2781_q <= 5'b00000;
    else
      n2781_q <= s_putcheckpoint_mux1_minus_m_pushcutoff_mux1;
  /* find_the_damn_issue_sky130.vhd:2995:17  */
  assign n2782_o = s_m_pushcommit_2 ? s_putcheckpoint_mux1_minus_m_pushcutoff : s_putcheckpoint;
  /* find_the_damn_issue_sky130.vhd:2995:17  */
  always @(posedge clk or posedge n2755_o)
    if (n2755_o)
      n2783_q <= 5'b00000;
    else
      n2783_q <= n2782_o;
  /* find_the_damn_issue_sky130.vhd:2995:17  */
  always @(posedge clk or posedge n2755_o)
    if (n2755_o)
      n2784_q <= 1'b0;
    else
      n2784_q <= s_unnamed_4;
  /* find_the_damn_issue_sky130.vhd:2995:17  */
  assign n2785_o = s_m_popvalid_2 ? s_get_plus_const_1 : s_get;
  /* find_the_damn_issue_sky130.vhd:2995:17  */
  always @(posedge clk or posedge n2755_o)
    if (n2755_o)
      n2786_q <= 5'b00000;
    else
      n2786_q <= n2785_o;
  /* find_the_damn_issue_sky130.vhd:2995:17  */
  always @(posedge clk or posedge n2755_o)
    if (n2755_o)
      n2787_q <= 1'b1;
    else
      n2787_q <= s_popput_bit_4_eq_get_mux1_bit_4_and_popput_rewired_eq_get_mux1_rewired;
  /* find_the_damn_issue_sky130.vhd:2995:17  */
  always @(posedge clk or posedge n2755_o)
    if (n2755_o)
      n2788_q <= 5'b00000;
    else
      n2788_q <= s_popget;
  /* find_the_damn_issue_sky130.vhd:2995:17  */
  always @(posedge clk or posedge n2755_o)
    if (n2755_o)
      n2789_q <= 5'b00000;
    else
      n2789_q <= s_pushput;
endmodule

module usbfunction
  (input  clk,
   input  rst_n,
   input  [1:0] in_unnamed,
   input  in_unnamed_2,
   input  in_unnamed_3,
   input  in_unnamed_4,
   input  [7:0] in_unnamed_5,
   input  in_unnamed_6,
   input  in_unnamed_7,
   input  in_unnamed_8,
   input  in_unnamed_9,
   input  in_unnamed_10,
   input  in_unnamed_11,
   input  in_unnamed_12,
   input  in_unnamed_13,
   input  [7:0] in_unnamed_14,
   input  [7:0] in_unnamed_15,
   input  [7:0] in_unnamed_16,
   input  in_unnamed_17,
   input  in_unnamed_18,
   input  in_unnamed_19,
   input  [23:0] in_unnamed_20,
   input  in_unnamed_21,
   input  [7:0] in_unnamed_22,
   input  [3:0] in_unnamed_23,
   input  in_unnamed_24,
   input  [4:0] in_unnamed_25,
   input  in_unnamed_26,
   input  in_unnamed_27,
   input  [7:0] in_unnamed_28,
   input  [3:0] in_unnamed_29,
   input  in_unnamed_30,
   input  in_unnamed_31,
   output out_m_phy_tx_valid_2,
   output [7:0] out_m_phy_tx_data_2,
   output [1:0] out_m_status_linestate,
   output out_m_status_rxactive,
   output out_m_out,
   output out_m_match_delayed1,
   output out_m_phy_tx_ready,
   output out_unnamed_mux1,
   output out_unnamed_mux1_2,
   output out_firstdatabit_mux2,
   output out_unnamed_mux2,
   output out_unnamed_mux1_3,
   output out_set_line_coding_mux1,
   output out_unnamed_32,
   output out_unnamed_eq_set_line_coding_and_m_phy_rx_error_not_and_m_pid_2_rewired_eq_const_11_and_nested_condition_m_phy_rx_eop,
   output [23:0] out_m_packetdata_2_rewired_mux1,
   output out_unnamed_mux2_2,
   output out_unnamed_not_mux1,
   output [7:0] out_unnamed_mux1_4,
   output [3:0] out_unnamed_mux1_5,
   output out_const_0_mux1,
   output out_unnamed_mux2_3,
   output [4:0] out_const_10_mux1,
   output out_unnamed_not_mux1_2,
   output out_unnamed_mux2_4,
   output out_const_0_mux1_2,
   output out_m_packetdata_2_bit_16,
   output out_m_packetdata_2_bit_17,
   output [23:0] out_m_packetdata_2_rewired,
   output out_unnamed_mux2_5,
   output out_m_packetdata_2_bit_17_mux1,
   output out_m_packetdata_2_bit_16_mux1,
   output [7:0] out_unnamed_txstuffedstream_valid_mux2_rewired_txstuffedstream_valid_mux2_rewired,
   output [7:0] out_unnamed_txstuffedstream_mux1_rewired_txstuffedstream_not_mux1_rewired);
  wire [3:0] s_m_senddatastate_mux8;
  wire [6:0] s_m_address_2;
  wire [3:0] s_m_configuration_2;
  wire s_unnamed_not_mux1_3;
  wire s_m_rx_eop_2;
  wire s_m_rxreadyerror_2;
  wire [1:0] s_const_1_mux15;
  wire [6:0] s_m_newaddress_2;
  wire s_m_status_sessend;
  wire s_m_rx_valid;
  wire s_m_rx_sop;
  wire s_m_rx_eop;
  wire s_m_rx_error;
  wire [7:0] s_m_rx_data;
  wire s_m_phy_rx_error;
  reg s_m_phy_rx_eop;
  wire [7:0] s_m_phy_rx_data;
  wire s_m_phy_rx_sop;
  reg s_m_phy_rx_valid;
  wire s_m_rxstatus_sessend;
  wire [1:0] s_m_rxstatus_linestate;
  reg [3:0] s_m_state;
  wire [3:0] s_m_state_2;
  wire s_m_phy_rx_valid_2;
  wire s_m_phy_rx_eop_2;
  wire s_m_phy_rx_error_2;
  wire [7:0] s_m_phy_rx_data_2;
  wire [1:0] s_m_rxstatus_linestate_2;
  wire s_m_rxstatus_sessend_2;
  wire [7:0] s_m_descaddressactive_mux1;
  wire [7:0] s_m_descdata;
  reg [1:0] s_m_sendhandshake;
  wire s_send_mux2;
  reg s_handshakestate;
  wire s_ackexpected_mux3;
  reg s_ackexpected;
  reg s_incompletetransfer;
  reg [3:0] s_m_packetlentxlimit;
  wire [3:0] s_m_endpoint;
  wire [15:0] s_m_endpointmask;
  wire s_m_packetdata_2_rewired_eq_unnamed_mux2_and_m_pid_2_rewired_eq_const_1_not_and_m_pid_2_rewired_eq_const_1_and_m_phy_rx_eop_and_m_phy_rx_error_not_and_m_state_eq_waitfortoken;
  wire [3:0] s_m_endpoint_mux1;
  wire [3:0] s_m_senddatastate;
  reg [6:0] s_m_newaddress;
  reg [3:0] s_m_configuration;
  wire [3:0] s_m_configuration_3;
  reg [15:0] s_m_nextoutdatapid;
  wire [7:0] s_m_descaddressactive;
  wire [7:0] s_m_desclengthactive;
  wire [7:0] s_m_descaddress;
  wire [7:0] s_m_desclength;
  wire s_m_tx_commit;
  wire s_m_tx_rollback;
  wire s_m_tx_valid_and_m_tx_endpoint_eq_m_endpoint_mux1_and_m_packetlen_2_eq_m_packetlentxlimit_not_not_and_m_state_eq_senddata;
  wire s_m_tx_ready;
  wire s_unnamed_33;
  wire [7:0] s_unnamed_34;
  wire [3:0] s_unnamed_35;
  wire [15:0] s_m_nextindatapid;
  wire [3:0] s_m_pid;
  wire [3:0] s_m_packetlen;
  wire [63:0] s_m_packetdata;
  wire s_m_rxreadyerror;
  wire s_unnamed_36;
  wire s_m_rx_valid_2;
  wire [3:0] s_m_rx_endpoint;
  wire [7:0] s_m_rx_data_2;
  wire s_m_rx_eop_3;
  wire s_m_rx_error_2;
  reg [6:0] s_m_address;
  wire s_unnamed_not_mux1_4;
  wire s_tx_valid;
  wire [3:0] s_tx_endpoint;
  wire [7:0] s_tx_data;
  wire [1:0] s_unnamed_37;
  wire s_unnamed_38;
  wire s_unnamed_39;
  wire s_unnamed_40;
  wire [7:0] s_unnamed_41;
  wire s_unnamed_42;
  wire s_unnamed_43;
  wire s_unnamed_44;
  wire s_unnamed_45;
  wire s_unnamed_46;
  wire s_unnamed_47;
  wire s_unnamed_48;
  wire [7:0] s_unnamed_49;
  wire [7:0] s_unnamed_50;
  wire [7:0] s_unnamed_51;
  wire s_unnamed_52;
  wire s_unnamed_53;
  wire s_unnamed_54;
  wire [4:0] s_unnamed_55;
  wire s_unnamed_56;
  wire [3:0] s_unnamed_57;
  wire [7:0] s_unnamed_58;
  wire s_unnamed_59;
  wire s_unnamed_60;
  wire [3:0] s_m_senddatastate_2_mux2;
  wire [15:0] s_unnamed_m_packetdata_2_rewired_eq_const_15_rewired;
  wire [3:0] s_m_packetdata_2_rewired_2;
  wire [6:0] s_unnamed_mux1_6;
  wire [3:0] s_unnamed_mux1_7;
  wire [6:0] s_unnamed_mux2_6;
  wire [3:0] s_m_packetlentxlimit_mux2;
  wire [6:0] s_unnamed_mux1_8;
  wire s_m_packetlen_2_eq_m_packetlentxlimit;
  wire [6:0] s_m_packetdata_2_rewired_mux1_2;
  wire [3:0] s_m_packetdata_2_rewired_mux1_3;
  wire [7:0] s_m_descaddressactive_mux9;
  wire [7:0] s_m_packetdata_2_rewired_mux1_4;
  wire [15:0] s_m_nextoutdatapid_2_mux1_rewired_mux2_rewired_mux1;
  wire [7:0] s_m_descaddressactive_mux2;
  wire [7:0] s_m_packetdata_2_rewired_mux2;
  wire [15:0] s_m_nextindatapid_2_mux2_rewired_mux1_xor_m_endpointmask_mux2;
  wire [3:0] s_m_phy_rx_data_rewired_mux2;
  wire [3:0] s_m_packetlen_2_plus_const_1_mux3;
  wire [63:0] s_m_packetdata_2_rewired_m_phy_rx_data_rewired;
  wire s_m_phy_rx_valid_and_m_packetlen_lt_const_8;
  wire [1:0] scl_usbgpiophy0_out_m_status_linestate;
  wire scl_usbgpiophy0_out_m_status_sessend;
  wire scl_usbgpiophy0_out_m_status_rxactive;
  wire scl_usbgpiophy0_out_m_out;
  wire scl_usbgpiophy0_out_m_match_delayed1;
  wire scl_usbgpiophy0_out_m_rx_valid;
  wire scl_usbgpiophy0_out_m_rx_sop;
  wire scl_usbgpiophy0_out_m_rx_eop;
  wire scl_usbgpiophy0_out_m_rx_error;
  wire [7:0] scl_usbgpiophy0_out_m_rx_data;
  wire scl_usbgpiophy0_out_unnamed_or_in_valid_mux1_delayed1_not_mux1;
  wire scl_usbgpiophy0_out_unnamed_mux1;
  wire scl_usbgpiophy0_out_unnamed_mux1_2;
  wire scl_usbgpiophy0_out_firstdatabit_mux2;
  wire scl_usbgpiophy0_out_unnamed_mux2;
  wire scl_usbgpiophy0_out_unnamed_mux1_3;
  wire [7:0] scl_usbgpiophy0_out_unnamed_txstuffedstream_valid_mux2_rewired_txstuffedstream_valid_mux2_rewired;
  wire [7:0] scl_usbgpiophy0_out_unnamed_txstuffedstream_mux1_rewired_txstuffedstream_not_mux1_rewired;
  wire n615_o;
  wire n617_o;
  wire n618_o;
  wire n620_o;
  wire n622_o;
  wire [7:0] n625_o;
  wire n627_o;
  wire n629_o;
  wire n630_o;
  wire [7:0] n632_o;
  wire n634_o;
  wire n636_o;
  wire n637_o;
  wire [7:0] n639_o;
  wire n641_o;
  wire n644_o;
  wire n647_o;
  wire n654_o;
  wire n655_o;
  wire [1:0] n657_o;
  wire n659_o;
  wire n661_o;
  wire n662_o;
  wire n663_o;
  wire n664_o;
  wire [6:0] n665_o;
  wire n667_o;
  wire n668_o;
  wire n669_o;
  wire n670_o;
  wire n673_o;
  wire n675_o;
  wire n676_o;
  wire n677_o;
  wire n678_o;
  wire n679_o;
  wire n682_o;
  wire n683_o;
  wire n684_o;
  wire n686_o;
  wire n689_o;
  wire n696_o;
  wire n697_o;
  wire n700_o;
  wire n707_o;
  wire n709_o;
  wire [7:0] n711_o;
  wire n712_o;
  wire n715_o;
  wire n722_o;
  wire n723_o;
  wire n726_o;
  wire n733_o;
  wire n734_o;
  wire n737_o;
  wire n744_o;
  wire n745_o;
  wire n746_o;
  wire [3:0] n747_o;
  wire [3:0] n748_o;
  wire [3:0] n750_o;
  wire n752_o;
  wire n754_o;
  wire n755_o;
  wire n757_o;
  wire n758_o;
  wire n760_o;
  wire n763_o;
  wire n770_o;
  wire n773_o;
  wire n780_o;
  wire n781_o;
  wire n784_o;
  wire n791_o;
  wire n792_o;
  wire n793_o;
  wire [7:0] n795_o;
  wire [7:0] n796_o;
  wire n798_o;
  wire n799_o;
  wire n800_o;
  wire n801_o;
  wire [7:0] n802_o;
  wire [7:0] n804_o;
  wire [7:0] n805_o;
  wire n807_o;
  wire n808_o;
  wire n809_o;
  wire n810_o;
  wire [7:0] n811_o;
  wire n812_o;
  wire n814_o;
  wire n815_o;
  wire n816_o;
  wire [7:0] n818_o;
  wire n820_o;
  wire n822_o;
  wire n823_o;
  wire n824_o;
  wire n826_o;
  wire n827_o;
  wire n829_o;
  wire [7:0] n830_o;
  wire [7:0] n831_o;
  wire [15:0] n832_o;
  wire [15:0] n833_o;
  wire [15:0] n834_o;
  wire [7:0] n835_o;
  wire n836_o;
  wire n837_o;
  wire [23:0] n838_o;
  wire [3:0] n839_o;
  wire [1:0] n840_o;
  wire n842_o;
  wire n844_o;
  wire n845_o;
  wire n847_o;
  wire n848_o;
  wire n849_o;
  wire n850_o;
  wire n851_o;
  wire [7:0] n853_o;
  wire n855_o;
  wire n857_o;
  wire n858_o;
  wire n860_o;
  wire n861_o;
  wire n862_o;
  wire n863_o;
  wire n864_o;
  wire [7:0] n866_o;
  wire n868_o;
  wire n870_o;
  wire [4:0] n871_o;
  wire n873_o;
  wire n875_o;
  wire n876_o;
  wire n878_o;
  wire n879_o;
  wire n880_o;
  wire n881_o;
  wire n882_o;
  wire n883_o;
  wire n884_o;
  wire [7:0] n886_o;
  wire n888_o;
  wire n890_o;
  wire [4:0] n891_o;
  wire n893_o;
  wire n895_o;
  wire n896_o;
  wire n898_o;
  wire n899_o;
  wire n900_o;
  wire n901_o;
  wire n902_o;
  wire n903_o;
  wire n904_o;
  wire [7:0] n906_o;
  wire n908_o;
  wire n910_o;
  wire [4:0] n911_o;
  wire n913_o;
  wire n915_o;
  wire n916_o;
  wire n918_o;
  wire n919_o;
  wire n920_o;
  wire n921_o;
  wire n922_o;
  wire n923_o;
  wire n924_o;
  wire [7:0] n926_o;
  wire n928_o;
  wire n930_o;
  wire [4:0] n931_o;
  wire n933_o;
  wire n935_o;
  wire n936_o;
  wire n938_o;
  wire n939_o;
  wire n940_o;
  wire n941_o;
  wire n942_o;
  wire n943_o;
  wire n944_o;
  wire [7:0] n946_o;
  wire n948_o;
  wire n950_o;
  wire [4:0] n951_o;
  wire n953_o;
  wire n955_o;
  wire n956_o;
  wire n958_o;
  wire n959_o;
  wire n960_o;
  wire n961_o;
  wire n962_o;
  wire n963_o;
  wire n964_o;
  wire [7:0] n966_o;
  wire n968_o;
  wire n970_o;
  wire [4:0] n971_o;
  wire n973_o;
  wire n975_o;
  wire n976_o;
  wire n978_o;
  wire n979_o;
  wire n980_o;
  wire n981_o;
  wire n982_o;
  wire n983_o;
  wire n984_o;
  wire [7:0] n986_o;
  wire n988_o;
  wire n990_o;
  wire [4:0] n991_o;
  wire n993_o;
  wire n995_o;
  wire n996_o;
  wire n998_o;
  wire n999_o;
  wire n1000_o;
  wire n1001_o;
  wire n1002_o;
  wire n1003_o;
  wire n1004_o;
  wire [7:0] n1006_o;
  wire n1008_o;
  wire n1010_o;
  wire [4:0] n1011_o;
  wire n1013_o;
  wire n1015_o;
  wire n1016_o;
  wire n1018_o;
  wire n1019_o;
  wire n1020_o;
  wire n1021_o;
  wire n1022_o;
  wire n1023_o;
  wire n1024_o;
  wire [7:0] n1026_o;
  wire n1028_o;
  wire n1030_o;
  wire [4:0] n1031_o;
  wire n1033_o;
  wire n1035_o;
  wire n1036_o;
  wire n1038_o;
  wire n1039_o;
  wire n1040_o;
  wire n1041_o;
  wire n1042_o;
  wire n1043_o;
  wire n1044_o;
  wire [7:0] n1046_o;
  wire n1048_o;
  wire n1050_o;
  wire [4:0] n1051_o;
  wire n1053_o;
  wire n1055_o;
  wire n1056_o;
  wire n1058_o;
  wire n1059_o;
  wire n1060_o;
  wire n1061_o;
  wire n1062_o;
  wire n1063_o;
  wire n1064_o;
  wire [7:0] n1066_o;
  wire n1068_o;
  wire [4:0] n1069_o;
  wire n1071_o;
  wire n1073_o;
  wire n1074_o;
  wire n1076_o;
  wire n1077_o;
  wire n1078_o;
  wire n1079_o;
  wire n1080_o;
  wire n1081_o;
  wire [6:0] n1082_o;
  wire [6:0] n1083_o;
  wire n1085_o;
  wire [4:0] n1086_o;
  wire n1088_o;
  wire n1090_o;
  wire n1091_o;
  wire n1093_o;
  wire n1094_o;
  wire n1095_o;
  wire n1096_o;
  wire n1097_o;
  wire n1098_o;
  wire [7:0] n1100_o;
  wire [7:0] n1101_o;
  wire n1103_o;
  wire [4:0] n1104_o;
  wire n1106_o;
  wire n1108_o;
  wire n1109_o;
  wire n1111_o;
  wire n1112_o;
  wire n1113_o;
  wire n1114_o;
  wire n1115_o;
  wire n1116_o;
  wire [7:0] n1118_o;
  wire n1120_o;
  wire n1122_o;
  wire [4:0] n1123_o;
  wire n1125_o;
  wire n1127_o;
  wire n1128_o;
  wire n1130_o;
  wire n1131_o;
  wire n1132_o;
  wire n1133_o;
  wire n1134_o;
  wire n1135_o;
  wire n1136_o;
  wire n1139_o;
  wire n1142_o;
  wire n1149_o;
  wire [4:0] n1151_o;
  wire n1153_o;
  wire n1160_o;
  wire n1163_o;
  wire n1170_o;
  wire n1171_o;
  wire n1174_o;
  wire n1181_o;
  wire n1182_o;
  wire n1183_o;
  wire n1184_o;
  wire n1185_o;
  wire n1186_o;
  wire n1187_o;
  wire [3:0] n1188_o;
  wire [3:0] n1189_o;
  wire n1191_o;
  wire n1192_o;
  wire n1194_o;
  wire n1195_o;
  wire n1196_o;
  wire n1197_o;
  wire n1199_o;
  wire n1201_o;
  wire n1203_o;
  wire n1204_o;
  wire n1206_o;
  wire n1207_o;
  wire n1209_o;
  wire n1210_o;
  wire n1212_o;
  wire n1213_o;
  wire n1214_o;
  wire n1215_o;
  wire n1216_o;
  wire n1218_o;
  wire n1220_o;
  wire n1222_o;
  wire n1223_o;
  wire n1225_o;
  wire n1226_o;
  wire n1228_o;
  wire n1229_o;
  wire n1231_o;
  wire n1232_o;
  wire n1233_o;
  wire n1234_o;
  wire n1235_o;
  wire n1238_o;
  wire n1241_o;
  wire n1248_o;
  wire n1251_o;
  wire n1258_o;
  wire n1259_o;
  wire n1262_o;
  wire n1269_o;
  wire n1270_o;
  wire n1273_o;
  wire n1280_o;
  wire n1281_o;
  wire n1284_o;
  wire n1291_o;
  wire n1292_o;
  wire n1293_o;
  wire n1294_o;
  wire n1295_o;
  wire n1296_o;
  wire n1297_o;
  wire n1299_o;
  wire n1301_o;
  wire n1303_o;
  wire n1304_o;
  wire n1306_o;
  wire n1307_o;
  wire n1308_o;
  wire n1309_o;
  wire n1310_o;
  wire n1313_o;
  wire n1315_o;
  wire n1317_o;
  wire n1318_o;
  wire n1320_o;
  wire n1321_o;
  wire n1323_o;
  wire n1324_o;
  wire n1326_o;
  wire n1327_o;
  wire n1328_o;
  wire n1329_o;
  wire n1330_o;
  wire n1332_o;
  wire n1333_o;
  wire n1336_o;
  wire n1343_o;
  wire n1344_o;
  wire n1347_o;
  wire n1354_o;
  wire n1355_o;
  wire n1356_o;
  wire n1357_o;
  wire n1358_o;
  wire [1:0] n1359_o;
  wire [3:0] n1360_o;
  wire n1363_o;
  wire n1370_o;
  wire [15:0] n1372_o;
  wire [13:0] n1373_o;
  wire n1376_o;
  wire n1383_o;
  wire [14:0] n1384_o;
  wire n1385_o;
  wire [15:0] n1386_o;
  wire [12:0] n1387_o;
  wire n1390_o;
  wire n1397_o;
  wire [13:0] n1398_o;
  wire [1:0] n1399_o;
  wire [15:0] n1400_o;
  wire [11:0] n1401_o;
  wire n1404_o;
  wire n1411_o;
  wire [12:0] n1412_o;
  wire [2:0] n1413_o;
  wire [15:0] n1414_o;
  wire [10:0] n1415_o;
  wire n1418_o;
  wire n1425_o;
  wire [11:0] n1426_o;
  wire [3:0] n1427_o;
  wire [15:0] n1428_o;
  wire [9:0] n1429_o;
  wire n1432_o;
  wire n1439_o;
  wire [10:0] n1440_o;
  wire [4:0] n1441_o;
  wire [15:0] n1442_o;
  wire [8:0] n1443_o;
  wire n1446_o;
  wire n1453_o;
  wire [9:0] n1454_o;
  wire [5:0] n1455_o;
  wire [15:0] n1456_o;
  wire [7:0] n1457_o;
  wire n1460_o;
  wire n1467_o;
  wire [8:0] n1468_o;
  wire [6:0] n1469_o;
  wire [15:0] n1470_o;
  wire [6:0] n1471_o;
  wire n1474_o;
  wire n1481_o;
  wire [7:0] n1482_o;
  wire [7:0] n1483_o;
  wire [15:0] n1484_o;
  wire [5:0] n1485_o;
  wire n1488_o;
  wire n1495_o;
  wire [6:0] n1496_o;
  wire [8:0] n1497_o;
  wire [15:0] n1498_o;
  wire [4:0] n1499_o;
  wire n1502_o;
  wire n1509_o;
  wire [5:0] n1510_o;
  wire [9:0] n1511_o;
  wire [15:0] n1512_o;
  wire [3:0] n1513_o;
  wire n1516_o;
  wire n1523_o;
  wire [4:0] n1524_o;
  wire [10:0] n1525_o;
  wire [15:0] n1526_o;
  wire [2:0] n1527_o;
  wire n1530_o;
  wire n1537_o;
  wire [3:0] n1538_o;
  wire [11:0] n1539_o;
  wire [15:0] n1540_o;
  wire [1:0] n1541_o;
  wire n1544_o;
  wire n1551_o;
  wire [2:0] n1552_o;
  wire [12:0] n1553_o;
  wire [15:0] n1554_o;
  wire n1555_o;
  wire n1558_o;
  wire n1565_o;
  wire [1:0] n1566_o;
  wire [13:0] n1567_o;
  wire [15:0] n1568_o;
  wire n1571_o;
  wire n1578_o;
  wire [14:0] n1579_o;
  wire [15:0] n1580_o;
  wire [1:0] n1581_o;
  wire [6:0] n1583_o;
  wire n1584_o;
  wire n1591_o;
  wire n1594_o;
  wire n1601_o;
  wire n1602_o;
  wire n1605_o;
  wire n1612_o;
  wire n1613_o;
  wire n1614_o;
  wire n1617_o;
  wire n1624_o;
  wire n1625_o;
  wire n1626_o;
  wire n1627_o;
  wire n1628_o;
  wire [3:0] n1629_o;
  wire [15:0] n1630_o;
  wire n1632_o;
  wire n1633_o;
  wire n1634_o;
  wire n1635_o;
  wire [15:0] n1636_o;
  wire [15:0] n1637_o;
  wire n1640_o;
  wire n1647_o;
  wire n1648_o;
  wire n1651_o;
  wire n1658_o;
  wire n1659_o;
  wire n1660_o;
  wire n1661_o;
  wire [23:0] n1662_o;
  wire n1664_o;
  wire n1666_o;
  wire n1668_o;
  wire n1669_o;
  wire n1670_o;
  wire n1672_o;
  wire n1674_o;
  wire n1676_o;
  wire n1677_o;
  wire n1678_o;
  wire [3:0] n1680_o;
  wire n1682_o;
  wire n1684_o;
  wire n1685_o;
  wire n1686_o;
  wire [14:0] n1687_o;
  wire [15:0] n1689_o;
  wire [15:0] n1690_o;
  wire n1692_o;
  wire n1694_o;
  wire n1695_o;
  wire n1696_o;
  wire [3:0] n1698_o;
  wire n1700_o;
  wire n1702_o;
  wire n1703_o;
  wire n1704_o;
  wire [3:0] n1706_o;
  wire n1708_o;
  wire n1710_o;
  wire n1711_o;
  wire n1712_o;
  wire [3:0] n1714_o;
  wire n1715_o;
  wire n1716_o;
  wire n1717_o;
  wire n1719_o;
  wire n1721_o;
  wire n1722_o;
  wire n1723_o;
  wire n1724_o;
  wire n1725_o;
  wire [3:0] n1727_o;
  wire n1728_o;
  wire n1729_o;
  wire n1730_o;
  wire n1732_o;
  wire n1734_o;
  wire n1735_o;
  wire n1736_o;
  wire n1737_o;
  wire n1738_o;
  wire [3:0] n1740_o;
  wire n1741_o;
  wire n1742_o;
  wire n1743_o;
  wire n1744_o;
  wire n1746_o;
  wire n1748_o;
  wire n1749_o;
  wire n1750_o;
  wire n1751_o;
  wire n1752_o;
  wire [1:0] n1754_o;
  wire n1756_o;
  wire n1758_o;
  wire n1759_o;
  wire n1760_o;
  wire n1761_o;
  wire [3:0] n1763_o;
  wire [3:0] n1765_o;
  wire n1766_o;
  wire n1768_o;
  wire n1769_o;
  wire n1770_o;
  wire [1:0] n1772_o;
  wire n1774_o;
  wire n1776_o;
  wire n1777_o;
  wire n1779_o;
  wire n1780_o;
  wire n1781_o;
  wire n1782_o;
  wire n1783_o;
  wire [1:0] n1785_o;
  wire n1787_o;
  wire n1789_o;
  wire n1790_o;
  wire n1792_o;
  wire n1793_o;
  wire n1794_o;
  wire n1795_o;
  wire n1796_o;
  wire [1:0] n1798_o;
  wire n1800_o;
  wire n1802_o;
  wire n1804_o;
  wire n1805_o;
  wire n1807_o;
  wire n1808_o;
  wire n1809_o;
  wire n1810_o;
  wire n1811_o;
  wire n1812_o;
  wire [1:0] n1814_o;
  wire n1816_o;
  wire n1818_o;
  wire [4:0] n1819_o;
  wire n1821_o;
  wire n1823_o;
  wire n1824_o;
  wire n1826_o;
  wire n1827_o;
  wire n1828_o;
  wire n1829_o;
  wire n1830_o;
  wire n1831_o;
  wire n1832_o;
  wire [1:0] n1834_o;
  wire n1836_o;
  wire n1838_o;
  wire [4:0] n1839_o;
  wire n1841_o;
  wire n1843_o;
  wire n1844_o;
  wire n1846_o;
  wire n1847_o;
  wire n1848_o;
  wire n1849_o;
  wire n1850_o;
  wire n1851_o;
  wire n1852_o;
  wire [1:0] n1854_o;
  wire n1856_o;
  wire n1858_o;
  wire [4:0] n1859_o;
  wire n1861_o;
  wire n1863_o;
  wire n1864_o;
  wire n1866_o;
  wire n1867_o;
  wire n1868_o;
  wire n1869_o;
  wire n1870_o;
  wire n1871_o;
  wire n1872_o;
  wire [1:0] n1874_o;
  wire n1876_o;
  wire n1878_o;
  wire [4:0] n1879_o;
  wire n1881_o;
  wire n1883_o;
  wire n1884_o;
  wire n1886_o;
  wire n1887_o;
  wire n1888_o;
  wire n1889_o;
  wire n1890_o;
  wire n1891_o;
  wire n1892_o;
  wire [1:0] n1894_o;
  wire n1896_o;
  wire n1898_o;
  wire [4:0] n1899_o;
  wire n1901_o;
  wire n1903_o;
  wire n1904_o;
  wire n1906_o;
  wire n1907_o;
  wire n1908_o;
  wire n1909_o;
  wire n1910_o;
  wire n1911_o;
  wire n1912_o;
  wire [1:0] n1914_o;
  wire n1916_o;
  wire [4:0] n1917_o;
  wire n1919_o;
  wire n1921_o;
  wire n1922_o;
  wire n1924_o;
  wire n1925_o;
  wire n1926_o;
  wire n1927_o;
  wire n1928_o;
  wire n1929_o;
  wire [1:0] n1931_o;
  wire n1933_o;
  wire [4:0] n1934_o;
  wire n1936_o;
  wire n1938_o;
  wire n1939_o;
  wire n1941_o;
  wire n1942_o;
  wire n1943_o;
  wire n1944_o;
  wire n1945_o;
  wire n1946_o;
  wire [1:0] n1948_o;
  wire [1:0] n1950_o;
  wire [1:0] n1952_o;
  wire [3:0] n1953_o;
  wire n1955_o;
  wire n1957_o;
  wire n1958_o;
  wire n1959_o;
  wire n1961_o;
  wire n1962_o;
  wire [3:0] n1964_o;
  wire [1:0] n1966_o;
  wire n1967_o;
  wire n1968_o;
  wire n1969_o;
  wire n1970_o;
  wire [1:0] n1972_o;
  wire n1973_o;
  wire n1974_o;
  wire n1975_o;
  wire n1976_o;
  wire n1977_o;
  wire [1:0] n1979_o;
  wire n1980_o;
  wire n1982_o;
  wire n1983_o;
  wire n1984_o;
  wire [1:0] n1986_o;
  wire [14:0] n1987_o;
  wire [15:0] n1989_o;
  wire n1991_o;
  wire [13:0] n1992_o;
  wire [14:0] n1994_o;
  wire n1995_o;
  wire [15:0] n1996_o;
  wire n1998_o;
  wire [12:0] n1999_o;
  wire [13:0] n2001_o;
  wire [1:0] n2002_o;
  wire [15:0] n2003_o;
  wire n2005_o;
  wire [11:0] n2006_o;
  wire [12:0] n2008_o;
  wire [2:0] n2009_o;
  wire [15:0] n2010_o;
  wire n2012_o;
  wire [10:0] n2013_o;
  wire [11:0] n2015_o;
  wire [3:0] n2016_o;
  wire [15:0] n2017_o;
  wire n2019_o;
  wire [9:0] n2020_o;
  wire [10:0] n2022_o;
  wire [4:0] n2023_o;
  wire [15:0] n2024_o;
  wire n2026_o;
  wire [8:0] n2027_o;
  wire [9:0] n2029_o;
  wire [5:0] n2030_o;
  wire [15:0] n2031_o;
  wire n2033_o;
  wire [7:0] n2034_o;
  wire [8:0] n2036_o;
  wire [6:0] n2037_o;
  wire [15:0] n2038_o;
  wire n2040_o;
  wire [6:0] n2041_o;
  wire [7:0] n2043_o;
  wire [7:0] n2044_o;
  wire [15:0] n2045_o;
  wire n2047_o;
  wire [5:0] n2048_o;
  wire [6:0] n2050_o;
  wire [8:0] n2051_o;
  wire [15:0] n2052_o;
  wire n2054_o;
  wire [4:0] n2055_o;
  wire [5:0] n2057_o;
  wire [9:0] n2058_o;
  wire [15:0] n2059_o;
  wire n2061_o;
  wire [3:0] n2062_o;
  wire [4:0] n2064_o;
  wire [10:0] n2065_o;
  wire [15:0] n2066_o;
  wire n2068_o;
  wire [2:0] n2069_o;
  wire [3:0] n2071_o;
  wire [11:0] n2072_o;
  wire [15:0] n2073_o;
  wire n2075_o;
  wire [1:0] n2076_o;
  wire [2:0] n2078_o;
  wire [12:0] n2079_o;
  wire [15:0] n2080_o;
  wire n2082_o;
  wire n2083_o;
  wire [1:0] n2085_o;
  wire [13:0] n2086_o;
  wire [15:0] n2087_o;
  wire n2089_o;
  wire [14:0] n2090_o;
  wire [15:0] n2092_o;
  wire n2094_o;
  wire [15:0] n2095_o;
  reg [15:0] n2097_o;
  wire n2098_o;
  wire n2100_o;
  wire n2102_o;
  wire n2104_o;
  wire n2105_o;
  wire n2107_o;
  wire n2108_o;
  wire n2109_o;
  wire n2110_o;
  wire n2111_o;
  wire n2112_o;
  wire n2113_o;
  wire [15:0] n2114_o;
  wire n2116_o;
  wire n2118_o;
  wire n2119_o;
  wire n2120_o;
  wire [14:0] n2121_o;
  wire [15:0] n2123_o;
  wire [15:0] n2124_o;
  wire [14:0] n2125_o;
  wire [15:0] n2127_o;
  wire n2129_o;
  wire [13:0] n2130_o;
  wire [14:0] n2132_o;
  wire n2133_o;
  wire [15:0] n2134_o;
  wire n2136_o;
  wire [12:0] n2137_o;
  wire [13:0] n2139_o;
  wire [1:0] n2140_o;
  wire [15:0] n2141_o;
  wire n2143_o;
  wire [11:0] n2144_o;
  wire [12:0] n2146_o;
  wire [2:0] n2147_o;
  wire [15:0] n2148_o;
  wire n2150_o;
  wire [10:0] n2151_o;
  wire [11:0] n2153_o;
  wire [3:0] n2154_o;
  wire [15:0] n2155_o;
  wire n2157_o;
  wire [9:0] n2158_o;
  wire [10:0] n2160_o;
  wire [4:0] n2161_o;
  wire [15:0] n2162_o;
  wire n2164_o;
  wire [8:0] n2165_o;
  wire [9:0] n2167_o;
  wire [5:0] n2168_o;
  wire [15:0] n2169_o;
  wire n2171_o;
  wire [7:0] n2172_o;
  wire [8:0] n2174_o;
  wire [6:0] n2175_o;
  wire [15:0] n2176_o;
  wire n2178_o;
  wire [6:0] n2179_o;
  wire [7:0] n2181_o;
  wire [7:0] n2182_o;
  wire [15:0] n2183_o;
  wire n2185_o;
  wire [5:0] n2186_o;
  wire [6:0] n2188_o;
  wire [8:0] n2189_o;
  wire [15:0] n2190_o;
  wire n2192_o;
  wire [4:0] n2193_o;
  wire [5:0] n2195_o;
  wire [9:0] n2196_o;
  wire [15:0] n2197_o;
  wire n2199_o;
  wire [3:0] n2200_o;
  wire [4:0] n2202_o;
  wire [10:0] n2203_o;
  wire [15:0] n2204_o;
  wire n2206_o;
  wire [2:0] n2207_o;
  wire [3:0] n2209_o;
  wire [11:0] n2210_o;
  wire [15:0] n2211_o;
  wire n2213_o;
  wire [1:0] n2214_o;
  wire [2:0] n2216_o;
  wire [12:0] n2217_o;
  wire [15:0] n2218_o;
  wire n2220_o;
  wire n2221_o;
  wire [1:0] n2223_o;
  wire [13:0] n2224_o;
  wire [15:0] n2225_o;
  wire n2227_o;
  wire [14:0] n2228_o;
  wire [15:0] n2230_o;
  wire n2232_o;
  wire [15:0] n2233_o;
  reg [15:0] n2235_o;
  wire n2236_o;
  wire n2237_o;
  wire n2239_o;
  wire n2241_o;
  wire n2243_o;
  wire n2244_o;
  wire n2246_o;
  wire n2247_o;
  wire n2248_o;
  wire n2249_o;
  wire n2250_o;
  wire n2251_o;
  wire n2252_o;
  wire [15:0] n2253_o;
  wire n2254_o;
  wire [15:0] n2256_o;
  wire [15:0] n2257_o;
  wire n2258_o;
  wire [15:0] n2260_o;
  wire [15:0] n2261_o;
  wire n2263_o;
  wire n2270_o;
  wire n2271_o;
  wire n2272_o;
  wire n2273_o;
  wire n2274_o;
  wire n2276_o;
  wire n2277_o;
  wire n2279_o;
  wire n2280_o;
  wire n2281_o;
  wire n2282_o;
  wire n2283_o;
  wire n2285_o;
  wire n2286_o;
  wire n2288_o;
  wire n2290_o;
  wire n2297_o;
  wire n2298_o;
  wire n2299_o;
  wire n2300_o;
  wire n2301_o;
  wire n2304_o;
  wire n2311_o;
  wire n2312_o;
  wire [3:0] n2313_o;
  wire n2315_o;
  wire n2317_o;
  wire n2318_o;
  wire n2319_o;
  wire n2320_o;
  wire n2321_o;
  wire [3:0] n2323_o;
  wire n2325_o;
  wire [3:0] n2327_o;
  wire n2329_o;
  wire n2330_o;
  wire n2331_o;
  wire n2332_o;
  wire [3:0] n2334_o;
  wire [3:0] n2335_o;
  wire n2336_o;
  wire [3:0] n2338_o;
  wire n2340_o;
  wire [3:0] n2342_o;
  wire [15:0] n2344_o;
  wire n2345_o;
  wire n2346_o;
  wire n2348_o;
  wire n2349_o;
  wire n2350_o;
  wire n2351_o;
  wire [7:0] n2352_o;
  wire [7:0] n2353_o;
  wire [15:0] n2354_o;
  wire n2356_o;
  wire n2357_o;
  wire [7:0] n2359_o;
  wire n2361_o;
  wire n2363_o;
  wire n2364_o;
  wire n2366_o;
  wire n2367_o;
  wire [7:0] n2368_o;
  wire n2369_o;
  wire n2370_o;
  wire n2371_o;
  wire n2372_o;
  wire n2374_o;
  wire n2375_o;
  wire [7:0] n2376_o;
  wire n2377_o;
  wire n2379_o;
  wire n2380_o;
  wire n2382_o;
  wire n2383_o;
  wire n2385_o;
  wire n2386_o;
  wire n2388_o;
  wire n2389_o;
  wire n2391_o;
  wire n2392_o;
  wire n2394_o;
  wire n2395_o;
  wire n2397_o;
  wire n2398_o;
  wire n2400_o;
  wire n2401_o;
  wire n2403_o;
  wire n2404_o;
  wire n2406_o;
  wire n2407_o;
  wire n2409_o;
  wire n2410_o;
  wire n2412_o;
  wire n2413_o;
  wire n2415_o;
  wire n2416_o;
  wire n2418_o;
  wire n2419_o;
  wire n2421_o;
  wire n2422_o;
  wire n2424_o;
  wire [15:0] n2425_o;
  reg n2427_o;
  wire n2428_o;
  wire n2429_o;
  wire n2430_o;
  wire n2431_o;
  wire [15:0] n2432_o;
  wire [15:0] n2433_o;
  wire [1:0] n2435_o;
  wire [3:0] n2437_o;
  wire [3:0] n2438_o;
  wire [7:0] n2439_o;
  wire n2440_o;
  wire n2441_o;
  wire n2443_o;
  wire n2444_o;
  wire n2445_o;
  wire [3:0] n2447_o;
  wire n2448_o;
  wire n2449_o;
  wire [1:0] n2451_o;
  wire [3:0] n2453_o;
  wire [3:0] n2454_o;
  wire [7:0] n2455_o;
  wire n2456_o;
  wire [3:0] n2457_o;
  wire [7:0] n2458_o;
  wire n2459_o;
  wire n2460_o;
  wire n2461_o;
  wire n2463_o;
  wire n2464_o;
  wire n2465_o;
  wire n2466_o;
  wire [3:0] n2468_o;
  wire [3:0] n2470_o;
  wire [3:0] n2472_o;
  wire [3:0] n2474_o;
  wire n2476_o;
  wire [7:0] n2477_o;
  wire n2479_o;
  wire [7:0] n2480_o;
  wire [55:0] n2481_o;
  wire [63:0] n2483_o;
  wire [55:0] n2484_o;
  wire [63:0] n2485_o;
  wire n2488_o;
  wire n2495_o;
  wire n2496_o;
  wire n2561_o;
  wire [6:0] functionreset0_out_unnamed_mux1;
  wire [3:0] functionreset0_out_unnamed_mux1_2;
  wire [6:0] functionreset0_out_unnamed_mux1_3;
  wire [7:0] scl_memory0_out_unnamed_2;
  wire rxstream0_out_m_rxreadyerror;
  wire rxstream0_out_const_1;
  wire rxstream0_out_m_rx_valid;
  wire [3:0] rxstream0_out_m_rx_endpoint_2;
  wire [7:0] rxstream0_out_m_rx_data_2;
  wire rxstream0_out_m_rx_eop;
  wire rxstream0_out_m_rx_error;
  wire rxfifointerface0_out_unnamed_not_mux1;
  wire rxfifointerface0_out_unnamed_not_mux1_2;
  wire [7:0] rxfifointerface0_out_unnamed_mux1;
  wire [3:0] rxfifointerface0_out_unnamed_mux1_2;
  wire rxfifointerface0_out_const_0_mux1;
  wire rxfifointerface0_out_unnamed_mux2;
  wire [4:0] rxfifointerface0_out_const_10_mux1;
  wire txfifointerface0_out_unnamed_not_mux1;
  wire txfifointerface0_out_unnamed_mux2;
  wire txfifointerface0_out_const_0_mux1;
  wire txfifointerface0_out_tx_ready_2;
  wire txfifointerface0_out_tx_valid;
  wire [3:0] txfifointerface0_out_tx_endpoint;
  wire [7:0] txfifointerface0_out_tx_data;
  wire txfifointerface0_out_unnamed_mux2_2;
  reg n2627_q;
  reg n2628_q;
  reg [7:0] n2629_q;
  reg n2630_q;
  reg n2631_q;
  reg n2632_q;
  reg [1:0] n2633_q;
  reg [3:0] n2634_q;
  reg [1:0] n2635_q;
  reg n2636_q;
  reg n2637_q;
  wire n2638_o;
  reg n2639_q;
  reg [3:0] n2640_q;
  wire [3:0] n2641_o;
  reg [3:0] n2642_q;
  wire [15:0] n2643_o;
  reg [15:0] n2644_q;
  reg [3:0] n2645_q;
  reg [6:0] n2646_q;
  reg [3:0] n2647_q;
  reg [15:0] n2648_q;
  reg [7:0] n2649_q;
  reg [7:0] n2650_q;
  reg [7:0] n2651_q;
  reg [7:0] n2652_q;
  reg [15:0] n2653_q;
  reg [3:0] n2654_q;
  reg [3:0] n2655_q;
  wire [63:0] n2656_o;
  reg [63:0] n2657_q;
  reg [6:0] n2658_q;
  assign out_m_phy_tx_valid_2 = n2288_o;
  assign out_m_phy_tx_data_2 = n2376_o;
  assign out_m_status_linestate = scl_usbgpiophy0_out_m_status_linestate;
  assign out_m_status_rxactive = scl_usbgpiophy0_out_m_status_rxactive;
  assign out_m_out = scl_usbgpiophy0_out_m_out;
  assign out_m_match_delayed1 = scl_usbgpiophy0_out_m_match_delayed1;
  assign out_m_phy_tx_ready = scl_usbgpiophy0_out_unnamed_or_in_valid_mux1_delayed1_not_mux1;
  assign out_unnamed_mux1 = scl_usbgpiophy0_out_unnamed_mux1;
  assign out_unnamed_mux1_2 = scl_usbgpiophy0_out_unnamed_mux1_2;
  assign out_firstdatabit_mux2 = scl_usbgpiophy0_out_firstdatabit_mux2;
  assign out_unnamed_mux2 = scl_usbgpiophy0_out_unnamed_mux2;
  assign out_unnamed_mux1_3 = scl_usbgpiophy0_out_unnamed_mux1_3;
  assign out_set_line_coding_mux1 = n1218_o;
  assign out_unnamed_32 = n1295_o;
  assign out_unnamed_eq_set_line_coding_and_m_phy_rx_error_not_and_m_pid_2_rewired_eq_const_11_and_nested_condition_m_phy_rx_eop = n1661_o;
  assign out_m_packetdata_2_rewired_mux1 = n1662_o;
  assign out_unnamed_mux2_2 = n1672_o;
  assign out_unnamed_not_mux1 = rxfifointerface0_out_unnamed_not_mux1_2;
  assign out_unnamed_mux1_4 = rxfifointerface0_out_unnamed_mux1;
  assign out_unnamed_mux1_5 = rxfifointerface0_out_unnamed_mux1_2;
  assign out_const_0_mux1 = rxfifointerface0_out_const_0_mux1;
  assign out_unnamed_mux2_3 = rxfifointerface0_out_unnamed_mux2;
  assign out_const_10_mux1 = rxfifointerface0_out_const_10_mux1;
  assign out_unnamed_not_mux1_2 = txfifointerface0_out_unnamed_not_mux1;
  assign out_unnamed_mux2_4 = txfifointerface0_out_unnamed_mux2;
  assign out_const_0_mux1_2 = txfifointerface0_out_const_0_mux1;
  assign out_m_packetdata_2_bit_16 = n836_o;
  assign out_m_packetdata_2_bit_17 = n837_o;
  assign out_m_packetdata_2_rewired = n838_o;
  assign out_unnamed_mux2_5 = txfifointerface0_out_unnamed_mux2_2;
  assign out_m_packetdata_2_bit_17_mux1 = n1297_o;
  assign out_m_packetdata_2_bit_16_mux1 = n1296_o;
  assign out_unnamed_txstuffedstream_valid_mux2_rewired_txstuffedstream_valid_mux2_rewired = scl_usbgpiophy0_out_unnamed_txstuffedstream_valid_mux2_rewired_txstuffedstream_valid_mux2_rewired;
  assign out_unnamed_txstuffedstream_mux1_rewired_txstuffedstream_not_mux1_rewired = scl_usbgpiophy0_out_unnamed_txstuffedstream_mux1_rewired_txstuffedstream_not_mux1_rewired;
  /* find_the_damn_issue_sky130.vhd:8579:16  */
  assign s_m_senddatastate_mux8 = n2474_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:8580:16  */
  assign s_m_address_2 = s_m_address; // (signal)
  /* find_the_damn_issue_sky130.vhd:8581:16  */
  assign s_m_configuration_2 = s_m_configuration_3; // (signal)
  /* find_the_damn_issue_sky130.vhd:8582:16  */
  assign s_unnamed_not_mux1_3 = s_unnamed_not_mux1_4; // (signal)
  /* find_the_damn_issue_sky130.vhd:8583:16  */
  assign s_m_rx_eop_2 = s_m_rx_eop_3; // (signal)
  /* find_the_damn_issue_sky130.vhd:8584:16  */
  assign s_m_rxreadyerror_2 = s_m_rxreadyerror; // (signal)
  /* find_the_damn_issue_sky130.vhd:8585:16  */
  assign s_const_1_mux15 = n1986_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:8586:16  */
  assign s_m_newaddress_2 = s_m_newaddress; // (signal)
  /* find_the_damn_issue_sky130.vhd:8587:16  */
  assign s_m_status_sessend = scl_usbgpiophy0_out_m_status_sessend; // (signal)
  /* find_the_damn_issue_sky130.vhd:8588:16  */
  assign s_m_rx_valid = scl_usbgpiophy0_out_m_rx_valid; // (signal)
  /* find_the_damn_issue_sky130.vhd:8589:16  */
  assign s_m_rx_sop = scl_usbgpiophy0_out_m_rx_sop; // (signal)
  /* find_the_damn_issue_sky130.vhd:8590:16  */
  assign s_m_rx_eop = scl_usbgpiophy0_out_m_rx_eop; // (signal)
  /* find_the_damn_issue_sky130.vhd:8591:16  */
  assign s_m_rx_error = scl_usbgpiophy0_out_m_rx_error; // (signal)
  /* find_the_damn_issue_sky130.vhd:8592:16  */
  assign s_m_rx_data = scl_usbgpiophy0_out_m_rx_data; // (signal)
  /* find_the_damn_issue_sky130.vhd:8593:16  */
  assign s_m_phy_rx_error = n2627_q; // (signal)
  /* find_the_damn_issue_sky130.vhd:8594:16  */
  always @*
    s_m_phy_rx_eop = n2628_q; // (isignal)
  initial
    s_m_phy_rx_eop = 1'b0;
  /* find_the_damn_issue_sky130.vhd:8595:16  */
  assign s_m_phy_rx_data = n2629_q; // (signal)
  /* find_the_damn_issue_sky130.vhd:8596:16  */
  assign s_m_phy_rx_sop = n2630_q; // (signal)
  /* find_the_damn_issue_sky130.vhd:8597:16  */
  always @*
    s_m_phy_rx_valid = n2631_q; // (isignal)
  initial
    s_m_phy_rx_valid = 1'b0;
  /* find_the_damn_issue_sky130.vhd:8598:16  */
  assign s_m_rxstatus_sessend = n2632_q; // (signal)
  /* find_the_damn_issue_sky130.vhd:8599:16  */
  assign s_m_rxstatus_linestate = n2633_q; // (signal)
  /* find_the_damn_issue_sky130.vhd:8600:16  */
  always @*
    s_m_state = n2634_q; // (isignal)
  initial
    s_m_state = 4'b0000;
  /* find_the_damn_issue_sky130.vhd:8601:16  */
  assign s_m_state_2 = s_m_state; // (signal)
  /* find_the_damn_issue_sky130.vhd:8602:16  */
  assign s_m_phy_rx_valid_2 = s_m_phy_rx_valid; // (signal)
  /* find_the_damn_issue_sky130.vhd:8603:16  */
  assign s_m_phy_rx_eop_2 = s_m_phy_rx_eop; // (signal)
  /* find_the_damn_issue_sky130.vhd:8604:16  */
  assign s_m_phy_rx_error_2 = s_m_phy_rx_error; // (signal)
  /* find_the_damn_issue_sky130.vhd:8605:16  */
  assign s_m_phy_rx_data_2 = s_m_phy_rx_data; // (signal)
  /* find_the_damn_issue_sky130.vhd:8606:16  */
  assign s_m_rxstatus_linestate_2 = s_m_rxstatus_linestate; // (signal)
  /* find_the_damn_issue_sky130.vhd:8607:16  */
  assign s_m_rxstatus_sessend_2 = s_m_rxstatus_sessend; // (signal)
  /* find_the_damn_issue_sky130.vhd:8608:16  */
  assign s_m_descaddressactive_mux1 = n796_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:8609:16  */
  assign s_m_descdata = scl_memory0_out_unnamed_2; // (signal)
  /* find_the_damn_issue_sky130.vhd:8610:16  */
  always @*
    s_m_sendhandshake = n2635_q; // (isignal)
  initial
    s_m_sendhandshake = 2'b00;
  /* find_the_damn_issue_sky130.vhd:8611:16  */
  assign s_send_mux2 = n659_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:8612:16  */
  always @*
    s_handshakestate = n2636_q; // (isignal)
  initial
    s_handshakestate = 1'b0;
  /* find_the_damn_issue_sky130.vhd:8613:16  */
  assign s_ackexpected_mux3 = n2325_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:8614:16  */
  always @*
    s_ackexpected = n2637_q; // (isignal)
  initial
    s_ackexpected = 1'b0;
  /* find_the_damn_issue_sky130.vhd:8615:16  */
  always @*
    s_incompletetransfer = n2639_q; // (isignal)
  initial
    s_incompletetransfer = 1'b0;
  /* find_the_damn_issue_sky130.vhd:8616:16  */
  always @*
    s_m_packetlentxlimit = n2640_q; // (isignal)
  initial
    s_m_packetlentxlimit = 4'b1000;
  /* find_the_damn_issue_sky130.vhd:8617:16  */
  assign s_m_endpoint = n2642_q; // (signal)
  /* find_the_damn_issue_sky130.vhd:8618:16  */
  assign s_m_endpointmask = n2644_q; // (signal)
  /* find_the_damn_issue_sky130.vhd:8619:16  */
  assign s_m_packetdata_2_rewired_eq_unnamed_mux2_and_m_pid_2_rewired_eq_const_1_not_and_m_pid_2_rewired_eq_const_1_and_m_phy_rx_eop_and_m_phy_rx_error_not_and_m_state_eq_waitfortoken = n1628_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:8620:16  */
  assign s_m_endpoint_mux1 = n1629_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:8621:16  */
  assign s_m_senddatastate = n2645_q; // (signal)
  /* find_the_damn_issue_sky130.vhd:8622:16  */
  always @*
    s_m_newaddress = n2646_q; // (isignal)
  initial
    s_m_newaddress = 7'b0000000;
  /* find_the_damn_issue_sky130.vhd:8623:16  */
  always @*
    s_m_configuration = n2647_q; // (isignal)
  initial
    s_m_configuration = 4'b0000;
  /* find_the_damn_issue_sky130.vhd:8624:16  */
  assign s_m_configuration_3 = s_m_configuration; // (signal)
  /* find_the_damn_issue_sky130.vhd:8625:16  */
  always @*
    s_m_nextoutdatapid = n2648_q; // (isignal)
  initial
    s_m_nextoutdatapid = 16'b0000000000000000;
  /* find_the_damn_issue_sky130.vhd:8626:16  */
  assign s_m_descaddressactive = n2649_q; // (signal)
  /* find_the_damn_issue_sky130.vhd:8627:16  */
  assign s_m_desclengthactive = n2650_q; // (signal)
  /* find_the_damn_issue_sky130.vhd:8628:16  */
  assign s_m_descaddress = n2651_q; // (signal)
  /* find_the_damn_issue_sky130.vhd:8629:16  */
  assign s_m_desclength = n2652_q; // (signal)
  /* find_the_damn_issue_sky130.vhd:8630:16  */
  assign s_m_tx_commit = n673_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:8631:16  */
  assign s_m_tx_rollback = n682_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:8632:16  */
  assign s_m_tx_valid_and_m_tx_endpoint_eq_m_endpoint_mux1_and_m_packetlen_2_eq_m_packetlentxlimit_not_not_and_m_state_eq_senddata = n2312_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:8633:16  */
  assign s_m_tx_ready = n2279_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:8634:16  */
  assign s_unnamed_33 = 1'b0; // (signal)
  /* find_the_damn_issue_sky130.vhd:8635:16  */
  assign s_unnamed_34 = 8'bX; // (signal)
  /* find_the_damn_issue_sky130.vhd:8636:16  */
  assign s_unnamed_35 = 4'bX; // (signal)
  /* find_the_damn_issue_sky130.vhd:8637:16  */
  assign s_m_nextindatapid = n2653_q; // (signal)
  /* find_the_damn_issue_sky130.vhd:8638:16  */
  assign s_m_pid = n2654_q; // (signal)
  /* find_the_damn_issue_sky130.vhd:8639:16  */
  assign s_m_packetlen = n2655_q; // (signal)
  /* find_the_damn_issue_sky130.vhd:8640:16  */
  assign s_m_packetdata = n2657_q; // (signal)
  /* find_the_damn_issue_sky130.vhd:8641:16  */
  assign s_m_rxreadyerror = rxstream0_out_m_rxreadyerror; // (signal)
  /* find_the_damn_issue_sky130.vhd:8642:16  */
  assign s_unnamed_36 = rxstream0_out_const_1; // (signal)
  /* find_the_damn_issue_sky130.vhd:8643:16  */
  assign s_m_rx_valid_2 = rxstream0_out_m_rx_valid; // (signal)
  /* find_the_damn_issue_sky130.vhd:8644:16  */
  assign s_m_rx_endpoint = rxstream0_out_m_rx_endpoint_2; // (signal)
  /* find_the_damn_issue_sky130.vhd:8645:16  */
  assign s_m_rx_data_2 = rxstream0_out_m_rx_data_2; // (signal)
  /* find_the_damn_issue_sky130.vhd:8646:16  */
  assign s_m_rx_eop_3 = rxstream0_out_m_rx_eop; // (signal)
  /* find_the_damn_issue_sky130.vhd:8647:16  */
  assign s_m_rx_error_2 = rxstream0_out_m_rx_error; // (signal)
  /* find_the_damn_issue_sky130.vhd:8648:16  */
  always @*
    s_m_address = n2658_q; // (isignal)
  initial
    s_m_address = 7'b0000000;
  /* find_the_damn_issue_sky130.vhd:8649:16  */
  assign s_unnamed_not_mux1_4 = rxfifointerface0_out_unnamed_not_mux1; // (signal)
  /* find_the_damn_issue_sky130.vhd:8651:16  */
  assign s_tx_valid = txfifointerface0_out_tx_valid; // (signal)
  /* find_the_damn_issue_sky130.vhd:8652:16  */
  assign s_tx_endpoint = txfifointerface0_out_tx_endpoint; // (signal)
  /* find_the_damn_issue_sky130.vhd:8653:16  */
  assign s_tx_data = txfifointerface0_out_tx_data; // (signal)
  /* find_the_damn_issue_sky130.vhd:8654:16  */
  assign s_unnamed_37 = in_unnamed; // (signal)
  /* find_the_damn_issue_sky130.vhd:8655:16  */
  assign s_unnamed_38 = in_unnamed_2; // (signal)
  /* find_the_damn_issue_sky130.vhd:8656:16  */
  assign s_unnamed_39 = in_unnamed_3; // (signal)
  /* find_the_damn_issue_sky130.vhd:8657:16  */
  assign s_unnamed_40 = in_unnamed_4; // (signal)
  /* find_the_damn_issue_sky130.vhd:8658:16  */
  assign s_unnamed_41 = in_unnamed_5; // (signal)
  /* find_the_damn_issue_sky130.vhd:8659:16  */
  assign s_unnamed_42 = in_unnamed_6; // (signal)
  /* find_the_damn_issue_sky130.vhd:8660:16  */
  assign s_unnamed_43 = in_unnamed_7; // (signal)
  /* find_the_damn_issue_sky130.vhd:8661:16  */
  assign s_unnamed_44 = in_unnamed_8; // (signal)
  /* find_the_damn_issue_sky130.vhd:8662:16  */
  assign s_unnamed_45 = in_unnamed_9; // (signal)
  /* find_the_damn_issue_sky130.vhd:8663:16  */
  assign s_unnamed_46 = in_unnamed_10; // (signal)
  /* find_the_damn_issue_sky130.vhd:8664:16  */
  assign s_unnamed_47 = in_unnamed_11; // (signal)
  /* find_the_damn_issue_sky130.vhd:8665:16  */
  assign s_unnamed_48 = in_unnamed_12; // (signal)
  /* find_the_damn_issue_sky130.vhd:8666:16  */
  assign s_unnamed_49 = in_unnamed_14; // (signal)
  /* find_the_damn_issue_sky130.vhd:8667:16  */
  assign s_unnamed_50 = in_unnamed_15; // (signal)
  /* find_the_damn_issue_sky130.vhd:8668:16  */
  assign s_unnamed_51 = in_unnamed_16; // (signal)
  /* find_the_damn_issue_sky130.vhd:8669:16  */
  assign s_unnamed_52 = in_unnamed_30; // (signal)
  /* find_the_damn_issue_sky130.vhd:8670:16  */
  assign s_unnamed_53 = in_unnamed_27; // (signal)
  /* find_the_damn_issue_sky130.vhd:8671:16  */
  assign s_unnamed_54 = in_unnamed_31; // (signal)
  /* find_the_damn_issue_sky130.vhd:8672:16  */
  assign s_unnamed_55 = in_unnamed_25; // (signal)
  /* find_the_damn_issue_sky130.vhd:8673:16  */
  assign s_unnamed_56 = in_unnamed_24; // (signal)
  /* find_the_damn_issue_sky130.vhd:8674:16  */
  assign s_unnamed_57 = in_unnamed_23; // (signal)
  /* find_the_damn_issue_sky130.vhd:8675:16  */
  assign s_unnamed_58 = in_unnamed_22; // (signal)
  /* find_the_damn_issue_sky130.vhd:8676:16  */
  assign s_unnamed_59 = in_unnamed_21; // (signal)
  /* find_the_damn_issue_sky130.vhd:8677:16  */
  assign s_unnamed_60 = in_unnamed_26; // (signal)
  /* find_the_damn_issue_sky130.vhd:8678:16  */
  assign s_m_senddatastate_2_mux2 = n1727_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:8679:16  */
  assign s_unnamed_m_packetdata_2_rewired_eq_const_15_rewired = n1580_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:8680:16  */
  assign s_m_packetdata_2_rewired_2 = n1360_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:8681:16  */
  assign s_unnamed_mux1_6 = functionreset0_out_unnamed_mux1; // (signal)
  /* find_the_damn_issue_sky130.vhd:8682:16  */
  assign s_unnamed_mux1_7 = functionreset0_out_unnamed_mux1_2; // (signal)
  /* find_the_damn_issue_sky130.vhd:8683:16  */
  assign s_unnamed_mux2_6 = n665_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:8684:16  */
  assign s_m_packetlentxlimit_mux2 = n2323_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:8685:16  */
  assign s_unnamed_mux1_8 = functionreset0_out_unnamed_mux1_3; // (signal)
  /* find_the_damn_issue_sky130.vhd:8686:16  */
  assign s_m_packetlen_2_eq_m_packetlentxlimit = n2270_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:8687:16  */
  assign s_m_packetdata_2_rewired_mux1_2 = n1083_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:8688:16  */
  assign s_m_packetdata_2_rewired_mux1_3 = n1189_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:8689:16  */
  assign s_m_descaddressactive_mux9 = n1101_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:8690:16  */
  assign s_m_packetdata_2_rewired_mux1_4 = n2353_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:8691:16  */
  assign s_m_nextoutdatapid_2_mux1_rewired_mux2_rewired_mux1 = n2257_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:8692:16  */
  assign s_m_descaddressactive_mux2 = n2477_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:8693:16  */
  assign s_m_packetdata_2_rewired_mux2 = n2480_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:8694:16  */
  assign s_m_nextindatapid_2_mux2_rewired_mux1_xor_m_endpointmask_mux2 = n2433_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:8695:16  */
  assign s_m_phy_rx_data_rewired_mux2 = n750_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:8696:16  */
  assign s_m_packetlen_2_plus_const_1_mux3 = n2342_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:8697:16  */
  assign s_m_packetdata_2_rewired_m_phy_rx_data_rewired = n2485_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:8698:16  */
  assign s_m_phy_rx_valid_and_m_packetlen_lt_const_8 = n2496_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:8700:9  */
  scl_usbgpiophy scl_usbgpiophy0 (
    .clk(clk),
    .rst_n(rst_n),
    .in_unnamed(s_unnamed_37),
    .in_unnamed_2(s_unnamed_38),
    .in_m_tx_ready(s_unnamed_39),
    .in_m_tx_valid(s_unnamed_40),
    .in_m_tx_data(s_unnamed_41),
    .in_m_crcen(s_unnamed_42),
    .in_m_crcin(s_unnamed_43),
    .in_m_crcout(s_unnamed_44),
    .in_m_crcmatch(s_unnamed_45),
    .in_m_crcreset(s_unnamed_46),
    .in_m_crcshiftout(s_unnamed_47),
    .in_unnamed_3(s_unnamed_48),
    .in_unnamed_4(s_unnamed_49),
    .in_unnamed_5(s_unnamed_50),
    .in_unnamed_6(s_unnamed_51),
    .out_m_status_linestate(scl_usbgpiophy0_out_m_status_linestate),
    .out_m_status_sessend(scl_usbgpiophy0_out_m_status_sessend),
    .out_m_status_rxactive(scl_usbgpiophy0_out_m_status_rxactive),
    .out_m_out(scl_usbgpiophy0_out_m_out),
    .out_m_match_delayed1(scl_usbgpiophy0_out_m_match_delayed1),
    .out_m_rx_valid(scl_usbgpiophy0_out_m_rx_valid),
    .out_m_rx_sop(scl_usbgpiophy0_out_m_rx_sop),
    .out_m_rx_eop(scl_usbgpiophy0_out_m_rx_eop),
    .out_m_rx_error(scl_usbgpiophy0_out_m_rx_error),
    .out_m_rx_data(scl_usbgpiophy0_out_m_rx_data),
    .out_unnamed_or_in_valid_mux1_delayed1_not_mux1(scl_usbgpiophy0_out_unnamed_or_in_valid_mux1_delayed1_not_mux1),
    .out_unnamed_mux1(scl_usbgpiophy0_out_unnamed_mux1),
    .out_unnamed_mux1_2(scl_usbgpiophy0_out_unnamed_mux1_2),
    .out_firstdatabit_mux2(scl_usbgpiophy0_out_firstdatabit_mux2),
    .out_unnamed_mux2(scl_usbgpiophy0_out_unnamed_mux2),
    .out_unnamed_mux1_3(scl_usbgpiophy0_out_unnamed_mux1_3),
    .out_unnamed_txstuffedstream_valid_mux2_rewired_txstuffedstream_valid_mux2_rewired(scl_usbgpiophy0_out_unnamed_txstuffedstream_valid_mux2_rewired_txstuffedstream_valid_mux2_rewired),
    .out_unnamed_txstuffedstream_mux1_rewired_txstuffedstream_not_mux1_rewired(scl_usbgpiophy0_out_unnamed_txstuffedstream_mux1_rewired_txstuffedstream_not_mux1_rewired));
  /* find_the_damn_issue_sky130.vhd:8984:40  */
  assign n615_o = s_m_sendhandshake != 2'b00;
  /* find_the_damn_issue_sky130.vhd:8984:71  */
  assign n617_o = s_handshakestate == 1'b0;
  /* find_the_damn_issue_sky130.vhd:8984:49  */
  assign n618_o = n615_o & n617_o;
  /* find_the_damn_issue_sky130.vhd:8984:17  */
  assign n620_o = n618_o ? 1'b1 : s_handshakestate;
  /* find_the_damn_issue_sky130.vhd:8989:38  */
  assign n622_o = s_handshakestate == 1'b1;
  /* find_the_damn_issue_sky130.vhd:8989:17  */
  assign n625_o = n622_o ? 8'b11010010 : 8'b00000000;
  /* find_the_damn_issue_sky130.vhd:8994:40  */
  assign n627_o = s_m_sendhandshake == 2'b10;
  /* find_the_damn_issue_sky130.vhd:8994:70  */
  assign n629_o = s_handshakestate == 1'b1;
  /* find_the_damn_issue_sky130.vhd:8994:48  */
  assign n630_o = n627_o & n629_o;
  /* find_the_damn_issue_sky130.vhd:8994:17  */
  assign n632_o = n630_o ? 8'b01011010 : n625_o;
  /* find_the_damn_issue_sky130.vhd:8999:40  */
  assign n634_o = s_m_sendhandshake == 2'b11;
  /* find_the_damn_issue_sky130.vhd:8999:70  */
  assign n636_o = s_handshakestate == 1'b1;
  /* find_the_damn_issue_sky130.vhd:8999:48  */
  assign n637_o = n634_o & n636_o;
  /* find_the_damn_issue_sky130.vhd:8999:17  */
  assign n639_o = n637_o ? 8'b00011110 : n632_o;
  /* find_the_damn_issue_sky130.vhd:9004:38  */
  assign n641_o = s_handshakestate == 1'b1;
  /* find_the_damn_issue_sky130.vhd:9004:17  */
  assign n644_o = n641_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:9009:107  */
  assign n647_o = s_handshakestate == 1'b1;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n654_o = n647_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:9009:72  */
  assign n655_o = scl_usbgpiophy0_out_unnamed_or_in_valid_mux1_delayed1_not_mux1 & n654_o;
  /* find_the_damn_issue_sky130.vhd:9010:17  */
  assign n657_o = n655_o ? 2'b00 : s_m_sendhandshake;
  /* find_the_damn_issue_sky130.vhd:9015:17  */
  assign n659_o = n655_o ? 1'b0 : n620_o;
  /* find_the_damn_issue_sky130.vhd:9024:40  */
  assign n661_o = s_m_phy_rx_data_2 == 8'b11010010;
  /* find_the_damn_issue_sky130.vhd:9024:80  */
  assign n662_o = s_ackexpected & s_m_phy_rx_sop;
  /* find_the_damn_issue_sky130.vhd:9024:106  */
  assign n663_o = n662_o & s_m_phy_rx_valid_2;
  /* find_the_damn_issue_sky130.vhd:9024:54  */
  assign n664_o = n661_o & n663_o;
  /* find_the_damn_issue_sky130.vhd:9024:17  */
  assign n665_o = n664_o ? s_unnamed_mux1_6 : s_unnamed_mux1_8;
  /* find_the_damn_issue_sky130.vhd:9029:40  */
  assign n667_o = s_m_phy_rx_data_2 == 8'b11010010;
  /* find_the_damn_issue_sky130.vhd:9029:80  */
  assign n668_o = s_ackexpected & s_m_phy_rx_sop;
  /* find_the_damn_issue_sky130.vhd:9029:106  */
  assign n669_o = n668_o & s_m_phy_rx_valid_2;
  /* find_the_damn_issue_sky130.vhd:9029:54  */
  assign n670_o = n667_o & n669_o;
  /* find_the_damn_issue_sky130.vhd:9029:17  */
  assign n673_o = n670_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:9034:46  */
  assign n675_o = s_m_phy_rx_data_2 == 8'b11010010;
  /* find_the_damn_issue_sky130.vhd:9034:23  */
  assign n676_o = ~n675_o;
  /* find_the_damn_issue_sky130.vhd:9034:87  */
  assign n677_o = s_ackexpected & s_m_phy_rx_sop;
  /* find_the_damn_issue_sky130.vhd:9034:113  */
  assign n678_o = n677_o & s_m_phy_rx_valid_2;
  /* find_the_damn_issue_sky130.vhd:9034:61  */
  assign n679_o = n676_o & n678_o;
  /* find_the_damn_issue_sky130.vhd:9034:17  */
  assign n682_o = n679_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:9039:42  */
  assign n683_o = s_ackexpected & s_m_phy_rx_sop;
  /* find_the_damn_issue_sky130.vhd:9039:68  */
  assign n684_o = n683_o & s_m_phy_rx_valid_2;
  /* find_the_damn_issue_sky130.vhd:9039:17  */
  assign n686_o = n684_o ? 1'b0 : s_ackexpected;
  /* find_the_damn_issue_sky130.vhd:9048:100  */
  assign n689_o = s_m_state_2 == 4'b0001;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n696_o = n689_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:9048:70  */
  assign n697_o = s_m_phy_rx_eop_2 & n696_o;
  /* find_the_damn_issue_sky130.vhd:9053:72  */
  assign n700_o = s_m_state_2 == 4'b0100;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n707_o = n700_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:9054:17  */
  assign n709_o = n707_o ? 1'b1 : n644_o;
  /* find_the_damn_issue_sky130.vhd:9059:17  */
  assign n711_o = n707_o ? 8'b11000011 : n639_o;
  /* find_the_damn_issue_sky130.vhd:9064:74  */
  assign n712_o = scl_usbgpiophy0_out_unnamed_or_in_valid_mux1_delayed1_not_mux1 & n707_o;
  /* find_the_damn_issue_sky130.vhd:9077:102  */
  assign n715_o = s_m_state_2 == 4'b0111;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n722_o = n715_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:9077:72  */
  assign n723_o = s_m_phy_rx_eop_2 & n722_o;
  /* find_the_damn_issue_sky130.vhd:9078:102  */
  assign n726_o = s_m_state_2 == 4'b1000;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n733_o = n726_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:9078:72  */
  assign n734_o = s_m_phy_rx_eop_2 & n733_o;
  /* find_the_damn_issue_sky130.vhd:9082:102  */
  assign n737_o = s_m_state_2 == 4'b0011;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n744_o = n737_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:9082:72  */
  assign n745_o = s_m_phy_rx_eop_2 & n744_o;
  /* find_the_damn_issue_sky130.vhd:9087:46  */
  assign n746_o = s_m_phy_rx_valid_2 & s_m_phy_rx_sop;
  /* find_the_damn_issue_sky130.vhd:9088:74  */
  assign n747_o = s_m_phy_rx_data_2[3:0];
  /* find_the_damn_issue_sky130.vhd:9087:17  */
  assign n748_o = n746_o ? n747_o : s_m_pid;
  /* find_the_damn_issue_sky130.vhd:9092:17  */
  assign n750_o = s_m_phy_rx_eop_2 ? 4'b0000 : n748_o;
  /* find_the_damn_issue_sky130.vhd:9099:44  */
  assign n752_o = s_m_desclengthactive != 8'b00000000;
  /* find_the_damn_issue_sky130.vhd:9099:80  */
  assign n754_o = s_m_packetlen != 4'b1000;
  /* find_the_damn_issue_sky130.vhd:9099:59  */
  assign n755_o = n752_o & n754_o;
  /* find_the_damn_issue_sky130.vhd:9099:109  */
  assign n757_o = s_m_state_2 == 4'b0010;
  /* find_the_damn_issue_sky130.vhd:9099:92  */
  assign n758_o = n755_o & n757_o;
  /* find_the_damn_issue_sky130.vhd:9099:17  */
  assign n760_o = n758_o ? 1'b1 : n709_o;
  /* find_the_damn_issue_sky130.vhd:9104:115  */
  assign n763_o = s_m_desclengthactive != 8'b00000000;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n770_o = n763_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:9104:164  */
  assign n773_o = s_m_packetlen != 4'b1000;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n780_o = n773_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:9104:130  */
  assign n781_o = n770_o & n780_o;
  /* find_the_damn_issue_sky130.vhd:9104:206  */
  assign n784_o = s_m_state_2 == 4'b0010;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n791_o = n784_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:9104:176  */
  assign n792_o = n781_o & n791_o;
  /* find_the_damn_issue_sky130.vhd:9104:74  */
  assign n793_o = scl_usbgpiophy0_out_unnamed_or_in_valid_mux1_delayed1_not_mux1 & n792_o;
  /* find_the_damn_issue_sky130.vhd:9106:78  */
  assign n795_o = s_m_descaddressactive + 8'b00000001;
  /* find_the_damn_issue_sky130.vhd:9105:17  */
  assign n796_o = n793_o ? n795_o : s_m_descaddressactive;
  /* find_the_damn_issue_sky130.vhd:9111:40  */
  assign n798_o = s_m_phy_rx_data_2 == 8'b11010010;
  /* find_the_damn_issue_sky130.vhd:9111:80  */
  assign n799_o = s_ackexpected & s_m_phy_rx_sop;
  /* find_the_damn_issue_sky130.vhd:9111:106  */
  assign n800_o = n799_o & s_m_phy_rx_valid_2;
  /* find_the_damn_issue_sky130.vhd:9111:54  */
  assign n801_o = n798_o & n800_o;
  /* find_the_damn_issue_sky130.vhd:9111:17  */
  assign n802_o = n801_o ? s_m_descaddressactive_mux1 : s_m_descaddress;
  /* find_the_damn_issue_sky130.vhd:9117:78  */
  assign n804_o = s_m_desclengthactive - 8'b00000001;
  /* find_the_damn_issue_sky130.vhd:9116:17  */
  assign n805_o = n793_o ? n804_o : s_m_desclengthactive;
  /* find_the_damn_issue_sky130.vhd:9122:40  */
  assign n807_o = s_m_phy_rx_data_2 == 8'b11010010;
  /* find_the_damn_issue_sky130.vhd:9122:80  */
  assign n808_o = s_ackexpected & s_m_phy_rx_sop;
  /* find_the_damn_issue_sky130.vhd:9122:106  */
  assign n809_o = n808_o & s_m_phy_rx_valid_2;
  /* find_the_damn_issue_sky130.vhd:9122:54  */
  assign n810_o = n807_o & n809_o;
  /* find_the_damn_issue_sky130.vhd:9122:17  */
  assign n811_o = n810_o ? n805_o : s_m_desclength;
  /* find_the_damn_issue_sky130.vhd:9127:24  */
  assign n812_o = ~s_m_phy_rx_error_2;
  /* find_the_damn_issue_sky130.vhd:9127:69  */
  assign n814_o = s_m_pid == 4'b0011;
  /* find_the_damn_issue_sky130.vhd:9127:54  */
  assign n815_o = n812_o & n814_o;
  /* find_the_damn_issue_sky130.vhd:9127:80  */
  assign n816_o = n815_o & n697_o;
  /* find_the_damn_issue_sky130.vhd:9127:17  */
  assign n818_o = n816_o ? 8'b00000000 : n811_o;
  /* find_the_damn_issue_sky130.vhd:9132:50  */
  assign n820_o = s_m_desclengthactive != 8'b00000000;
  /* find_the_damn_issue_sky130.vhd:9132:86  */
  assign n822_o = s_m_packetlen != 4'b1000;
  /* find_the_damn_issue_sky130.vhd:9132:65  */
  assign n823_o = n820_o & n822_o;
  /* find_the_damn_issue_sky130.vhd:9132:23  */
  assign n824_o = ~n823_o;
  /* find_the_damn_issue_sky130.vhd:9132:116  */
  assign n826_o = s_m_state_2 == 4'b0010;
  /* find_the_damn_issue_sky130.vhd:9132:99  */
  assign n827_o = n824_o & n826_o;
  /* find_the_damn_issue_sky130.vhd:9132:17  */
  assign n829_o = n827_o ? 1'b1 : n686_o;
  /* find_the_damn_issue_sky130.vhd:9139:56  */
  assign n830_o = s_m_packetdata[7:0];
  /* find_the_damn_issue_sky130.vhd:9140:52  */
  assign n831_o = s_m_packetdata[15:8];
  /* find_the_damn_issue_sky130.vhd:9141:51  */
  assign n832_o = s_m_packetdata[31:16];
  /* find_the_damn_issue_sky130.vhd:9142:51  */
  assign n833_o = s_m_packetdata[47:32];
  /* find_the_damn_issue_sky130.vhd:9143:52  */
  assign n834_o = s_m_packetdata[63:48];
  /* find_the_damn_issue_sky130.vhd:9144:45  */
  assign n835_o = s_m_packetdata[47:40];
  /* find_the_damn_issue_sky130.vhd:9171:62  */
  assign n836_o = s_m_packetdata[16];
  /* find_the_damn_issue_sky130.vhd:9172:62  */
  assign n837_o = s_m_packetdata[17];
  /* find_the_damn_issue_sky130.vhd:9173:63  */
  assign n838_o = s_m_packetdata[23:0];
  /* find_the_damn_issue_sky130.vhd:9174:61  */
  assign n839_o = s_m_packetdata[35:32];
  /* find_the_damn_issue_sky130.vhd:9175:63  */
  assign n840_o = s_m_packetdata[6:5];
  /* find_the_damn_issue_sky130.vhd:9176:38  */
  assign n842_o = n831_o == 8'b00000000;
  /* find_the_damn_issue_sky130.vhd:9176:85  */
  assign n844_o = n840_o == 2'b00;
  /* find_the_damn_issue_sky130.vhd:9176:101  */
  assign n845_o = ~s_m_phy_rx_error_2;
  /* find_the_damn_issue_sky130.vhd:9176:146  */
  assign n847_o = s_m_pid == 4'b0011;
  /* find_the_damn_issue_sky130.vhd:9176:131  */
  assign n848_o = n845_o & n847_o;
  /* find_the_damn_issue_sky130.vhd:9176:157  */
  assign n849_o = n848_o & n697_o;
  /* find_the_damn_issue_sky130.vhd:9176:93  */
  assign n850_o = n844_o & n849_o;
  /* find_the_damn_issue_sky130.vhd:9176:52  */
  assign n851_o = n842_o & n850_o;
  /* find_the_damn_issue_sky130.vhd:9176:17  */
  assign n853_o = n851_o ? 8'b00001110 : n802_o;
  /* find_the_damn_issue_sky130.vhd:9181:38  */
  assign n855_o = n831_o == 8'b00000000;
  /* find_the_damn_issue_sky130.vhd:9181:85  */
  assign n857_o = n840_o == 2'b00;
  /* find_the_damn_issue_sky130.vhd:9181:101  */
  assign n858_o = ~s_m_phy_rx_error_2;
  /* find_the_damn_issue_sky130.vhd:9181:146  */
  assign n860_o = s_m_pid == 4'b0011;
  /* find_the_damn_issue_sky130.vhd:9181:131  */
  assign n861_o = n858_o & n860_o;
  /* find_the_damn_issue_sky130.vhd:9181:157  */
  assign n862_o = n861_o & n697_o;
  /* find_the_damn_issue_sky130.vhd:9181:93  */
  assign n863_o = n857_o & n862_o;
  /* find_the_damn_issue_sky130.vhd:9181:52  */
  assign n864_o = n855_o & n863_o;
  /* find_the_damn_issue_sky130.vhd:9181:17  */
  assign n866_o = n864_o ? 8'b00000010 : n818_o;
  /* find_the_damn_issue_sky130.vhd:9186:37  */
  assign n868_o = n832_o == 16'b0000000100000000;
  /* find_the_damn_issue_sky130.vhd:9186:81  */
  assign n870_o = n831_o == 8'b00000110;
  /* find_the_damn_issue_sky130.vhd:9186:117  */
  assign n871_o = s_m_packetdata[4:0];
  /* find_the_damn_issue_sky130.vhd:9186:130  */
  assign n873_o = n871_o == 5'b00000;
  /* find_the_damn_issue_sky130.vhd:9186:174  */
  assign n875_o = n840_o == 2'b00;
  /* find_the_damn_issue_sky130.vhd:9186:190  */
  assign n876_o = ~s_m_phy_rx_error_2;
  /* find_the_damn_issue_sky130.vhd:9186:235  */
  assign n878_o = s_m_pid == 4'b0011;
  /* find_the_damn_issue_sky130.vhd:9186:220  */
  assign n879_o = n876_o & n878_o;
  /* find_the_damn_issue_sky130.vhd:9186:246  */
  assign n880_o = n879_o & n697_o;
  /* find_the_damn_issue_sky130.vhd:9186:182  */
  assign n881_o = n875_o & n880_o;
  /* find_the_damn_issue_sky130.vhd:9186:141  */
  assign n882_o = n873_o & n881_o;
  /* find_the_damn_issue_sky130.vhd:9186:95  */
  assign n883_o = n870_o & n882_o;
  /* find_the_damn_issue_sky130.vhd:9186:59  */
  assign n884_o = n868_o & n883_o;
  /* find_the_damn_issue_sky130.vhd:9186:17  */
  assign n886_o = n884_o ? 8'b00010000 : n853_o;
  /* find_the_damn_issue_sky130.vhd:9191:37  */
  assign n888_o = n832_o == 16'b0000000100000000;
  /* find_the_damn_issue_sky130.vhd:9191:81  */
  assign n890_o = n831_o == 8'b00000110;
  /* find_the_damn_issue_sky130.vhd:9191:117  */
  assign n891_o = s_m_packetdata[4:0];
  /* find_the_damn_issue_sky130.vhd:9191:130  */
  assign n893_o = n891_o == 5'b00000;
  /* find_the_damn_issue_sky130.vhd:9191:174  */
  assign n895_o = n840_o == 2'b00;
  /* find_the_damn_issue_sky130.vhd:9191:190  */
  assign n896_o = ~s_m_phy_rx_error_2;
  /* find_the_damn_issue_sky130.vhd:9191:235  */
  assign n898_o = s_m_pid == 4'b0011;
  /* find_the_damn_issue_sky130.vhd:9191:220  */
  assign n899_o = n896_o & n898_o;
  /* find_the_damn_issue_sky130.vhd:9191:246  */
  assign n900_o = n899_o & n697_o;
  /* find_the_damn_issue_sky130.vhd:9191:182  */
  assign n901_o = n895_o & n900_o;
  /* find_the_damn_issue_sky130.vhd:9191:141  */
  assign n902_o = n893_o & n901_o;
  /* find_the_damn_issue_sky130.vhd:9191:95  */
  assign n903_o = n890_o & n902_o;
  /* find_the_damn_issue_sky130.vhd:9191:59  */
  assign n904_o = n888_o & n903_o;
  /* find_the_damn_issue_sky130.vhd:9191:17  */
  assign n906_o = n904_o ? 8'b00010010 : n866_o;
  /* find_the_damn_issue_sky130.vhd:9196:37  */
  assign n908_o = n832_o == 16'b0000001000000000;
  /* find_the_damn_issue_sky130.vhd:9196:81  */
  assign n910_o = n831_o == 8'b00000110;
  /* find_the_damn_issue_sky130.vhd:9196:117  */
  assign n911_o = s_m_packetdata[4:0];
  /* find_the_damn_issue_sky130.vhd:9196:130  */
  assign n913_o = n911_o == 5'b00000;
  /* find_the_damn_issue_sky130.vhd:9196:174  */
  assign n915_o = n840_o == 2'b00;
  /* find_the_damn_issue_sky130.vhd:9196:190  */
  assign n916_o = ~s_m_phy_rx_error_2;
  /* find_the_damn_issue_sky130.vhd:9196:235  */
  assign n918_o = s_m_pid == 4'b0011;
  /* find_the_damn_issue_sky130.vhd:9196:220  */
  assign n919_o = n916_o & n918_o;
  /* find_the_damn_issue_sky130.vhd:9196:246  */
  assign n920_o = n919_o & n697_o;
  /* find_the_damn_issue_sky130.vhd:9196:182  */
  assign n921_o = n915_o & n920_o;
  /* find_the_damn_issue_sky130.vhd:9196:141  */
  assign n922_o = n913_o & n921_o;
  /* find_the_damn_issue_sky130.vhd:9196:95  */
  assign n923_o = n910_o & n922_o;
  /* find_the_damn_issue_sky130.vhd:9196:59  */
  assign n924_o = n908_o & n923_o;
  /* find_the_damn_issue_sky130.vhd:9196:17  */
  assign n926_o = n924_o ? 8'b00100010 : n886_o;
  /* find_the_damn_issue_sky130.vhd:9201:37  */
  assign n928_o = n832_o == 16'b0000001000000000;
  /* find_the_damn_issue_sky130.vhd:9201:81  */
  assign n930_o = n831_o == 8'b00000110;
  /* find_the_damn_issue_sky130.vhd:9201:117  */
  assign n931_o = s_m_packetdata[4:0];
  /* find_the_damn_issue_sky130.vhd:9201:130  */
  assign n933_o = n931_o == 5'b00000;
  /* find_the_damn_issue_sky130.vhd:9201:174  */
  assign n935_o = n840_o == 2'b00;
  /* find_the_damn_issue_sky130.vhd:9201:190  */
  assign n936_o = ~s_m_phy_rx_error_2;
  /* find_the_damn_issue_sky130.vhd:9201:235  */
  assign n938_o = s_m_pid == 4'b0011;
  /* find_the_damn_issue_sky130.vhd:9201:220  */
  assign n939_o = n936_o & n938_o;
  /* find_the_damn_issue_sky130.vhd:9201:246  */
  assign n940_o = n939_o & n697_o;
  /* find_the_damn_issue_sky130.vhd:9201:182  */
  assign n941_o = n935_o & n940_o;
  /* find_the_damn_issue_sky130.vhd:9201:141  */
  assign n942_o = n933_o & n941_o;
  /* find_the_damn_issue_sky130.vhd:9201:95  */
  assign n943_o = n930_o & n942_o;
  /* find_the_damn_issue_sky130.vhd:9201:59  */
  assign n944_o = n928_o & n943_o;
  /* find_the_damn_issue_sky130.vhd:9201:17  */
  assign n946_o = n944_o ? 8'b01000011 : n906_o;
  /* find_the_damn_issue_sky130.vhd:9206:37  */
  assign n948_o = n832_o == 16'b0000001100000000;
  /* find_the_damn_issue_sky130.vhd:9206:81  */
  assign n950_o = n831_o == 8'b00000110;
  /* find_the_damn_issue_sky130.vhd:9206:117  */
  assign n951_o = s_m_packetdata[4:0];
  /* find_the_damn_issue_sky130.vhd:9206:130  */
  assign n953_o = n951_o == 5'b00000;
  /* find_the_damn_issue_sky130.vhd:9206:174  */
  assign n955_o = n840_o == 2'b00;
  /* find_the_damn_issue_sky130.vhd:9206:190  */
  assign n956_o = ~s_m_phy_rx_error_2;
  /* find_the_damn_issue_sky130.vhd:9206:235  */
  assign n958_o = s_m_pid == 4'b0011;
  /* find_the_damn_issue_sky130.vhd:9206:220  */
  assign n959_o = n956_o & n958_o;
  /* find_the_damn_issue_sky130.vhd:9206:246  */
  assign n960_o = n959_o & n697_o;
  /* find_the_damn_issue_sky130.vhd:9206:182  */
  assign n961_o = n955_o & n960_o;
  /* find_the_damn_issue_sky130.vhd:9206:141  */
  assign n962_o = n953_o & n961_o;
  /* find_the_damn_issue_sky130.vhd:9206:95  */
  assign n963_o = n950_o & n962_o;
  /* find_the_damn_issue_sky130.vhd:9206:59  */
  assign n964_o = n948_o & n963_o;
  /* find_the_damn_issue_sky130.vhd:9206:17  */
  assign n966_o = n964_o ? 8'b01100101 : n926_o;
  /* find_the_damn_issue_sky130.vhd:9211:37  */
  assign n968_o = n832_o == 16'b0000001100000000;
  /* find_the_damn_issue_sky130.vhd:9211:81  */
  assign n970_o = n831_o == 8'b00000110;
  /* find_the_damn_issue_sky130.vhd:9211:117  */
  assign n971_o = s_m_packetdata[4:0];
  /* find_the_damn_issue_sky130.vhd:9211:130  */
  assign n973_o = n971_o == 5'b00000;
  /* find_the_damn_issue_sky130.vhd:9211:174  */
  assign n975_o = n840_o == 2'b00;
  /* find_the_damn_issue_sky130.vhd:9211:190  */
  assign n976_o = ~s_m_phy_rx_error_2;
  /* find_the_damn_issue_sky130.vhd:9211:235  */
  assign n978_o = s_m_pid == 4'b0011;
  /* find_the_damn_issue_sky130.vhd:9211:220  */
  assign n979_o = n976_o & n978_o;
  /* find_the_damn_issue_sky130.vhd:9211:246  */
  assign n980_o = n979_o & n697_o;
  /* find_the_damn_issue_sky130.vhd:9211:182  */
  assign n981_o = n975_o & n980_o;
  /* find_the_damn_issue_sky130.vhd:9211:141  */
  assign n982_o = n973_o & n981_o;
  /* find_the_damn_issue_sky130.vhd:9211:95  */
  assign n983_o = n970_o & n982_o;
  /* find_the_damn_issue_sky130.vhd:9211:59  */
  assign n984_o = n968_o & n983_o;
  /* find_the_damn_issue_sky130.vhd:9211:17  */
  assign n986_o = n984_o ? 8'b00000100 : n946_o;
  /* find_the_damn_issue_sky130.vhd:9216:37  */
  assign n988_o = n832_o == 16'b0000001100000001;
  /* find_the_damn_issue_sky130.vhd:9216:81  */
  assign n990_o = n831_o == 8'b00000110;
  /* find_the_damn_issue_sky130.vhd:9216:117  */
  assign n991_o = s_m_packetdata[4:0];
  /* find_the_damn_issue_sky130.vhd:9216:130  */
  assign n993_o = n991_o == 5'b00000;
  /* find_the_damn_issue_sky130.vhd:9216:174  */
  assign n995_o = n840_o == 2'b00;
  /* find_the_damn_issue_sky130.vhd:9216:190  */
  assign n996_o = ~s_m_phy_rx_error_2;
  /* find_the_damn_issue_sky130.vhd:9216:235  */
  assign n998_o = s_m_pid == 4'b0011;
  /* find_the_damn_issue_sky130.vhd:9216:220  */
  assign n999_o = n996_o & n998_o;
  /* find_the_damn_issue_sky130.vhd:9216:246  */
  assign n1000_o = n999_o & n697_o;
  /* find_the_damn_issue_sky130.vhd:9216:182  */
  assign n1001_o = n995_o & n1000_o;
  /* find_the_damn_issue_sky130.vhd:9216:141  */
  assign n1002_o = n993_o & n1001_o;
  /* find_the_damn_issue_sky130.vhd:9216:95  */
  assign n1003_o = n990_o & n1002_o;
  /* find_the_damn_issue_sky130.vhd:9216:59  */
  assign n1004_o = n988_o & n1003_o;
  /* find_the_damn_issue_sky130.vhd:9216:17  */
  assign n1006_o = n1004_o ? 8'b01101001 : n966_o;
  /* find_the_damn_issue_sky130.vhd:9221:37  */
  assign n1008_o = n832_o == 16'b0000001100000001;
  /* find_the_damn_issue_sky130.vhd:9221:81  */
  assign n1010_o = n831_o == 8'b00000110;
  /* find_the_damn_issue_sky130.vhd:9221:117  */
  assign n1011_o = s_m_packetdata[4:0];
  /* find_the_damn_issue_sky130.vhd:9221:130  */
  assign n1013_o = n1011_o == 5'b00000;
  /* find_the_damn_issue_sky130.vhd:9221:174  */
  assign n1015_o = n840_o == 2'b00;
  /* find_the_damn_issue_sky130.vhd:9221:190  */
  assign n1016_o = ~s_m_phy_rx_error_2;
  /* find_the_damn_issue_sky130.vhd:9221:235  */
  assign n1018_o = s_m_pid == 4'b0011;
  /* find_the_damn_issue_sky130.vhd:9221:220  */
  assign n1019_o = n1016_o & n1018_o;
  /* find_the_damn_issue_sky130.vhd:9221:246  */
  assign n1020_o = n1019_o & n697_o;
  /* find_the_damn_issue_sky130.vhd:9221:182  */
  assign n1021_o = n1015_o & n1020_o;
  /* find_the_damn_issue_sky130.vhd:9221:141  */
  assign n1022_o = n1013_o & n1021_o;
  /* find_the_damn_issue_sky130.vhd:9221:95  */
  assign n1023_o = n1010_o & n1022_o;
  /* find_the_damn_issue_sky130.vhd:9221:59  */
  assign n1024_o = n1008_o & n1023_o;
  /* find_the_damn_issue_sky130.vhd:9221:17  */
  assign n1026_o = n1024_o ? 8'b00010010 : n986_o;
  /* find_the_damn_issue_sky130.vhd:9226:37  */
  assign n1028_o = n832_o == 16'b0000001100000010;
  /* find_the_damn_issue_sky130.vhd:9226:81  */
  assign n1030_o = n831_o == 8'b00000110;
  /* find_the_damn_issue_sky130.vhd:9226:117  */
  assign n1031_o = s_m_packetdata[4:0];
  /* find_the_damn_issue_sky130.vhd:9226:130  */
  assign n1033_o = n1031_o == 5'b00000;
  /* find_the_damn_issue_sky130.vhd:9226:174  */
  assign n1035_o = n840_o == 2'b00;
  /* find_the_damn_issue_sky130.vhd:9226:190  */
  assign n1036_o = ~s_m_phy_rx_error_2;
  /* find_the_damn_issue_sky130.vhd:9226:235  */
  assign n1038_o = s_m_pid == 4'b0011;
  /* find_the_damn_issue_sky130.vhd:9226:220  */
  assign n1039_o = n1036_o & n1038_o;
  /* find_the_damn_issue_sky130.vhd:9226:246  */
  assign n1040_o = n1039_o & n697_o;
  /* find_the_damn_issue_sky130.vhd:9226:182  */
  assign n1041_o = n1035_o & n1040_o;
  /* find_the_damn_issue_sky130.vhd:9226:141  */
  assign n1042_o = n1033_o & n1041_o;
  /* find_the_damn_issue_sky130.vhd:9226:95  */
  assign n1043_o = n1030_o & n1042_o;
  /* find_the_damn_issue_sky130.vhd:9226:59  */
  assign n1044_o = n1028_o & n1043_o;
  /* find_the_damn_issue_sky130.vhd:9226:17  */
  assign n1046_o = n1044_o ? 8'b01111011 : n1006_o;
  /* find_the_damn_issue_sky130.vhd:9231:37  */
  assign n1048_o = n832_o == 16'b0000001100000010;
  /* find_the_damn_issue_sky130.vhd:9231:81  */
  assign n1050_o = n831_o == 8'b00000110;
  /* find_the_damn_issue_sky130.vhd:9231:117  */
  assign n1051_o = s_m_packetdata[4:0];
  /* find_the_damn_issue_sky130.vhd:9231:130  */
  assign n1053_o = n1051_o == 5'b00000;
  /* find_the_damn_issue_sky130.vhd:9231:174  */
  assign n1055_o = n840_o == 2'b00;
  /* find_the_damn_issue_sky130.vhd:9231:190  */
  assign n1056_o = ~s_m_phy_rx_error_2;
  /* find_the_damn_issue_sky130.vhd:9231:235  */
  assign n1058_o = s_m_pid == 4'b0011;
  /* find_the_damn_issue_sky130.vhd:9231:220  */
  assign n1059_o = n1056_o & n1058_o;
  /* find_the_damn_issue_sky130.vhd:9231:246  */
  assign n1060_o = n1059_o & n697_o;
  /* find_the_damn_issue_sky130.vhd:9231:182  */
  assign n1061_o = n1055_o & n1060_o;
  /* find_the_damn_issue_sky130.vhd:9231:141  */
  assign n1062_o = n1053_o & n1061_o;
  /* find_the_damn_issue_sky130.vhd:9231:95  */
  assign n1063_o = n1050_o & n1062_o;
  /* find_the_damn_issue_sky130.vhd:9231:59  */
  assign n1064_o = n1048_o & n1063_o;
  /* find_the_damn_issue_sky130.vhd:9231:17  */
  assign n1066_o = n1064_o ? 8'b00100010 : n1026_o;
  /* find_the_damn_issue_sky130.vhd:9236:38  */
  assign n1068_o = n831_o == 8'b00000101;
  /* find_the_damn_issue_sky130.vhd:9236:74  */
  assign n1069_o = s_m_packetdata[4:0];
  /* find_the_damn_issue_sky130.vhd:9236:87  */
  assign n1071_o = n1069_o == 5'b00000;
  /* find_the_damn_issue_sky130.vhd:9236:131  */
  assign n1073_o = n840_o == 2'b00;
  /* find_the_damn_issue_sky130.vhd:9236:147  */
  assign n1074_o = ~s_m_phy_rx_error_2;
  /* find_the_damn_issue_sky130.vhd:9236:192  */
  assign n1076_o = s_m_pid == 4'b0011;
  /* find_the_damn_issue_sky130.vhd:9236:177  */
  assign n1077_o = n1074_o & n1076_o;
  /* find_the_damn_issue_sky130.vhd:9236:203  */
  assign n1078_o = n1077_o & n697_o;
  /* find_the_damn_issue_sky130.vhd:9236:139  */
  assign n1079_o = n1073_o & n1078_o;
  /* find_the_damn_issue_sky130.vhd:9236:98  */
  assign n1080_o = n1071_o & n1079_o;
  /* find_the_damn_issue_sky130.vhd:9236:52  */
  assign n1081_o = n1068_o & n1080_o;
  /* find_the_damn_issue_sky130.vhd:9237:74  */
  assign n1082_o = s_m_packetdata[22:16];
  /* find_the_damn_issue_sky130.vhd:9236:17  */
  assign n1083_o = n1081_o ? n1082_o : s_unnamed_mux1_6;
  /* find_the_damn_issue_sky130.vhd:9241:38  */
  assign n1085_o = n831_o == 8'b00001000;
  /* find_the_damn_issue_sky130.vhd:9241:74  */
  assign n1086_o = s_m_packetdata[4:0];
  /* find_the_damn_issue_sky130.vhd:9241:87  */
  assign n1088_o = n1086_o == 5'b00000;
  /* find_the_damn_issue_sky130.vhd:9241:131  */
  assign n1090_o = n840_o == 2'b00;
  /* find_the_damn_issue_sky130.vhd:9241:147  */
  assign n1091_o = ~s_m_phy_rx_error_2;
  /* find_the_damn_issue_sky130.vhd:9241:192  */
  assign n1093_o = s_m_pid == 4'b0011;
  /* find_the_damn_issue_sky130.vhd:9241:177  */
  assign n1094_o = n1091_o & n1093_o;
  /* find_the_damn_issue_sky130.vhd:9241:203  */
  assign n1095_o = n1094_o & n697_o;
  /* find_the_damn_issue_sky130.vhd:9241:139  */
  assign n1096_o = n1090_o & n1095_o;
  /* find_the_damn_issue_sky130.vhd:9241:98  */
  assign n1097_o = n1088_o & n1096_o;
  /* find_the_damn_issue_sky130.vhd:9241:52  */
  assign n1098_o = n1085_o & n1097_o;
  /* find_the_damn_issue_sky130.vhd:9242:63  */
  assign n1100_o = {4'b0000, s_unnamed_mux1_7};
  /* find_the_damn_issue_sky130.vhd:9241:17  */
  assign n1101_o = n1098_o ? n1100_o : n1046_o;
  /* find_the_damn_issue_sky130.vhd:9246:38  */
  assign n1103_o = n831_o == 8'b00001000;
  /* find_the_damn_issue_sky130.vhd:9246:74  */
  assign n1104_o = s_m_packetdata[4:0];
  /* find_the_damn_issue_sky130.vhd:9246:87  */
  assign n1106_o = n1104_o == 5'b00000;
  /* find_the_damn_issue_sky130.vhd:9246:131  */
  assign n1108_o = n840_o == 2'b00;
  /* find_the_damn_issue_sky130.vhd:9246:147  */
  assign n1109_o = ~s_m_phy_rx_error_2;
  /* find_the_damn_issue_sky130.vhd:9246:192  */
  assign n1111_o = s_m_pid == 4'b0011;
  /* find_the_damn_issue_sky130.vhd:9246:177  */
  assign n1112_o = n1109_o & n1111_o;
  /* find_the_damn_issue_sky130.vhd:9246:203  */
  assign n1113_o = n1112_o & n697_o;
  /* find_the_damn_issue_sky130.vhd:9246:139  */
  assign n1114_o = n1108_o & n1113_o;
  /* find_the_damn_issue_sky130.vhd:9246:98  */
  assign n1115_o = n1106_o & n1114_o;
  /* find_the_damn_issue_sky130.vhd:9246:52  */
  assign n1116_o = n1103_o & n1115_o;
  /* find_the_damn_issue_sky130.vhd:9246:17  */
  assign n1118_o = n1116_o ? 8'b00000001 : n1066_o;
  /* find_the_damn_issue_sky130.vhd:9251:41  */
  assign n1120_o = 16'b0000000000000001 == n832_o;
  /* find_the_damn_issue_sky130.vhd:9251:81  */
  assign n1122_o = n831_o == 8'b00001001;
  /* find_the_damn_issue_sky130.vhd:9251:117  */
  assign n1123_o = s_m_packetdata[4:0];
  /* find_the_damn_issue_sky130.vhd:9251:130  */
  assign n1125_o = n1123_o == 5'b00000;
  /* find_the_damn_issue_sky130.vhd:9251:174  */
  assign n1127_o = n840_o == 2'b00;
  /* find_the_damn_issue_sky130.vhd:9251:190  */
  assign n1128_o = ~s_m_phy_rx_error_2;
  /* find_the_damn_issue_sky130.vhd:9251:235  */
  assign n1130_o = s_m_pid == 4'b0011;
  /* find_the_damn_issue_sky130.vhd:9251:220  */
  assign n1131_o = n1128_o & n1130_o;
  /* find_the_damn_issue_sky130.vhd:9251:246  */
  assign n1132_o = n1131_o & n697_o;
  /* find_the_damn_issue_sky130.vhd:9251:182  */
  assign n1133_o = n1127_o & n1132_o;
  /* find_the_damn_issue_sky130.vhd:9251:141  */
  assign n1134_o = n1125_o & n1133_o;
  /* find_the_damn_issue_sky130.vhd:9251:95  */
  assign n1135_o = n1122_o & n1134_o;
  /* find_the_damn_issue_sky130.vhd:9251:59  */
  assign n1136_o = n1120_o & n1135_o;
  /* find_the_damn_issue_sky130.vhd:9251:17  */
  assign n1139_o = n1136_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:9257:103  */
  assign n1142_o = n831_o == 8'b00001001;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n1149_o = n1142_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:9257:152  */
  assign n1151_o = s_m_packetdata[4:0];
  /* find_the_damn_issue_sky130.vhd:9257:165  */
  assign n1153_o = n1151_o == 5'b00000;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n1160_o = n1153_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:9257:222  */
  assign n1163_o = n840_o == 2'b00;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n1170_o = n1163_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:9257:238  */
  assign n1171_o = ~s_m_phy_rx_error_2;
  /* find_the_damn_issue_sky130.vhd:9257:290  */
  assign n1174_o = s_m_pid == 4'b0011;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n1181_o = n1174_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:9257:262  */
  assign n1182_o = n1171_o & n1181_o;
  /* find_the_damn_issue_sky130.vhd:9257:301  */
  assign n1183_o = n1182_o & n697_o;
  /* find_the_damn_issue_sky130.vhd:9257:230  */
  assign n1184_o = n1170_o & n1183_o;
  /* find_the_damn_issue_sky130.vhd:9257:176  */
  assign n1185_o = n1160_o & n1184_o;
  /* find_the_damn_issue_sky130.vhd:9257:117  */
  assign n1186_o = n1149_o & n1185_o;
  /* find_the_damn_issue_sky130.vhd:9257:68  */
  assign n1187_o = n1139_o & n1186_o;
  /* find_the_damn_issue_sky130.vhd:9259:76  */
  assign n1188_o = s_m_packetdata[19:16];
  /* find_the_damn_issue_sky130.vhd:9258:17  */
  assign n1189_o = n1187_o ? n1188_o : s_unnamed_mux1_7;
  /* find_the_damn_issue_sky130.vhd:9263:49  */
  assign n1191_o = n840_o == 2'b01;
  /* find_the_damn_issue_sky130.vhd:9263:65  */
  assign n1192_o = ~s_m_phy_rx_error_2;
  /* find_the_damn_issue_sky130.vhd:9263:110  */
  assign n1194_o = s_m_pid == 4'b0011;
  /* find_the_damn_issue_sky130.vhd:9263:95  */
  assign n1195_o = n1192_o & n1194_o;
  /* find_the_damn_issue_sky130.vhd:9263:121  */
  assign n1196_o = n1195_o & n697_o;
  /* find_the_damn_issue_sky130.vhd:9263:57  */
  assign n1197_o = n1191_o & n1196_o;
  /* find_the_damn_issue_sky130.vhd:9263:17  */
  assign n1199_o = n1197_o ? 1'b0 : in_unnamed_17;
  /* find_the_damn_issue_sky130.vhd:9268:40  */
  assign n1201_o = n831_o == 8'b00100000;
  /* find_the_damn_issue_sky130.vhd:9268:79  */
  assign n1203_o = n830_o == 8'b00100001;
  /* find_the_damn_issue_sky130.vhd:9268:54  */
  assign n1204_o = n1201_o & n1203_o;
  /* find_the_damn_issue_sky130.vhd:9268:114  */
  assign n1206_o = n833_o == 16'b0000000000000000;
  /* find_the_damn_issue_sky130.vhd:9268:94  */
  assign n1207_o = n1204_o & n1206_o;
  /* find_the_damn_issue_sky130.vhd:9268:170  */
  assign n1209_o = n840_o == 2'b01;
  /* find_the_damn_issue_sky130.vhd:9268:186  */
  assign n1210_o = ~s_m_phy_rx_error_2;
  /* find_the_damn_issue_sky130.vhd:9268:231  */
  assign n1212_o = s_m_pid == 4'b0011;
  /* find_the_damn_issue_sky130.vhd:9268:216  */
  assign n1213_o = n1210_o & n1212_o;
  /* find_the_damn_issue_sky130.vhd:9268:242  */
  assign n1214_o = n1213_o & n697_o;
  /* find_the_damn_issue_sky130.vhd:9268:178  */
  assign n1215_o = n1209_o & n1214_o;
  /* find_the_damn_issue_sky130.vhd:9268:137  */
  assign n1216_o = n1207_o & n1215_o;
  /* find_the_damn_issue_sky130.vhd:9268:17  */
  assign n1218_o = n1216_o ? 1'b1 : n1199_o;
  /* find_the_damn_issue_sky130.vhd:9273:40  */
  assign n1220_o = n831_o == 8'b00100000;
  /* find_the_damn_issue_sky130.vhd:9273:79  */
  assign n1222_o = n830_o == 8'b00100001;
  /* find_the_damn_issue_sky130.vhd:9273:54  */
  assign n1223_o = n1220_o & n1222_o;
  /* find_the_damn_issue_sky130.vhd:9273:114  */
  assign n1225_o = n833_o == 16'b0000000000000000;
  /* find_the_damn_issue_sky130.vhd:9273:94  */
  assign n1226_o = n1223_o & n1225_o;
  /* find_the_damn_issue_sky130.vhd:9273:170  */
  assign n1228_o = n840_o == 2'b01;
  /* find_the_damn_issue_sky130.vhd:9273:186  */
  assign n1229_o = ~s_m_phy_rx_error_2;
  /* find_the_damn_issue_sky130.vhd:9273:231  */
  assign n1231_o = s_m_pid == 4'b0011;
  /* find_the_damn_issue_sky130.vhd:9273:216  */
  assign n1232_o = n1229_o & n1231_o;
  /* find_the_damn_issue_sky130.vhd:9273:242  */
  assign n1233_o = n1232_o & n697_o;
  /* find_the_damn_issue_sky130.vhd:9273:178  */
  assign n1234_o = n1228_o & n1233_o;
  /* find_the_damn_issue_sky130.vhd:9273:137  */
  assign n1235_o = n1226_o & n1234_o;
  /* find_the_damn_issue_sky130.vhd:9273:17  */
  assign n1238_o = n1235_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:9278:68  */
  assign n1241_o = n831_o == 8'b00100010;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n1248_o = n1241_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:9278:120  */
  assign n1251_o = n830_o == 8'b00100001;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n1258_o = n1251_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:9278:82  */
  assign n1259_o = n1248_o & n1258_o;
  /* find_the_damn_issue_sky130.vhd:9278:168  */
  assign n1262_o = n833_o == 16'b0000000000000000;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n1269_o = n1262_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:9278:135  */
  assign n1270_o = n1259_o & n1269_o;
  /* find_the_damn_issue_sky130.vhd:9278:237  */
  assign n1273_o = n840_o == 2'b01;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n1280_o = n1273_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:9278:253  */
  assign n1281_o = ~s_m_phy_rx_error_2;
  /* find_the_damn_issue_sky130.vhd:9278:305  */
  assign n1284_o = s_m_pid == 4'b0011;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n1291_o = n1284_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:9278:277  */
  assign n1292_o = n1281_o & n1291_o;
  /* find_the_damn_issue_sky130.vhd:9278:316  */
  assign n1293_o = n1292_o & n697_o;
  /* find_the_damn_issue_sky130.vhd:9278:245  */
  assign n1294_o = n1280_o & n1293_o;
  /* find_the_damn_issue_sky130.vhd:9278:191  */
  assign n1295_o = n1270_o & n1294_o;
  /* find_the_damn_issue_sky130.vhd:9279:17  */
  assign n1296_o = n1295_o ? n836_o : in_unnamed_18;
  /* find_the_damn_issue_sky130.vhd:9284:17  */
  assign n1297_o = n1295_o ? n837_o : in_unnamed_19;
  /* find_the_damn_issue_sky130.vhd:9289:17  */
  assign n1299_o = n1295_o ? 1'b1 : n1238_o;
  /* find_the_damn_issue_sky130.vhd:9294:38  */
  assign n1301_o = n831_o == 8'b00100000;
  /* find_the_damn_issue_sky130.vhd:9294:85  */
  assign n1303_o = n840_o == 2'b01;
  /* find_the_damn_issue_sky130.vhd:9294:101  */
  assign n1304_o = ~s_m_phy_rx_error_2;
  /* find_the_damn_issue_sky130.vhd:9294:146  */
  assign n1306_o = s_m_pid == 4'b0011;
  /* find_the_damn_issue_sky130.vhd:9294:131  */
  assign n1307_o = n1304_o & n1306_o;
  /* find_the_damn_issue_sky130.vhd:9294:157  */
  assign n1308_o = n1307_o & n697_o;
  /* find_the_damn_issue_sky130.vhd:9294:93  */
  assign n1309_o = n1303_o & n1308_o;
  /* find_the_damn_issue_sky130.vhd:9294:52  */
  assign n1310_o = n1301_o & n1309_o;
  /* find_the_damn_issue_sky130.vhd:9294:17  */
  assign n1313_o = n1310_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:9299:40  */
  assign n1315_o = n831_o == 8'b00100010;
  /* find_the_damn_issue_sky130.vhd:9299:79  */
  assign n1317_o = n830_o == 8'b00100001;
  /* find_the_damn_issue_sky130.vhd:9299:54  */
  assign n1318_o = n1315_o & n1317_o;
  /* find_the_damn_issue_sky130.vhd:9299:114  */
  assign n1320_o = n833_o == 16'b0000000000000000;
  /* find_the_damn_issue_sky130.vhd:9299:94  */
  assign n1321_o = n1318_o & n1320_o;
  /* find_the_damn_issue_sky130.vhd:9299:170  */
  assign n1323_o = n840_o == 2'b01;
  /* find_the_damn_issue_sky130.vhd:9299:186  */
  assign n1324_o = ~s_m_phy_rx_error_2;
  /* find_the_damn_issue_sky130.vhd:9299:231  */
  assign n1326_o = s_m_pid == 4'b0011;
  /* find_the_damn_issue_sky130.vhd:9299:216  */
  assign n1327_o = n1324_o & n1326_o;
  /* find_the_damn_issue_sky130.vhd:9299:242  */
  assign n1328_o = n1327_o & n697_o;
  /* find_the_damn_issue_sky130.vhd:9299:178  */
  assign n1329_o = n1323_o & n1328_o;
  /* find_the_damn_issue_sky130.vhd:9299:137  */
  assign n1330_o = n1321_o & n1329_o;
  /* find_the_damn_issue_sky130.vhd:9299:17  */
  assign n1332_o = n1330_o ? 1'b1 : n1313_o;
  /* find_the_damn_issue_sky130.vhd:9304:47  */
  assign n1333_o = n1299_o | n1332_o;
  /* find_the_damn_issue_sky130.vhd:9305:106  */
  assign n1336_o = n840_o == 2'b01;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n1343_o = n1336_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:9305:122  */
  assign n1344_o = ~s_m_phy_rx_error_2;
  /* find_the_damn_issue_sky130.vhd:9305:174  */
  assign n1347_o = s_m_pid == 4'b0011;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n1354_o = n1347_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:9305:146  */
  assign n1355_o = n1344_o & n1354_o;
  /* find_the_damn_issue_sky130.vhd:9305:185  */
  assign n1356_o = n1355_o & n697_o;
  /* find_the_damn_issue_sky130.vhd:9305:114  */
  assign n1357_o = n1343_o & n1356_o;
  /* find_the_damn_issue_sky130.vhd:9305:60  */
  assign n1358_o = n1333_o & n1357_o;
  /* find_the_damn_issue_sky130.vhd:9306:47  */
  assign n1359_o = s_m_pid[3:2];
  /* find_the_damn_issue_sky130.vhd:9309:63  */
  assign n1360_o = s_m_packetdata[58:55];
  /* find_the_damn_issue_sky130.vhd:9310:126  */
  assign n1363_o = s_m_packetdata_2_rewired_2 == 4'b0000;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n1370_o = n1363_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:9310:83  */
  assign n1372_o = {15'b000000000000000, n1370_o};
  /* find_the_damn_issue_sky130.vhd:9311:150  */
  assign n1373_o = n1372_o[15:2];
  /* find_the_damn_issue_sky130.vhd:9311:207  */
  assign n1376_o = s_m_packetdata_2_rewired_2 == 4'b0001;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n1383_o = n1376_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:9311:164  */
  assign n1384_o = {n1373_o, n1383_o};
  /* find_the_damn_issue_sky130.vhd:9311:262  */
  assign n1385_o = n1372_o[0];
  /* find_the_damn_issue_sky130.vhd:9311:217  */
  assign n1386_o = {n1384_o, n1385_o};
  /* find_the_damn_issue_sky130.vhd:9312:234  */
  assign n1387_o = n1386_o[15:3];
  /* find_the_damn_issue_sky130.vhd:9312:291  */
  assign n1390_o = s_m_packetdata_2_rewired_2 == 4'b0010;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n1397_o = n1390_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:9312:248  */
  assign n1398_o = {n1387_o, n1397_o};
  /* find_the_damn_issue_sky130.vhd:9312:388  */
  assign n1399_o = n1386_o[1:0];
  /* find_the_damn_issue_sky130.vhd:9312:301  */
  assign n1400_o = {n1398_o, n1399_o};
  /* find_the_damn_issue_sky130.vhd:9313:318  */
  assign n1401_o = n1400_o[15:4];
  /* find_the_damn_issue_sky130.vhd:9313:375  */
  assign n1404_o = s_m_packetdata_2_rewired_2 == 4'b0011;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n1411_o = n1404_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:9313:332  */
  assign n1412_o = {n1401_o, n1411_o};
  /* find_the_damn_issue_sky130.vhd:9313:514  */
  assign n1413_o = n1400_o[2:0];
  /* find_the_damn_issue_sky130.vhd:9313:385  */
  assign n1414_o = {n1412_o, n1413_o};
  /* find_the_damn_issue_sky130.vhd:9314:202  */
  assign n1415_o = n1414_o[15:5];
  /* find_the_damn_issue_sky130.vhd:9314:259  */
  assign n1418_o = s_m_packetdata_2_rewired_2 == 4'b0100;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n1425_o = n1418_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:9314:216  */
  assign n1426_o = {n1415_o, n1425_o};
  /* find_the_damn_issue_sky130.vhd:9314:440  */
  assign n1427_o = n1414_o[3:0];
  /* find_the_damn_issue_sky130.vhd:9314:269  */
  assign n1428_o = {n1426_o, n1427_o};
  /* find_the_damn_issue_sky130.vhd:9315:84  */
  assign n1429_o = n1428_o[15:6];
  /* find_the_damn_issue_sky130.vhd:9315:141  */
  assign n1432_o = s_m_packetdata_2_rewired_2 == 4'b0101;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n1439_o = n1432_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:9315:98  */
  assign n1440_o = {n1429_o, n1439_o};
  /* find_the_damn_issue_sky130.vhd:9315:164  */
  assign n1441_o = n1428_o[4:0];
  /* find_the_damn_issue_sky130.vhd:9315:151  */
  assign n1442_o = {n1440_o, n1441_o};
  /* find_the_damn_issue_sky130.vhd:9316:166  */
  assign n1443_o = n1442_o[15:7];
  /* find_the_damn_issue_sky130.vhd:9316:223  */
  assign n1446_o = s_m_packetdata_2_rewired_2 == 4'b0110;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n1453_o = n1446_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:9316:180  */
  assign n1454_o = {n1443_o, n1453_o};
  /* find_the_damn_issue_sky130.vhd:9316:286  */
  assign n1455_o = n1442_o[5:0];
  /* find_the_damn_issue_sky130.vhd:9316:233  */
  assign n1456_o = {n1454_o, n1455_o};
  /* find_the_damn_issue_sky130.vhd:9317:250  */
  assign n1457_o = n1456_o[15:8];
  /* find_the_damn_issue_sky130.vhd:9317:307  */
  assign n1460_o = s_m_packetdata_2_rewired_2 == 4'b0111;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n1467_o = n1460_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:9317:264  */
  assign n1468_o = {n1457_o, n1467_o};
  /* find_the_damn_issue_sky130.vhd:9317:412  */
  assign n1469_o = n1456_o[6:0];
  /* find_the_damn_issue_sky130.vhd:9317:317  */
  assign n1470_o = {n1468_o, n1469_o};
  /* find_the_damn_issue_sky130.vhd:9318:334  */
  assign n1471_o = n1470_o[15:9];
  /* find_the_damn_issue_sky130.vhd:9318:391  */
  assign n1474_o = s_m_packetdata_2_rewired_2 == 4'b1000;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n1481_o = n1474_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:9318:348  */
  assign n1482_o = {n1471_o, n1481_o};
  /* find_the_damn_issue_sky130.vhd:9318:538  */
  assign n1483_o = n1470_o[7:0];
  /* find_the_damn_issue_sky130.vhd:9318:401  */
  assign n1484_o = {n1482_o, n1483_o};
  /* find_the_damn_issue_sky130.vhd:9319:210  */
  assign n1485_o = n1484_o[15:10];
  /* find_the_damn_issue_sky130.vhd:9319:268  */
  assign n1488_o = s_m_packetdata_2_rewired_2 == 4'b1001;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n1495_o = n1488_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:9319:225  */
  assign n1496_o = {n1485_o, n1495_o};
  /* find_the_damn_issue_sky130.vhd:9319:457  */
  assign n1497_o = n1484_o[8:0];
  /* find_the_damn_issue_sky130.vhd:9319:278  */
  assign n1498_o = {n1496_o, n1497_o};
  /* find_the_damn_issue_sky130.vhd:9320:85  */
  assign n1499_o = n1498_o[15:11];
  /* find_the_damn_issue_sky130.vhd:9320:143  */
  assign n1502_o = s_m_packetdata_2_rewired_2 == 4'b1010;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n1509_o = n1502_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:9320:100  */
  assign n1510_o = {n1499_o, n1509_o};
  /* find_the_damn_issue_sky130.vhd:9320:166  */
  assign n1511_o = n1498_o[9:0];
  /* find_the_damn_issue_sky130.vhd:9320:153  */
  assign n1512_o = {n1510_o, n1511_o};
  /* find_the_damn_issue_sky130.vhd:9321:169  */
  assign n1513_o = n1512_o[15:12];
  /* find_the_damn_issue_sky130.vhd:9321:227  */
  assign n1516_o = s_m_packetdata_2_rewired_2 == 4'b1011;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n1523_o = n1516_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:9321:184  */
  assign n1524_o = {n1513_o, n1523_o};
  /* find_the_damn_issue_sky130.vhd:9321:291  */
  assign n1525_o = n1512_o[10:0];
  /* find_the_damn_issue_sky130.vhd:9321:237  */
  assign n1526_o = {n1524_o, n1525_o};
  /* find_the_damn_issue_sky130.vhd:9322:255  */
  assign n1527_o = n1526_o[15:13];
  /* find_the_damn_issue_sky130.vhd:9322:313  */
  assign n1530_o = s_m_packetdata_2_rewired_2 == 4'b1100;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n1537_o = n1530_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:9322:270  */
  assign n1538_o = {n1527_o, n1537_o};
  /* find_the_damn_issue_sky130.vhd:9322:420  */
  assign n1539_o = n1526_o[11:0];
  /* find_the_damn_issue_sky130.vhd:9322:323  */
  assign n1540_o = {n1538_o, n1539_o};
  /* find_the_damn_issue_sky130.vhd:9323:341  */
  assign n1541_o = n1540_o[15:14];
  /* find_the_damn_issue_sky130.vhd:9323:399  */
  assign n1544_o = s_m_packetdata_2_rewired_2 == 4'b1101;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n1551_o = n1544_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:9323:356  */
  assign n1552_o = {n1541_o, n1551_o};
  /* find_the_damn_issue_sky130.vhd:9323:549  */
  assign n1553_o = n1540_o[12:0];
  /* find_the_damn_issue_sky130.vhd:9323:409  */
  assign n1554_o = {n1552_o, n1553_o};
  /* find_the_damn_issue_sky130.vhd:9324:212  */
  assign n1555_o = n1554_o[15];
  /* find_the_damn_issue_sky130.vhd:9324:270  */
  assign n1558_o = s_m_packetdata_2_rewired_2 == 4'b1110;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n1565_o = n1558_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:9324:227  */
  assign n1566_o = {n1555_o, n1565_o};
  /* find_the_damn_issue_sky130.vhd:9324:463  */
  assign n1567_o = n1554_o[13:0];
  /* find_the_damn_issue_sky130.vhd:9324:280  */
  assign n1568_o = {n1566_o, n1567_o};
  /* find_the_damn_issue_sky130.vhd:9325:115  */
  assign n1571_o = s_m_packetdata_2_rewired_2 == 4'b1111;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n1578_o = n1571_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:9325:136  */
  assign n1579_o = n1568_o[14:0];
  /* find_the_damn_issue_sky130.vhd:9325:125  */
  assign n1580_o = {n1578_o, n1579_o};
  /* find_the_damn_issue_sky130.vhd:9327:49  */
  assign n1581_o = s_m_pid[1:0];
  /* find_the_damn_issue_sky130.vhd:9328:226  */
  assign n1583_o = s_m_packetdata[54:48];
  /* find_the_damn_issue_sky130.vhd:9328:241  */
  assign n1584_o = n1583_o == s_unnamed_mux2_6;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n1591_o = n1584_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:9328:304  */
  assign n1594_o = n1359_o == 2'b01;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n1601_o = n1594_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:9328:268  */
  assign n1602_o = ~n1601_o;
  /* find_the_damn_issue_sky130.vhd:9328:352  */
  assign n1605_o = n1581_o == 2'b01;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n1612_o = n1605_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:9328:389  */
  assign n1613_o = ~s_m_phy_rx_error_2;
  /* find_the_damn_issue_sky130.vhd:9328:383  */
  assign n1614_o = s_m_phy_rx_eop_2 & n1613_o;
  /* find_the_damn_issue_sky130.vhd:9328:444  */
  assign n1617_o = s_m_state_2 == 4'b0000;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n1624_o = n1617_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:9328:414  */
  assign n1625_o = n1614_o & n1624_o;
  /* find_the_damn_issue_sky130.vhd:9328:360  */
  assign n1626_o = n1612_o & n1625_o;
  /* find_the_damn_issue_sky130.vhd:9328:313  */
  assign n1627_o = n1602_o & n1626_o;
  /* find_the_damn_issue_sky130.vhd:9328:261  */
  assign n1628_o = n1591_o & n1627_o;
  /* find_the_damn_issue_sky130.vhd:9329:17  */
  assign n1629_o = s_m_packetdata_2_rewired_eq_unnamed_mux2_and_m_pid_2_rewired_eq_const_1_not_and_m_pid_2_rewired_eq_const_1_and_m_phy_rx_eop_and_m_phy_rx_error_not_and_m_state_eq_waitfortoken ? s_m_packetdata_2_rewired_2 : s_m_endpoint;
  /* find_the_damn_issue_sky130.vhd:9334:17  */
  assign n1630_o = s_m_packetdata_2_rewired_eq_unnamed_mux2_and_m_pid_2_rewired_eq_const_1_not_and_m_pid_2_rewired_eq_const_1_and_m_phy_rx_eop_and_m_phy_rx_error_not_and_m_state_eq_waitfortoken ? s_unnamed_m_packetdata_2_rewired_eq_const_15_rewired : s_m_endpointmask;
  /* find_the_damn_issue_sky130.vhd:9339:40  */
  assign n1632_o = s_m_phy_rx_data_2 == 8'b11010010;
  /* find_the_damn_issue_sky130.vhd:9339:80  */
  assign n1633_o = s_ackexpected & s_m_phy_rx_sop;
  /* find_the_damn_issue_sky130.vhd:9339:106  */
  assign n1634_o = n1633_o & s_m_phy_rx_valid_2;
  /* find_the_damn_issue_sky130.vhd:9339:54  */
  assign n1635_o = n1632_o & n1634_o;
  /* find_the_damn_issue_sky130.vhd:9340:76  */
  assign n1636_o = s_m_nextoutdatapid ^ n1630_o;
  /* find_the_damn_issue_sky130.vhd:9339:17  */
  assign n1637_o = n1635_o ? n1636_o : s_m_nextoutdatapid;
  /* find_the_damn_issue_sky130.vhd:9344:169  */
  assign n1640_o = in_unnamed_17 == 1'b1;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n1647_o = n1640_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:9344:200  */
  assign n1648_o = ~s_m_phy_rx_error_2;
  /* find_the_damn_issue_sky130.vhd:9344:262  */
  assign n1651_o = n1581_o == 2'b11;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n1658_o = n1651_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:9344:224  */
  assign n1659_o = n1648_o & n1658_o;
  /* find_the_damn_issue_sky130.vhd:9344:271  */
  assign n1660_o = n1659_o & n745_o;
  /* find_the_damn_issue_sky130.vhd:9344:192  */
  assign n1661_o = n1647_o & n1660_o;
  /* find_the_damn_issue_sky130.vhd:9345:17  */
  assign n1662_o = n1661_o ? n838_o : in_unnamed_20;
  /* find_the_damn_issue_sky130.vhd:9350:17  */
  assign n1664_o = n1661_o ? 1'b0 : in_unnamed_13;
  /* find_the_damn_issue_sky130.vhd:9355:55  */
  assign n1666_o = n1662_o == 24'b000000001110000100000000;
  /* find_the_damn_issue_sky130.vhd:9355:99  */
  assign n1668_o = n835_o == 8'b00000010;
  /* find_the_damn_issue_sky130.vhd:9355:85  */
  assign n1669_o = n1666_o & n1668_o;
  /* find_the_damn_issue_sky130.vhd:9355:114  */
  assign n1670_o = n1669_o & n1661_o;
  /* find_the_damn_issue_sky130.vhd:9355:17  */
  assign n1672_o = n1670_o ? 1'b1 : n1664_o;
  /* find_the_damn_issue_sky130.vhd:9361:40  */
  assign n1674_o = n1359_o == 2'b11;
  /* find_the_damn_issue_sky130.vhd:9361:72  */
  assign n1676_o = s_m_endpoint_mux1 == 4'b0000;
  /* find_the_damn_issue_sky130.vhd:9361:82  */
  assign n1677_o = n1676_o & s_m_packetdata_2_rewired_eq_unnamed_mux2_and_m_pid_2_rewired_eq_const_1_not_and_m_pid_2_rewired_eq_const_1_and_m_phy_rx_eop_and_m_phy_rx_error_not_and_m_state_eq_waitfortoken;
  /* find_the_damn_issue_sky130.vhd:9361:48  */
  assign n1678_o = n1674_o & n1677_o;
  /* find_the_damn_issue_sky130.vhd:9361:17  */
  assign n1680_o = n1678_o ? 4'b0001 : s_m_state;
  /* find_the_damn_issue_sky130.vhd:9366:40  */
  assign n1682_o = n1359_o == 2'b11;
  /* find_the_damn_issue_sky130.vhd:9366:72  */
  assign n1684_o = s_m_endpoint_mux1 == 4'b0000;
  /* find_the_damn_issue_sky130.vhd:9366:82  */
  assign n1685_o = n1684_o & s_m_packetdata_2_rewired_eq_unnamed_mux2_and_m_pid_2_rewired_eq_const_1_not_and_m_pid_2_rewired_eq_const_1_and_m_phy_rx_eop_and_m_phy_rx_error_not_and_m_state_eq_waitfortoken;
  /* find_the_damn_issue_sky130.vhd:9366:48  */
  assign n1686_o = n1682_o & n1685_o;
  /* find_the_damn_issue_sky130.vhd:9367:73  */
  assign n1687_o = s_m_nextindatapid[15:1];
  /* find_the_damn_issue_sky130.vhd:9367:87  */
  assign n1689_o = {n1687_o, 1'b0};
  /* find_the_damn_issue_sky130.vhd:9366:17  */
  assign n1690_o = n1686_o ? n1689_o : s_m_nextindatapid;
  /* find_the_damn_issue_sky130.vhd:9371:40  */
  assign n1692_o = n1359_o == 2'b10;
  /* find_the_damn_issue_sky130.vhd:9371:72  */
  assign n1694_o = s_m_endpoint_mux1 == 4'b0000;
  /* find_the_damn_issue_sky130.vhd:9371:82  */
  assign n1695_o = n1694_o & s_m_packetdata_2_rewired_eq_unnamed_mux2_and_m_pid_2_rewired_eq_const_1_not_and_m_pid_2_rewired_eq_const_1_and_m_phy_rx_eop_and_m_phy_rx_error_not_and_m_state_eq_waitfortoken;
  /* find_the_damn_issue_sky130.vhd:9371:48  */
  assign n1696_o = n1692_o & n1695_o;
  /* find_the_damn_issue_sky130.vhd:9371:17  */
  assign n1698_o = n1696_o ? 4'b0100 : n1680_o;
  /* find_the_damn_issue_sky130.vhd:9376:40  */
  assign n1700_o = n1359_o == 2'b10;
  /* find_the_damn_issue_sky130.vhd:9376:72  */
  assign n1702_o = s_m_endpoint_mux1 == 4'b0000;
  /* find_the_damn_issue_sky130.vhd:9376:82  */
  assign n1703_o = n1702_o & s_m_packetdata_2_rewired_eq_unnamed_mux2_and_m_pid_2_rewired_eq_const_1_not_and_m_pid_2_rewired_eq_const_1_and_m_phy_rx_eop_and_m_phy_rx_error_not_and_m_state_eq_waitfortoken;
  /* find_the_damn_issue_sky130.vhd:9376:48  */
  assign n1704_o = n1700_o & n1703_o;
  /* find_the_damn_issue_sky130.vhd:9376:17  */
  assign n1706_o = n1704_o ? 4'b0010 : s_m_senddatastate;
  /* find_the_damn_issue_sky130.vhd:9381:40  */
  assign n1708_o = n1359_o == 2'b00;
  /* find_the_damn_issue_sky130.vhd:9381:72  */
  assign n1710_o = s_m_endpoint_mux1 == 4'b0000;
  /* find_the_damn_issue_sky130.vhd:9381:82  */
  assign n1711_o = n1710_o & s_m_packetdata_2_rewired_eq_unnamed_mux2_and_m_pid_2_rewired_eq_const_1_not_and_m_pid_2_rewired_eq_const_1_and_m_phy_rx_eop_and_m_phy_rx_error_not_and_m_state_eq_waitfortoken;
  /* find_the_damn_issue_sky130.vhd:9381:48  */
  assign n1712_o = n1708_o & n1711_o;
  /* find_the_damn_issue_sky130.vhd:9381:17  */
  assign n1714_o = n1712_o ? 4'b0011 : n1698_o;
  /* find_the_damn_issue_sky130.vhd:9386:91  */
  assign n1715_o = s_tx_endpoint == s_m_endpoint_mux1;
  /* find_the_damn_issue_sky130.vhd:9386:70  */
  assign n1716_o = s_tx_valid & n1715_o;
  /* find_the_damn_issue_sky130.vhd:9386:49  */
  assign n1717_o = s_incompletetransfer | n1716_o;
  /* find_the_damn_issue_sky130.vhd:9386:138  */
  assign n1719_o = n1359_o == 2'b10;
  /* find_the_damn_issue_sky130.vhd:9386:176  */
  assign n1721_o = s_m_endpoint_mux1 == 4'b0000;
  /* find_the_damn_issue_sky130.vhd:9386:153  */
  assign n1722_o = ~n1721_o;
  /* find_the_damn_issue_sky130.vhd:9386:187  */
  assign n1723_o = n1722_o & s_m_packetdata_2_rewired_eq_unnamed_mux2_and_m_pid_2_rewired_eq_const_1_not_and_m_pid_2_rewired_eq_const_1_and_m_phy_rx_eop_and_m_phy_rx_error_not_and_m_state_eq_waitfortoken;
  /* find_the_damn_issue_sky130.vhd:9386:146  */
  assign n1724_o = n1719_o & n1723_o;
  /* find_the_damn_issue_sky130.vhd:9386:114  */
  assign n1725_o = n1717_o & n1724_o;
  /* find_the_damn_issue_sky130.vhd:9386:17  */
  assign n1727_o = n1725_o ? 4'b0110 : n1706_o;
  /* find_the_damn_issue_sky130.vhd:9391:91  */
  assign n1728_o = s_tx_endpoint == s_m_endpoint_mux1;
  /* find_the_damn_issue_sky130.vhd:9391:70  */
  assign n1729_o = s_tx_valid & n1728_o;
  /* find_the_damn_issue_sky130.vhd:9391:49  */
  assign n1730_o = s_incompletetransfer | n1729_o;
  /* find_the_damn_issue_sky130.vhd:9391:138  */
  assign n1732_o = n1359_o == 2'b10;
  /* find_the_damn_issue_sky130.vhd:9391:176  */
  assign n1734_o = s_m_endpoint_mux1 == 4'b0000;
  /* find_the_damn_issue_sky130.vhd:9391:153  */
  assign n1735_o = ~n1734_o;
  /* find_the_damn_issue_sky130.vhd:9391:187  */
  assign n1736_o = n1735_o & s_m_packetdata_2_rewired_eq_unnamed_mux2_and_m_pid_2_rewired_eq_const_1_not_and_m_pid_2_rewired_eq_const_1_and_m_phy_rx_eop_and_m_phy_rx_error_not_and_m_state_eq_waitfortoken;
  /* find_the_damn_issue_sky130.vhd:9391:146  */
  assign n1737_o = n1732_o & n1736_o;
  /* find_the_damn_issue_sky130.vhd:9391:114  */
  assign n1738_o = n1730_o & n1737_o;
  /* find_the_damn_issue_sky130.vhd:9391:17  */
  assign n1740_o = n1738_o ? 4'b0100 : n1714_o;
  /* find_the_damn_issue_sky130.vhd:9396:97  */
  assign n1741_o = s_tx_endpoint == s_m_endpoint_mux1;
  /* find_the_damn_issue_sky130.vhd:9396:76  */
  assign n1742_o = s_tx_valid & n1741_o;
  /* find_the_damn_issue_sky130.vhd:9396:55  */
  assign n1743_o = s_incompletetransfer | n1742_o;
  /* find_the_damn_issue_sky130.vhd:9396:23  */
  assign n1744_o = ~n1743_o;
  /* find_the_damn_issue_sky130.vhd:9396:145  */
  assign n1746_o = n1359_o == 2'b10;
  /* find_the_damn_issue_sky130.vhd:9396:183  */
  assign n1748_o = s_m_endpoint_mux1 == 4'b0000;
  /* find_the_damn_issue_sky130.vhd:9396:160  */
  assign n1749_o = ~n1748_o;
  /* find_the_damn_issue_sky130.vhd:9396:194  */
  assign n1750_o = n1749_o & s_m_packetdata_2_rewired_eq_unnamed_mux2_and_m_pid_2_rewired_eq_const_1_not_and_m_pid_2_rewired_eq_const_1_and_m_phy_rx_eop_and_m_phy_rx_error_not_and_m_state_eq_waitfortoken;
  /* find_the_damn_issue_sky130.vhd:9396:153  */
  assign n1751_o = n1746_o & n1750_o;
  /* find_the_damn_issue_sky130.vhd:9396:121  */
  assign n1752_o = n1744_o & n1751_o;
  /* find_the_damn_issue_sky130.vhd:9396:17  */
  assign n1754_o = n1752_o ? 2'b10 : n657_o;
  /* find_the_damn_issue_sky130.vhd:9401:40  */
  assign n1756_o = n1359_o == 2'b00;
  /* find_the_damn_issue_sky130.vhd:9401:78  */
  assign n1758_o = s_m_endpoint_mux1 == 4'b0000;
  /* find_the_damn_issue_sky130.vhd:9401:55  */
  assign n1759_o = ~n1758_o;
  /* find_the_damn_issue_sky130.vhd:9401:89  */
  assign n1760_o = n1759_o & s_m_packetdata_2_rewired_eq_unnamed_mux2_and_m_pid_2_rewired_eq_const_1_not_and_m_pid_2_rewired_eq_const_1_and_m_phy_rx_eop_and_m_phy_rx_error_not_and_m_state_eq_waitfortoken;
  /* find_the_damn_issue_sky130.vhd:9401:48  */
  assign n1761_o = n1756_o & n1760_o;
  /* find_the_damn_issue_sky130.vhd:9401:17  */
  assign n1763_o = n1761_o ? 4'b0111 : n1740_o;
  /* find_the_damn_issue_sky130.vhd:9406:17  */
  assign n1765_o = n697_o ? 4'b0000 : n1763_o;
  /* find_the_damn_issue_sky130.vhd:9411:24  */
  assign n1766_o = ~s_m_phy_rx_error_2;
  /* find_the_damn_issue_sky130.vhd:9411:69  */
  assign n1768_o = s_m_pid == 4'b0011;
  /* find_the_damn_issue_sky130.vhd:9411:54  */
  assign n1769_o = n1766_o & n1768_o;
  /* find_the_damn_issue_sky130.vhd:9411:80  */
  assign n1770_o = n1769_o & n697_o;
  /* find_the_damn_issue_sky130.vhd:9411:17  */
  assign n1772_o = n1770_o ? 2'b11 : n1754_o;
  /* find_the_damn_issue_sky130.vhd:9416:38  */
  assign n1774_o = n831_o == 8'b00000000;
  /* find_the_damn_issue_sky130.vhd:9416:85  */
  assign n1776_o = n840_o == 2'b00;
  /* find_the_damn_issue_sky130.vhd:9416:101  */
  assign n1777_o = ~s_m_phy_rx_error_2;
  /* find_the_damn_issue_sky130.vhd:9416:146  */
  assign n1779_o = s_m_pid == 4'b0011;
  /* find_the_damn_issue_sky130.vhd:9416:131  */
  assign n1780_o = n1777_o & n1779_o;
  /* find_the_damn_issue_sky130.vhd:9416:157  */
  assign n1781_o = n1780_o & n697_o;
  /* find_the_damn_issue_sky130.vhd:9416:93  */
  assign n1782_o = n1776_o & n1781_o;
  /* find_the_damn_issue_sky130.vhd:9416:52  */
  assign n1783_o = n1774_o & n1782_o;
  /* find_the_damn_issue_sky130.vhd:9416:17  */
  assign n1785_o = n1783_o ? 2'b01 : n1772_o;
  /* find_the_damn_issue_sky130.vhd:9421:38  */
  assign n1787_o = n831_o == 8'b00000001;
  /* find_the_damn_issue_sky130.vhd:9421:85  */
  assign n1789_o = n840_o == 2'b00;
  /* find_the_damn_issue_sky130.vhd:9421:101  */
  assign n1790_o = ~s_m_phy_rx_error_2;
  /* find_the_damn_issue_sky130.vhd:9421:146  */
  assign n1792_o = s_m_pid == 4'b0011;
  /* find_the_damn_issue_sky130.vhd:9421:131  */
  assign n1793_o = n1790_o & n1792_o;
  /* find_the_damn_issue_sky130.vhd:9421:157  */
  assign n1794_o = n1793_o & n697_o;
  /* find_the_damn_issue_sky130.vhd:9421:93  */
  assign n1795_o = n1789_o & n1794_o;
  /* find_the_damn_issue_sky130.vhd:9421:52  */
  assign n1796_o = n1787_o & n1795_o;
  /* find_the_damn_issue_sky130.vhd:9421:17  */
  assign n1798_o = n1796_o ? 2'b01 : n1785_o;
  /* find_the_damn_issue_sky130.vhd:9426:37  */
  assign n1800_o = n832_o == 16'b0000000000000000;
  /* find_the_damn_issue_sky130.vhd:9426:81  */
  assign n1802_o = n831_o == 8'b00000011;
  /* find_the_damn_issue_sky130.vhd:9426:128  */
  assign n1804_o = n840_o == 2'b00;
  /* find_the_damn_issue_sky130.vhd:9426:144  */
  assign n1805_o = ~s_m_phy_rx_error_2;
  /* find_the_damn_issue_sky130.vhd:9426:189  */
  assign n1807_o = s_m_pid == 4'b0011;
  /* find_the_damn_issue_sky130.vhd:9426:174  */
  assign n1808_o = n1805_o & n1807_o;
  /* find_the_damn_issue_sky130.vhd:9426:200  */
  assign n1809_o = n1808_o & n697_o;
  /* find_the_damn_issue_sky130.vhd:9426:136  */
  assign n1810_o = n1804_o & n1809_o;
  /* find_the_damn_issue_sky130.vhd:9426:95  */
  assign n1811_o = n1802_o & n1810_o;
  /* find_the_damn_issue_sky130.vhd:9426:59  */
  assign n1812_o = n1800_o & n1811_o;
  /* find_the_damn_issue_sky130.vhd:9426:17  */
  assign n1814_o = n1812_o ? 2'b01 : n1798_o;
  /* find_the_damn_issue_sky130.vhd:9431:37  */
  assign n1816_o = n832_o == 16'b0000000100000000;
  /* find_the_damn_issue_sky130.vhd:9431:81  */
  assign n1818_o = n831_o == 8'b00000110;
  /* find_the_damn_issue_sky130.vhd:9431:117  */
  assign n1819_o = s_m_packetdata[4:0];
  /* find_the_damn_issue_sky130.vhd:9431:130  */
  assign n1821_o = n1819_o == 5'b00000;
  /* find_the_damn_issue_sky130.vhd:9431:174  */
  assign n1823_o = n840_o == 2'b00;
  /* find_the_damn_issue_sky130.vhd:9431:190  */
  assign n1824_o = ~s_m_phy_rx_error_2;
  /* find_the_damn_issue_sky130.vhd:9431:235  */
  assign n1826_o = s_m_pid == 4'b0011;
  /* find_the_damn_issue_sky130.vhd:9431:220  */
  assign n1827_o = n1824_o & n1826_o;
  /* find_the_damn_issue_sky130.vhd:9431:246  */
  assign n1828_o = n1827_o & n697_o;
  /* find_the_damn_issue_sky130.vhd:9431:182  */
  assign n1829_o = n1823_o & n1828_o;
  /* find_the_damn_issue_sky130.vhd:9431:141  */
  assign n1830_o = n1821_o & n1829_o;
  /* find_the_damn_issue_sky130.vhd:9431:95  */
  assign n1831_o = n1818_o & n1830_o;
  /* find_the_damn_issue_sky130.vhd:9431:59  */
  assign n1832_o = n1816_o & n1831_o;
  /* find_the_damn_issue_sky130.vhd:9431:17  */
  assign n1834_o = n1832_o ? 2'b01 : n1814_o;
  /* find_the_damn_issue_sky130.vhd:9436:37  */
  assign n1836_o = n832_o == 16'b0000001000000000;
  /* find_the_damn_issue_sky130.vhd:9436:81  */
  assign n1838_o = n831_o == 8'b00000110;
  /* find_the_damn_issue_sky130.vhd:9436:117  */
  assign n1839_o = s_m_packetdata[4:0];
  /* find_the_damn_issue_sky130.vhd:9436:130  */
  assign n1841_o = n1839_o == 5'b00000;
  /* find_the_damn_issue_sky130.vhd:9436:174  */
  assign n1843_o = n840_o == 2'b00;
  /* find_the_damn_issue_sky130.vhd:9436:190  */
  assign n1844_o = ~s_m_phy_rx_error_2;
  /* find_the_damn_issue_sky130.vhd:9436:235  */
  assign n1846_o = s_m_pid == 4'b0011;
  /* find_the_damn_issue_sky130.vhd:9436:220  */
  assign n1847_o = n1844_o & n1846_o;
  /* find_the_damn_issue_sky130.vhd:9436:246  */
  assign n1848_o = n1847_o & n697_o;
  /* find_the_damn_issue_sky130.vhd:9436:182  */
  assign n1849_o = n1843_o & n1848_o;
  /* find_the_damn_issue_sky130.vhd:9436:141  */
  assign n1850_o = n1841_o & n1849_o;
  /* find_the_damn_issue_sky130.vhd:9436:95  */
  assign n1851_o = n1838_o & n1850_o;
  /* find_the_damn_issue_sky130.vhd:9436:59  */
  assign n1852_o = n1836_o & n1851_o;
  /* find_the_damn_issue_sky130.vhd:9436:17  */
  assign n1854_o = n1852_o ? 2'b01 : n1834_o;
  /* find_the_damn_issue_sky130.vhd:9441:37  */
  assign n1856_o = n832_o == 16'b0000001100000000;
  /* find_the_damn_issue_sky130.vhd:9441:81  */
  assign n1858_o = n831_o == 8'b00000110;
  /* find_the_damn_issue_sky130.vhd:9441:117  */
  assign n1859_o = s_m_packetdata[4:0];
  /* find_the_damn_issue_sky130.vhd:9441:130  */
  assign n1861_o = n1859_o == 5'b00000;
  /* find_the_damn_issue_sky130.vhd:9441:174  */
  assign n1863_o = n840_o == 2'b00;
  /* find_the_damn_issue_sky130.vhd:9441:190  */
  assign n1864_o = ~s_m_phy_rx_error_2;
  /* find_the_damn_issue_sky130.vhd:9441:235  */
  assign n1866_o = s_m_pid == 4'b0011;
  /* find_the_damn_issue_sky130.vhd:9441:220  */
  assign n1867_o = n1864_o & n1866_o;
  /* find_the_damn_issue_sky130.vhd:9441:246  */
  assign n1868_o = n1867_o & n697_o;
  /* find_the_damn_issue_sky130.vhd:9441:182  */
  assign n1869_o = n1863_o & n1868_o;
  /* find_the_damn_issue_sky130.vhd:9441:141  */
  assign n1870_o = n1861_o & n1869_o;
  /* find_the_damn_issue_sky130.vhd:9441:95  */
  assign n1871_o = n1858_o & n1870_o;
  /* find_the_damn_issue_sky130.vhd:9441:59  */
  assign n1872_o = n1856_o & n1871_o;
  /* find_the_damn_issue_sky130.vhd:9441:17  */
  assign n1874_o = n1872_o ? 2'b01 : n1854_o;
  /* find_the_damn_issue_sky130.vhd:9446:37  */
  assign n1876_o = n832_o == 16'b0000001100000001;
  /* find_the_damn_issue_sky130.vhd:9446:81  */
  assign n1878_o = n831_o == 8'b00000110;
  /* find_the_damn_issue_sky130.vhd:9446:117  */
  assign n1879_o = s_m_packetdata[4:0];
  /* find_the_damn_issue_sky130.vhd:9446:130  */
  assign n1881_o = n1879_o == 5'b00000;
  /* find_the_damn_issue_sky130.vhd:9446:174  */
  assign n1883_o = n840_o == 2'b00;
  /* find_the_damn_issue_sky130.vhd:9446:190  */
  assign n1884_o = ~s_m_phy_rx_error_2;
  /* find_the_damn_issue_sky130.vhd:9446:235  */
  assign n1886_o = s_m_pid == 4'b0011;
  /* find_the_damn_issue_sky130.vhd:9446:220  */
  assign n1887_o = n1884_o & n1886_o;
  /* find_the_damn_issue_sky130.vhd:9446:246  */
  assign n1888_o = n1887_o & n697_o;
  /* find_the_damn_issue_sky130.vhd:9446:182  */
  assign n1889_o = n1883_o & n1888_o;
  /* find_the_damn_issue_sky130.vhd:9446:141  */
  assign n1890_o = n1881_o & n1889_o;
  /* find_the_damn_issue_sky130.vhd:9446:95  */
  assign n1891_o = n1878_o & n1890_o;
  /* find_the_damn_issue_sky130.vhd:9446:59  */
  assign n1892_o = n1876_o & n1891_o;
  /* find_the_damn_issue_sky130.vhd:9446:17  */
  assign n1894_o = n1892_o ? 2'b01 : n1874_o;
  /* find_the_damn_issue_sky130.vhd:9451:37  */
  assign n1896_o = n832_o == 16'b0000001100000010;
  /* find_the_damn_issue_sky130.vhd:9451:81  */
  assign n1898_o = n831_o == 8'b00000110;
  /* find_the_damn_issue_sky130.vhd:9451:117  */
  assign n1899_o = s_m_packetdata[4:0];
  /* find_the_damn_issue_sky130.vhd:9451:130  */
  assign n1901_o = n1899_o == 5'b00000;
  /* find_the_damn_issue_sky130.vhd:9451:174  */
  assign n1903_o = n840_o == 2'b00;
  /* find_the_damn_issue_sky130.vhd:9451:190  */
  assign n1904_o = ~s_m_phy_rx_error_2;
  /* find_the_damn_issue_sky130.vhd:9451:235  */
  assign n1906_o = s_m_pid == 4'b0011;
  /* find_the_damn_issue_sky130.vhd:9451:220  */
  assign n1907_o = n1904_o & n1906_o;
  /* find_the_damn_issue_sky130.vhd:9451:246  */
  assign n1908_o = n1907_o & n697_o;
  /* find_the_damn_issue_sky130.vhd:9451:182  */
  assign n1909_o = n1903_o & n1908_o;
  /* find_the_damn_issue_sky130.vhd:9451:141  */
  assign n1910_o = n1901_o & n1909_o;
  /* find_the_damn_issue_sky130.vhd:9451:95  */
  assign n1911_o = n1898_o & n1910_o;
  /* find_the_damn_issue_sky130.vhd:9451:59  */
  assign n1912_o = n1896_o & n1911_o;
  /* find_the_damn_issue_sky130.vhd:9451:17  */
  assign n1914_o = n1912_o ? 2'b01 : n1894_o;
  /* find_the_damn_issue_sky130.vhd:9456:38  */
  assign n1916_o = n831_o == 8'b00000101;
  /* find_the_damn_issue_sky130.vhd:9456:74  */
  assign n1917_o = s_m_packetdata[4:0];
  /* find_the_damn_issue_sky130.vhd:9456:87  */
  assign n1919_o = n1917_o == 5'b00000;
  /* find_the_damn_issue_sky130.vhd:9456:131  */
  assign n1921_o = n840_o == 2'b00;
  /* find_the_damn_issue_sky130.vhd:9456:147  */
  assign n1922_o = ~s_m_phy_rx_error_2;
  /* find_the_damn_issue_sky130.vhd:9456:192  */
  assign n1924_o = s_m_pid == 4'b0011;
  /* find_the_damn_issue_sky130.vhd:9456:177  */
  assign n1925_o = n1922_o & n1924_o;
  /* find_the_damn_issue_sky130.vhd:9456:203  */
  assign n1926_o = n1925_o & n697_o;
  /* find_the_damn_issue_sky130.vhd:9456:139  */
  assign n1927_o = n1921_o & n1926_o;
  /* find_the_damn_issue_sky130.vhd:9456:98  */
  assign n1928_o = n1919_o & n1927_o;
  /* find_the_damn_issue_sky130.vhd:9456:52  */
  assign n1929_o = n1916_o & n1928_o;
  /* find_the_damn_issue_sky130.vhd:9456:17  */
  assign n1931_o = n1929_o ? 2'b01 : n1914_o;
  /* find_the_damn_issue_sky130.vhd:9461:38  */
  assign n1933_o = n831_o == 8'b00001000;
  /* find_the_damn_issue_sky130.vhd:9461:74  */
  assign n1934_o = s_m_packetdata[4:0];
  /* find_the_damn_issue_sky130.vhd:9461:87  */
  assign n1936_o = n1934_o == 5'b00000;
  /* find_the_damn_issue_sky130.vhd:9461:131  */
  assign n1938_o = n840_o == 2'b00;
  /* find_the_damn_issue_sky130.vhd:9461:147  */
  assign n1939_o = ~s_m_phy_rx_error_2;
  /* find_the_damn_issue_sky130.vhd:9461:192  */
  assign n1941_o = s_m_pid == 4'b0011;
  /* find_the_damn_issue_sky130.vhd:9461:177  */
  assign n1942_o = n1939_o & n1941_o;
  /* find_the_damn_issue_sky130.vhd:9461:203  */
  assign n1943_o = n1942_o & n697_o;
  /* find_the_damn_issue_sky130.vhd:9461:139  */
  assign n1944_o = n1938_o & n1943_o;
  /* find_the_damn_issue_sky130.vhd:9461:98  */
  assign n1945_o = n1936_o & n1944_o;
  /* find_the_damn_issue_sky130.vhd:9461:52  */
  assign n1946_o = n1933_o & n1945_o;
  /* find_the_damn_issue_sky130.vhd:9461:17  */
  assign n1948_o = n1946_o ? 2'b01 : n1931_o;
  /* find_the_damn_issue_sky130.vhd:9466:17  */
  assign n1950_o = n1187_o ? 2'b01 : n1948_o;
  /* find_the_damn_issue_sky130.vhd:9471:17  */
  assign n1952_o = n1358_o ? 2'b01 : n1950_o;
  /* find_the_damn_issue_sky130.vhd:9476:17  */
  assign n1953_o = n712_o ? s_m_senddatastate : n1765_o;
  /* find_the_damn_issue_sky130.vhd:9481:50  */
  assign n1955_o = s_m_desclengthactive != 8'b00000000;
  /* find_the_damn_issue_sky130.vhd:9481:86  */
  assign n1957_o = s_m_packetlen != 4'b1000;
  /* find_the_damn_issue_sky130.vhd:9481:65  */
  assign n1958_o = n1955_o & n1957_o;
  /* find_the_damn_issue_sky130.vhd:9481:23  */
  assign n1959_o = ~n1958_o;
  /* find_the_damn_issue_sky130.vhd:9481:116  */
  assign n1961_o = s_m_state_2 == 4'b0010;
  /* find_the_damn_issue_sky130.vhd:9481:99  */
  assign n1962_o = n1959_o & n1961_o;
  /* find_the_damn_issue_sky130.vhd:9481:17  */
  assign n1964_o = n1962_o ? 4'b0000 : n1953_o;
  /* find_the_damn_issue_sky130.vhd:9486:17  */
  assign n1966_o = n723_o ? 2'b01 : n1952_o;
  /* find_the_damn_issue_sky130.vhd:9491:23  */
  assign n1967_o = ~s_m_rxreadyerror_2;
  /* find_the_damn_issue_sky130.vhd:9491:60  */
  assign n1968_o = ~s_m_phy_rx_error_2;
  /* find_the_damn_issue_sky130.vhd:9491:90  */
  assign n1969_o = n1968_o & n734_o;
  /* find_the_damn_issue_sky130.vhd:9491:53  */
  assign n1970_o = n1967_o & n1969_o;
  /* find_the_damn_issue_sky130.vhd:9491:17  */
  assign n1972_o = n1970_o ? 2'b01 : n1966_o;
  /* find_the_damn_issue_sky130.vhd:9496:29  */
  assign n1973_o = ~s_m_rxreadyerror_2;
  /* find_the_damn_issue_sky130.vhd:9496:23  */
  assign n1974_o = ~n1973_o;
  /* find_the_damn_issue_sky130.vhd:9496:67  */
  assign n1975_o = ~s_m_phy_rx_error_2;
  /* find_the_damn_issue_sky130.vhd:9496:97  */
  assign n1976_o = n1975_o & n734_o;
  /* find_the_damn_issue_sky130.vhd:9496:60  */
  assign n1977_o = n1974_o & n1976_o;
  /* find_the_damn_issue_sky130.vhd:9496:17  */
  assign n1979_o = n1977_o ? 2'b10 : n1972_o;
  /* find_the_damn_issue_sky130.vhd:9501:24  */
  assign n1980_o = ~s_m_phy_rx_error_2;
  /* find_the_damn_issue_sky130.vhd:9501:79  */
  assign n1982_o = n1581_o == 2'b11;
  /* find_the_damn_issue_sky130.vhd:9501:54  */
  assign n1983_o = n1980_o & n1982_o;
  /* find_the_damn_issue_sky130.vhd:9501:88  */
  assign n1984_o = n1983_o & n745_o;
  /* find_the_damn_issue_sky130.vhd:9501:17  */
  assign n1986_o = n1984_o ? 2'b01 : n1979_o;
  /* find_the_damn_issue_sky130.vhd:9509:108  */
  assign n1987_o = n1690_o[15:1];
  /* find_the_damn_issue_sky130.vhd:9509:122  */
  assign n1989_o = {n1987_o, 1'b0};
  /* find_the_damn_issue_sky130.vhd:9509:25  */
  assign n1991_o = n839_o == 4'b0000;
  /* find_the_damn_issue_sky130.vhd:9510:108  */
  assign n1992_o = n1690_o[15:2];
  /* find_the_damn_issue_sky130.vhd:9510:122  */
  assign n1994_o = {n1992_o, 1'b0};
  /* find_the_damn_issue_sky130.vhd:9510:156  */
  assign n1995_o = n1690_o[0];
  /* find_the_damn_issue_sky130.vhd:9510:128  */
  assign n1996_o = {n1994_o, n1995_o};
  /* find_the_damn_issue_sky130.vhd:9510:25  */
  assign n1998_o = n839_o == 4'b0001;
  /* find_the_damn_issue_sky130.vhd:9511:108  */
  assign n1999_o = n1690_o[15:3];
  /* find_the_damn_issue_sky130.vhd:9511:122  */
  assign n2001_o = {n1999_o, 1'b0};
  /* find_the_damn_issue_sky130.vhd:9511:156  */
  assign n2002_o = n1690_o[1:0];
  /* find_the_damn_issue_sky130.vhd:9511:128  */
  assign n2003_o = {n2001_o, n2002_o};
  /* find_the_damn_issue_sky130.vhd:9511:25  */
  assign n2005_o = n839_o == 4'b0010;
  /* find_the_damn_issue_sky130.vhd:9512:108  */
  assign n2006_o = n1690_o[15:4];
  /* find_the_damn_issue_sky130.vhd:9512:122  */
  assign n2008_o = {n2006_o, 1'b0};
  /* find_the_damn_issue_sky130.vhd:9512:156  */
  assign n2009_o = n1690_o[2:0];
  /* find_the_damn_issue_sky130.vhd:9512:128  */
  assign n2010_o = {n2008_o, n2009_o};
  /* find_the_damn_issue_sky130.vhd:9512:25  */
  assign n2012_o = n839_o == 4'b0011;
  /* find_the_damn_issue_sky130.vhd:9513:108  */
  assign n2013_o = n1690_o[15:5];
  /* find_the_damn_issue_sky130.vhd:9513:122  */
  assign n2015_o = {n2013_o, 1'b0};
  /* find_the_damn_issue_sky130.vhd:9513:156  */
  assign n2016_o = n1690_o[3:0];
  /* find_the_damn_issue_sky130.vhd:9513:128  */
  assign n2017_o = {n2015_o, n2016_o};
  /* find_the_damn_issue_sky130.vhd:9513:25  */
  assign n2019_o = n839_o == 4'b0100;
  /* find_the_damn_issue_sky130.vhd:9514:108  */
  assign n2020_o = n1690_o[15:6];
  /* find_the_damn_issue_sky130.vhd:9514:122  */
  assign n2022_o = {n2020_o, 1'b0};
  /* find_the_damn_issue_sky130.vhd:9514:156  */
  assign n2023_o = n1690_o[4:0];
  /* find_the_damn_issue_sky130.vhd:9514:128  */
  assign n2024_o = {n2022_o, n2023_o};
  /* find_the_damn_issue_sky130.vhd:9514:25  */
  assign n2026_o = n839_o == 4'b0101;
  /* find_the_damn_issue_sky130.vhd:9515:108  */
  assign n2027_o = n1690_o[15:7];
  /* find_the_damn_issue_sky130.vhd:9515:122  */
  assign n2029_o = {n2027_o, 1'b0};
  /* find_the_damn_issue_sky130.vhd:9515:156  */
  assign n2030_o = n1690_o[5:0];
  /* find_the_damn_issue_sky130.vhd:9515:128  */
  assign n2031_o = {n2029_o, n2030_o};
  /* find_the_damn_issue_sky130.vhd:9515:25  */
  assign n2033_o = n839_o == 4'b0110;
  /* find_the_damn_issue_sky130.vhd:9516:108  */
  assign n2034_o = n1690_o[15:8];
  /* find_the_damn_issue_sky130.vhd:9516:122  */
  assign n2036_o = {n2034_o, 1'b0};
  /* find_the_damn_issue_sky130.vhd:9516:156  */
  assign n2037_o = n1690_o[6:0];
  /* find_the_damn_issue_sky130.vhd:9516:128  */
  assign n2038_o = {n2036_o, n2037_o};
  /* find_the_damn_issue_sky130.vhd:9516:25  */
  assign n2040_o = n839_o == 4'b0111;
  /* find_the_damn_issue_sky130.vhd:9517:108  */
  assign n2041_o = n1690_o[15:9];
  /* find_the_damn_issue_sky130.vhd:9517:122  */
  assign n2043_o = {n2041_o, 1'b0};
  /* find_the_damn_issue_sky130.vhd:9517:156  */
  assign n2044_o = n1690_o[7:0];
  /* find_the_damn_issue_sky130.vhd:9517:128  */
  assign n2045_o = {n2043_o, n2044_o};
  /* find_the_damn_issue_sky130.vhd:9517:25  */
  assign n2047_o = n839_o == 4'b1000;
  /* find_the_damn_issue_sky130.vhd:9518:108  */
  assign n2048_o = n1690_o[15:10];
  /* find_the_damn_issue_sky130.vhd:9518:123  */
  assign n2050_o = {n2048_o, 1'b0};
  /* find_the_damn_issue_sky130.vhd:9518:157  */
  assign n2051_o = n1690_o[8:0];
  /* find_the_damn_issue_sky130.vhd:9518:129  */
  assign n2052_o = {n2050_o, n2051_o};
  /* find_the_damn_issue_sky130.vhd:9518:25  */
  assign n2054_o = n839_o == 4'b1001;
  /* find_the_damn_issue_sky130.vhd:9519:108  */
  assign n2055_o = n1690_o[15:11];
  /* find_the_damn_issue_sky130.vhd:9519:123  */
  assign n2057_o = {n2055_o, 1'b0};
  /* find_the_damn_issue_sky130.vhd:9519:157  */
  assign n2058_o = n1690_o[9:0];
  /* find_the_damn_issue_sky130.vhd:9519:129  */
  assign n2059_o = {n2057_o, n2058_o};
  /* find_the_damn_issue_sky130.vhd:9519:25  */
  assign n2061_o = n839_o == 4'b1010;
  /* find_the_damn_issue_sky130.vhd:9520:108  */
  assign n2062_o = n1690_o[15:12];
  /* find_the_damn_issue_sky130.vhd:9520:123  */
  assign n2064_o = {n2062_o, 1'b0};
  /* find_the_damn_issue_sky130.vhd:9520:157  */
  assign n2065_o = n1690_o[10:0];
  /* find_the_damn_issue_sky130.vhd:9520:129  */
  assign n2066_o = {n2064_o, n2065_o};
  /* find_the_damn_issue_sky130.vhd:9520:25  */
  assign n2068_o = n839_o == 4'b1011;
  /* find_the_damn_issue_sky130.vhd:9521:108  */
  assign n2069_o = n1690_o[15:13];
  /* find_the_damn_issue_sky130.vhd:9521:123  */
  assign n2071_o = {n2069_o, 1'b0};
  /* find_the_damn_issue_sky130.vhd:9521:157  */
  assign n2072_o = n1690_o[11:0];
  /* find_the_damn_issue_sky130.vhd:9521:129  */
  assign n2073_o = {n2071_o, n2072_o};
  /* find_the_damn_issue_sky130.vhd:9521:25  */
  assign n2075_o = n839_o == 4'b1100;
  /* find_the_damn_issue_sky130.vhd:9522:108  */
  assign n2076_o = n1690_o[15:14];
  /* find_the_damn_issue_sky130.vhd:9522:123  */
  assign n2078_o = {n2076_o, 1'b0};
  /* find_the_damn_issue_sky130.vhd:9522:157  */
  assign n2079_o = n1690_o[12:0];
  /* find_the_damn_issue_sky130.vhd:9522:129  */
  assign n2080_o = {n2078_o, n2079_o};
  /* find_the_damn_issue_sky130.vhd:9522:25  */
  assign n2082_o = n839_o == 4'b1101;
  /* find_the_damn_issue_sky130.vhd:9523:108  */
  assign n2083_o = n1690_o[15];
  /* find_the_damn_issue_sky130.vhd:9523:123  */
  assign n2085_o = {n2083_o, 1'b0};
  /* find_the_damn_issue_sky130.vhd:9523:157  */
  assign n2086_o = n1690_o[13:0];
  /* find_the_damn_issue_sky130.vhd:9523:129  */
  assign n2087_o = {n2085_o, n2086_o};
  /* find_the_damn_issue_sky130.vhd:9523:25  */
  assign n2089_o = n839_o == 4'b1110;
  /* find_the_damn_issue_sky130.vhd:9524:114  */
  assign n2090_o = n1690_o[14:0];
  /* find_the_damn_issue_sky130.vhd:9524:86  */
  assign n2092_o = {1'b0, n2090_o};
  /* find_the_damn_issue_sky130.vhd:9524:25  */
  assign n2094_o = n839_o == 4'b1111;
  assign n2095_o = {n2094_o, n2089_o, n2082_o, n2075_o, n2068_o, n2061_o, n2054_o, n2047_o, n2040_o, n2033_o, n2026_o, n2019_o, n2012_o, n2005_o, n1998_o, n1991_o};
  /* find_the_damn_issue_sky130.vhd:9508:17  */
  always @*
    case (n2095_o)
      16'b1000000000000000: n2097_o = n2092_o;
      16'b0100000000000000: n2097_o = n2087_o;
      16'b0010000000000000: n2097_o = n2080_o;
      16'b0001000000000000: n2097_o = n2073_o;
      16'b0000100000000000: n2097_o = n2066_o;
      16'b0000010000000000: n2097_o = n2059_o;
      16'b0000001000000000: n2097_o = n2052_o;
      16'b0000000100000000: n2097_o = n2045_o;
      16'b0000000010000000: n2097_o = n2038_o;
      16'b0000000001000000: n2097_o = n2031_o;
      16'b0000000000100000: n2097_o = n2024_o;
      16'b0000000000010000: n2097_o = n2017_o;
      16'b0000000000001000: n2097_o = n2010_o;
      16'b0000000000000100: n2097_o = n2003_o;
      16'b0000000000000010: n2097_o = n1996_o;
      16'b0000000000000001: n2097_o = n1989_o;
      default: n2097_o = 16'bX;
    endcase
  /* find_the_damn_issue_sky130.vhd:9527:37  */
  assign n2098_o = s_m_packetdata[39];
  /* find_the_damn_issue_sky130.vhd:9527:69  */
  assign n2100_o = n832_o == 16'b0000000000000000;
  /* find_the_damn_issue_sky130.vhd:9527:113  */
  assign n2102_o = n831_o == 8'b00000001;
  /* find_the_damn_issue_sky130.vhd:9527:160  */
  assign n2104_o = n840_o == 2'b00;
  /* find_the_damn_issue_sky130.vhd:9527:176  */
  assign n2105_o = ~s_m_phy_rx_error_2;
  /* find_the_damn_issue_sky130.vhd:9527:221  */
  assign n2107_o = s_m_pid == 4'b0011;
  /* find_the_damn_issue_sky130.vhd:9527:206  */
  assign n2108_o = n2105_o & n2107_o;
  /* find_the_damn_issue_sky130.vhd:9527:232  */
  assign n2109_o = n2108_o & n697_o;
  /* find_the_damn_issue_sky130.vhd:9527:168  */
  assign n2110_o = n2104_o & n2109_o;
  /* find_the_damn_issue_sky130.vhd:9527:127  */
  assign n2111_o = n2102_o & n2110_o;
  /* find_the_damn_issue_sky130.vhd:9527:91  */
  assign n2112_o = n2100_o & n2111_o;
  /* find_the_damn_issue_sky130.vhd:9527:48  */
  assign n2113_o = n2098_o & n2112_o;
  /* find_the_damn_issue_sky130.vhd:9527:17  */
  assign n2114_o = n2113_o ? n2097_o : n1690_o;
  /* find_the_damn_issue_sky130.vhd:9534:40  */
  assign n2116_o = n1359_o == 2'b11;
  /* find_the_damn_issue_sky130.vhd:9534:72  */
  assign n2118_o = s_m_endpoint_mux1 == 4'b0000;
  /* find_the_damn_issue_sky130.vhd:9534:82  */
  assign n2119_o = n2118_o & s_m_packetdata_2_rewired_eq_unnamed_mux2_and_m_pid_2_rewired_eq_const_1_not_and_m_pid_2_rewired_eq_const_1_and_m_phy_rx_eop_and_m_phy_rx_error_not_and_m_state_eq_waitfortoken;
  /* find_the_damn_issue_sky130.vhd:9534:48  */
  assign n2120_o = n2116_o & n2119_o;
  /* find_the_damn_issue_sky130.vhd:9535:95  */
  assign n2121_o = n1637_o[15:1];
  /* find_the_damn_issue_sky130.vhd:9535:109  */
  assign n2123_o = {n2121_o, 1'b1};
  /* find_the_damn_issue_sky130.vhd:9534:17  */
  assign n2124_o = n2120_o ? n2123_o : n1637_o;
  /* find_the_damn_issue_sky130.vhd:9541:108  */
  assign n2125_o = n2124_o[15:1];
  /* find_the_damn_issue_sky130.vhd:9541:122  */
  assign n2127_o = {n2125_o, 1'b0};
  /* find_the_damn_issue_sky130.vhd:9541:25  */
  assign n2129_o = n839_o == 4'b0000;
  /* find_the_damn_issue_sky130.vhd:9542:108  */
  assign n2130_o = n2124_o[15:2];
  /* find_the_damn_issue_sky130.vhd:9542:122  */
  assign n2132_o = {n2130_o, 1'b0};
  /* find_the_damn_issue_sky130.vhd:9542:155  */
  assign n2133_o = n2124_o[0];
  /* find_the_damn_issue_sky130.vhd:9542:128  */
  assign n2134_o = {n2132_o, n2133_o};
  /* find_the_damn_issue_sky130.vhd:9542:25  */
  assign n2136_o = n839_o == 4'b0001;
  /* find_the_damn_issue_sky130.vhd:9543:108  */
  assign n2137_o = n2124_o[15:3];
  /* find_the_damn_issue_sky130.vhd:9543:122  */
  assign n2139_o = {n2137_o, 1'b0};
  /* find_the_damn_issue_sky130.vhd:9543:155  */
  assign n2140_o = n2124_o[1:0];
  /* find_the_damn_issue_sky130.vhd:9543:128  */
  assign n2141_o = {n2139_o, n2140_o};
  /* find_the_damn_issue_sky130.vhd:9543:25  */
  assign n2143_o = n839_o == 4'b0010;
  /* find_the_damn_issue_sky130.vhd:9544:108  */
  assign n2144_o = n2124_o[15:4];
  /* find_the_damn_issue_sky130.vhd:9544:122  */
  assign n2146_o = {n2144_o, 1'b0};
  /* find_the_damn_issue_sky130.vhd:9544:155  */
  assign n2147_o = n2124_o[2:0];
  /* find_the_damn_issue_sky130.vhd:9544:128  */
  assign n2148_o = {n2146_o, n2147_o};
  /* find_the_damn_issue_sky130.vhd:9544:25  */
  assign n2150_o = n839_o == 4'b0011;
  /* find_the_damn_issue_sky130.vhd:9545:108  */
  assign n2151_o = n2124_o[15:5];
  /* find_the_damn_issue_sky130.vhd:9545:122  */
  assign n2153_o = {n2151_o, 1'b0};
  /* find_the_damn_issue_sky130.vhd:9545:155  */
  assign n2154_o = n2124_o[3:0];
  /* find_the_damn_issue_sky130.vhd:9545:128  */
  assign n2155_o = {n2153_o, n2154_o};
  /* find_the_damn_issue_sky130.vhd:9545:25  */
  assign n2157_o = n839_o == 4'b0100;
  /* find_the_damn_issue_sky130.vhd:9546:108  */
  assign n2158_o = n2124_o[15:6];
  /* find_the_damn_issue_sky130.vhd:9546:122  */
  assign n2160_o = {n2158_o, 1'b0};
  /* find_the_damn_issue_sky130.vhd:9546:155  */
  assign n2161_o = n2124_o[4:0];
  /* find_the_damn_issue_sky130.vhd:9546:128  */
  assign n2162_o = {n2160_o, n2161_o};
  /* find_the_damn_issue_sky130.vhd:9546:25  */
  assign n2164_o = n839_o == 4'b0101;
  /* find_the_damn_issue_sky130.vhd:9547:108  */
  assign n2165_o = n2124_o[15:7];
  /* find_the_damn_issue_sky130.vhd:9547:122  */
  assign n2167_o = {n2165_o, 1'b0};
  /* find_the_damn_issue_sky130.vhd:9547:155  */
  assign n2168_o = n2124_o[5:0];
  /* find_the_damn_issue_sky130.vhd:9547:128  */
  assign n2169_o = {n2167_o, n2168_o};
  /* find_the_damn_issue_sky130.vhd:9547:25  */
  assign n2171_o = n839_o == 4'b0110;
  /* find_the_damn_issue_sky130.vhd:9548:108  */
  assign n2172_o = n2124_o[15:8];
  /* find_the_damn_issue_sky130.vhd:9548:122  */
  assign n2174_o = {n2172_o, 1'b0};
  /* find_the_damn_issue_sky130.vhd:9548:155  */
  assign n2175_o = n2124_o[6:0];
  /* find_the_damn_issue_sky130.vhd:9548:128  */
  assign n2176_o = {n2174_o, n2175_o};
  /* find_the_damn_issue_sky130.vhd:9548:25  */
  assign n2178_o = n839_o == 4'b0111;
  /* find_the_damn_issue_sky130.vhd:9549:108  */
  assign n2179_o = n2124_o[15:9];
  /* find_the_damn_issue_sky130.vhd:9549:122  */
  assign n2181_o = {n2179_o, 1'b0};
  /* find_the_damn_issue_sky130.vhd:9549:155  */
  assign n2182_o = n2124_o[7:0];
  /* find_the_damn_issue_sky130.vhd:9549:128  */
  assign n2183_o = {n2181_o, n2182_o};
  /* find_the_damn_issue_sky130.vhd:9549:25  */
  assign n2185_o = n839_o == 4'b1000;
  /* find_the_damn_issue_sky130.vhd:9550:108  */
  assign n2186_o = n2124_o[15:10];
  /* find_the_damn_issue_sky130.vhd:9550:123  */
  assign n2188_o = {n2186_o, 1'b0};
  /* find_the_damn_issue_sky130.vhd:9550:156  */
  assign n2189_o = n2124_o[8:0];
  /* find_the_damn_issue_sky130.vhd:9550:129  */
  assign n2190_o = {n2188_o, n2189_o};
  /* find_the_damn_issue_sky130.vhd:9550:25  */
  assign n2192_o = n839_o == 4'b1001;
  /* find_the_damn_issue_sky130.vhd:9551:108  */
  assign n2193_o = n2124_o[15:11];
  /* find_the_damn_issue_sky130.vhd:9551:123  */
  assign n2195_o = {n2193_o, 1'b0};
  /* find_the_damn_issue_sky130.vhd:9551:156  */
  assign n2196_o = n2124_o[9:0];
  /* find_the_damn_issue_sky130.vhd:9551:129  */
  assign n2197_o = {n2195_o, n2196_o};
  /* find_the_damn_issue_sky130.vhd:9551:25  */
  assign n2199_o = n839_o == 4'b1010;
  /* find_the_damn_issue_sky130.vhd:9552:108  */
  assign n2200_o = n2124_o[15:12];
  /* find_the_damn_issue_sky130.vhd:9552:123  */
  assign n2202_o = {n2200_o, 1'b0};
  /* find_the_damn_issue_sky130.vhd:9552:156  */
  assign n2203_o = n2124_o[10:0];
  /* find_the_damn_issue_sky130.vhd:9552:129  */
  assign n2204_o = {n2202_o, n2203_o};
  /* find_the_damn_issue_sky130.vhd:9552:25  */
  assign n2206_o = n839_o == 4'b1011;
  /* find_the_damn_issue_sky130.vhd:9553:108  */
  assign n2207_o = n2124_o[15:13];
  /* find_the_damn_issue_sky130.vhd:9553:123  */
  assign n2209_o = {n2207_o, 1'b0};
  /* find_the_damn_issue_sky130.vhd:9553:156  */
  assign n2210_o = n2124_o[11:0];
  /* find_the_damn_issue_sky130.vhd:9553:129  */
  assign n2211_o = {n2209_o, n2210_o};
  /* find_the_damn_issue_sky130.vhd:9553:25  */
  assign n2213_o = n839_o == 4'b1100;
  /* find_the_damn_issue_sky130.vhd:9554:108  */
  assign n2214_o = n2124_o[15:14];
  /* find_the_damn_issue_sky130.vhd:9554:123  */
  assign n2216_o = {n2214_o, 1'b0};
  /* find_the_damn_issue_sky130.vhd:9554:156  */
  assign n2217_o = n2124_o[12:0];
  /* find_the_damn_issue_sky130.vhd:9554:129  */
  assign n2218_o = {n2216_o, n2217_o};
  /* find_the_damn_issue_sky130.vhd:9554:25  */
  assign n2220_o = n839_o == 4'b1101;
  /* find_the_damn_issue_sky130.vhd:9555:108  */
  assign n2221_o = n2124_o[15];
  /* find_the_damn_issue_sky130.vhd:9555:123  */
  assign n2223_o = {n2221_o, 1'b0};
  /* find_the_damn_issue_sky130.vhd:9555:156  */
  assign n2224_o = n2124_o[13:0];
  /* find_the_damn_issue_sky130.vhd:9555:129  */
  assign n2225_o = {n2223_o, n2224_o};
  /* find_the_damn_issue_sky130.vhd:9555:25  */
  assign n2227_o = n839_o == 4'b1110;
  /* find_the_damn_issue_sky130.vhd:9556:114  */
  assign n2228_o = n2124_o[14:0];
  /* find_the_damn_issue_sky130.vhd:9556:87  */
  assign n2230_o = {1'b0, n2228_o};
  /* find_the_damn_issue_sky130.vhd:9556:25  */
  assign n2232_o = n839_o == 4'b1111;
  assign n2233_o = {n2232_o, n2227_o, n2220_o, n2213_o, n2206_o, n2199_o, n2192_o, n2185_o, n2178_o, n2171_o, n2164_o, n2157_o, n2150_o, n2143_o, n2136_o, n2129_o};
  /* find_the_damn_issue_sky130.vhd:9540:17  */
  always @*
    case (n2233_o)
      16'b1000000000000000: n2235_o = n2230_o;
      16'b0100000000000000: n2235_o = n2225_o;
      16'b0010000000000000: n2235_o = n2218_o;
      16'b0001000000000000: n2235_o = n2211_o;
      16'b0000100000000000: n2235_o = n2204_o;
      16'b0000010000000000: n2235_o = n2197_o;
      16'b0000001000000000: n2235_o = n2190_o;
      16'b0000000100000000: n2235_o = n2183_o;
      16'b0000000010000000: n2235_o = n2176_o;
      16'b0000000001000000: n2235_o = n2169_o;
      16'b0000000000100000: n2235_o = n2162_o;
      16'b0000000000010000: n2235_o = n2155_o;
      16'b0000000000001000: n2235_o = n2148_o;
      16'b0000000000000100: n2235_o = n2141_o;
      16'b0000000000000010: n2235_o = n2134_o;
      16'b0000000000000001: n2235_o = n2127_o;
      default: n2235_o = 16'bX;
    endcase
  /* find_the_damn_issue_sky130.vhd:9559:43  */
  assign n2236_o = s_m_packetdata[39];
  /* find_the_damn_issue_sky130.vhd:9559:23  */
  assign n2237_o = ~n2236_o;
  /* find_the_damn_issue_sky130.vhd:9559:76  */
  assign n2239_o = n832_o == 16'b0000000000000000;
  /* find_the_damn_issue_sky130.vhd:9559:120  */
  assign n2241_o = n831_o == 8'b00000001;
  /* find_the_damn_issue_sky130.vhd:9559:167  */
  assign n2243_o = n840_o == 2'b00;
  /* find_the_damn_issue_sky130.vhd:9559:183  */
  assign n2244_o = ~s_m_phy_rx_error_2;
  /* find_the_damn_issue_sky130.vhd:9559:228  */
  assign n2246_o = s_m_pid == 4'b0011;
  /* find_the_damn_issue_sky130.vhd:9559:213  */
  assign n2247_o = n2244_o & n2246_o;
  /* find_the_damn_issue_sky130.vhd:9559:239  */
  assign n2248_o = n2247_o & n697_o;
  /* find_the_damn_issue_sky130.vhd:9559:175  */
  assign n2249_o = n2243_o & n2248_o;
  /* find_the_damn_issue_sky130.vhd:9559:134  */
  assign n2250_o = n2241_o & n2249_o;
  /* find_the_damn_issue_sky130.vhd:9559:98  */
  assign n2251_o = n2239_o & n2250_o;
  /* find_the_damn_issue_sky130.vhd:9559:55  */
  assign n2252_o = n2237_o & n2251_o;
  /* find_the_damn_issue_sky130.vhd:9559:17  */
  assign n2253_o = n2252_o ? n2235_o : n2124_o;
  /* find_the_damn_issue_sky130.vhd:9566:141  */
  assign n2254_o = n2253_o[0];
  /* find_the_damn_issue_sky130.vhd:9566:99  */
  assign n2256_o = {15'b000000000000000, n2254_o};
  /* find_the_damn_issue_sky130.vhd:9565:17  */
  assign n2257_o = n1187_o ? n2256_o : n2253_o;
  /* find_the_damn_issue_sky130.vhd:9572:113  */
  assign n2258_o = n2114_o[0];
  /* find_the_damn_issue_sky130.vhd:9572:85  */
  assign n2260_o = {15'b000000000000000, n2258_o};
  /* find_the_damn_issue_sky130.vhd:9571:17  */
  assign n2261_o = n1187_o ? n2260_o : n2114_o;
  /* find_the_damn_issue_sky130.vhd:9576:88  */
  assign n2263_o = s_m_packetlen == s_m_packetlentxlimit;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n2270_o = n2263_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:9577:63  */
  assign n2271_o = s_tx_endpoint == s_m_endpoint_mux1;
  /* find_the_damn_issue_sky130.vhd:9577:42  */
  assign n2272_o = s_tx_valid & n2271_o;
  /* find_the_damn_issue_sky130.vhd:9577:91  */
  assign n2273_o = ~s_m_packetlen_2_eq_m_packetlentxlimit;
  /* find_the_damn_issue_sky130.vhd:9577:85  */
  assign n2274_o = n2272_o & n2273_o;
  /* find_the_damn_issue_sky130.vhd:9577:158  */
  assign n2276_o = s_m_state_2 == 4'b0110;
  /* find_the_damn_issue_sky130.vhd:9577:141  */
  assign n2277_o = n2274_o & n2276_o;
  /* find_the_damn_issue_sky130.vhd:9577:17  */
  assign n2279_o = n2277_o ? scl_usbgpiophy0_out_unnamed_or_in_valid_mux1_delayed1_not_mux1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:9582:63  */
  assign n2280_o = s_tx_endpoint == s_m_endpoint_mux1;
  /* find_the_damn_issue_sky130.vhd:9582:42  */
  assign n2281_o = s_tx_valid & n2280_o;
  /* find_the_damn_issue_sky130.vhd:9582:91  */
  assign n2282_o = ~s_m_packetlen_2_eq_m_packetlentxlimit;
  /* find_the_damn_issue_sky130.vhd:9582:85  */
  assign n2283_o = n2281_o & n2282_o;
  /* find_the_damn_issue_sky130.vhd:9582:158  */
  assign n2285_o = s_m_state_2 == 4'b0110;
  /* find_the_damn_issue_sky130.vhd:9582:141  */
  assign n2286_o = n2283_o & n2285_o;
  /* find_the_damn_issue_sky130.vhd:9582:17  */
  assign n2288_o = n2286_o ? 1'b1 : n760_o;
  /* find_the_damn_issue_sky130.vhd:9587:198  */
  assign n2290_o = s_tx_endpoint == s_m_endpoint_mux1;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n2297_o = n2290_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:9587:164  */
  assign n2298_o = s_tx_valid & n2297_o;
  /* find_the_damn_issue_sky130.vhd:9587:226  */
  assign n2299_o = ~s_m_packetlen_2_eq_m_packetlentxlimit;
  /* find_the_damn_issue_sky130.vhd:9587:220  */
  assign n2300_o = n2298_o & n2299_o;
  /* find_the_damn_issue_sky130.vhd:9587:145  */
  assign n2301_o = ~n2300_o;
  /* find_the_damn_issue_sky130.vhd:9587:301  */
  assign n2304_o = s_m_state_2 == 4'b0110;
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n2311_o = n2304_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:9587:271  */
  assign n2312_o = n2301_o & n2311_o;
  /* find_the_damn_issue_sky130.vhd:9588:17  */
  assign n2313_o = s_m_tx_valid_and_m_tx_endpoint_eq_m_endpoint_mux1_and_m_packetlen_2_eq_m_packetlentxlimit_not_not_and_m_state_eq_senddata ? s_m_packetlen : s_m_packetlentxlimit;
  /* find_the_damn_issue_sky130.vhd:9593:40  */
  assign n2315_o = s_m_endpoint_mux1 != 4'b0000;
  /* find_the_damn_issue_sky130.vhd:9593:75  */
  assign n2317_o = s_m_phy_rx_data_2 == 8'b11010010;
  /* find_the_damn_issue_sky130.vhd:9593:115  */
  assign n2318_o = s_ackexpected & s_m_phy_rx_sop;
  /* find_the_damn_issue_sky130.vhd:9593:141  */
  assign n2319_o = n2318_o & s_m_phy_rx_valid_2;
  /* find_the_damn_issue_sky130.vhd:9593:89  */
  assign n2320_o = n2317_o & n2319_o;
  /* find_the_damn_issue_sky130.vhd:9593:51  */
  assign n2321_o = n2315_o & n2320_o;
  /* find_the_damn_issue_sky130.vhd:9593:17  */
  assign n2323_o = n2321_o ? 4'b1000 : n2313_o;
  /* find_the_damn_issue_sky130.vhd:9598:17  */
  assign n2325_o = s_m_tx_valid_and_m_tx_endpoint_eq_m_endpoint_mux1_and_m_packetlen_2_eq_m_packetlentxlimit_not_not_and_m_state_eq_senddata ? 1'b1 : n829_o;
  /* find_the_damn_issue_sky130.vhd:9604:17  */
  assign n2327_o = s_m_tx_valid_and_m_tx_endpoint_eq_m_endpoint_mux1_and_m_packetlen_2_eq_m_packetlentxlimit_not_not_and_m_state_eq_senddata ? 4'b0000 : n1964_o;
  /* find_the_damn_issue_sky130.vhd:9610:38  */
  assign n2329_o = s_m_packetlen != 4'b1111;
  /* find_the_damn_issue_sky130.vhd:9610:108  */
  assign n2330_o = n2288_o & scl_usbgpiophy0_out_unnamed_or_in_valid_mux1_delayed1_not_mux1;
  /* find_the_damn_issue_sky130.vhd:9610:79  */
  assign n2331_o = s_m_phy_rx_valid_2 | n2330_o;
  /* find_the_damn_issue_sky130.vhd:9610:49  */
  assign n2332_o = n2329_o & n2331_o;
  /* find_the_damn_issue_sky130.vhd:9611:79  */
  assign n2334_o = s_m_packetlen + 4'b0001;
  /* find_the_damn_issue_sky130.vhd:9610:17  */
  assign n2335_o = n2332_o ? n2334_o : s_m_packetlen;
  /* find_the_damn_issue_sky130.vhd:9615:46  */
  assign n2336_o = s_m_phy_rx_valid_2 & s_m_phy_rx_sop;
  /* find_the_damn_issue_sky130.vhd:9615:17  */
  assign n2338_o = n2336_o ? 4'b0000 : n2335_o;
  /* find_the_damn_issue_sky130.vhd:9620:33  */
  assign n2340_o = s_m_state_2 == 4'b0100;
  /* find_the_damn_issue_sky130.vhd:9620:17  */
  assign n2342_o = n2340_o ? 4'b0000 : n2338_o;
  /* find_the_damn_issue_sky130.vhd:9630:34  */
  assign n2344_o = {8'b00000000, n1118_o};
  /* find_the_damn_issue_sky130.vhd:9630:54  */
  assign n2345_o = $unsigned(n2344_o) > $unsigned(n834_o);
  /* find_the_damn_issue_sky130.vhd:9630:81  */
  assign n2346_o = ~s_m_phy_rx_error_2;
  /* find_the_damn_issue_sky130.vhd:9630:126  */
  assign n2348_o = s_m_pid == 4'b0011;
  /* find_the_damn_issue_sky130.vhd:9630:111  */
  assign n2349_o = n2346_o & n2348_o;
  /* find_the_damn_issue_sky130.vhd:9630:137  */
  assign n2350_o = n2349_o & n697_o;
  /* find_the_damn_issue_sky130.vhd:9630:73  */
  assign n2351_o = n2345_o & n2350_o;
  /* find_the_damn_issue_sky130.vhd:9631:76  */
  assign n2352_o = s_m_packetdata[55:48];
  /* find_the_damn_issue_sky130.vhd:9630:17  */
  assign n2353_o = n2351_o ? n2352_o : n1118_o;
  /* find_the_damn_issue_sky130.vhd:9641:75  */
  assign n2354_o = s_m_nextoutdatapid_2_mux1_rewired_mux2_rewired_mux1 & n1630_o;
  /* find_the_damn_issue_sky130.vhd:9641:104  */
  assign n2356_o = n2354_o != 16'b0000000000000000;
  /* find_the_damn_issue_sky130.vhd:9641:127  */
  assign n2357_o = n2356_o & n707_o;
  /* find_the_damn_issue_sky130.vhd:9641:17  */
  assign n2359_o = n2357_o ? 8'b01001011 : n711_o;
  /* find_the_damn_issue_sky130.vhd:9646:44  */
  assign n2361_o = s_m_desclengthactive != 8'b00000000;
  /* find_the_damn_issue_sky130.vhd:9646:80  */
  assign n2363_o = s_m_packetlen != 4'b1000;
  /* find_the_damn_issue_sky130.vhd:9646:59  */
  assign n2364_o = n2361_o & n2363_o;
  /* find_the_damn_issue_sky130.vhd:9646:109  */
  assign n2366_o = s_m_state_2 == 4'b0010;
  /* find_the_damn_issue_sky130.vhd:9646:92  */
  assign n2367_o = n2364_o & n2366_o;
  /* find_the_damn_issue_sky130.vhd:9646:17  */
  assign n2368_o = n2367_o ? s_m_descdata : n2359_o;
  /* find_the_damn_issue_sky130.vhd:9651:63  */
  assign n2369_o = s_tx_endpoint == s_m_endpoint_mux1;
  /* find_the_damn_issue_sky130.vhd:9651:42  */
  assign n2370_o = s_tx_valid & n2369_o;
  /* find_the_damn_issue_sky130.vhd:9651:91  */
  assign n2371_o = ~s_m_packetlen_2_eq_m_packetlentxlimit;
  /* find_the_damn_issue_sky130.vhd:9651:85  */
  assign n2372_o = n2370_o & n2371_o;
  /* find_the_damn_issue_sky130.vhd:9651:158  */
  assign n2374_o = s_m_state_2 == 4'b0110;
  /* find_the_damn_issue_sky130.vhd:9651:141  */
  assign n2375_o = n2372_o & n2374_o;
  /* find_the_damn_issue_sky130.vhd:9651:17  */
  assign n2376_o = n2375_o ? s_tx_data : n2368_o;
  /* find_the_damn_issue_sky130.vhd:9661:132  */
  assign n2377_o = n2261_o[0];
  /* find_the_damn_issue_sky130.vhd:9661:25  */
  assign n2379_o = s_m_endpoint_mux1 == 4'b0000;
  /* find_the_damn_issue_sky130.vhd:9662:132  */
  assign n2380_o = n2261_o[1];
  /* find_the_damn_issue_sky130.vhd:9662:25  */
  assign n2382_o = s_m_endpoint_mux1 == 4'b0001;
  /* find_the_damn_issue_sky130.vhd:9663:132  */
  assign n2383_o = n2261_o[2];
  /* find_the_damn_issue_sky130.vhd:9663:25  */
  assign n2385_o = s_m_endpoint_mux1 == 4'b0010;
  /* find_the_damn_issue_sky130.vhd:9664:132  */
  assign n2386_o = n2261_o[3];
  /* find_the_damn_issue_sky130.vhd:9664:25  */
  assign n2388_o = s_m_endpoint_mux1 == 4'b0011;
  /* find_the_damn_issue_sky130.vhd:9665:132  */
  assign n2389_o = n2261_o[4];
  /* find_the_damn_issue_sky130.vhd:9665:25  */
  assign n2391_o = s_m_endpoint_mux1 == 4'b0100;
  /* find_the_damn_issue_sky130.vhd:9666:132  */
  assign n2392_o = n2261_o[5];
  /* find_the_damn_issue_sky130.vhd:9666:25  */
  assign n2394_o = s_m_endpoint_mux1 == 4'b0101;
  /* find_the_damn_issue_sky130.vhd:9667:132  */
  assign n2395_o = n2261_o[6];
  /* find_the_damn_issue_sky130.vhd:9667:25  */
  assign n2397_o = s_m_endpoint_mux1 == 4'b0110;
  /* find_the_damn_issue_sky130.vhd:9668:132  */
  assign n2398_o = n2261_o[7];
  /* find_the_damn_issue_sky130.vhd:9668:25  */
  assign n2400_o = s_m_endpoint_mux1 == 4'b0111;
  /* find_the_damn_issue_sky130.vhd:9669:132  */
  assign n2401_o = n2261_o[8];
  /* find_the_damn_issue_sky130.vhd:9669:25  */
  assign n2403_o = s_m_endpoint_mux1 == 4'b1000;
  /* find_the_damn_issue_sky130.vhd:9670:132  */
  assign n2404_o = n2261_o[9];
  /* find_the_damn_issue_sky130.vhd:9670:25  */
  assign n2406_o = s_m_endpoint_mux1 == 4'b1001;
  /* find_the_damn_issue_sky130.vhd:9671:132  */
  assign n2407_o = n2261_o[10];
  /* find_the_damn_issue_sky130.vhd:9671:25  */
  assign n2409_o = s_m_endpoint_mux1 == 4'b1010;
  /* find_the_damn_issue_sky130.vhd:9672:132  */
  assign n2410_o = n2261_o[11];
  /* find_the_damn_issue_sky130.vhd:9672:25  */
  assign n2412_o = s_m_endpoint_mux1 == 4'b1011;
  /* find_the_damn_issue_sky130.vhd:9673:132  */
  assign n2413_o = n2261_o[12];
  /* find_the_damn_issue_sky130.vhd:9673:25  */
  assign n2415_o = s_m_endpoint_mux1 == 4'b1100;
  /* find_the_damn_issue_sky130.vhd:9674:132  */
  assign n2416_o = n2261_o[13];
  /* find_the_damn_issue_sky130.vhd:9674:25  */
  assign n2418_o = s_m_endpoint_mux1 == 4'b1101;
  /* find_the_damn_issue_sky130.vhd:9675:132  */
  assign n2419_o = n2261_o[14];
  /* find_the_damn_issue_sky130.vhd:9675:25  */
  assign n2421_o = s_m_endpoint_mux1 == 4'b1110;
  /* find_the_damn_issue_sky130.vhd:9676:132  */
  assign n2422_o = n2261_o[15];
  /* find_the_damn_issue_sky130.vhd:9676:25  */
  assign n2424_o = s_m_endpoint_mux1 == 4'b1111;
  assign n2425_o = {n2424_o, n2421_o, n2418_o, n2415_o, n2412_o, n2409_o, n2406_o, n2403_o, n2400_o, n2397_o, n2394_o, n2391_o, n2388_o, n2385_o, n2382_o, n2379_o};
  /* find_the_damn_issue_sky130.vhd:9660:17  */
  always @*
    case (n2425_o)
      16'b1000000000000000: n2427_o = n2422_o;
      16'b0100000000000000: n2427_o = n2419_o;
      16'b0010000000000000: n2427_o = n2416_o;
      16'b0001000000000000: n2427_o = n2413_o;
      16'b0000100000000000: n2427_o = n2410_o;
      16'b0000010000000000: n2427_o = n2407_o;
      16'b0000001000000000: n2427_o = n2404_o;
      16'b0000000100000000: n2427_o = n2401_o;
      16'b0000000010000000: n2427_o = n2398_o;
      16'b0000000001000000: n2427_o = n2395_o;
      16'b0000000000100000: n2427_o = n2392_o;
      16'b0000000000010000: n2427_o = n2389_o;
      16'b0000000000001000: n2427_o = n2386_o;
      16'b0000000000000100: n2427_o = n2383_o;
      16'b0000000000000010: n2427_o = n2380_o;
      16'b0000000000000001: n2427_o = n2377_o;
      default: n2427_o = 1'bX;
    endcase
  /* find_the_damn_issue_sky130.vhd:9679:23  */
  assign n2428_o = ~s_m_rxreadyerror_2;
  /* find_the_damn_issue_sky130.vhd:9679:60  */
  assign n2429_o = ~s_m_phy_rx_error_2;
  /* find_the_damn_issue_sky130.vhd:9679:90  */
  assign n2430_o = n2429_o & n734_o;
  /* find_the_damn_issue_sky130.vhd:9679:53  */
  assign n2431_o = n2428_o & n2430_o;
  /* find_the_damn_issue_sky130.vhd:9680:131  */
  assign n2432_o = n2261_o ^ n1630_o;
  /* find_the_damn_issue_sky130.vhd:9679:17  */
  assign n2433_o = n2431_o ? n2432_o : n2261_o;
  /* find_the_damn_issue_sky130.vhd:9684:129  */
  assign n2435_o = {n2427_o, 1'b0};
  /* find_the_damn_issue_sky130.vhd:9684:135  */
  assign n2437_o = {n2435_o, 2'b11};
  /* find_the_damn_issue_sky130.vhd:9685:45  */
  assign n2438_o = ~n2437_o;
  /* find_the_damn_issue_sky130.vhd:9685:108  */
  assign n2439_o = {n2438_o, n2437_o};
  /* find_the_damn_issue_sky130.vhd:9685:40  */
  assign n2440_o = s_m_phy_rx_data_2 == n2439_o;
  /* find_the_damn_issue_sky130.vhd:9685:197  */
  assign n2441_o = s_m_phy_rx_sop & s_m_phy_rx_valid_2;
  /* find_the_damn_issue_sky130.vhd:9685:244  */
  assign n2443_o = s_m_state_2 == 4'b0111;
  /* find_the_damn_issue_sky130.vhd:9685:227  */
  assign n2444_o = n2441_o & n2443_o;
  /* find_the_damn_issue_sky130.vhd:9685:170  */
  assign n2445_o = n2440_o & n2444_o;
  /* find_the_damn_issue_sky130.vhd:9685:17  */
  assign n2447_o = n2445_o ? 4'b1000 : n2327_o;
  /* find_the_damn_issue_sky130.vhd:9690:160  */
  assign n2448_o = n2437_o[3];
  /* find_the_damn_issue_sky130.vhd:9690:99  */
  assign n2449_o = ~n2448_o;
  /* find_the_damn_issue_sky130.vhd:9690:165  */
  assign n2451_o = {n2449_o, 1'b0};
  /* find_the_damn_issue_sky130.vhd:9690:171  */
  assign n2453_o = {n2451_o, 2'b11};
  /* find_the_damn_issue_sky130.vhd:9691:46  */
  assign n2454_o = ~n2453_o;
  /* find_the_damn_issue_sky130.vhd:9691:127  */
  assign n2455_o = {n2454_o, n2453_o};
  /* find_the_damn_issue_sky130.vhd:9691:40  */
  assign n2456_o = s_m_phy_rx_data_2 != n2455_o;
  /* find_the_damn_issue_sky130.vhd:9691:242  */
  assign n2457_o = ~n2437_o;
  /* find_the_damn_issue_sky130.vhd:9691:305  */
  assign n2458_o = {n2457_o, n2437_o};
  /* find_the_damn_issue_sky130.vhd:9691:237  */
  assign n2459_o = s_m_phy_rx_data_2 == n2458_o;
  /* find_the_damn_issue_sky130.vhd:9691:214  */
  assign n2460_o = ~n2459_o;
  /* find_the_damn_issue_sky130.vhd:9691:395  */
  assign n2461_o = s_m_phy_rx_sop & s_m_phy_rx_valid_2;
  /* find_the_damn_issue_sky130.vhd:9691:442  */
  assign n2463_o = s_m_state_2 == 4'b0111;
  /* find_the_damn_issue_sky130.vhd:9691:425  */
  assign n2464_o = n2461_o & n2463_o;
  /* find_the_damn_issue_sky130.vhd:9691:368  */
  assign n2465_o = n2460_o & n2464_o;
  /* find_the_damn_issue_sky130.vhd:9691:207  */
  assign n2466_o = n2456_o & n2465_o;
  /* find_the_damn_issue_sky130.vhd:9691:17  */
  assign n2468_o = n2466_o ? 4'b0000 : n2447_o;
  /* find_the_damn_issue_sky130.vhd:9696:17  */
  assign n2470_o = n723_o ? 4'b0000 : n2468_o;
  /* find_the_damn_issue_sky130.vhd:9701:17  */
  assign n2472_o = n734_o ? 4'b0000 : n2470_o;
  /* find_the_damn_issue_sky130.vhd:9706:17  */
  assign n2474_o = n745_o ? 4'b0000 : n2472_o;
  /* find_the_damn_issue_sky130.vhd:9713:36  */
  assign n2476_o = s_m_senddatastate_mux8 == 4'b0100;
  /* find_the_damn_issue_sky130.vhd:9713:17  */
  assign n2477_o = n2476_o ? s_m_descaddressactive_mux9 : s_m_descaddressactive_mux1;
  /* find_the_damn_issue_sky130.vhd:9718:36  */
  assign n2479_o = s_m_senddatastate_mux8 == 4'b0100;
  /* find_the_damn_issue_sky130.vhd:9718:17  */
  assign n2480_o = n2479_o ? s_m_packetdata_2_rewired_mux1_4 : n805_o;
  /* find_the_damn_issue_sky130.vhd:9728:77  */
  assign n2481_o = s_m_packetdata[63:8];
  /* find_the_damn_issue_sky130.vhd:9728:59  */
  assign n2483_o = {8'b00000000, n2481_o};
  /* find_the_damn_issue_sky130.vhd:9729:114  */
  assign n2484_o = n2483_o[55:0];
  /* find_the_damn_issue_sky130.vhd:9729:86  */
  assign n2485_o = {s_m_phy_rx_data_2, n2484_o};
  /* find_the_damn_issue_sky130.vhd:9730:116  */
  assign n2488_o = $unsigned(s_m_packetlen) < $unsigned(4'b1000);
  /* find_the_damn_issue_sky130.vhd:24:17  */
  assign n2495_o = n2488_o ? 1'b1 : 1'b0;
  /* find_the_damn_issue_sky130.vhd:9730:84  */
  assign n2496_o = s_m_phy_rx_valid_2 & n2495_o;
  /* find_the_damn_issue_sky130.vhd:9763:27  */
  assign n2561_o = ~rst_n;
  /* find_the_damn_issue_sky130.vhd:9794:9  */
  functionreset functionreset0 (
    .clk(clk),
    .rst_n(rst_n),
    .in_unnamed(s_m_address_2),
    .in_unnamed_2(s_m_configuration_2),
    .in_unnamed_3(s_m_newaddress_2),
    .in_unnamed_4(s_m_rxstatus_linestate_2),
    .in_unnamed_5(s_m_rxstatus_sessend_2),
    .out_unnamed_mux1(functionreset0_out_unnamed_mux1),
    .out_unnamed_mux1_2(functionreset0_out_unnamed_mux1_2),
    .out_unnamed_mux1_3(functionreset0_out_unnamed_mux1_3));
  /* find_the_damn_issue_sky130.vhd:9806:9  */
  scl_memory scl_memory0 (
    .clk(clk),
    .in_unnamed(s_m_descaddressactive_mux1),
    .out_unnamed_2(scl_memory0_out_unnamed_2));
  /* find_the_damn_issue_sky130.vhd:9811:9  */
  rxstream rxstream0 (
    .clk(clk),
    .rst_n(rst_n),
    .in_m_rx_ready(s_unnamed_not_mux1_3),
    .in_unnamed(s_m_rx_eop_2),
    .in_unnamed_2(s_m_rxreadyerror_2),
    .in_unnamed_3(s_m_state_2),
    .in_unnamed_4(s_m_phy_rx_valid_2),
    .in_unnamed_5(s_m_phy_rx_eop_2),
    .in_unnamed_6(s_m_phy_rx_error_2),
    .in_m_rx_data(s_m_phy_rx_data_2),
    .in_m_rx_endpoint(s_m_endpoint_mux1),
    .in_unnamed_7(s_m_configuration_3),
    .out_m_rxreadyerror(rxstream0_out_m_rxreadyerror),
    .out_const_1(rxstream0_out_const_1),
    .out_m_rx_valid(rxstream0_out_m_rx_valid),
    .out_m_rx_endpoint_2(rxstream0_out_m_rx_endpoint_2),
    .out_m_rx_data_2(rxstream0_out_m_rx_data_2),
    .out_m_rx_eop(rxstream0_out_m_rx_eop),
    .out_m_rx_error(rxstream0_out_m_rx_error));
  /* find_the_damn_issue_sky130.vhd:9832:9  */
  rxfifointerface rxfifointerface0 (
    .in_unnamed(s_m_endpoint_mux1),
    .in_unnamed_2(s_unnamed_36),
    .in_unnamed_3(s_m_rx_valid_2),
    .in_unnamed_4(s_m_rx_endpoint),
    .in_unnamed_5(s_m_rx_data_2),
    .in_unnamed_6(s_m_rx_eop_3),
    .in_unnamed_7(s_m_rx_error_2),
    .in_unnamed_8(s_unnamed_55),
    .in_unnamed_9(s_unnamed_56),
    .in_unnamed_10(s_unnamed_57),
    .in_unnamed_11(s_unnamed_58),
    .in_unnamed_12(s_unnamed_59),
    .in_unnamed_13(s_unnamed_60),
    .out_unnamed_not_mux1(rxfifointerface0_out_unnamed_not_mux1),
    .out_unnamed_not_mux1_2(rxfifointerface0_out_unnamed_not_mux1_2),
    .out_unnamed_mux1(rxfifointerface0_out_unnamed_mux1),
    .out_unnamed_mux1_2(rxfifointerface0_out_unnamed_mux1_2),
    .out_const_0_mux1(rxfifointerface0_out_const_0_mux1),
    .out_unnamed_mux2(rxfifointerface0_out_unnamed_mux2),
    .out_const_10_mux1(rxfifointerface0_out_const_10_mux1));
  /* find_the_damn_issue_sky130.vhd:9854:9  */
  txfifointerface txfifointerface0 (
    .in_unnamed(s_m_endpoint_mux1),
    .in_unnamed_2(s_m_tx_commit),
    .in_unnamed_3(s_m_tx_rollback),
    .in_tx_ready(s_m_tx_ready),
    .in_unnamed_4(s_unnamed_33),
    .in_unnamed_5(s_unnamed_34),
    .in_unnamed_6(s_unnamed_35),
    .in_unnamed_7(in_unnamed_28),
    .in_unnamed_8(in_unnamed_29),
    .in_unnamed_9(s_unnamed_52),
    .in_unnamed_10(s_unnamed_53),
    .in_unnamed_11(s_unnamed_54),
    .out_unnamed_not_mux1(txfifointerface0_out_unnamed_not_mux1),
    .out_unnamed_mux2(txfifointerface0_out_unnamed_mux2),
    .out_const_0_mux1(txfifointerface0_out_const_0_mux1),
    .out_tx_ready_2(),
    .out_tx_valid(txfifointerface0_out_tx_valid),
    .out_tx_endpoint(txfifointerface0_out_tx_endpoint),
    .out_tx_data(txfifointerface0_out_tx_data),
    .out_unnamed_mux2_2(txfifointerface0_out_unnamed_mux2_2));
  /* find_the_damn_issue_sky130.vhd:9735:17  */
  always @(posedge clk)
    n2627_q <= s_m_rx_error;
  /* find_the_damn_issue_sky130.vhd:9776:17  */
  always @(posedge clk or posedge n2561_o)
    if (n2561_o)
      n2628_q <= 1'b0;
    else
      n2628_q <= s_m_rx_eop;
  /* find_the_damn_issue_sky130.vhd:9735:17  */
  always @(posedge clk)
    n2629_q <= s_m_rx_data;
  /* find_the_damn_issue_sky130.vhd:9735:17  */
  always @(posedge clk)
    n2630_q <= s_m_rx_sop;
  /* find_the_damn_issue_sky130.vhd:9776:17  */
  always @(posedge clk or posedge n2561_o)
    if (n2561_o)
      n2631_q <= 1'b0;
    else
      n2631_q <= s_m_rx_valid;
  /* find_the_damn_issue_sky130.vhd:9735:17  */
  always @(posedge clk)
    n2632_q <= s_m_status_sessend;
  /* find_the_damn_issue_sky130.vhd:9735:17  */
  always @(posedge clk)
    n2633_q <= scl_usbgpiophy0_out_m_status_linestate;
  /* find_the_damn_issue_sky130.vhd:9776:17  */
  always @(posedge clk or posedge n2561_o)
    if (n2561_o)
      n2634_q <= 4'b0000;
    else
      n2634_q <= s_m_senddatastate_mux8;
  /* find_the_damn_issue_sky130.vhd:9776:17  */
  always @(posedge clk or posedge n2561_o)
    if (n2561_o)
      n2635_q <= 2'b00;
    else
      n2635_q <= s_const_1_mux15;
  /* find_the_damn_issue_sky130.vhd:9776:17  */
  always @(posedge clk or posedge n2561_o)
    if (n2561_o)
      n2636_q <= 1'b0;
    else
      n2636_q <= s_send_mux2;
  /* find_the_damn_issue_sky130.vhd:9776:17  */
  always @(posedge clk or posedge n2561_o)
    if (n2561_o)
      n2637_q <= 1'b0;
    else
      n2637_q <= s_ackexpected_mux3;
  /* find_the_damn_issue_sky130.vhd:9776:17  */
  assign n2638_o = s_m_tx_valid_and_m_tx_endpoint_eq_m_endpoint_mux1_and_m_packetlen_2_eq_m_packetlentxlimit_not_not_and_m_state_eq_senddata ? s_m_packetlen_2_eq_m_packetlentxlimit : s_incompletetransfer;
  /* find_the_damn_issue_sky130.vhd:9776:17  */
  always @(posedge clk or posedge n2561_o)
    if (n2561_o)
      n2639_q <= 1'b0;
    else
      n2639_q <= n2638_o;
  /* find_the_damn_issue_sky130.vhd:9776:17  */
  always @(posedge clk or posedge n2561_o)
    if (n2561_o)
      n2640_q <= 4'b1000;
    else
      n2640_q <= s_m_packetlentxlimit_mux2;
  /* find_the_damn_issue_sky130.vhd:9735:17  */
  assign n2641_o = s_m_packetdata_2_rewired_eq_unnamed_mux2_and_m_pid_2_rewired_eq_const_1_not_and_m_pid_2_rewired_eq_const_1_and_m_phy_rx_eop_and_m_phy_rx_error_not_and_m_state_eq_waitfortoken ? s_m_packetdata_2_rewired_2 : s_m_endpoint;
  /* find_the_damn_issue_sky130.vhd:9735:17  */
  always @(posedge clk)
    n2642_q <= n2641_o;
  /* find_the_damn_issue_sky130.vhd:9735:17  */
  assign n2643_o = s_m_packetdata_2_rewired_eq_unnamed_mux2_and_m_pid_2_rewired_eq_const_1_not_and_m_pid_2_rewired_eq_const_1_and_m_phy_rx_eop_and_m_phy_rx_error_not_and_m_state_eq_waitfortoken ? s_unnamed_m_packetdata_2_rewired_eq_const_15_rewired : s_m_endpointmask;
  /* find_the_damn_issue_sky130.vhd:9735:17  */
  always @(posedge clk)
    n2644_q <= n2643_o;
  /* find_the_damn_issue_sky130.vhd:9735:17  */
  always @(posedge clk)
    n2645_q <= s_m_senddatastate_2_mux2;
  /* find_the_damn_issue_sky130.vhd:9776:17  */
  always @(posedge clk or posedge n2561_o)
    if (n2561_o)
      n2646_q <= 7'b0000000;
    else
      n2646_q <= s_m_packetdata_2_rewired_mux1_2;
  /* find_the_damn_issue_sky130.vhd:9776:17  */
  always @(posedge clk or posedge n2561_o)
    if (n2561_o)
      n2647_q <= 4'b0000;
    else
      n2647_q <= s_m_packetdata_2_rewired_mux1_3;
  /* find_the_damn_issue_sky130.vhd:9776:17  */
  always @(posedge clk or posedge n2561_o)
    if (n2561_o)
      n2648_q <= 16'b0000000000000000;
    else
      n2648_q <= s_m_nextoutdatapid_2_mux1_rewired_mux2_rewired_mux1;
  /* find_the_damn_issue_sky130.vhd:9735:17  */
  always @(posedge clk)
    n2649_q <= s_m_descaddressactive_mux2;
  /* find_the_damn_issue_sky130.vhd:9735:17  */
  always @(posedge clk)
    n2650_q <= s_m_packetdata_2_rewired_mux2;
  /* find_the_damn_issue_sky130.vhd:9735:17  */
  always @(posedge clk)
    n2651_q <= s_m_descaddressactive_mux9;
  /* find_the_damn_issue_sky130.vhd:9735:17  */
  always @(posedge clk)
    n2652_q <= s_m_packetdata_2_rewired_mux1_4;
  /* find_the_damn_issue_sky130.vhd:9735:17  */
  always @(posedge clk)
    n2653_q <= s_m_nextindatapid_2_mux2_rewired_mux1_xor_m_endpointmask_mux2;
  /* find_the_damn_issue_sky130.vhd:9735:17  */
  always @(posedge clk)
    n2654_q <= s_m_phy_rx_data_rewired_mux2;
  /* find_the_damn_issue_sky130.vhd:9735:17  */
  always @(posedge clk)
    n2655_q <= s_m_packetlen_2_plus_const_1_mux3;
  /* find_the_damn_issue_sky130.vhd:9735:17  */
  assign n2656_o = s_m_phy_rx_valid_and_m_packetlen_lt_const_8 ? s_m_packetdata_2_rewired_m_phy_rx_data_rewired : s_m_packetdata;
  /* find_the_damn_issue_sky130.vhd:9735:17  */
  always @(posedge clk)
    n2657_q <= n2656_o;
  /* find_the_damn_issue_sky130.vhd:9776:17  */
  always @(posedge clk or posedge n2561_o)
    if (n2561_o)
      n2658_q <= 7'b0000000;
    else
      n2658_q <= s_unnamed_mux2_6;
endmodule

module tt_um_find_the_damn_issue
  (input  clk,
   input  rst_n,
   input  [7:0] uio_in,
   input  [7:0] ui_in,
   input  ena,
   output [7:0] uio_out,
   output [7:0] uio_oe,
   output [7:0] uo_out);
  wire [1:0] s_m_status_linestate_2;
  wire s_m_status_rxactive_2;
  wire s_unnamed_or_in_valid_mux1_delayed1_not_mux1;
  wire s_m_phy_tx_valid_3;
  wire [7:0] s_m_phy_tx_data_3;
  wire s_unnamed_mux2;
  wire s_in_mux1;
  wire s_m_out_2;
  wire s_m_match_delayed1;
  wire s_firstdatabit_mux1;
  wire s_unnamed_mux1;
  wire s_unnamed_mux1_2;
  wire s_m_phy_tx_valid_2;
  wire [7:0] s_m_phy_tx_data_2;
  wire s_unnamed_mux2_2;
  reg s_operatingmode;
  wire [7:0] s_uio_in_2;
  wire [7:0] s_unnamed;
  wire [7:0] s_unnamed_2;
  wire s_operatingmode_2;
  wire s_set_line_coding_mux1;
  reg s_unnamed_3;
  reg s_dtr;
  wire s_dtr_2;
  reg s_rts;
  wire s_rts_2;
  reg [23:0] s_baudrate;
  wire [23:0] s_baudrate_2;
  wire [1:0] s_m_status_linestate;
  wire s_m_status_rxactive;
  wire s_m_out;
  wire s_m_match_delayed1_2;
  wire s_m_phy_tx_ready;
  wire s_unnamed_mux1_3;
  wire s_in_mux1_2;
  wire s_firstdatabit_mux1_2;
  wire s_unnamed_mux2_3;
  wire s_unnamed_mux1_4;
  wire s_set_line_coding_mux1_2;
  wire s_unnamed_4;
  wire s_unnamed_eq_set_line_coding_and_m_phy_rx_error_not_and_m_pid_2_rewired_eq_const_11_and_nested_condition_m_phy_rx_eop;
  wire [23:0] s_baudrate_3;
  wire s_unnamed_mux2_4;
  wire s_unnamed_5;
  wire [7:0] s_unnamed_6;
  wire [3:0] s_unnamed_7;
  wire [7:0] s_m_peekdata_data;
  wire s_unnamed_8;
  wire [4:0] s_unnamed_9;
  wire s_m_pushvalid;
  wire [7:0] s_m_pushdata_data;
  wire [3:0] s_m_pushdata_endpoint;
  wire s_m_pushcommit;
  wire s_m_pushrollack;
  wire [4:0] s_m_pushcutoff;
  wire s_m_popvalid;
  wire s_m_pushfull;
  wire s_m_popempty;
  wire s_usbep1_rx_valid;
  wire [7:0] s_usbep1_rx;
  wire s_m_selector;
  wire s_out_0_ready;
  wire s_out_0_valid;
  wire [7:0] s_out_0;
  wire s_unnamed_10;
  wire s_out;
  wire s_usbep1_rx_ready;
  wire s_out_1_ready;
  wire s_out_1_valid;
  wire [7:0] s_out_1;
  wire s_unnamed_11;
  wire s_m_io0_out;
  wire s_m_io0_en;
  wire s_m_io0_opendrain;
  wire s_m_io1_out;
  wire s_m_io1_en;
  wire s_m_io1_opendrain;
  wire s_m_io2_out;
  wire s_m_io2_en;
  wire s_m_io2_opendrain;
  wire s_m_io3_out;
  wire s_m_io3_en;
  wire s_m_io3_opendrain;
  wire s_m_io4_out;
  wire s_m_io4_en;
  wire s_m_io4_opendrain;
  wire s_m_io5_out;
  wire s_m_io5_en;
  wire s_m_io5_opendrain;
  wire s_m_io8_out;
  wire s_m_io9_out;
  wire s_m_io10_out;
  wire s_m_io11_out;
  wire s_m_io12_out;
  wire s_m_io13_out;
  wire s_m_io14_out;
  wire s_m_io15_out;
  wire s_out_valid;
  wire [7:0] s_out_2;
  wire s_bitbangout_valid;
  wire [7:0] s_bitbangout;
  wire s_rx;
  wire s_out_valid_2;
  wire [7:0] s_out_3;
  wire s_uartout_valid;
  wire [7:0] s_uartout;
  wire s_unnamed_12;
  wire s_m_out_valid;
  wire [7:0] s_m_out_3;
  wire s_unnamed_13;
  wire [7:0] s_m_peekdata_data_2;
  wire [3:0] s_m_peekdata_endpoint;
  wire s_unnamed_14;
  wire [4:0] s_m_pushcutoff_2;
  wire s_m_popvalid_2;
  wire s_m_popcommit;
  wire s_m_poprollback;
  wire s_m_out_ready;
  wire s_m_pushvalid_2;
  wire [7:0] s_m_pushdata_data_2;
  wire [3:0] s_m_pushdata_endpoint_2;
  wire s_m_pushfull_2;
  wire s_m_popempty_2;
  wire s_unnamed_15;
  wire s_unnamed_16;
  wire s_unnamed_17;
  wire s_unnamed_18;
  wire s_unnamed_19;
  wire s_unnamed_20;
  wire s_unnamed_21;
  wire s_unnamed_22;
  wire s_unnamed_23;
  wire s_unnamed_24;
  wire s_unnamed_25;
  wire s_unnamed_26;
  wire s_unnamed_27;
  wire s_unnamed_28;
  wire s_m_packetdata_2_bit_16;
  wire s_m_packetdata_2_bit_17;
  wire [23:0] s_m_packetdata_2_rewired;
  wire s_unnamed_mux2_5;
  wire s_m_packetdata_2_bit_17_mux1;
  wire s_m_packetdata_2_bit_16_mux1;
  wire [7:0] s_unnamed_txstuffedstream_valid_mux2_rewired_txstuffedstream_valid_mux2_rewired;
  wire [7:0] s_unnamed_txstuffedstream_mux1_rewired_txstuffedstream_not_mux1_rewired;
  wire usbfunction0_out_m_phy_tx_valid_2;
  wire [7:0] usbfunction0_out_m_phy_tx_data_2;
  wire [1:0] usbfunction0_out_m_status_linestate;
  wire usbfunction0_out_m_status_rxactive;
  wire usbfunction0_out_m_out;
  wire usbfunction0_out_m_match_delayed1;
  wire usbfunction0_out_m_phy_tx_ready;
  wire usbfunction0_out_unnamed_mux1;
  wire usbfunction0_out_unnamed_mux1_2;
  wire usbfunction0_out_firstdatabit_mux2;
  wire usbfunction0_out_unnamed_mux2;
  wire usbfunction0_out_unnamed_mux1_3;
  wire usbfunction0_out_set_line_coding_mux1;
  wire usbfunction0_out_unnamed_32;
  wire usbfunction0_out_unnamed_eq_set_line_coding_and_m_phy_rx_error_not_and_m_pid_2_rewired_eq_const_11_and_nested_condition_m_phy_rx_eop;
  wire [23:0] usbfunction0_out_m_packetdata_2_rewired_mux1;
  wire usbfunction0_out_unnamed_mux2_2;
  wire usbfunction0_out_unnamed_not_mux1;
  wire [7:0] usbfunction0_out_unnamed_mux1_4;
  wire [3:0] usbfunction0_out_unnamed_mux1_5;
  wire usbfunction0_out_const_0_mux1;
  wire usbfunction0_out_unnamed_mux2_3;
  wire [4:0] usbfunction0_out_const_10_mux1;
  wire usbfunction0_out_unnamed_not_mux1_2;
  wire usbfunction0_out_unnamed_mux2_4;
  wire usbfunction0_out_const_0_mux1_2;
  wire usbfunction0_out_m_packetdata_2_bit_16;
  wire usbfunction0_out_m_packetdata_2_bit_17;
  wire [23:0] usbfunction0_out_m_packetdata_2_rewired;
  wire usbfunction0_out_unnamed_mux2_5;
  wire usbfunction0_out_m_packetdata_2_bit_17_mux1;
  wire usbfunction0_out_m_packetdata_2_bit_16_mux1;
  wire [7:0] usbfunction0_out_unnamed_txstuffedstream_valid_mux2_rewired_txstuffedstream_valid_mux2_rewired;
  wire [7:0] usbfunction0_out_unnamed_txstuffedstream_mux1_rewired_txstuffedstream_not_mux1_rewired;
  wire n92_o;
  wire n93_o;
  wire n94_o;
  wire n96_o;
  wire n97_o;
  wire n98_o;
  wire n99_o;
  wire n100_o;
  wire n101_o;
  wire n103_o;
  wire n104_o;
  wire n106_o;
  wire n107_o;
  wire n108_o;
  wire n109_o;
  wire n110_o;
  wire n112_o;
  wire n113_o;
  wire n114_o;
  wire n115_o;
  wire n116_o;
  wire n118_o;
  wire n119_o;
  wire n120_o;
  wire n121_o;
  wire n122_o;
  wire n124_o;
  wire n125_o;
  wire n126_o;
  wire n127_o;
  wire n128_o;
  wire n130_o;
  wire n131_o;
  wire n132_o;
  wire n133_o;
  wire n134_o;
  wire n136_o;
  wire n137_o;
  wire n138_o;
  wire n139_o;
  wire n140_o;
  wire n141_o;
  wire n142_o;
  wire n143_o;
  wire n144_o;
  wire n145_o;
  wire n146_o;
  wire n147_o;
  localparam [7:0] n148_o = 8'bX;
  wire [6:0] n149_o;
  wire [7:0] n150_o;
  wire [5:0] n151_o;
  wire [6:0] n152_o;
  wire n153_o;
  wire [7:0] n154_o;
  wire [4:0] n155_o;
  wire [5:0] n156_o;
  wire [1:0] n157_o;
  wire [7:0] n158_o;
  wire [3:0] n159_o;
  wire [4:0] n160_o;
  wire [2:0] n161_o;
  wire [7:0] n162_o;
  wire [2:0] n163_o;
  wire [3:0] n164_o;
  wire [3:0] n165_o;
  wire [7:0] n166_o;
  wire [1:0] n167_o;
  wire [2:0] n168_o;
  wire [4:0] n169_o;
  wire [7:0] n170_o;
  wire n171_o;
  wire [1:0] n172_o;
  wire [5:0] n173_o;
  wire [7:0] n174_o;
  wire [6:0] n175_o;
  wire [7:0] n176_o;
  wire [6:0] n177_o;
  wire [7:0] n178_o;
  wire n180_o;
  wire [5:0] n181_o;
  wire [6:0] n182_o;
  wire n183_o;
  wire [7:0] n184_o;
  wire [7:0] n185_o;
  wire [6:0] n186_o;
  wire [7:0] n187_o;
  wire [5:0] n188_o;
  wire [6:0] n189_o;
  wire n190_o;
  wire [7:0] n191_o;
  wire [4:0] n192_o;
  wire [5:0] n193_o;
  wire [1:0] n194_o;
  wire [7:0] n195_o;
  wire [3:0] n196_o;
  wire [4:0] n197_o;
  wire [2:0] n198_o;
  wire [7:0] n199_o;
  wire [2:0] n200_o;
  wire [3:0] n201_o;
  wire [3:0] n202_o;
  wire [7:0] n203_o;
  wire [1:0] n204_o;
  wire [2:0] n205_o;
  wire [4:0] n206_o;
  wire [7:0] n207_o;
  wire n209_o;
  wire [1:0] n210_o;
  wire [7:0] n212_o;
  wire [7:0] n213_o;
  wire [6:0] n214_o;
  wire [7:0] n215_o;
  wire [5:0] n216_o;
  wire [6:0] n217_o;
  wire n218_o;
  wire [7:0] n219_o;
  wire [4:0] n220_o;
  wire [5:0] n221_o;
  wire [1:0] n222_o;
  wire [7:0] n223_o;
  wire [3:0] n224_o;
  wire [4:0] n225_o;
  wire [2:0] n226_o;
  wire [7:0] n227_o;
  wire [2:0] n228_o;
  wire [3:0] n229_o;
  wire [3:0] n230_o;
  wire [7:0] n231_o;
  wire [1:0] n232_o;
  wire [2:0] n233_o;
  wire [4:0] n234_o;
  wire [7:0] n235_o;
  wire n237_o;
  wire [5:0] n238_o;
  wire [6:0] n239_o;
  wire n240_o;
  wire [7:0] n241_o;
  wire [7:0] n242_o;
  wire n243_o;
  localparam [11:0] n244_o = 12'bX;
  wire [7:0] n245_o;
  wire [7:0] n246_o;
  wire n247_o;
  localparam [11:0] n248_o = 12'bX;
  wire [3:0] n249_o;
  wire [3:0] n251_o;
  localparam [11:0] n252_o = 12'bX;
  wire [7:0] n253_o;
  localparam [11:0] n254_o = 12'bX;
  wire [3:0] n255_o;
  wire n274_o;
  wire [7:0] scl_fifo0_out_m_peekdata_data;
  wire scl_fifo0_out_m_pushfull;
  wire scl_fifo0_out_m_popempty;
  wire scl_streamdemux0_out_out_0_ready;
  wire scl_streamdemux0_out_out_0_valid;
  wire [7:0] scl_streamdemux0_out_out_0;
  wire scl_streamdemux0_out_m_in_ready_mux2;
  wire scl_streamdemux0_out_out_1_ready;
  wire scl_streamdemux0_out_out_1_valid;
  wire [7:0] scl_streamdemux0_out_out_1;
  wire scl_uarttx0_out_baud_and_m_last;
  wire scl_uarttx0_out_out;
  wire scl_bitbangengine0_out_const_0_mux13;
  wire scl_bitbangengine0_out_m_io0_out;
  wire scl_bitbangengine0_out_m_io0_en;
  wire scl_bitbangengine0_out_m_io0_opendrain;
  wire scl_bitbangengine0_out_m_io1_out;
  wire scl_bitbangengine0_out_m_io1_en;
  wire scl_bitbangengine0_out_m_io1_opendrain;
  wire scl_bitbangengine0_out_m_io2_out;
  wire scl_bitbangengine0_out_m_io2_en;
  wire scl_bitbangengine0_out_m_io2_opendrain;
  wire scl_bitbangengine0_out_m_io3_out;
  wire scl_bitbangengine0_out_m_io3_en;
  wire scl_bitbangengine0_out_m_io3_opendrain;
  wire scl_bitbangengine0_out_m_io4_out;
  wire scl_bitbangengine0_out_m_io4_en;
  wire scl_bitbangengine0_out_m_io4_opendrain;
  wire scl_bitbangengine0_out_m_io5_out;
  wire scl_bitbangengine0_out_m_io5_en;
  wire scl_bitbangengine0_out_m_io5_opendrain;
  wire scl_bitbangengine0_out_m_io8_out;
  wire scl_bitbangengine0_out_m_io9_out;
  wire scl_bitbangengine0_out_m_io10_out;
  wire scl_bitbangengine0_out_m_io11_out;
  wire scl_bitbangengine0_out_m_io12_out;
  wire scl_bitbangengine0_out_m_io13_out;
  wire scl_bitbangengine0_out_m_io14_out;
  wire scl_bitbangengine0_out_m_io15_out;
  wire scl_bitbangengine0_out_out_ready;
  wire scl_bitbangengine0_out_out_valid;
  wire [7:0] scl_bitbangengine0_out_out;
  wire scl_uartrx0_out_out_valid;
  wire [7:0] scl_uartrx0_out_out;
  wire scl_streamarbiter_2_out_const_0_mux1;
  wire scl_streamarbiter_2_out_m_out_valid;
  wire [7:0] scl_streamarbiter_2_out_m_out;
  wire [7:0] scl_fifo1_out_m_peekdata_data;
  wire [3:0] scl_fifo1_out_m_peekdata_endpoint;
  wire scl_fifo1_out_m_pushfull;
  wire scl_fifo1_out_m_popempty;
  reg n346_q;
  reg n347_q;
  wire n348_o;
  reg n349_q;
  wire n350_o;
  reg n351_q;
  wire [23:0] n352_o;
  reg [23:0] n353_q;
  assign uio_out = n242_o;
  assign uio_oe = n213_o;
  assign uo_out = n185_o;
  /* find_the_damn_issue_sky130.vhd:9909:16  */
  assign s_m_status_linestate_2 = s_m_status_linestate; // (signal)
  /* find_the_damn_issue_sky130.vhd:9910:16  */
  assign s_m_status_rxactive_2 = s_m_status_rxactive; // (signal)
  /* find_the_damn_issue_sky130.vhd:9911:16  */
  assign s_unnamed_or_in_valid_mux1_delayed1_not_mux1 = s_m_phy_tx_ready; // (signal)
  /* find_the_damn_issue_sky130.vhd:9912:16  */
  assign s_m_phy_tx_valid_3 = s_m_phy_tx_valid_2; // (signal)
  /* find_the_damn_issue_sky130.vhd:9913:16  */
  assign s_m_phy_tx_data_3 = s_m_phy_tx_data_2; // (signal)
  /* find_the_damn_issue_sky130.vhd:9914:16  */
  assign s_unnamed_mux2 = s_unnamed_mux2_3; // (signal)
  /* find_the_damn_issue_sky130.vhd:9915:16  */
  assign s_in_mux1 = s_in_mux1_2; // (signal)
  /* find_the_damn_issue_sky130.vhd:9916:16  */
  assign s_m_out_2 = s_m_out; // (signal)
  /* find_the_damn_issue_sky130.vhd:9917:16  */
  assign s_m_match_delayed1 = s_m_match_delayed1_2; // (signal)
  /* find_the_damn_issue_sky130.vhd:9918:16  */
  assign s_firstdatabit_mux1 = s_firstdatabit_mux1_2; // (signal)
  /* find_the_damn_issue_sky130.vhd:9919:16  */
  assign s_unnamed_mux1 = s_unnamed_mux1_4; // (signal)
  /* find_the_damn_issue_sky130.vhd:9920:16  */
  assign s_unnamed_mux1_2 = s_unnamed_mux1_3; // (signal)
  /* find_the_damn_issue_sky130.vhd:9921:16  */
  assign s_m_phy_tx_valid_2 = usbfunction0_out_m_phy_tx_valid_2; // (signal)
  /* find_the_damn_issue_sky130.vhd:9922:16  */
  assign s_m_phy_tx_data_2 = usbfunction0_out_m_phy_tx_data_2; // (signal)
  /* find_the_damn_issue_sky130.vhd:9923:16  */
  assign s_unnamed_mux2_2 = s_unnamed_mux2_4; // (signal)
  /* find_the_damn_issue_sky130.vhd:9924:16  */
  always @*
    s_operatingmode = n346_q; // (isignal)
  initial
    s_operatingmode = 1'b0;
  /* find_the_damn_issue_sky130.vhd:9925:16  */
  assign s_uio_in_2 = uio_in; // (signal)
  /* find_the_damn_issue_sky130.vhd:9926:16  */
  assign s_unnamed = 8'bX; // (signal)
  /* find_the_damn_issue_sky130.vhd:9927:16  */
  assign s_unnamed_2 = 8'bX; // (signal)
  /* find_the_damn_issue_sky130.vhd:9928:16  */
  assign s_operatingmode_2 = s_operatingmode; // (signal)
  /* find_the_damn_issue_sky130.vhd:9929:16  */
  assign s_set_line_coding_mux1 = s_set_line_coding_mux1_2; // (signal)
  /* find_the_damn_issue_sky130.vhd:9930:16  */
  always @*
    s_unnamed_3 = n347_q; // (isignal)
  initial
    s_unnamed_3 = 1'b0;
  /* find_the_damn_issue_sky130.vhd:9931:16  */
  always @*
    s_dtr = n349_q; // (isignal)
  initial
    s_dtr = 1'b0;
  /* find_the_damn_issue_sky130.vhd:9932:16  */
  assign s_dtr_2 = s_dtr; // (signal)
  /* find_the_damn_issue_sky130.vhd:9933:16  */
  always @*
    s_rts = n351_q; // (isignal)
  initial
    s_rts = 1'b0;
  /* find_the_damn_issue_sky130.vhd:9934:16  */
  assign s_rts_2 = s_rts; // (signal)
  /* find_the_damn_issue_sky130.vhd:9935:16  */
  always @*
    s_baudrate = n353_q; // (isignal)
  initial
    s_baudrate = 24'b000000011100001000000000;
  /* find_the_damn_issue_sky130.vhd:9936:16  */
  assign s_baudrate_2 = s_baudrate; // (signal)
  /* find_the_damn_issue_sky130.vhd:9937:16  */
  assign s_m_status_linestate = usbfunction0_out_m_status_linestate; // (signal)
  /* find_the_damn_issue_sky130.vhd:9938:16  */
  assign s_m_status_rxactive = usbfunction0_out_m_status_rxactive; // (signal)
  /* find_the_damn_issue_sky130.vhd:9939:16  */
  assign s_m_out = usbfunction0_out_m_out; // (signal)
  /* find_the_damn_issue_sky130.vhd:9940:16  */
  assign s_m_match_delayed1_2 = usbfunction0_out_m_match_delayed1; // (signal)
  /* find_the_damn_issue_sky130.vhd:9941:16  */
  assign s_m_phy_tx_ready = usbfunction0_out_m_phy_tx_ready; // (signal)
  /* find_the_damn_issue_sky130.vhd:9942:16  */
  assign s_unnamed_mux1_3 = usbfunction0_out_unnamed_mux1; // (signal)
  /* find_the_damn_issue_sky130.vhd:9943:16  */
  assign s_in_mux1_2 = usbfunction0_out_unnamed_mux1_2; // (signal)
  /* find_the_damn_issue_sky130.vhd:9944:16  */
  assign s_firstdatabit_mux1_2 = usbfunction0_out_firstdatabit_mux2; // (signal)
  /* find_the_damn_issue_sky130.vhd:9945:16  */
  assign s_unnamed_mux2_3 = usbfunction0_out_unnamed_mux2; // (signal)
  /* find_the_damn_issue_sky130.vhd:9946:16  */
  assign s_unnamed_mux1_4 = usbfunction0_out_unnamed_mux1_3; // (signal)
  /* find_the_damn_issue_sky130.vhd:9947:16  */
  assign s_set_line_coding_mux1_2 = usbfunction0_out_set_line_coding_mux1; // (signal)
  /* find_the_damn_issue_sky130.vhd:9948:16  */
  assign s_unnamed_4 = usbfunction0_out_unnamed_32; // (signal)
  /* find_the_damn_issue_sky130.vhd:9949:16  */
  assign s_unnamed_eq_set_line_coding_and_m_phy_rx_error_not_and_m_pid_2_rewired_eq_const_11_and_nested_condition_m_phy_rx_eop = usbfunction0_out_unnamed_eq_set_line_coding_and_m_phy_rx_error_not_and_m_pid_2_rewired_eq_const_11_and_nested_condition_m_phy_rx_eop; // (signal)
  /* find_the_damn_issue_sky130.vhd:9950:16  */
  assign s_baudrate_3 = usbfunction0_out_m_packetdata_2_rewired_mux1; // (signal)
  /* find_the_damn_issue_sky130.vhd:9951:16  */
  assign s_unnamed_mux2_4 = usbfunction0_out_unnamed_mux2_2; // (signal)
  /* find_the_damn_issue_sky130.vhd:9952:16  */
  assign s_unnamed_5 = 1'b0; // (signal)
  /* find_the_damn_issue_sky130.vhd:9953:16  */
  assign s_unnamed_6 = n253_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:9954:16  */
  assign s_unnamed_7 = n255_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:9955:16  */
  assign s_m_peekdata_data = scl_fifo0_out_m_peekdata_data; // (signal)
  /* find_the_damn_issue_sky130.vhd:9956:16  */
  assign s_unnamed_8 = 1'b0; // (signal)
  /* find_the_damn_issue_sky130.vhd:9957:16  */
  assign s_unnamed_9 = 5'b00000; // (signal)
  /* find_the_damn_issue_sky130.vhd:9958:16  */
  assign s_m_pushvalid = usbfunction0_out_unnamed_not_mux1; // (signal)
  /* find_the_damn_issue_sky130.vhd:9959:16  */
  assign s_m_pushdata_data = usbfunction0_out_unnamed_mux1_4; // (signal)
  /* find_the_damn_issue_sky130.vhd:9960:16  */
  assign s_m_pushdata_endpoint = usbfunction0_out_unnamed_mux1_5; // (signal)
  /* find_the_damn_issue_sky130.vhd:9961:16  */
  assign s_m_pushcommit = usbfunction0_out_const_0_mux1; // (signal)
  /* find_the_damn_issue_sky130.vhd:9962:16  */
  assign s_m_pushrollack = usbfunction0_out_unnamed_mux2_3; // (signal)
  /* find_the_damn_issue_sky130.vhd:9963:16  */
  assign s_m_pushcutoff = usbfunction0_out_const_10_mux1; // (signal)
  /* find_the_damn_issue_sky130.vhd:9964:16  */
  assign s_m_popvalid = n96_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:9965:16  */
  assign s_m_pushfull = scl_fifo0_out_m_pushfull; // (signal)
  /* find_the_damn_issue_sky130.vhd:9966:16  */
  assign s_m_popempty = scl_fifo0_out_m_popempty; // (signal)
  /* find_the_damn_issue_sky130.vhd:9967:16  */
  assign s_usbep1_rx_valid = n97_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:9968:16  */
  assign s_usbep1_rx = s_m_peekdata_data; // (signal)
  /* find_the_damn_issue_sky130.vhd:9969:16  */
  assign s_m_selector = s_operatingmode_2; // (signal)
  /* find_the_damn_issue_sky130.vhd:9970:16  */
  assign s_out_0_ready = scl_streamdemux0_out_out_0_ready; // (signal)
  /* find_the_damn_issue_sky130.vhd:9971:16  */
  assign s_out_0_valid = scl_streamdemux0_out_out_0_valid; // (signal)
  /* find_the_damn_issue_sky130.vhd:9972:16  */
  assign s_out_0 = scl_streamdemux0_out_out_0; // (signal)
  /* find_the_damn_issue_sky130.vhd:9973:16  */
  assign s_unnamed_10 = scl_uarttx0_out_baud_and_m_last; // (signal)
  /* find_the_damn_issue_sky130.vhd:9974:16  */
  assign s_out = scl_uarttx0_out_out; // (signal)
  /* find_the_damn_issue_sky130.vhd:9975:16  */
  assign s_usbep1_rx_ready = scl_streamdemux0_out_m_in_ready_mux2; // (signal)
  /* find_the_damn_issue_sky130.vhd:9976:16  */
  assign s_out_1_ready = scl_streamdemux0_out_out_1_ready; // (signal)
  /* find_the_damn_issue_sky130.vhd:9977:16  */
  assign s_out_1_valid = scl_streamdemux0_out_out_1_valid; // (signal)
  /* find_the_damn_issue_sky130.vhd:9978:16  */
  assign s_out_1 = scl_streamdemux0_out_out_1; // (signal)
  /* find_the_damn_issue_sky130.vhd:9979:16  */
  assign s_unnamed_11 = scl_bitbangengine0_out_const_0_mux13; // (signal)
  /* find_the_damn_issue_sky130.vhd:9980:16  */
  assign s_m_io0_out = scl_bitbangengine0_out_m_io0_out; // (signal)
  /* find_the_damn_issue_sky130.vhd:9981:16  */
  assign s_m_io0_en = scl_bitbangengine0_out_m_io0_en; // (signal)
  /* find_the_damn_issue_sky130.vhd:9982:16  */
  assign s_m_io0_opendrain = scl_bitbangengine0_out_m_io0_opendrain; // (signal)
  /* find_the_damn_issue_sky130.vhd:9983:16  */
  assign s_m_io1_out = scl_bitbangengine0_out_m_io1_out; // (signal)
  /* find_the_damn_issue_sky130.vhd:9984:16  */
  assign s_m_io1_en = scl_bitbangengine0_out_m_io1_en; // (signal)
  /* find_the_damn_issue_sky130.vhd:9985:16  */
  assign s_m_io1_opendrain = scl_bitbangengine0_out_m_io1_opendrain; // (signal)
  /* find_the_damn_issue_sky130.vhd:9986:16  */
  assign s_m_io2_out = scl_bitbangengine0_out_m_io2_out; // (signal)
  /* find_the_damn_issue_sky130.vhd:9987:16  */
  assign s_m_io2_en = scl_bitbangengine0_out_m_io2_en; // (signal)
  /* find_the_damn_issue_sky130.vhd:9988:16  */
  assign s_m_io2_opendrain = scl_bitbangengine0_out_m_io2_opendrain; // (signal)
  /* find_the_damn_issue_sky130.vhd:9989:16  */
  assign s_m_io3_out = scl_bitbangengine0_out_m_io3_out; // (signal)
  /* find_the_damn_issue_sky130.vhd:9990:16  */
  assign s_m_io3_en = scl_bitbangengine0_out_m_io3_en; // (signal)
  /* find_the_damn_issue_sky130.vhd:9991:16  */
  assign s_m_io3_opendrain = scl_bitbangengine0_out_m_io3_opendrain; // (signal)
  /* find_the_damn_issue_sky130.vhd:9992:16  */
  assign s_m_io4_out = scl_bitbangengine0_out_m_io4_out; // (signal)
  /* find_the_damn_issue_sky130.vhd:9993:16  */
  assign s_m_io4_en = scl_bitbangengine0_out_m_io4_en; // (signal)
  /* find_the_damn_issue_sky130.vhd:9994:16  */
  assign s_m_io4_opendrain = scl_bitbangengine0_out_m_io4_opendrain; // (signal)
  /* find_the_damn_issue_sky130.vhd:9995:16  */
  assign s_m_io5_out = scl_bitbangengine0_out_m_io5_out; // (signal)
  /* find_the_damn_issue_sky130.vhd:9996:16  */
  assign s_m_io5_en = scl_bitbangengine0_out_m_io5_en; // (signal)
  /* find_the_damn_issue_sky130.vhd:9997:16  */
  assign s_m_io5_opendrain = scl_bitbangengine0_out_m_io5_opendrain; // (signal)
  /* find_the_damn_issue_sky130.vhd:9998:16  */
  assign s_m_io8_out = scl_bitbangengine0_out_m_io8_out; // (signal)
  /* find_the_damn_issue_sky130.vhd:9999:16  */
  assign s_m_io9_out = scl_bitbangengine0_out_m_io9_out; // (signal)
  /* find_the_damn_issue_sky130.vhd:10000:16  */
  assign s_m_io10_out = scl_bitbangengine0_out_m_io10_out; // (signal)
  /* find_the_damn_issue_sky130.vhd:10001:16  */
  assign s_m_io11_out = scl_bitbangengine0_out_m_io11_out; // (signal)
  /* find_the_damn_issue_sky130.vhd:10002:16  */
  assign s_m_io12_out = scl_bitbangengine0_out_m_io12_out; // (signal)
  /* find_the_damn_issue_sky130.vhd:10003:16  */
  assign s_m_io13_out = scl_bitbangengine0_out_m_io13_out; // (signal)
  /* find_the_damn_issue_sky130.vhd:10004:16  */
  assign s_m_io14_out = scl_bitbangengine0_out_m_io14_out; // (signal)
  /* find_the_damn_issue_sky130.vhd:10005:16  */
  assign s_m_io15_out = scl_bitbangengine0_out_m_io15_out; // (signal)
  /* find_the_damn_issue_sky130.vhd:10007:16  */
  assign s_out_valid = scl_bitbangengine0_out_out_valid; // (signal)
  /* find_the_damn_issue_sky130.vhd:10008:16  */
  assign s_out_2 = scl_bitbangengine0_out_out; // (signal)
  /* find_the_damn_issue_sky130.vhd:10009:16  */
  assign s_bitbangout_valid = s_out_valid; // (signal)
  /* find_the_damn_issue_sky130.vhd:10010:16  */
  assign s_bitbangout = s_out_2; // (signal)
  /* find_the_damn_issue_sky130.vhd:10011:16  */
  assign s_rx = n98_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:10012:16  */
  assign s_out_valid_2 = scl_uartrx0_out_out_valid; // (signal)
  /* find_the_damn_issue_sky130.vhd:10013:16  */
  assign s_out_3 = scl_uartrx0_out_out; // (signal)
  /* find_the_damn_issue_sky130.vhd:10014:16  */
  assign s_uartout_valid = s_out_valid_2; // (signal)
  /* find_the_damn_issue_sky130.vhd:10015:16  */
  assign s_uartout = s_out_3; // (signal)
  /* find_the_damn_issue_sky130.vhd:10016:16  */
  assign s_unnamed_12 = scl_streamarbiter_2_out_const_0_mux1; // (signal)
  /* find_the_damn_issue_sky130.vhd:10017:16  */
  assign s_m_out_valid = scl_streamarbiter_2_out_m_out_valid; // (signal)
  /* find_the_damn_issue_sky130.vhd:10018:16  */
  assign s_m_out_3 = scl_streamarbiter_2_out_m_out; // (signal)
  /* find_the_damn_issue_sky130.vhd:10019:16  */
  assign s_unnamed_13 = 1'b0; // (signal)
  /* find_the_damn_issue_sky130.vhd:10020:16  */
  assign s_m_peekdata_data_2 = scl_fifo1_out_m_peekdata_data; // (signal)
  /* find_the_damn_issue_sky130.vhd:10021:16  */
  assign s_m_peekdata_endpoint = scl_fifo1_out_m_peekdata_endpoint; // (signal)
  /* find_the_damn_issue_sky130.vhd:10022:16  */
  assign s_unnamed_14 = 1'b0; // (signal)
  /* find_the_damn_issue_sky130.vhd:10023:16  */
  assign s_m_pushcutoff_2 = 5'b00000; // (signal)
  /* find_the_damn_issue_sky130.vhd:10024:16  */
  assign s_m_popvalid_2 = usbfunction0_out_unnamed_not_mux1_2; // (signal)
  /* find_the_damn_issue_sky130.vhd:10025:16  */
  assign s_m_popcommit = usbfunction0_out_unnamed_mux2_4; // (signal)
  /* find_the_damn_issue_sky130.vhd:10026:16  */
  assign s_m_poprollback = usbfunction0_out_const_0_mux1_2; // (signal)
  /* find_the_damn_issue_sky130.vhd:10027:16  */
  assign s_m_out_ready = n99_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:10028:16  */
  assign s_m_pushvalid_2 = n103_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:10029:16  */
  assign s_m_pushdata_data_2 = n246_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:10030:16  */
  assign s_m_pushdata_endpoint_2 = n251_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:10031:16  */
  assign s_m_pushfull_2 = scl_fifo1_out_m_pushfull; // (signal)
  /* find_the_damn_issue_sky130.vhd:10032:16  */
  assign s_m_popempty_2 = scl_fifo1_out_m_popempty; // (signal)
  /* find_the_damn_issue_sky130.vhd:10033:16  */
  assign s_unnamed_15 = n104_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:10034:16  */
  assign s_unnamed_16 = n110_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:10035:16  */
  assign s_unnamed_17 = n116_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:10036:16  */
  assign s_unnamed_18 = n122_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:10037:16  */
  assign s_unnamed_19 = n128_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:10038:16  */
  assign s_unnamed_20 = n134_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:10039:16  */
  assign s_unnamed_21 = n140_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:10040:16  */
  assign s_unnamed_22 = n141_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:10041:16  */
  assign s_unnamed_23 = n142_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:10042:16  */
  assign s_unnamed_24 = n143_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:10043:16  */
  assign s_unnamed_25 = n144_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:10044:16  */
  assign s_unnamed_26 = n145_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:10045:16  */
  assign s_unnamed_27 = n146_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:10046:16  */
  assign s_unnamed_28 = n147_o; // (signal)
  /* find_the_damn_issue_sky130.vhd:10047:16  */
  assign s_m_packetdata_2_bit_16 = usbfunction0_out_m_packetdata_2_bit_16; // (signal)
  /* find_the_damn_issue_sky130.vhd:10048:16  */
  assign s_m_packetdata_2_bit_17 = usbfunction0_out_m_packetdata_2_bit_17; // (signal)
  /* find_the_damn_issue_sky130.vhd:10049:16  */
  assign s_m_packetdata_2_rewired = usbfunction0_out_m_packetdata_2_rewired; // (signal)
  /* find_the_damn_issue_sky130.vhd:10050:16  */
  assign s_unnamed_mux2_5 = usbfunction0_out_unnamed_mux2_5; // (signal)
  /* find_the_damn_issue_sky130.vhd:10051:16  */
  assign s_m_packetdata_2_bit_17_mux1 = usbfunction0_out_m_packetdata_2_bit_17_mux1; // (signal)
  /* find_the_damn_issue_sky130.vhd:10052:16  */
  assign s_m_packetdata_2_bit_16_mux1 = usbfunction0_out_m_packetdata_2_bit_16_mux1; // (signal)
  /* find_the_damn_issue_sky130.vhd:10053:16  */
  assign s_unnamed_txstuffedstream_valid_mux2_rewired_txstuffedstream_valid_mux2_rewired = usbfunction0_out_unnamed_txstuffedstream_valid_mux2_rewired_txstuffedstream_valid_mux2_rewired; // (signal)
  /* find_the_damn_issue_sky130.vhd:10054:16  */
  assign s_unnamed_txstuffedstream_mux1_rewired_txstuffedstream_not_mux1_rewired = usbfunction0_out_unnamed_txstuffedstream_mux1_rewired_txstuffedstream_not_mux1_rewired; // (signal)
  /* find_the_damn_issue_sky130.vhd:10056:9  */
  usbfunction usbfunction0 (
    .clk(clk),
    .rst_n(rst_n),
    .in_unnamed(s_m_status_linestate_2),
    .in_unnamed_2(s_m_status_rxactive_2),
    .in_unnamed_3(s_unnamed_or_in_valid_mux1_delayed1_not_mux1),
    .in_unnamed_4(s_m_phy_tx_valid_3),
    .in_unnamed_5(s_m_phy_tx_data_3),
    .in_unnamed_6(s_unnamed_mux2),
    .in_unnamed_7(s_in_mux1),
    .in_unnamed_8(s_m_out_2),
    .in_unnamed_9(s_m_match_delayed1),
    .in_unnamed_10(s_firstdatabit_mux1),
    .in_unnamed_11(s_unnamed_mux1),
    .in_unnamed_12(s_unnamed_mux1_2),
    .in_unnamed_13(s_operatingmode),
    .in_unnamed_14(s_uio_in_2),
    .in_unnamed_15(s_unnamed),
    .in_unnamed_16(s_unnamed_2),
    .in_unnamed_17(s_unnamed_3),
    .in_unnamed_18(s_dtr_2),
    .in_unnamed_19(s_rts_2),
    .in_unnamed_20(s_baudrate_2),
    .in_unnamed_21(s_unnamed_5),
    .in_unnamed_22(s_unnamed_6),
    .in_unnamed_23(s_unnamed_7),
    .in_unnamed_24(s_unnamed_8),
    .in_unnamed_25(s_unnamed_9),
    .in_unnamed_26(s_m_pushfull),
    .in_unnamed_27(s_unnamed_13),
    .in_unnamed_28(s_m_peekdata_data_2),
    .in_unnamed_29(s_m_peekdata_endpoint),
    .in_unnamed_30(s_unnamed_14),
    .in_unnamed_31(s_m_popempty_2),
    .out_m_phy_tx_valid_2(usbfunction0_out_m_phy_tx_valid_2),
    .out_m_phy_tx_data_2(usbfunction0_out_m_phy_tx_data_2),
    .out_m_status_linestate(usbfunction0_out_m_status_linestate),
    .out_m_status_rxactive(usbfunction0_out_m_status_rxactive),
    .out_m_out(usbfunction0_out_m_out),
    .out_m_match_delayed1(usbfunction0_out_m_match_delayed1),
    .out_m_phy_tx_ready(usbfunction0_out_m_phy_tx_ready),
    .out_unnamed_mux1(usbfunction0_out_unnamed_mux1),
    .out_unnamed_mux1_2(usbfunction0_out_unnamed_mux1_2),
    .out_firstdatabit_mux2(usbfunction0_out_firstdatabit_mux2),
    .out_unnamed_mux2(usbfunction0_out_unnamed_mux2),
    .out_unnamed_mux1_3(usbfunction0_out_unnamed_mux1_3),
    .out_set_line_coding_mux1(usbfunction0_out_set_line_coding_mux1),
    .out_unnamed_32(usbfunction0_out_unnamed_32),
    .out_unnamed_eq_set_line_coding_and_m_phy_rx_error_not_and_m_pid_2_rewired_eq_const_11_and_nested_condition_m_phy_rx_eop(usbfunction0_out_unnamed_eq_set_line_coding_and_m_phy_rx_error_not_and_m_pid_2_rewired_eq_const_11_and_nested_condition_m_phy_rx_eop),
    .out_m_packetdata_2_rewired_mux1(usbfunction0_out_m_packetdata_2_rewired_mux1),
    .out_unnamed_mux2_2(usbfunction0_out_unnamed_mux2_2),
    .out_unnamed_not_mux1(usbfunction0_out_unnamed_not_mux1),
    .out_unnamed_mux1_4(usbfunction0_out_unnamed_mux1_4),
    .out_unnamed_mux1_5(usbfunction0_out_unnamed_mux1_5),
    .out_const_0_mux1(usbfunction0_out_const_0_mux1),
    .out_unnamed_mux2_3(usbfunction0_out_unnamed_mux2_3),
    .out_const_10_mux1(usbfunction0_out_const_10_mux1),
    .out_unnamed_not_mux1_2(usbfunction0_out_unnamed_not_mux1_2),
    .out_unnamed_mux2_4(usbfunction0_out_unnamed_mux2_4),
    .out_const_0_mux1_2(usbfunction0_out_const_0_mux1_2),
    .out_m_packetdata_2_bit_16(usbfunction0_out_m_packetdata_2_bit_16),
    .out_m_packetdata_2_bit_17(usbfunction0_out_m_packetdata_2_bit_17),
    .out_m_packetdata_2_rewired(usbfunction0_out_m_packetdata_2_rewired),
    .out_unnamed_mux2_5(usbfunction0_out_unnamed_mux2_5),
    .out_m_packetdata_2_bit_17_mux1(usbfunction0_out_m_packetdata_2_bit_17_mux1),
    .out_m_packetdata_2_bit_16_mux1(usbfunction0_out_m_packetdata_2_bit_16_mux1),
    .out_unnamed_txstuffedstream_valid_mux2_rewired_txstuffedstream_valid_mux2_rewired(usbfunction0_out_unnamed_txstuffedstream_valid_mux2_rewired_txstuffedstream_valid_mux2_rewired),
    .out_unnamed_txstuffedstream_mux1_rewired_txstuffedstream_not_mux1_rewired(usbfunction0_out_unnamed_txstuffedstream_mux1_rewired_txstuffedstream_not_mux1_rewired));
  /* find_the_damn_issue_sky130.vhd:10204:23  */
  assign n92_o = ~s_m_popempty;
  /* find_the_damn_issue_sky130.vhd:10204:47  */
  assign n93_o = n92_o & s_usbep1_rx_ready;
  /* find_the_damn_issue_sky130.vhd:10205:43  */
  assign n94_o = ~s_m_popempty;
  /* find_the_damn_issue_sky130.vhd:10204:17  */
  assign n96_o = n93_o ? n94_o : 1'b0;
  /* find_the_damn_issue_sky130.vhd:10210:40  */
  assign n97_o = ~s_m_popempty;
  /* find_the_damn_issue_sky130.vhd:10217:35  */
  assign n98_o = s_uio_in_2[2];
  /* find_the_damn_issue_sky130.vhd:10223:36  */
  assign n99_o = ~s_m_pushfull_2;
  /* find_the_damn_issue_sky130.vhd:10224:41  */
  assign n100_o = s_m_out_valid & s_m_out_ready;
  /* find_the_damn_issue_sky130.vhd:10225:46  */
  assign n101_o = ~s_m_pushfull_2;
  /* find_the_damn_issue_sky130.vhd:10224:17  */
  assign n103_o = n100_o ? n101_o : 1'b0;
  /* find_the_damn_issue_sky130.vhd:10229:43  */
  assign n104_o = s_uio_in_2[0];
  /* find_the_damn_issue_sky130.vhd:10230:17  */
  assign n106_o = s_m_io0_opendrain ? 1'b0 : s_m_io0_out;
  /* find_the_damn_issue_sky130.vhd:10236:62  */
  assign n107_o = ~s_m_io0_out;
  /* find_the_damn_issue_sky130.vhd:10236:56  */
  assign n108_o = s_m_io0_en & n107_o;
  /* find_the_damn_issue_sky130.vhd:10235:17  */
  assign n109_o = s_m_io0_opendrain ? n108_o : s_m_io0_en;
  /* find_the_damn_issue_sky130.vhd:10240:43  */
  assign n110_o = s_uio_in_2[1];
  /* find_the_damn_issue_sky130.vhd:10241:17  */
  assign n112_o = s_m_io1_opendrain ? 1'b0 : s_m_io1_out;
  /* find_the_damn_issue_sky130.vhd:10247:62  */
  assign n113_o = ~s_m_io1_out;
  /* find_the_damn_issue_sky130.vhd:10247:56  */
  assign n114_o = s_m_io1_en & n113_o;
  /* find_the_damn_issue_sky130.vhd:10246:17  */
  assign n115_o = s_m_io1_opendrain ? n114_o : s_m_io1_en;
  /* find_the_damn_issue_sky130.vhd:10251:43  */
  assign n116_o = s_uio_in_2[2];
  /* find_the_damn_issue_sky130.vhd:10252:17  */
  assign n118_o = s_m_io2_opendrain ? 1'b0 : s_m_io2_out;
  /* find_the_damn_issue_sky130.vhd:10258:62  */
  assign n119_o = ~s_m_io2_out;
  /* find_the_damn_issue_sky130.vhd:10258:56  */
  assign n120_o = s_m_io2_en & n119_o;
  /* find_the_damn_issue_sky130.vhd:10257:17  */
  assign n121_o = s_m_io2_opendrain ? n120_o : s_m_io2_en;
  /* find_the_damn_issue_sky130.vhd:10262:43  */
  assign n122_o = s_uio_in_2[3];
  /* find_the_damn_issue_sky130.vhd:10263:17  */
  assign n124_o = s_m_io3_opendrain ? 1'b0 : s_m_io3_out;
  /* find_the_damn_issue_sky130.vhd:10269:62  */
  assign n125_o = ~s_m_io3_out;
  /* find_the_damn_issue_sky130.vhd:10269:56  */
  assign n126_o = s_m_io3_en & n125_o;
  /* find_the_damn_issue_sky130.vhd:10268:17  */
  assign n127_o = s_m_io3_opendrain ? n126_o : s_m_io3_en;
  /* find_the_damn_issue_sky130.vhd:10273:43  */
  assign n128_o = s_uio_in_2[4];
  /* find_the_damn_issue_sky130.vhd:10274:17  */
  assign n130_o = s_m_io4_opendrain ? 1'b0 : s_m_io4_out;
  /* find_the_damn_issue_sky130.vhd:10280:62  */
  assign n131_o = ~s_m_io4_out;
  /* find_the_damn_issue_sky130.vhd:10280:56  */
  assign n132_o = s_m_io4_en & n131_o;
  /* find_the_damn_issue_sky130.vhd:10279:17  */
  assign n133_o = s_m_io4_opendrain ? n132_o : s_m_io4_en;
  /* find_the_damn_issue_sky130.vhd:10284:43  */
  assign n134_o = s_uio_in_2[5];
  /* find_the_damn_issue_sky130.vhd:10285:17  */
  assign n136_o = s_m_io5_opendrain ? 1'b0 : s_m_io5_out;
  /* find_the_damn_issue_sky130.vhd:10291:62  */
  assign n137_o = ~s_m_io5_out;
  /* find_the_damn_issue_sky130.vhd:10291:56  */
  assign n138_o = s_m_io5_en & n137_o;
  /* find_the_damn_issue_sky130.vhd:10290:17  */
  assign n139_o = s_m_io5_opendrain ? n138_o : s_m_io5_en;
  /* find_the_damn_issue_sky130.vhd:10296:40  */
  assign n140_o = ui_in[0];
  /* find_the_damn_issue_sky130.vhd:10297:40  */
  assign n141_o = ui_in[1];
  /* find_the_damn_issue_sky130.vhd:10298:40  */
  assign n142_o = ui_in[2];
  /* find_the_damn_issue_sky130.vhd:10299:40  */
  assign n143_o = ui_in[3];
  /* find_the_damn_issue_sky130.vhd:10300:40  */
  assign n144_o = ui_in[4];
  /* find_the_damn_issue_sky130.vhd:10301:40  */
  assign n145_o = ui_in[5];
  /* find_the_damn_issue_sky130.vhd:10302:40  */
  assign n146_o = ui_in[6];
  /* find_the_damn_issue_sky130.vhd:10303:40  */
  assign n147_o = ui_in[7];
  /* find_the_damn_issue_sky130.vhd:10305:58  */
  assign n149_o = n148_o[7:1];
  /* find_the_damn_issue_sky130.vhd:10305:71  */
  assign n150_o = {n149_o, s_m_io8_out};
  /* find_the_damn_issue_sky130.vhd:10306:94  */
  assign n151_o = n150_o[7:2];
  /* find_the_damn_issue_sky130.vhd:10306:107  */
  assign n152_o = {n151_o, s_m_io9_out};
  /* find_the_damn_issue_sky130.vhd:10306:150  */
  assign n153_o = n150_o[0];
  /* find_the_damn_issue_sky130.vhd:10306:121  */
  assign n154_o = {n152_o, n153_o};
  /* find_the_damn_issue_sky130.vhd:10307:131  */
  assign n155_o = n154_o[7:3];
  /* find_the_damn_issue_sky130.vhd:10307:144  */
  assign n156_o = {n155_o, s_m_io10_out};
  /* find_the_damn_issue_sky130.vhd:10307:206  */
  assign n157_o = n154_o[1:0];
  /* find_the_damn_issue_sky130.vhd:10307:159  */
  assign n158_o = {n156_o, n157_o};
  /* find_the_damn_issue_sky130.vhd:10308:169  */
  assign n159_o = n158_o[7:4];
  /* find_the_damn_issue_sky130.vhd:10308:182  */
  assign n160_o = {n159_o, s_m_io11_out};
  /* find_the_damn_issue_sky130.vhd:10308:263  */
  assign n161_o = n158_o[2:0];
  /* find_the_damn_issue_sky130.vhd:10308:197  */
  assign n162_o = {n160_o, n161_o};
  /* find_the_damn_issue_sky130.vhd:10309:207  */
  assign n163_o = n162_o[7:5];
  /* find_the_damn_issue_sky130.vhd:10309:220  */
  assign n164_o = {n163_o, s_m_io12_out};
  /* find_the_damn_issue_sky130.vhd:10309:320  */
  assign n165_o = n162_o[3:0];
  /* find_the_damn_issue_sky130.vhd:10309:235  */
  assign n166_o = {n164_o, n165_o};
  /* find_the_damn_issue_sky130.vhd:10310:245  */
  assign n167_o = n166_o[7:6];
  /* find_the_damn_issue_sky130.vhd:10310:258  */
  assign n168_o = {n167_o, s_m_io13_out};
  /* find_the_damn_issue_sky130.vhd:10310:377  */
  assign n169_o = n166_o[4:0];
  /* find_the_damn_issue_sky130.vhd:10310:273  */
  assign n170_o = {n168_o, n169_o};
  /* find_the_damn_issue_sky130.vhd:10311:283  */
  assign n171_o = n170_o[7];
  /* find_the_damn_issue_sky130.vhd:10311:296  */
  assign n172_o = {n171_o, s_m_io14_out};
  /* find_the_damn_issue_sky130.vhd:10311:434  */
  assign n173_o = n170_o[5:0];
  /* find_the_damn_issue_sky130.vhd:10311:311  */
  assign n174_o = {n172_o, n173_o};
  /* find_the_damn_issue_sky130.vhd:10312:336  */
  assign n175_o = n174_o[6:0];
  /* find_the_damn_issue_sky130.vhd:10312:194  */
  assign n176_o = {s_m_io15_out, n175_o};
  /* find_the_damn_issue_sky130.vhd:10314:377  */
  assign n177_o = n176_o[7:1];
  /* find_the_damn_issue_sky130.vhd:10314:390  */
  assign n178_o = {n177_o, s_m_packetdata_2_bit_16_mux1};
  /* find_the_damn_issue_sky130.vhd:10315:39  */
  assign n180_o = s_operatingmode_2 == 1'b0;
  /* find_the_damn_issue_sky130.vhd:10316:238  */
  assign n181_o = n178_o[7:2];
  /* find_the_damn_issue_sky130.vhd:10316:251  */
  assign n182_o = {n181_o, s_m_packetdata_2_bit_17_mux1};
  /* find_the_damn_issue_sky130.vhd:10316:478  */
  assign n183_o = n178_o[0];
  /* find_the_damn_issue_sky130.vhd:10316:282  */
  assign n184_o = {n182_o, n183_o};
  /* find_the_damn_issue_sky130.vhd:10315:17  */
  assign n185_o = n180_o ? n184_o : n176_o;
  /* find_the_damn_issue_sky130.vhd:10321:202  */
  assign n186_o = s_unnamed_txstuffedstream_valid_mux2_rewired_txstuffedstream_valid_mux2_rewired[7:1];
  /* find_the_damn_issue_sky130.vhd:10321:215  */
  assign n187_o = {n186_o, n109_o};
  /* find_the_damn_issue_sky130.vhd:10322:246  */
  assign n188_o = n187_o[7:2];
  /* find_the_damn_issue_sky130.vhd:10322:259  */
  assign n189_o = {n188_o, n115_o};
  /* find_the_damn_issue_sky130.vhd:10322:380  */
  assign n190_o = n187_o[0];
  /* find_the_damn_issue_sky130.vhd:10322:277  */
  assign n191_o = {n189_o, n190_o};
  /* find_the_damn_issue_sky130.vhd:10323:290  */
  assign n192_o = n191_o[7:3];
  /* find_the_damn_issue_sky130.vhd:10323:303  */
  assign n193_o = {n192_o, n121_o};
  /* find_the_damn_issue_sky130.vhd:10323:446  */
  assign n194_o = n191_o[1:0];
  /* find_the_damn_issue_sky130.vhd:10323:321  */
  assign n195_o = {n193_o, n194_o};
  /* find_the_damn_issue_sky130.vhd:10324:334  */
  assign n196_o = n195_o[7:4];
  /* find_the_damn_issue_sky130.vhd:10324:347  */
  assign n197_o = {n196_o, n127_o};
  /* find_the_damn_issue_sky130.vhd:10324:512  */
  assign n198_o = n195_o[2:0];
  /* find_the_damn_issue_sky130.vhd:10324:365  */
  assign n199_o = {n197_o, n198_o};
  /* find_the_damn_issue_sky130.vhd:10325:378  */
  assign n200_o = n199_o[7:5];
  /* find_the_damn_issue_sky130.vhd:10325:391  */
  assign n201_o = {n200_o, n133_o};
  /* find_the_damn_issue_sky130.vhd:10325:578  */
  assign n202_o = n199_o[3:0];
  /* find_the_damn_issue_sky130.vhd:10325:409  */
  assign n203_o = {n201_o, n202_o};
  /* find_the_damn_issue_sky130.vhd:10326:222  */
  assign n204_o = n203_o[7:6];
  /* find_the_damn_issue_sky130.vhd:10326:235  */
  assign n205_o = {n204_o, n139_o};
  /* find_the_damn_issue_sky130.vhd:10326:444  */
  assign n206_o = n203_o[4:0];
  /* find_the_damn_issue_sky130.vhd:10326:253  */
  assign n207_o = {n205_o, n206_o};
  /* find_the_damn_issue_sky130.vhd:10327:39  */
  assign n209_o = s_operatingmode_2 == 1'b0;
  /* find_the_damn_issue_sky130.vhd:10328:49  */
  assign n210_o = n207_o[7:6];
  /* find_the_damn_issue_sky130.vhd:10328:62  */
  assign n212_o = {n210_o, 6'b000010};
  /* find_the_damn_issue_sky130.vhd:10327:17  */
  assign n213_o = n209_o ? n212_o : n207_o;
  /* find_the_damn_issue_sky130.vhd:10334:187  */
  assign n214_o = s_unnamed_txstuffedstream_mux1_rewired_txstuffedstream_not_mux1_rewired[7:1];
  /* find_the_damn_issue_sky130.vhd:10334:200  */
  assign n215_o = {n214_o, n106_o};
  /* find_the_damn_issue_sky130.vhd:10335:233  */
  assign n216_o = n215_o[7:2];
  /* find_the_damn_issue_sky130.vhd:10335:246  */
  assign n217_o = {n216_o, n112_o};
  /* find_the_damn_issue_sky130.vhd:10335:361  */
  assign n218_o = n215_o[0];
  /* find_the_damn_issue_sky130.vhd:10335:265  */
  assign n219_o = {n217_o, n218_o};
  /* find_the_damn_issue_sky130.vhd:10336:279  */
  assign n220_o = n219_o[7:3];
  /* find_the_damn_issue_sky130.vhd:10336:292  */
  assign n221_o = {n220_o, n118_o};
  /* find_the_damn_issue_sky130.vhd:10336:430  */
  assign n222_o = n219_o[1:0];
  /* find_the_damn_issue_sky130.vhd:10336:311  */
  assign n223_o = {n221_o, n222_o};
  /* find_the_damn_issue_sky130.vhd:10337:325  */
  assign n224_o = n223_o[7:4];
  /* find_the_damn_issue_sky130.vhd:10337:338  */
  assign n225_o = {n224_o, n124_o};
  /* find_the_damn_issue_sky130.vhd:10337:499  */
  assign n226_o = n223_o[2:0];
  /* find_the_damn_issue_sky130.vhd:10337:357  */
  assign n227_o = {n225_o, n226_o};
  /* find_the_damn_issue_sky130.vhd:10338:371  */
  assign n228_o = n227_o[7:5];
  /* find_the_damn_issue_sky130.vhd:10338:384  */
  assign n229_o = {n228_o, n130_o};
  /* find_the_damn_issue_sky130.vhd:10338:568  */
  assign n230_o = n227_o[3:0];
  /* find_the_damn_issue_sky130.vhd:10338:403  */
  assign n231_o = {n229_o, n230_o};
  /* find_the_damn_issue_sky130.vhd:10339:217  */
  assign n232_o = n231_o[7:6];
  /* find_the_damn_issue_sky130.vhd:10339:230  */
  assign n233_o = {n232_o, n136_o};
  /* find_the_damn_issue_sky130.vhd:10339:437  */
  assign n234_o = n231_o[4:0];
  /* find_the_damn_issue_sky130.vhd:10339:249  */
  assign n235_o = {n233_o, n234_o};
  /* find_the_damn_issue_sky130.vhd:10341:39  */
  assign n237_o = s_operatingmode_2 == 1'b0;
  /* find_the_damn_issue_sky130.vhd:10342:50  */
  assign n238_o = n235_o[7:2];
  /* find_the_damn_issue_sky130.vhd:10342:63  */
  assign n239_o = {n238_o, s_out};
  /* find_the_damn_issue_sky130.vhd:10342:83  */
  assign n240_o = n235_o[0];
  /* find_the_damn_issue_sky130.vhd:10342:70  */
  assign n241_o = {n239_o, n240_o};
  /* find_the_damn_issue_sky130.vhd:10341:17  */
  assign n242_o = n237_o ? n241_o : n235_o;
  /* find_the_damn_issue_sky130.vhd:10349:41  */
  assign n243_o = s_m_out_valid & s_m_out_ready;
  /* find_the_damn_issue_sky130.vhd:10352:59  */
  assign n245_o = n244_o[7:0];
  /* find_the_damn_issue_sky130.vhd:10349:17  */
  assign n246_o = n243_o ? s_m_out_3 : n245_o;
  /* find_the_damn_issue_sky130.vhd:10354:41  */
  assign n247_o = s_m_out_valid & s_m_out_ready;
  /* find_the_damn_issue_sky130.vhd:10357:63  */
  assign n249_o = n248_o[11:8];
  /* find_the_damn_issue_sky130.vhd:10354:17  */
  assign n251_o = n247_o ? 4'b0001 : n249_o;
  /* find_the_damn_issue_sky130.vhd:10360:43  */
  assign n253_o = n252_o[7:0];
  /* find_the_damn_issue_sky130.vhd:10361:43  */
  assign n255_o = n254_o[11:8];
  /* find_the_damn_issue_sky130.vhd:10366:27  */
  assign n274_o = ~rst_n;
  /* find_the_damn_issue_sky130.vhd:10387:9  */
  scl_fifo scl_fifo0 (
    .clk(clk),
    .rst_n(rst_n),
    .in_m_pushvalid(s_m_pushvalid),
    .in_m_pushdata_data(s_m_pushdata_data),
    .in_m_pushdata_endpoint(s_m_pushdata_endpoint),
    .in_m_pushcommit(s_m_pushcommit),
    .in_m_pushrollack(s_m_pushrollack),
    .in_m_pushcutoff(s_m_pushcutoff),
    .in_m_popvalid(s_m_popvalid),
    .out_m_peekdata_data(scl_fifo0_out_m_peekdata_data),
    .out_m_pushfull(scl_fifo0_out_m_pushfull),
    .out_m_popempty(scl_fifo0_out_m_popempty));
  /* find_the_damn_issue_sky130.vhd:10401:9  */
  scl_streamdemux scl_streamdemux0 (
    .in_m_in_valid(s_usbep1_rx_valid),
    .in_m_in(s_usbep1_rx),
    .in_unnamed(s_m_selector),
    .in_unnamed_2(s_unnamed_10),
    .in_unnamed_3(s_unnamed_11),
    .out_out_0_ready(scl_streamdemux0_out_out_0_ready),
    .out_out_0_valid(scl_streamdemux0_out_out_0_valid),
    .out_out_0(scl_streamdemux0_out_out_0),
    .out_m_in_ready_mux2(scl_streamdemux0_out_m_in_ready_mux2),
    .out_out_1_ready(scl_streamdemux0_out_out_1_ready),
    .out_out_1_valid(scl_streamdemux0_out_out_1_valid),
    .out_out_1(scl_streamdemux0_out_out_1));
  /* find_the_damn_issue_sky130.vhd:10415:9  */
  scl_uarttx scl_uarttx0 (
    .clk(clk),
    .rst_n(rst_n),
    .in_baudrate(s_baudrate_3),
    .in_data_ready(s_out_0_ready),
    .in_data_valid(s_out_0_valid),
    .in_data(s_out_0),
    .out_baud_and_m_last(scl_uarttx0_out_baud_and_m_last),
    .out_out(scl_uarttx0_out_out));
  /* find_the_damn_issue_sky130.vhd:10425:9  */
  scl_bitbangengine scl_bitbangengine0 (
    .clk(clk),
    .rst_n(rst_n),
    .in_command_ready(s_out_1_ready),
    .in_command_valid(s_out_1_valid),
    .in_command(s_out_1),
    .in_unnamed(s_unnamed_12),
    .in_unnamed_2(s_unnamed_15),
    .in_unnamed_3(s_unnamed_16),
    .in_unnamed_4(s_unnamed_17),
    .in_unnamed_5(s_unnamed_18),
    .in_unnamed_6(s_unnamed_19),
    .in_unnamed_7(s_unnamed_20),
    .in_unnamed_8(s_unnamed_21),
    .in_unnamed_9(s_unnamed_22),
    .in_unnamed_10(s_unnamed_23),
    .in_unnamed_11(s_unnamed_24),
    .in_unnamed_12(s_unnamed_25),
    .in_unnamed_13(s_unnamed_26),
    .in_unnamed_14(s_unnamed_27),
    .in_unnamed_15(s_unnamed_28),
    .out_const_0_mux13(scl_bitbangengine0_out_const_0_mux13),
    .out_m_io0_out(scl_bitbangengine0_out_m_io0_out),
    .out_m_io0_en(scl_bitbangengine0_out_m_io0_en),
    .out_m_io0_opendrain(scl_bitbangengine0_out_m_io0_opendrain),
    .out_m_io1_out(scl_bitbangengine0_out_m_io1_out),
    .out_m_io1_en(scl_bitbangengine0_out_m_io1_en),
    .out_m_io1_opendrain(scl_bitbangengine0_out_m_io1_opendrain),
    .out_m_io2_out(scl_bitbangengine0_out_m_io2_out),
    .out_m_io2_en(scl_bitbangengine0_out_m_io2_en),
    .out_m_io2_opendrain(scl_bitbangengine0_out_m_io2_opendrain),
    .out_m_io3_out(scl_bitbangengine0_out_m_io3_out),
    .out_m_io3_en(scl_bitbangengine0_out_m_io3_en),
    .out_m_io3_opendrain(scl_bitbangengine0_out_m_io3_opendrain),
    .out_m_io4_out(scl_bitbangengine0_out_m_io4_out),
    .out_m_io4_en(scl_bitbangengine0_out_m_io4_en),
    .out_m_io4_opendrain(scl_bitbangengine0_out_m_io4_opendrain),
    .out_m_io5_out(scl_bitbangengine0_out_m_io5_out),
    .out_m_io5_en(scl_bitbangengine0_out_m_io5_en),
    .out_m_io5_opendrain(scl_bitbangengine0_out_m_io5_opendrain),
    .out_m_io8_out(scl_bitbangengine0_out_m_io8_out),
    .out_m_io9_out(scl_bitbangengine0_out_m_io9_out),
    .out_m_io10_out(scl_bitbangengine0_out_m_io10_out),
    .out_m_io11_out(scl_bitbangengine0_out_m_io11_out),
    .out_m_io12_out(scl_bitbangengine0_out_m_io12_out),
    .out_m_io13_out(scl_bitbangengine0_out_m_io13_out),
    .out_m_io14_out(scl_bitbangengine0_out_m_io14_out),
    .out_m_io15_out(scl_bitbangengine0_out_m_io15_out),
    .out_out_ready(),
    .out_out_valid(scl_bitbangengine0_out_out_valid),
    .out_out(scl_bitbangengine0_out_out));
  /* find_the_damn_issue_sky130.vhd:10477:9  */
  scl_uartrx scl_uartrx0 (
    .clk(clk),
    .rst_n(rst_n),
    .in_baudrate(s_baudrate_3),
    .in_rx(s_rx),
    .out_out_valid(scl_uartrx0_out_out_valid),
    .out_out(scl_uartrx0_out_out));
  /* find_the_damn_issue_sky130.vhd:10485:9  */
  scl_streamarbiter scl_streamarbiter_2 (
    .clk(clk),
    .rst_n(rst_n),
    .in_unnamed(s_operatingmode_2),
    .in_m_in1_stream_valid(s_bitbangout_valid),
    .in_m_in1_stream(s_bitbangout),
    .in_m_in0_stream_valid(s_uartout_valid),
    .in_m_in0_stream(s_uartout),
    .in_m_out_ready(s_m_out_ready),
    .out_const_0_mux1(scl_streamarbiter_2_out_const_0_mux1),
    .out_m_out_valid(scl_streamarbiter_2_out_m_out_valid),
    .out_m_out(scl_streamarbiter_2_out_m_out));
  /* find_the_damn_issue_sky130.vhd:10498:9  */
  scl_fifo_2 scl_fifo1 (
    .clk(clk),
    .rst_n(rst_n),
    .in_m_pushcutoff(s_m_pushcutoff_2),
    .in_m_popvalid(s_m_popvalid_2),
    .in_m_popcommit(s_m_popcommit),
    .in_m_poprollback(s_m_poprollback),
    .in_m_pushvalid(s_m_pushvalid_2),
    .in_m_pushdata_data(s_m_pushdata_data_2),
    .in_m_pushdata_endpoint(s_m_pushdata_endpoint_2),
    .in_unnamed(s_unnamed_mux2_5),
    .out_m_peekdata_data(scl_fifo1_out_m_peekdata_data),
    .out_m_peekdata_endpoint(scl_fifo1_out_m_peekdata_endpoint),
    .out_m_pushfull(scl_fifo1_out_m_pushfull),
    .out_m_popempty(scl_fifo1_out_m_popempty));
  /* find_the_damn_issue_sky130.vhd:10372:17  */
  always @(posedge clk or posedge n274_o)
    if (n274_o)
      n346_q <= 1'b0;
    else
      n346_q <= s_unnamed_mux2_2;
  /* find_the_damn_issue_sky130.vhd:10372:17  */
  always @(posedge clk or posedge n274_o)
    if (n274_o)
      n347_q <= 1'b0;
    else
      n347_q <= s_set_line_coding_mux1;
  /* find_the_damn_issue_sky130.vhd:10372:17  */
  assign n348_o = s_unnamed_4 ? s_m_packetdata_2_bit_16 : s_dtr;
  /* find_the_damn_issue_sky130.vhd:10372:17  */
  always @(posedge clk or posedge n274_o)
    if (n274_o)
      n349_q <= 1'b0;
    else
      n349_q <= n348_o;
  /* find_the_damn_issue_sky130.vhd:10372:17  */
  assign n350_o = s_unnamed_4 ? s_m_packetdata_2_bit_17 : s_rts;
  /* find_the_damn_issue_sky130.vhd:10372:17  */
  always @(posedge clk or posedge n274_o)
    if (n274_o)
      n351_q <= 1'b0;
    else
      n351_q <= n350_o;
  /* find_the_damn_issue_sky130.vhd:10372:17  */
  assign n352_o = s_unnamed_eq_set_line_coding_and_m_phy_rx_error_not_and_m_pid_2_rewired_eq_const_11_and_nested_condition_m_phy_rx_eop ? s_m_packetdata_2_rewired : s_baudrate;
  /* find_the_damn_issue_sky130.vhd:10372:17  */
  always @(posedge clk or posedge n274_o)
    if (n274_o)
      n353_q <= 24'b000000011100001000000000;
    else
      n353_q <= n352_o;
endmodule

