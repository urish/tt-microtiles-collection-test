/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */
`default_nettype none

module tt_um_ran_DanielZhu (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n);     // reset_n - low to reset



	logic startring;
    logic inverterringout;
    logic inverterringout1;
    logic inverterringout2;
    logic switch_SL;
    logic switch_R12;

    logic ranprocessout;

    logic ran16out;

    logic ranbitstring;

    logic sample;
    logic [3:0] samplednum;

    logic pulse;
    logic diplaychoose;
    logic [13:0]displaypin;





	wire _unused = &{ena, uio_in,ui_in[7:6],1'b0};

	assign uo_out[7] =inverterringout;	
    assign uo_out[6:0]=displaypin[6:0];
	assign startring=ui_in[0];
    assign switch_SL=ui_in[1];
    assign switch_R12=ui_in[2];
    assign sample=ui_in[3];
    assign pulse=ui_in[4];
    assign diplaychoose=ui_in[5];
	assign uio_out[7] =ranbitstring;	
    assign uio_out[6:0]=displaypin[13:7];	
	assign uio_oe[7:0]=8'b11111111;
	
    generate
        tt_invring tt_invring1(
            .clk(clk),
            .switch_SL(switch_SL),
		    .startring(startring),
            .inverterringout(inverterringout1),
            .rst_n(rst_n));

	    tt_invring tt_invring2(
            .clk(clk),
            .switch_SL(switch_SL),
		    .startring(startring),
            .inverterringout(inverterringout2),
            .rst_n(rst_n));
    endgenerate


    always_comb begin
        if (switch_R12==0)
            inverterringout=inverterringout1;
        else
            inverterringout=inverterringout2;
    end

	tt_process tt_process(
		.clk(clk),
		.rst_n(rst_n),
        .num(inverterringout),
		.ranprocessout(ranprocessout));

	tt_16bitran tt_16bitran(
		.clk(clk),
		.rst_n(rst_n),
        .ran16out(ran16out));

	always@(*)
		ranbitstring = ran16out^ranprocessout;


	tt_samplekey tt_samplekey(
		.clk(clk),
		.rst_n(rst_n),
		.sample(sample),
		.num(ranbitstring),
		.samplednum(samplednum));

	tt_finalprocess tt_finalprocess(
		.pulse(pulse),
		.switchAB(diplaychoose),
		.key_4(samplednum),
		.disppinout(displaypin),
        .rst_n(rst_n));

endmodule 



module tt_inv (
	input  wire a,
  	output wire y);

  	sky130_fd_sc_hd__inv_2 cnt_bit_I (
    	.A     (a),
    	.Y     (y));

endmodule 

module tt_invring #(
	parameter integer OSC_LEN_1 = 11,//length of each inverter
    parameter integer OSC_LEN_2 = 19,
    parameter integer OSC_LEN_3 = 23,
    parameter integer OSC_LEN_4 = 29,
    parameter integer OSC_LEN_5 = 37,
    parameter integer OSC_LEN_6 = 41,
    parameter integer OSC_LEN_7 = 47,
    parameter integer OSC_LEN_8 = 53)
	
	(input wire clk,
	input wire rst_n,
    input wire switch_SL,
	input wire startring,//rings oscillate,else rings stop oscillate
	output wire inverterringout);//generate random bit string

	wire [OSC_LEN_1-1:0] osc_1;//wire for connecting inverters
	wire [OSC_LEN_2-1:0] osc_2;
	wire [OSC_LEN_3-1:0] osc_3;
	wire [OSC_LEN_4-1:0] osc_4;
    wire [OSC_LEN_5-1:0] osc_5;
	wire [OSC_LEN_6-1:0] osc_6;
	wire [OSC_LEN_7-1:0] osc_7;
	wire [OSC_LEN_8-1:0] osc_8;

    logic [7:0] ringout;//collect each rings last inverters output
    logic [7:0] ringoutsam;//after sample
    logic  rannum;//bit string this system generate

	assign ringout ={osc_8[OSC_LEN_8-1],osc_7[OSC_LEN_7-1],osc_6[OSC_LEN_6-1],osc_5[OSC_LEN_5-1],
                    osc_4[OSC_LEN_4-1],osc_3[OSC_LEN_3-1],osc_2[OSC_LEN_2-1],osc_1[OSC_LEN_1-1]};
    assign inverterringout=rannum;

	genvar i;
	generate
		//4 Oscillator
		for (i = 0; i < OSC_LEN_1; i = i + 1) begin: ringosc1
			wire y;
			if (i == 0)begin:gen_1
				assign y = startring? osc_1[OSC_LEN_1 - 1]:0;//if start is off,the ring will not connect its head and tail
			end
			else begin:gen_11
				assign y = osc_1[i - 1];
			end
			tt_inv inv (
				.a (y),
				.y (osc_1[i]));
		end

		for (i = 0; i < OSC_LEN_2; i = i + 1) begin: ringosc2
			wire y;
			if (i == 0)begin:gen_2
				assign y = startring? osc_2[OSC_LEN_2 - 1]:0;
			end
			else begin:gen_22
				assign y = osc_2[i - 1];
			end
			tt_inv inv (
				.a (y),
				.y (osc_2[i]));
		end

		for (i = 0; i < OSC_LEN_3; i = i + 1) begin: ringosc3
			wire y;
			if (i == 0)begin:gen_3
				assign y = startring? osc_3[OSC_LEN_3 - 1]:0;
			end
			else begin:gen_33
				assign y = osc_3[i - 1];
			end
			tt_inv inv (
				.a (y),
				.y (osc_3[i]));
		end

		for (i = 0; i < OSC_LEN_4; i = i + 1) begin: ringosc4
			wire y;
			if (i == 0)begin:gen_4
				assign y = startring? osc_4[OSC_LEN_4 - 1]:0;
			end
			else begin:gen_44
				assign y = osc_4[i - 1];
			end
			tt_inv inv (
				.a (y),
				.y (osc_4[i]));
		end

        for (i = 0; i < OSC_LEN_5; i = i + 1) begin: ringosc5
			wire y;
			if (i == 0)begin:gen_5
				assign y = startring? osc_5[OSC_LEN_5 - 1]:0;
			end
			else begin:gen_55
				assign y = osc_5[i - 1];
			end
			tt_inv inv (
				.a (y),
				.y (osc_5[i]));
		end

		for (i = 0; i < OSC_LEN_6; i = i + 1) begin: ringosc6
			wire y;
			if (i == 0)begin:gen_6
				assign y = startring? osc_6[OSC_LEN_6 - 1]:0;
			end
			else begin:gen_66
				assign y = osc_6[i - 1];
			end
			tt_inv inv (
				.a (y),
				.y (osc_6[i]));
		end

		for (i = 0; i < OSC_LEN_7; i = i + 1) begin: ringosc7
			wire y;
			if (i == 0)begin:gen_7
				assign y = startring? osc_7[OSC_LEN_7 - 1]:0;
			end
			else begin:gen_77
				assign y = osc_7[i - 1];
			end
			tt_inv inv (
				.a (y),
				.y (osc_7[i]));
		end

		for (i = 0; i < OSC_LEN_8; i = i + 1) begin: ringosc8
			wire y;
			if (i == 0)begin:gen_8
				assign y = startring? osc_8[OSC_LEN_8 - 1]:0;
			end
			else begin:gen_88
				assign y = osc_8[i - 1];
			end
			tt_inv inv (
				.a (y),
				.y (osc_8[i]));
		end
	endgenerate

	always @(posedge clk or negedge rst_n)begin//sample ringout each clk cycle
		if (!rst_n) begin
            ringoutsam[0]<=0;
		    ringoutsam[1]<=0;
		    ringoutsam[2]<=0;
		    ringoutsam[3]<=0;
		    ringoutsam[4]<=0;
		    ringoutsam[5]<=0;
		    ringoutsam[6]<=0;
		    ringoutsam[7]<=0;
        end
        else begin
            ringoutsam[0]<=ringout[0];
		    ringoutsam[1]<=ringout[1];
		    ringoutsam[2]<=ringout[2];
		    ringoutsam[3]<=ringout[3]; 
            ringoutsam[4]<=ringout[4]; 
            ringoutsam[5]<=ringout[5]; 
            ringoutsam[6]<=ringout[6]; 
            ringoutsam[7]<=ringout[7]; 
        end

	end
    
    always_comb begin
        if (switch_SL==0)
            rannum= ringoutsam[4]^^ringoutsam[5]^^ringoutsam[6]^^ringoutsam[7];//create random number by xor
        else 
            rannum= ringoutsam[0]^^ringoutsam[1]^^ringoutsam[2]^^ringoutsam[3]^^
                    ringoutsam[4]^^ringoutsam[5]^^ringoutsam[6]^^ringoutsam[7];//create random number by xor

        
    end
    
       
endmodule

module tt_13n #(
	parameter integer count = 13)(
    input wire clk,
    input wire rst_n,//set all flipflop to 0
    input wire num,//bit string to be preccess
	output wire ran13nout);

	logic [count:0] connection;//all of the wire required in the connection
	always@(posedge clk or negedge rst_n)begin//pass down bit each clk 
		if (!rst_n) begin
			connection[13:0]<=14'b0;
		end
		else begin
			connection[13]<=connection[12];
			connection[12]<=connection[11];
			connection[11]<=connection[10];
			connection[10]<=connection[9];
			connection[9]<=connection[8];
			connection[8]<=connection[7];
			connection[7]<=connection[6];
			connection[6]<=connection[5];
			connection[5]<=connection[4];		
			connection[4]<=connection[3];
			connection[3]<=connection[2];
			connection[2]<=connection[1];
			connection[1]<=connection[0];
	   		connection[0]<=num;
		end

	end
        
		
                
	assign ran13nout = connection[1]^^connection[2]^^connection[3]^^connection[4]^^
			connection[5]^^connection[6]^^connection[7]^^connection[8]^^connection[9]^^
			connection[10]^^connection[11]^^connection[12]^^connection[13];

endmodule 

module tt_process (
    input wire clk,
    input wire rst_n,
    input wire num,
	output wire ranprocessout);


	logic [2:0] bitsadjacent;
	logic [1:0] bitsgroup;
    logic bitsend;
	logic bitaft13n;
	logic  Gxor;//xor gate for the grouped number
	logic clk_half;//half clk frequency
        
	assign ranprocessout=bitsend;

	tt_13n tt_13n(
		.clk(clk),
		.rst_n(rst_n),
		.num(bitsadjacent[2]),
        .ran13nout(bitaft13n));

    always @(posedge clk or negedge rst_n)begin//prepare for grouping
	    if (!rst_n) begin
	    	bitsadjacent[0]<=0;
	   		bitsadjacent[1]<=0;
	    	bitsadjacent[2]<=0;
    	end
		else begin
			bitsadjacent[0]<=num;
            bitsadjacent[1]<=bitsadjacent[0];
		    bitsadjacent[2]<=bitsadjacent[1];
		end
		
    end

 
    always@(posedge clk or negedge rst_n) begin//generate half clk frequency
  		if (!rst_n) begin
  			clk_half <= 0;
            end
 		else
 	        clk_half <= ~clk_half;
		end

	always @(posedge clk_half)begin//every two clk cycle, the prepared number will update in to the second stage
		bitsgroup[0]<=bitsadjacent[0];
		bitsgroup[1]<=bitsadjacent[1];
	end

	always_comb begin
		Gxor=bitsgroup[0]^bitsgroup[1];
        if(Gxor==1)begin//the output will choose the first of the grouped number
            bitsend=bitsgroup[1];
        end
        else
            bitsend=bitaft13n;//choose the one coming out of 13n
	end
endmodule


module tt_16bitran #(
	parameter integer count = 16)
	(input wire clk,
    input wire rst_n,
	output wire ran16out);

	logic [count:1] connection;//connect all filpflop
	logic connectbe;
	assign ran16out =connection[16];


	always@(posedge clk or negedge rst_n)begin//pass down bit each clk 
		if (!rst_n) begin			
			connection[16:1]<=16'b1;
		end
		else begin
			connection[16]<=connection[15];
			connection[15]<=connection[14];
			connection[14]<=connection[13];
			connection[13]<=connection[12];
			connection[12]<=connection[11];
			connection[11]<=connection[10];
			connection[10]<=connection[9];
			connection[9]<=connection[8];
			connection[8]<=connection[7];
			connection[7]<=connection[6];
			connection[6]<=connection[5];
			connection[5]<=connection[4];		
			connection[4]<=connection[3];
			connection[3]<=connection[2];
			connection[2]<=connection[1];
			connection[1]<=connectbe;
		end
	end
	always_comb 
		connectbe=connection[4]^^connection[13]^^connection[15]^^connection[16];

		
endmodule



module tt_samplekey(
    input wire clk,
    input wire sample,
    input wire num,
	input wire rst_n,
	output wire [3:0] samplednum);


	logic [3:0] bitsadjacent;
	logic [3:0] sample_4;

        
	assign samplednum=sample_4;


    always @(posedge clk or negedge rst_n)begin
		if (!rst_n) begin
			bitsadjacent[0]<=0;
    		bitsadjacent[1]<=0;
			bitsadjacent[2]<=0;
			bitsadjacent[3]<=0;
		end
		else begin
			bitsadjacent[0]<=num;
    		bitsadjacent[1]<=bitsadjacent[0];
			bitsadjacent[2]<=bitsadjacent[1];
			bitsadjacent[3]<=bitsadjacent[2];
		end

    end

	always @(posedge sample)begin
		sample_4<={bitsadjacent[3],bitsadjacent[2],bitsadjacent[1],bitsadjacent[0]};
 	end


endmodule 


module tt_mult(
	input  wire sel,
	input  wire A,
	input  wire B,
	output wire out);

	sky130_fd_sc_hd__mux2_1 cell0_I (
        `ifdef WITH_POWER
		    .VPWR (1'b1),
		    .VGND (1'b0),
		    .VPB  (1'b1),
		    .VNB  (1'b0),
        `endif
		    .S      (sel),
	    	.A0    (A),
	    	.A1     (B),
	    	.X      (out));
endmodule

module tt_mult_22 (
	input  wire a,
	input  wire b,
	input  wire key,
    output wire c,
    output wire d);

    generate
        tt_mult mult_1(
            .A(a),
            .B(b),
            .sel(key),
            .out(c));

        tt_mult mult_2(
            .A(b),
            .B(a),
            .sel(key),
            .out(d));
    endgenerate


endmodule 

module nand_gate (
    input wire A,
    input wire B,
    output wire out);

    sky130_fd_sc_hd__nand2_1 cell_nand (
        .A(A),
        .B(B),
        .Y(out));

endmodule


module nand_gate_2 (
    input wire Ak,
    input wire Bk,
    output wire outt);

    logic A_1;
    logic B_1;
    logic A_2;
    logic B_2;
    logic out_1;
    logic out_2;

    assign A_1=Ak ;
    assign B_1=out_2 ;
    assign B_2=Bk;
    assign A_2=out_1;

    assign outt=out_1;

    generate
        nand_gate nand_gate1(
            .A(A_1),
            .B(B_1),
            .out(out_1));
        
        nand_gate nand_gate2(
            .A(A_2),
            .B(B_2),
            .out(out_2));
        
    endgenerate


endmodule

module tt_multblock #(
	parameter integer mult_len =12)
	
	(input wire pulse,
	input wire [3:0] key_4,
	output wire multblockout);

	wire [mult_len:0] A;//A B are wire to connect the switch
	wire [mult_len:0] B;
	wire [mult_len-1:0] key;


	assign A[0]=pulse;
	assign B[0]=pulse;

	
	genvar i;
	generate
		//4 Oscillator
		for (i = 0; i < mult_len; i = i + 1) begin
			tt_mult_22 mult_22(
				.a (A[i]),
				.b (B[i]),
 				.c(A[i+1]),
				.d(B[i+1]),
				.key(key[i]));
		end
       
	endgenerate

    assign key[0]=key_4[0];
    assign key[1]=key_4[0];
    assign key[2]=key_4[0];
    assign key[3]=key_4[1];
    assign key[4]=key_4[1];
    assign key[5]=key_4[1];
    assign key[6]=key_4[2];
    assign key[7]=key_4[2];
    assign key[8]=key_4[2];
    assign key[9]=key_4[3];
    assign key[10]=key_4[3];
    assign key[11]=key_4[3];

    nand_gate_2 nand_gate_2(
        .Ak(A[12]),
        .Bk(B[12]),
        .outt(multblockout));


       
endmodule 




module tt_display(
    input wire [3:0] number1,
    input wire [3:0] number2,
	output wire [13:0] displaypin);

	logic [6:0] nub1dis;
	logic [6:0] nub2dis;
    assign displaypin={nub2dis,nub1dis};
	always_comb begin     
		case(number1)
			4'h0:nub1dis[6:0]=7'b0000001;
			4'h1:nub1dis[6:0]=7'b0110000;
			4'h2:nub1dis[6:0]=7'b1101101;
			4'h3:nub1dis[6:0]=7'b1111001;
			4'h4:nub1dis[6:0]=7'b0110011;
			4'h5:nub1dis[6:0]=7'b1011011;
			4'h6:nub1dis[6:0]=7'b1011111;
			4'h7:nub1dis[6:0]=7'b1110000; 
			4'h8:nub1dis[6:0]=7'b1111111;
			4'h9:nub1dis[6:0]=7'b1111011;
			4'ha:nub1dis[6:0]=7'b1110111;
			4'hb:nub1dis[6:0]=7'b0011111;
			4'hc:nub1dis[6:0]=7'b1001110;     
			4'hd:nub1dis[6:0]=7'b0111101;
			4'he:nub1dis[6:0]=7'b1001111;
			4'hf:nub1dis[6:0]=7'b1000111;             
			default:nub1dis[6:0]=7'b0000000;
		endcase
		case(number2)
			4'h0:nub2dis[6:0]=7'b0000001;
			4'h1:nub2dis[6:0]=7'b0110000;
			4'h2:nub2dis[6:0]=7'b1101101;
			4'h3:nub2dis[6:0]=7'b1111001;
			4'h4:nub2dis[6:0]=7'b0110011;
			4'h5:nub2dis[6:0]=7'b1011011;
			4'h6:nub2dis[6:0]=7'b1011111;
			4'h7:nub2dis[6:0]=7'b1110000; 
			4'h8:nub2dis[6:0]=7'b1111111;
			4'h9:nub2dis[6:0]=7'b1111011;
			4'ha:nub2dis[6:0]=7'b1110111;
			4'hb:nub2dis[6:0]=7'b0011111;
			4'hc:nub2dis[6:0]=7'b1001110;     
			4'hd:nub2dis[6:0]=7'b0111101;
			4'he:nub2dis[6:0]=7'b1001111;
			4'hf:nub2dis[6:0]=7'b1000111;             
			default:nub2dis[6:0]=7'b0000000;
		endcase
	end
endmodule


module tt_finalprocess (
	input wire pulse,
    input  wire switchAB,
	input wire [3:0] key_4,
	input wire rst_n,
	output wire [13:0] disppinout);

	logic [3:0] multblockA;
	logic [3:0] multblockB;

	logic [3:0] num1;
	logic [3:0] num2;

	logic [7:0]multblockout;
	
	assign num1=key_4;

	genvar i;
	generate
		for (i = 0; i < 8; i = i + 1) begin
			tt_multblock multblock(
				.pulse(pulse),
				.key_4(key_4),
				.multblockout(multblockout[i]));
		end
       
	endgenerate

    assign multblockA={multblockout[3],multblockout[2],multblockout[1],multblockout[0]};
    assign multblockB={multblockout[7],multblockout[6],multblockout[5],multblockout[4]};

	always_comb begin
        if (rst_n==0) begin
            num2=4'b0000;
        end
        else begin
            if(switchAB==1)
			    num2=multblockA;
		    else
			    num2=multblockB;
        end
 
	end

	tt_display tt_display(
		.number1(num1),
		.number2(num2),
		.displaypin(disppinout));

endmodule 
