//`timescale 1ns / 1ps

//   morse.v
//
//   Copyright 2024 Brady Etz
//
//   Licensed under the Apache License, Version 2.0 (the "License");
//   you may not use this file except in compliance with the License.
//   You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
//   Unless required by applicable law or agreed to in writing, software
//   distributed under the License is distributed on an "AS IS" BASIS,
//   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//   See the License for the specific language governing permissions and
//   limitations under the License.


/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
* Morse Decode State Machine - A morse parsing state machine
* It advances a state machine based on the dit/dah input code on a rising clk_i when strobe_i is high. 
* It is initialized on reset, or when dit & dah are both strobed low (which also updates the outputs).
* In other words, dit & dah being strobed low together is equivalent to a character space (no dit or dah).
* On an output update, the outputs reflect the last valid state.
* If the strobed state is INIT or ERR, outputs are fully reset (all low).
* ERR indicates an invalid code state, which can only be escaped on initialization/reset.
* Limitations:
* - Morse Decode only tracks codes up to 6 symbols long, e.g., .-.-.-
* - Morse Decode invalidates "prosigns". They should be replaced by their letter equivalents.
*   e.g., -.--. => KN => -.- -., .-... => AS => .- ...
*/
module morse_decode_sm(
  input clk_i, rstn_i,
  input strobe_i,
  input dit_i, dah_i,
  output reg [7:0] seven_seg_o //.GFEDCBA = uo_out[7:0]
);
  // State encodings
  localparam st_INIT = 6'd0;
  localparam st_E    = 6'd1;  //.
  localparam st_T    = 6'd2;  //-
  localparam st_I    = 6'd3;  //..
  localparam st_A    = 6'd4;  //.-
  localparam st_N    = 6'd5;  //-.
  localparam st_M    = 6'd6;  //--
  localparam st_S    = 6'd7;  //...
  localparam st_U    = 6'd8;  //..-
  localparam st_R    = 6'd9;  //.-.
  localparam st_W    = 6'd10; //.--
  localparam st_D    = 6'd11; //-..
  localparam st_K    = 6'd12; //-.-
  localparam st_G    = 6'd13; //--.
  localparam st_O    = 6'd14; //---
  localparam st_H    = 6'd15; //....
  localparam st_V    = 6'd16; //...-
  localparam st_F    = 6'd17; //..-.
  localparam st_INT1 = 6'd18; //..--
  localparam st_L    = 6'd19; //.-..
  localparam st_INT2 = 6'd20; //.-.-
  localparam st_P    = 6'd21; //.--.
  localparam st_J    = 6'd22; //.---
  localparam st_B    = 6'd23; //-...
  localparam st_X    = 6'd24; //-..-
  localparam st_C    = 6'd25; //-.-.
  localparam st_Y    = 6'd26; //-.--
  localparam st_Z    = 6'd27; //--..
  localparam st_Q    = 6'd28; //--.-
  localparam st_INT3 = 6'd29; //---.
  localparam st_INT4 = 6'd30; //----
  localparam st_5    = 6'd31; //.....
  localparam st_4    = 6'd32; //....-
  localparam st_3    = 6'd33; //...--
  localparam st_INT5 = 6'd34; //..--.
  localparam st_2    = 6'd35; //..---
  localparam st_ampn = 6'd36; //.-... -> &
  localparam st_INT6 = 6'd37; //.-..-
  localparam st_plus = 6'd38; //.-.-. -> +
  localparam st_INT7 = 6'd39; //.--.-
  localparam st_1    = 6'd40; //.----
  localparam st_6    = 6'd41; //-....
  localparam st_eqls = 6'd42; //-...- -> =
  localparam st_slsh = 6'd43; //-..-. -> /
  localparam st_INT8 = 6'd44; //-.-.-
  localparam st_prno = 6'd45; //-.--. -> (
  localparam st_7    = 6'd46; //--...
  localparam st_INT9 = 6'd47; //--..-
  localparam st_8    = 6'd48; //---..
  localparam st_9    = 6'd49; //----.
  localparam st_0    = 6'd50; //-----
  localparam st_qstn = 6'd51; //..--.. -> ?
  localparam st_udrs = 6'd52; //..--.- -> _
  localparam st_qote = 6'd53; //.-..-. -> "
  localparam st_fstp = 6'd54; //.-.-.- -> .
  localparam st_atsn = 6'd55; //.--.-. -> @
  localparam st_apst = 6'd56; //.----. -> '
  localparam st_dash = 6'd57; //-....- -> -
  localparam st_semc = 6'd58; //-.-.-. -> ;
  localparam st_excm = 6'd59; //-.-.-- -> !
  localparam st_prnc = 6'd60; //-.--.- -> )
  localparam st_cmma = 6'd61; //--..-- -> ,
  localparam st_coln = 6'd62; //---... -> :
  localparam st_ERR  = 6'd63; //various dead-end codes
  
  reg [5:0] current_state, next_state;
  
  // State transition block
  always @(posedge clk_i or negedge rstn_i) begin
    if (!rstn_i) current_state <= st_INIT;
    else if (strobe_i) current_state <= next_state;
  end
  
  // State machine definition block
  always @* begin
    next_state = st_INIT;
    case(current_state)
      st_INIT: begin
        if (dit_i) next_state = st_E;
        if (dah_i) next_state = st_T;
      end
      st_ERR: if (dit_i | dah_i) next_state = st_ERR;
      st_E: begin //.
        if (dit_i) next_state = st_I;
        if (dah_i) next_state = st_A;
      end
      st_T: begin //-
        if (dit_i) next_state = st_N;
        if (dah_i) next_state = st_M;
      end
      st_I: begin //..
        if (dit_i) next_state = st_S;
        if (dah_i) next_state = st_U;
      end
      st_A: begin //.-
        if (dit_i) next_state = st_R;
        if (dah_i) next_state = st_W;
      end
      st_N: begin //-.
        if (dit_i) next_state = st_D;
        if (dah_i) next_state = st_K;
      end
      st_M: begin //--
        if (dit_i) next_state = st_G;
        if (dah_i) next_state = st_O;
      end
      st_S: begin //...
        if (dit_i) next_state = st_H;
        if (dah_i) next_state = st_V;
      end
      st_U: begin //..-
        if (dit_i) next_state = st_F;
        if (dah_i) next_state = st_INT1;
      end
      st_R: begin //.-.
        if (dit_i) next_state = st_L;
        if (dah_i) next_state = st_INT2;
      end
      st_W: begin //.--
        if (dit_i) next_state = st_P;
        if (dah_i) next_state = st_J;
      end
      st_D: begin //-..
        if (dit_i) next_state = st_B;
        if (dah_i) next_state = st_X;
      end
      st_K: begin //-.-
        if (dit_i) next_state = st_C;
        if (dah_i) next_state = st_Y;
      end
      st_G: begin //--.
        if (dit_i) next_state = st_Z;
        if (dah_i) next_state = st_Q;
      end
      st_O: begin //---
        if (dit_i) next_state = st_INT3;
        if (dah_i) next_state = st_INT4;
      end
      st_H: begin //....
        if (dit_i) next_state = st_5;
        if (dah_i) next_state = st_4;
      end
      st_V: begin //...-
        if (dit_i) next_state = st_ERR;
        if (dah_i) next_state = st_3;
      end
      st_F: begin //..-.
        if (dit_i | dah_i) next_state = st_ERR;
      end
      st_INT1: begin //..--
        if (dit_i) next_state = st_INT5;
        if (dah_i) next_state = st_2;
      end
      st_L: begin //.-..
        if (dit_i) next_state = st_ampn;
        if (dah_i) next_state = st_INT6;
      end
      st_INT2: begin //.-.-
        if (dit_i) next_state = st_plus;
        if (dah_i) next_state = st_ERR;
      end
      st_P: begin //.--.
        if (dit_i) next_state = st_ERR;
        if (dah_i) next_state = st_INT7;
      end
      st_J: begin //.---
        if (dit_i) next_state = st_ERR;
        if (dah_i) next_state = st_1;
      end
      st_B: begin //-...
        if (dit_i) next_state = st_6;
        if (dah_i) next_state = st_eqls;
      end
      st_X: begin //-..-
        if (dit_i) next_state = st_slsh;
        if (dah_i) next_state = st_ERR;
      end
      st_C: begin //-.-.
        if (dit_i) next_state = st_ERR;
        if (dah_i) next_state = st_INT8;
      end
      st_Y: begin //-.--
        if (dit_i) next_state = st_prno;
        if (dah_i) next_state = st_ERR;
      end
      st_Z: begin //--..
        if (dit_i) next_state = st_7;
        if (dah_i) next_state = st_INT9;
      end
      st_Q: begin //--.-
        if (dit_i | dah_i) next_state = st_ERR;
      end
      st_INT3: begin //---.
        if (dit_i) next_state = st_8;
        if (dah_i) next_state = st_ERR;
      end
      st_INT4: begin //----
        if (dit_i) next_state = st_9;
        if (dah_i) next_state = st_0;
      end
      st_5: begin //.....
        if (dit_i | dah_i) next_state = st_ERR;
      end
      st_4: begin //....-
        if (dit_i | dah_i) next_state = st_ERR;
      end
      st_3: begin //...--
        if (dit_i | dah_i) next_state = st_ERR;
      end
      st_INT5: begin //..--.
        if (dit_i) next_state = st_qstn;
        if (dah_i) next_state = st_udrs;
      end
      st_2: begin //..---
        if (dit_i | dah_i) next_state = st_ERR;
      end
      st_ampn: begin //.-... -> &
        if (dit_i | dah_i) next_state = st_ERR;
      end
      st_INT6: begin //.-..-
        if (dit_i) next_state = st_qote;
        if (dah_i) next_state = st_ERR;
      end
      st_plus: begin //.-.-. -> +
        if (dit_i) next_state = st_ERR;
        if (dah_i) next_state = st_fstp;
      end
      st_INT7: begin //.--.-
        if (dit_i) next_state = st_atsn;
        if (dah_i) next_state = st_ERR;
      end
      st_1: begin //.----
        if (dit_i) next_state = st_apst;
        if (dah_i) next_state = st_ERR;
      end
      st_6: begin //-....
        if (dit_i) next_state = st_ERR;
        if (dah_i) next_state = st_dash;
      end
      st_eqls: begin //-...- -> =
        if (dit_i | dah_i) next_state = st_ERR;
      end
      st_slsh: begin //-..-. -> /
        if (dit_i | dah_i) next_state = st_ERR;
      end
      st_INT8: begin //-.-.-
        if (dit_i) next_state = st_semc;
        if (dah_i) next_state = st_excm;
      end
      st_prno: begin //-.--. -> (
        if (dit_i) next_state = st_ERR;
        if (dah_i) next_state = st_prnc;
      end
      st_7: begin //--...
        if (dit_i | dah_i) next_state = st_ERR;
      end
      st_INT9: begin //--..-
        if (dit_i) next_state = st_ERR;
        if (dah_i) next_state = st_cmma;
      end
      st_8: begin //---..
        if (dit_i) next_state = st_coln;
        if (dah_i) next_state = st_ERR;
      end
      st_9: begin //----.
        if (dit_i | dah_i) next_state = st_ERR;
      end
      st_0: begin //-----
        if (dit_i | dah_i) next_state = st_ERR;
      end
      st_qstn: begin //..--.. -> ?
        if (dit_i | dah_i) next_state = st_ERR;
      end
      st_udrs: begin //..--.- -> _
        if (dit_i | dah_i) next_state = st_ERR;
      end
      st_qote: begin //.-..-. -> "
        if (dit_i | dah_i) next_state = st_ERR;
      end
      st_fstp: begin //.-.-.- -> .
        if (dit_i | dah_i) next_state = st_ERR;
      end
      st_atsn: begin //.--.-. -> @
        if (dit_i | dah_i) next_state = st_ERR;
      end
      st_apst: begin //.----. -> '
        if (dit_i | dah_i) next_state = st_ERR;
      end
      st_dash: begin //-....- -> -
        if (dit_i | dah_i) next_state = st_ERR;
      end
      st_semc: begin //-.-.-. -> ;
        if (dit_i | dah_i) next_state = st_ERR;
      end
      st_excm: begin //-.-.-- -> !
        if (dit_i | dah_i) next_state = st_ERR;
      end
      st_prnc: begin //-.--.- -> )
        if (dit_i | dah_i) next_state = st_ERR;
      end
      st_cmma: begin //--..-- -> ,
        if (dit_i | dah_i) next_state = st_ERR;
      end
      st_coln: begin //---... -> :
        if (dit_i | dah_i) next_state = st_ERR;
      end
      default: next_state = st_ERR;
    endcase
  end
  
  // Output transition block
  always @(posedge clk_i or negedge rstn_i) begin
    if (!rstn_i) seven_seg_o <= 8'b0;
    else if (strobe_i & ~(dit_i | dah_i)) begin
      case(current_state)
        st_A: seven_seg_o <= 8'b01110111;
        st_B: seven_seg_o <= 8'b01111100;
        st_C: seven_seg_o <= 8'b01011000;
        st_D: seven_seg_o <= 8'b01011110;
        st_E: seven_seg_o <= 8'b01111001;
        st_F: seven_seg_o <= 8'b01110001;
        st_G: seven_seg_o <= 8'b00111101;
        st_H: seven_seg_o <= 8'b01110100;
        st_I: seven_seg_o <= 8'b00010001;
        st_J: seven_seg_o <= 8'b00001101;
        st_K: seven_seg_o <= 8'b01110101;
        st_L: seven_seg_o <= 8'b00111000;
        st_M: seven_seg_o <= 8'b01010101;
        st_N: seven_seg_o <= 8'b01010100;
        st_O: seven_seg_o <= 8'b01011100;
        st_P: seven_seg_o <= 8'b01110011;
        st_Q: seven_seg_o <= 8'b11100111;
        st_R: seven_seg_o <= 8'b01010000;
        st_S: seven_seg_o <= 8'b00101101;
        st_T: seven_seg_o <= 8'b01111000;
        st_U: seven_seg_o <= 8'b00011100;
        st_V: seven_seg_o <= 8'b00101010;
        st_W: seven_seg_o <= 8'b01101010;
        st_X: seven_seg_o <= 8'b00010100;
        st_Y: seven_seg_o <= 8'b01101110;
        st_Z: seven_seg_o <= 8'b00011011;
        st_1: seven_seg_o <= 8'b00000110;
        st_2: seven_seg_o <= 8'b01011011;
        st_3: seven_seg_o <= 8'b01001111;
        st_4: seven_seg_o <= 8'b01100110;
        st_5: seven_seg_o <= 8'b01101101;
        st_6: seven_seg_o <= 8'b01111101;
        st_7: seven_seg_o <= 8'b00000111;
        st_8: seven_seg_o <= 8'b01111111;
        st_9: seven_seg_o <= 8'b01101111;
        st_0: seven_seg_o <= 8'b00111111;
        st_fstp: seven_seg_o <= 8'b10000000;
        st_qstn: seven_seg_o <= 8'b01001011;
        st_excm: seven_seg_o <= 8'b10000010;
        st_cmma: seven_seg_o <= 8'b10000100;
        st_ampn: seven_seg_o <= 8'b11111111;
        st_plus: seven_seg_o <= 8'b01000110;
        st_dash: seven_seg_o <= 8'b01000000;
        st_eqls: seven_seg_o <= 8'b01001000;
        st_slsh: seven_seg_o <= 8'b01010010;
        st_prno: seven_seg_o <= 8'b00111001;
        st_prnc: seven_seg_o <= 8'b00001111;
        st_udrs: seven_seg_o <= 8'b00001000;
        st_apst: seven_seg_o <= 8'b00100000;
        st_qote: seven_seg_o <= 8'b00100010;
        st_atsn: seven_seg_o <= 8'b01011111;
        st_semc: seven_seg_o <= 8'b00000101;
        st_coln: seven_seg_o <= 8'b00001001;
        default: seven_seg_o <= 8'b00000000;
      endcase
    end
  end
endmodule


/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
* Morse Decode Shift Register - A morse parsing shift register
* It advances a shift register with the dit(0)/dah(1) input on a rising clk_i when strobe_i is high. 
* It is initialized on reset, or when dit & dah are both strobed low (which also updates the outputs).
* In other words, dit & dah being strobed low together is equivalent to a character space (no dit or dah).
* On an output update, the outputs reflect the shift register contents.
* On initialization, outputs bits are reset (all low).
* Exceeding 6 symbols in a code character results in a blank/error output.
* Limitations:
* - Morse Decode only tracks codes up to 6 symbols long, e.g., .-.-.-
* - Morse Decode invalidates "prosigns". They should be replaced by their letter equivalents.
*   e.g., -.--. => KN => -.- -., .-... => AS => .- ...
*/
module morse_decode_sr(
  input clk_i, rstn_i,
  input strobe_i,
  input dit_i, dah_i,
  output reg [7:0] seven_seg_o //.GFEDCBA = uo_out[7:0]
);
  // Symbol encodings
  localparam msk_INIT = 6'b000000;
  localparam reg_INIT = 6'b000000;
  
  localparam msk_1    = 6'b000001;
  localparam reg_E    = 6'b000000; //.
  localparam reg_T    = 6'b000001; //-
  
  localparam msk_2    = 6'b000011;
  localparam reg_I    = 6'b000000; //..
  localparam reg_A    = 6'b000001; //.-
  localparam reg_N    = 6'b000010; //-.
  localparam reg_M    = 6'b000011; //--
  
  localparam msk_3    = 6'b000111;
  localparam reg_S    = 6'b000000; //...
  localparam reg_U    = 6'b000001; //..-
  localparam reg_R    = 6'b000010; //.-.
  localparam reg_W    = 6'b000011; //.--
  localparam reg_D    = 6'b000100; //-..
  localparam reg_K    = 6'b000101; //-.-
  localparam reg_G    = 6'b000110; //--.
  localparam reg_O    = 6'b000111; //---
  
  localparam msk_4    = 6'b001111;
  localparam reg_H    = 6'b000000; //....
  localparam reg_V    = 6'b000001; //...-
  localparam reg_F    = 6'b000010; //..-.
  localparam reg_L    = 6'b000100; //.-..
  localparam reg_P    = 6'b000110; //.--.
  localparam reg_J    = 6'b000111; //.---
  localparam reg_B    = 6'b001000; //-...
  localparam reg_X    = 6'b001001; //-..-
  localparam reg_C    = 6'b001010; //-.-.
  localparam reg_Y    = 6'b001011; //-.--
  localparam reg_Z    = 6'b001100; //--..
  localparam reg_Q    = 6'b001101; //--.-
  
  localparam msk_5    = 6'b011111;
  localparam reg_5    = 6'b000000; //.....
  localparam reg_4    = 6'b000001; //....-
  localparam reg_3    = 6'b000011; //...--
  localparam reg_2    = 6'b000111; //..---
  localparam reg_ampn = 6'b001000; //.-... -> &
  localparam reg_plus = 6'b001010; //.-.-. -> +
  localparam reg_1    = 6'b001111; //.----
  localparam reg_6    = 6'b010000; //-....
  localparam reg_eqls = 6'b010001; //-...- -> =
  localparam reg_slsh = 6'b010010; //-..-. -> /
  localparam reg_prno = 6'b010110; //-.--. -> (
  localparam reg_7    = 6'b011000; //--...
  localparam reg_8    = 6'b011100; //---..
  localparam reg_9    = 6'b011110; //----.
  localparam reg_0    = 6'b011111; //-----
  
  localparam msk_6    = 6'b111111;
  localparam reg_qstn = 6'b001100; //..--.. -> ?
  localparam reg_udrs = 6'b001101; //..--.- -> _
  localparam reg_qote = 6'b010010; //.-..-. -> "
  localparam reg_fstp = 6'b010101; //.-.-.- -> .
  localparam reg_atsn = 6'b011010; //.--.-. -> @
  localparam reg_apst = 6'b011110; //.----. -> '
  localparam reg_dash = 6'b100001; //-....- -> -
  localparam reg_semc = 6'b101010; //-.-.-. -> ;
  localparam reg_excm = 6'b101011; //-.-.-- -> !
  localparam reg_prnc = 6'b101101; //-.--.- -> )
  localparam reg_cmma = 6'b110011; //--..-- -> ,
  localparam reg_coln = 6'b111000; //---... -> :
  localparam reg_ERR  = 6'b111111; // overflow
  
  reg [5:0] data, mask;
  
  // Shift register block
  always @(posedge clk_i or negedge rstn_i) begin
    if (!rstn_i) begin
      data <= reg_INIT; mask <= msk_INIT;
    end else if (strobe_i) begin
      if (dit_i | dah_i) begin
        data <= mask[5] ? reg_ERR : {data[4:0], dah_i};
        mask <= {mask[4:0], 1'b1};
      end else begin
        data <= reg_INIT;
        mask <= msk_INIT;
      end
    end
  end
  
  // Output block
  always @(posedge clk_i or negedge rstn_i) begin
    if (!rstn_i) seven_seg_o <= 8'b0;
    else if (strobe_i & ~(dit_i | dah_i)) begin
      case (mask)
        msk_1: begin
          case (data)
            reg_E:   seven_seg_o <= 8'b01111001;
            reg_T:   seven_seg_o <= 8'b01111000;
            default: seven_seg_o <= 8'b0;
          endcase
        end
        msk_2: begin
          case (data)
            reg_I:   seven_seg_o <= 8'b00010001;
            reg_A:   seven_seg_o <= 8'b01110111;
            reg_N:   seven_seg_o <= 8'b01010100;
            reg_M:   seven_seg_o <= 8'b01010101;
            default: seven_seg_o <= 8'b0;
          endcase
        end
        msk_3: begin
          case (data)
            reg_S:   seven_seg_o <= 8'b00101101;
            reg_U:   seven_seg_o <= 8'b00011100;
            reg_R:   seven_seg_o <= 8'b01010000;
            reg_W:   seven_seg_o <= 8'b01101010;
            reg_D:   seven_seg_o <= 8'b01011110;
            reg_K:   seven_seg_o <= 8'b01110101;
            reg_G:   seven_seg_o <= 8'b00111101;
            reg_O:   seven_seg_o <= 8'b01011100;
            default: seven_seg_o <= 8'b0;
          endcase
        end
        msk_4: begin
          case (data)
            reg_H:   seven_seg_o <= 8'b01110100;
            reg_V:   seven_seg_o <= 8'b00101010;
            reg_F:   seven_seg_o <= 8'b01110001;
            reg_L:   seven_seg_o <= 8'b00111000;
            reg_P:   seven_seg_o <= 8'b01110011;
            reg_J:   seven_seg_o <= 8'b00001101;
            reg_B:   seven_seg_o <= 8'b01111100;
            reg_X:   seven_seg_o <= 8'b00010100;
            reg_C:   seven_seg_o <= 8'b01011000;
            reg_Y:   seven_seg_o <= 8'b01101110;
            reg_Z:   seven_seg_o <= 8'b00011011;
            reg_Q:   seven_seg_o <= 8'b11100111;
            default: seven_seg_o <= 8'b0;
          endcase
        end
        msk_5: begin
          case (data)
            reg_0:    seven_seg_o <= 8'b00111111;
            reg_1:    seven_seg_o <= 8'b00000110;
            reg_2:    seven_seg_o <= 8'b01011011;
            reg_3:    seven_seg_o <= 8'b01001111;
            reg_4:    seven_seg_o <= 8'b01100110;
            reg_5:    seven_seg_o <= 8'b01101101;
            reg_6:    seven_seg_o <= 8'b01111101;
            reg_7:    seven_seg_o <= 8'b00000111;
            reg_8:    seven_seg_o <= 8'b01111111;
            reg_9:    seven_seg_o <= 8'b01101111;
            reg_eqls: seven_seg_o <= 8'b01001000;
            reg_plus: seven_seg_o <= 8'b01000110;
            reg_slsh: seven_seg_o <= 8'b01010010;
            reg_ampn: seven_seg_o <= 8'b11111111;
            reg_prno: seven_seg_o <= 8'b00111001;
            default:  seven_seg_o <= 8'b0;
          endcase
        end
        msk_6: begin
          case (data)
            reg_fstp: seven_seg_o <= 8'b10000000;
            reg_qstn: seven_seg_o <= 8'b01001011;
            reg_excm: seven_seg_o <= 8'b10000010;
            reg_cmma: seven_seg_o <= 8'b10000100;
            reg_dash: seven_seg_o <= 8'b01000000;
            reg_prnc: seven_seg_o <= 8'b00001111;
            reg_udrs: seven_seg_o <= 8'b00001000;
            reg_apst: seven_seg_o <= 8'b00100000;
            reg_qote: seven_seg_o <= 8'b00100010;
            reg_atsn: seven_seg_o <= 8'b01011111;
            reg_semc: seven_seg_o <= 8'b00000101;
            reg_coln: seven_seg_o <= 8'b00001001;
            default:  seven_seg_o <= 8'b0;
          endcase
        end
        default: seven_seg_o <= 8'b0;
      endcase
    end
  end
endmodule


/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
* Iambic Keyer - A paddle keying state machine
* It advances a state machine to produce dit/dah pulses on a rising clk_i on a timer pulse (sync_i).
* The timer pulse is a one-period active-high sync clock set by the WPM rate and last word start.
*  -- It starts counting on a key input and pulses high for a single clock after Tdit.
*  -- The sync clock should reset on a new word, a pause longer than 2*Tdit.
* The timer period sets the "dit" time (Tdit). "Dah" is an extended pulse of 3*Tdit.
* The space between any dit/dah, called a "pause", is Tdit.
* AB_Select determines if the iambic keying takes Iambic-A behavior (LOW) or Iambic-B (HIGH).
* Limitations:
* - Debouncing and synchronizing the inputs is done externally.
*/
module iambic_keyer(
  input clk_i, rstn_i,
  input ab_select_i,
  input dit_i, dah_i, sync_i,
  output reg morse_out
);
  // State encodings
  localparam st_INIT          = 8'b00000000;
  localparam st_DIT_PULSE     = 8'b00000001;
  localparam st_DIT_PULSE_DAH = 8'b00000010;
  localparam st_DIT_PAUSE     = 8'b00000100;
  localparam st_DIT_PAUSE_DAH = 8'b00001000;
  localparam st_DAH_PULSE     = 8'b00010000;
  localparam st_DAH_PULSE_DIT = 8'b00100000;
  localparam st_DAH_PAUSE     = 8'b01000000;
  localparam st_DAH_PAUSE_DIT = 8'b10000000;
  
  reg [7:0] current_state, next_state;
  reg [1:0] dah_count;
  
  // State transition block
  always @(posedge clk_i or negedge rstn_i) begin
    if (!rstn_i) current_state <= st_INIT;
    else         current_state <= next_state;
  end
  
  // Dah counter
  always @(posedge clk_i) begin
    case (current_state)
      st_DAH_PULSE:     if (sync_i) dah_count <= {dah_count[0], 1'b1};
      st_DAH_PULSE_DIT: if (sync_i) dah_count <= {dah_count[0], 1'b1};
      default:          dah_count <= 2'b00;
    endcase
  end
  
  // State machine definition block
  always @* begin
    next_state = current_state;
    case(current_state)
      st_INIT: begin
        if (dit_i) next_state = st_DIT_PULSE;
        if (dah_i) next_state = st_DAH_PULSE;
      end
      st_DIT_PULSE: begin
        if (dah_i & ab_select_i) next_state = st_DIT_PULSE_DAH;
        if (sync_i) next_state = st_DIT_PAUSE;
      end
      st_DIT_PULSE_DAH: begin
        if (sync_i) next_state = st_DIT_PAUSE_DAH;
      end
      st_DIT_PAUSE: begin
        if (dah_i & ab_select_i) next_state = st_DIT_PAUSE_DAH;
        if (sync_i) next_state = dah_i ? st_DAH_PULSE : st_INIT;
      end
      st_DIT_PAUSE_DAH: begin
        if (sync_i) next_state = st_DAH_PULSE;
      end
      st_DAH_PULSE: begin
        if (dit_i & ab_select_i) next_state = st_DAH_PULSE_DIT;
        if (sync_i & dah_count[1]) next_state = st_DAH_PAUSE;
      end
      st_DAH_PULSE_DIT: begin
        if (sync_i & dah_count[1]) next_state = st_DAH_PAUSE_DIT;
      end
      st_DAH_PAUSE: begin
        if (dit_i & ab_select_i) next_state = st_DAH_PAUSE_DIT;
        if (sync_i) next_state = dit_i ? st_DIT_PULSE : st_INIT;
      end
      st_DAH_PAUSE_DIT: begin
        if (sync_i) next_state = st_DIT_PULSE;
      end
      default: ;
    endcase
  end
  
  // Morse output is high during any pulse state.
  always @(posedge clk_i) begin
    case (current_state)
      st_DIT_PULSE:     morse_out <= 1'b1;
      st_DIT_PULSE_DAH: morse_out <= 1'b1;
      st_DAH_PULSE:     morse_out <= 1'b1;
      st_DAH_PULSE_DIT: morse_out <= 1'b1;
      default:          morse_out <= 1'b0;
    endcase
  end
endmodule


/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
* Dit Pulse and Buzzer Oscillator - Timing Element
* This module consumes a 12 MHz clock and produces a variable-period dit pulse.
* First, a 512x prescaler drops the effective timer frequency to 23.44 kHz.
* The timer preset is adjusted by wpm_control to between 110 WPM (4'b0000) and 6.9 WPM (4'b1111).
* The module also produces a gated buzzer waveform with the timer's 5th bit.
* The pulse timer begins on any Morse pulse (morse_i high state).
* The timer stops producing pulses after 6 pulses with morse_i low, which is enough for downstream decode.
*/
module dit_pulse_buzzer_oscillator(
  input clk_i, rstn_i,
  input morse_i,
  input [3:0] wpm_control,
  output reg dit_pulse,
  output reg buzzer_osc
);
  wire [11:0] timer_preset;
  assign timer_preset = {wpm_control, 8'b11111111}; // Fixed offset of 255, step size of 256
  
  // Retime the dit pulses whenever a new key begins, to prevent measurement bugs
  // This is a synchronous reset for the timer
  reg last_morse; wire retime;
  always @(posedge clk_i) last_morse <= morse_i;
  assign retime = morse_i & ~last_morse;
  
  // Timer prescaler pulse, divide by 512
  // Note, the first prescaler pulse is early. The minimum timer count is 255, so this is tolerable.
  wire clk2, clk4, clk8, clk16, clk32, clk64, clk128, clk256, clk512;
  clkdiv_by_2  div0(clk_i, rstn_i, clk2);
  ripple_stage div1(clk_i, rstn_i, clk2, clk4);
  ripple_stage div2(clk_i, rstn_i, clk4, clk8);
  ripple_stage div3(clk_i, rstn_i, clk8, clk16);
  ripple_stage div4(clk_i, rstn_i, clk16, clk32);
  ripple_stage div5(clk_i, rstn_i, clk32, clk64);
  ripple_stage div6(clk_i, rstn_i, clk64, clk128);
  ripple_stage div7(clk_i, rstn_i, clk128, clk256);
  ripple_stage div8(clk_i, rstn_i, clk256, clk512);
  reg last_clk512; wire prescaler;
  always @(posedge clk_i) last_clk512 <= clk512;
  assign prescaler = clk512 & ~last_clk512;
  
  reg [11:0] timer;
  reg [5:0] pause_count;
  reg timer_dn, timer_en;
  // Timer update
  always @(posedge clk_i or negedge rstn_i) begin
    if (!rstn_i) begin
      timer <= 12'b0; pause_count <= 6'b0; timer_dn <= 1'b0; timer_en <= 1'b0;
    end else if (retime) begin
      timer <= 12'b0; pause_count <= 6'b0; timer_dn <= 1'b0; timer_en <= 1'b0;
    end else begin
      if (morse_i) timer_en <= 1'b1;
      if (timer == timer_preset) begin
        timer <= 12'b0; timer_dn <= 1'b1;
        if (~morse_i) begin
          if (pause_count[5]) timer_en <= 1'b0;
          pause_count <= {pause_count[4:0], 1'b1};
        end
      end else begin
        timer_dn <= 1'b0;
        if (prescaler & (timer_en | morse_i)) begin
          timer <= timer + 1;
        end
      end
    end
  end
  
  // Output control
  always @* begin
    dit_pulse = timer_dn;
    buzzer_osc = timer[4] & morse_i;
  end
endmodule


/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
* Morse Dit/Dah Encoder
* This module consumes a system clock, morse code input, and a single-clock dit period pulse to determine:
* - Whether a high pulse is a dit or dah
* - Whether a low pulse (pause) is a character space or a word space
* The module produces a single-clock strobe pulse and the accompanying dit/dah signal for downstream displays.
*/
module morse_encoder(
  input clk_i, rstn_i,
  input morse_i, dit_pulse,
  output reg strobe, code_dit, code_dah
);
  
  reg [1:0] high_ct; reg [5:0] low_ct;
  reg last_morse;
  always @(posedge clk_i) last_morse <= morse_i;
  
  always @(posedge clk_i or negedge rstn_i) begin
    if (~rstn_i) begin
      high_ct <= 2'b0; low_ct <= 6'b0; 
      strobe <= 1'b0; code_dit <= 1'b0; code_dah <= 1'b0;
    end else begin
      strobe <= 1'b0; code_dit <= 1'b0; code_dah <= 1'b0;
      if (dit_pulse) begin
        high_ct <= morse_i ? {high_ct[0], 1'b1} : 2'b0;
        low_ct <= ~morse_i ? {low_ct[4:0], 1'b1} : 6'b0;
        if (low_ct[5]) strobe <= 1'b1; // End of word conversion
      end
      if (morse_i & ~last_morse & low_ct[1]) strobe <= 1'b1; // End of character conversion
      if (~morse_i & last_morse) begin
        strobe <= 1'b1;
        if (high_ct[1]) code_dah <= 1'b1; // Serialize a dah
        else            code_dit <= 1'b1; // Serialize a dit
      end
    end
  end
endmodule


/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
* Top-level Morse Keyer Module
* Implements the functionality described in the project documentation: 
*   https://github.com/b-etz/tt08-morse-keyer
*/
module tt08_morse_keyer(
  input clk_i, rstn_i,
  input [3:0] wpm_sel_i,
  input paddle_sel_i, iambic_AB_i,
  input dit_i, dah_i,
  output reg  aux_dit_o, aux_dah_o, aux_morse_o,
  output wire buzzer_o,
  output wire [7:0] seven_segment
);
  wire dit_r, dah_r;
  wire iambic_morse, morse_int;
  wire dit_pulse;
  wire stb, code_dit, code_dah;
  
  debounce db0(clk_i, rstn_i, dit_i, dit_r); // Dit paddle debounce
  debounce db1(clk_i, rstn_i, dah_i, dah_r); // Dah paddle debounce
  
  assign morse_int = paddle_sel_i ? iambic_morse : dit_r; // Select between straight-key morse and keyer output
  iambic_keyer keyer(clk_i, rstn_i, iambic_AB_i, dit_r, dah_r, dit_pulse, iambic_morse);
  morse_decode_sr display(clk_i, rstn_i, stb, code_dit, code_dah, seven_segment);
  dit_pulse_buzzer_oscillator dit_timer(clk_i, rstn_i, morse_int, wpm_sel_i, dit_pulse, buzzer_o);
  morse_encoder encoder(clk_i, rstn_i, morse_int, dit_pulse, stb, code_dit, code_dah);
  
  always @(posedge clk_i) begin
    aux_dit_o   <= dit_r;
    aux_dah_o   <= dah_r;
    aux_morse_o <= morse_int;
  end
endmodule
