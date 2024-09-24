// Copyright, 2024 - Alea Art Engineering, Enrico Sanino
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.


module color_wheel_processor
    (
        input wire clk,
        input wire clk_en,
        input wire reset,
        input wire mult_ok,
        output reg [7 : 0] mult1,
        output reg [7 : 0] mult2,
        input wire [15 : 0] mult_res,
        output reg ld,
        input wire [7 : 0] mode,
        input wire [7 : 0] lint,
        input wire [7 : 0] color_idx,
        input wire [7 : 0] white_in,
        input wire [7 : 0] red_in,
        input wire [7 : 0] green_in,
        input wire [7 : 0] blue_in,
        output reg [7 : 0] red_out_reg,
        output reg [7 : 0] green_out_reg,
        output reg [7 : 0] blue_out_reg,
        output reg [7 : 0] white_out_reg
    );

    
    /* this pre_* state is purely to have the correct sync in a pure sequential logic. it increase the clock cycles to compute a color */
    localparam init = 5'd0;
    /* states to "rotate" the wheel up to the selected color. 256 rotation steps possible,
       with total of 6 hue transitions */
    localparam pre_thr1 = 5'd1;
    localparam thr1 = 5'd2;
    localparam pre_thr2 = 5'd3;
    localparam thr2 = 5'd4;
    localparam pre_thr3 = 5'd5;
    localparam thr3 = 5'd6;
    localparam pre_thr4 = 5'd7;
    localparam thr4 = 5'd8;
    localparam pre_thr5 = 5'd9;
    localparam thr5 = 5'd10;
    localparam pre_thr6 = 5'd11;
    localparam thr6 = 5'd12;
    /* apply the tint by summing white to the colors and outputting a separate white as well */
    localparam whiteSat = 5'd13;
    /* apply the intensity factor to the white */
    localparam stateApply = 5'd14;
    /* apply the intensity factor to the red */
    localparam stateApply_R = 5'd15;
    /* apply the intensity factor to the green */
    localparam stateApply_G = 5'd16;
    /* apply the intensity factor to the blue */
    localparam stateApply_B = 5'd17;
    /* truncate the final color from 16bit to 8 (MSB) and store them in the outputs */
    localparam applyOut = 5'd18;


    reg [7 : 0] r = 8'b00000000; // the generated RED (hue)
    reg [7 : 0] g = 8'b00000000; // the generated GREEN (hue)
    reg [7 : 0] b = 8'b00000000; // the generated BLUE (hue)
    reg [7 : 0] buff_white = 8'b00000000; // buffer the white and avoid glithes in a single color cycle
    reg [15 : 0] r_temp = 16'h0000; // to handle overflows when applying the luminosity factor
    reg [15 : 0] g_temp = 16'h0000; // to handle overflows when applying the luminosity factor
    reg [15 : 0] b_temp = 16'h0000; // to handle overflows when applying the luminosity factor
    reg [15 : 0] w_temp = 16'h0000; // to handle overflows when applying the luminosity factor
    reg [8 : 0] temp_ovf_r = 9'b000000000; // to handle overflows when applying the tint (white) factor
    reg [8 : 0] temp_ovf_b = 9'b000000000; // to handle overflows when applying the tint (white) factor
    reg [8 : 0] temp_ovf_g = 9'b000000000; // to handle overflows when applying the tint (white) factor
    reg [7 : 0] buff_light_intst = 8'b00000000;
    reg [7 : 0] thr = 8'b00000000;
    reg [7 : 0] counter = 8'b00000000;


    reg [4 : 0] state = 5'd0;

    always @(posedge clk)
    begin
    if (clk_en == 1'b0)
    begin
        if (reset == 1'b0)
        begin
            state <= init;
            thr <= 8'b00000000;
            buff_light_intst <= 8'b00000000;
            counter <= 8'b00000000;
            r <= 8'b00000000;
            g <= 8'b00000000;
            b <= 8'b00000000;
            buff_light_intst <= 8'b00000000;
            white_out_reg <= 8'h00;
            red_out_reg <= 8'h00;
            green_out_reg <= 8'h00;
            blue_out_reg <= 8'h00;
            ld <= 1'b0;
            mult1 <= 8'h00;
            mult2 <= 8'h00;
        end
        else
        begin
            case (state)
            init: begin
                r <= 8'b00000000;
                g <= 8'b00000000;
                b <= 8'b00000000;
                thr <= color_idx;
                buff_light_intst <= lint;
                buff_white <= white_in;
                counter <= 8'b00000001;
                if (mode == 8'h21)  // no need to buffer as it is cheched only at the first step of the color state machine
                begin
                    white_out_reg <= white_in;
                    red_out_reg <= red_in;
                    green_out_reg <= green_in;
                    blue_out_reg <= blue_in;
                    state <= init;
                end
                else if (mode == 8'ha4)
                begin
                    state <= pre_thr1;
                    temp_ovf_b <= b + 8'b00000111;
                end
                else
                begin
                    state <= init;
                end
            end

            pre_thr1: begin
            if (temp_ovf_b[8] == 1'b1) begin // overflow
                    b <= 8'hff;
                end 
                else begin
                    b <= temp_ovf_b[7:0]; 
                end           
            r <= 8'b11111111;
            g <= 8'b00000000;
            state <= thr1;
            end


            thr1: begin
                
            
                if (counter < thr)
                begin
                    counter <= counter + 1;
                    if (counter < 8'h2A)
                    begin
                        state <= pre_thr1;
                        temp_ovf_b <= b + 8'b00000111;
                    end
                    else
                    begin
                        state <= pre_thr2;
                        temp_ovf_r <= r - 8'b00000111;
                    end
                end
                else
                begin
                    state <= whiteSat;
                end
            end

            pre_thr2: begin
            /* this pre_* state is purely to have the correct sync in a pure sequential logic. it increase the clock cycles to compute a color */
            if ((temp_ovf_r[8] == 1'b1)) begin // underflow
                    r <= 8'h00;
                end 
                else begin
                    r <= temp_ovf_r[7:0]; 
                end                   
                g <= 8'b00000000;
                b <= 8'b11111111;
                state <= thr2;
            end

            thr2: begin
                
                if (counter < thr)
                begin
                    counter <= counter + 1;
                    if (counter < 8'h54)
                    begin
                        state <= pre_thr2;
                        temp_ovf_r <= r - 8'b00000111;
                    end
                    else
                    begin
                        state <= pre_thr3;
                        temp_ovf_g <= g + 8'b00000111;
                    end
                end
                else
                begin
                    state <= whiteSat;
                end
            end


            pre_thr3: begin
            /* this pre_* state is purely to have the correct sync in a pure sequential logic. it increase the clock cycles to compute a color */
                if (temp_ovf_g[8] == 1'b1) begin // overflow
                    g <= 8'hff;
                end 
                else begin
                    g <= temp_ovf_g[7:0]; 
                end    
                r <= 8'b00000000;
                b <= 8'b11111111;
                state <= thr3;
            end


            thr3: begin

                if (counter < thr)
                begin
                    counter <= counter + 1;
                    if (counter < 8'h7e)
                    begin
                        state <= pre_thr3;
                        temp_ovf_g <= g + 8'b00000111;
                    end
                    else
                    begin
                        state <= pre_thr4;
                        temp_ovf_b <= b - 8'b00000111;
                    end
                end
                else
                begin
                    state <= whiteSat;
                end
            end

            pre_thr4: begin
            /* this pre_* state is purely to have the correct sync in a pure sequential logic. it increase the clock cycles to compute a color */
                if ((temp_ovf_b[8] == 1'b1)) begin // underflow
                    b <= 8'h00;
                end 
                else begin
                    b <= temp_ovf_b[7:0]; 
                end   
                r <= 8'b00000000;
                g <= 8'b11111111;
                state <= thr4;
                    counter <= counter + 1;

            end

            thr4: begin

                if (counter < thr)
                begin
                    if (counter < 8'hA8)
                    begin
                        state <= pre_thr4;
                        temp_ovf_b <= b - 8'b00000111;
                    end
                    else
                    begin
                        state <= pre_thr5;
                        temp_ovf_r <= r + 8'b00000111;
                    end
                end
                else
                begin
                    state <= whiteSat;
                end
            end

            pre_thr5: begin
            /* this pre_* state is purely to have the correct sync in a pure sequential logic. it increase the clock cycles to compute a color */
                if (temp_ovf_r[8] == 1'b1) begin // overflow
                    r <= 8'hff;
                end 
                else begin
                    r <= temp_ovf_r[7:0]; 
                end    
                g <= 8'b11111111;
                b <= 8'b00000000;
                state <= thr5;
            end

            thr5: begin

                if (counter < thr)
                begin
                    counter <= counter + 1;
                    if (counter < 8'hD2)
                    begin
                        state <= pre_thr5;
                        temp_ovf_r <= r + 8'b00000111;
                    end
                    else
                    begin
                        state <= pre_thr6;
                        temp_ovf_g <= g - 8'b00000111;
                    end
                end
                else
                begin
                    state <= whiteSat;
                end
            end

            pre_thr6: begin
            /* this pre_* state is purely to have the correct sync in a pure sequential logic. it increase the clock cycles to compute a color */
                if ((temp_ovf_g[8] == 1'b1)) begin // underflow
                    g <= 8'h00;  
                end 
                else begin
                 g <= temp_ovf_g[7:0]; 
                end    
                r <= 8'b11111111;
                b <= 8'b00000000;
                state <= thr6;
            end

            thr6: begin
                if (counter < thr)
                begin
                    counter <= counter + 1;
                    if (counter < 8'hFC)
                    begin
                        state <= pre_thr6;
                        temp_ovf_g <= g - 8'b00000111;
                    end
                    else
                    begin
                        state <= whiteSat;
                    end
                end
                else
                begin
                    state <= whiteSat;
                end
            end

            whiteSat: begin

                // Assign values based on overflow check
                if ({1'b0, r} + {1'b0, buff_white} >= 9'b100000000) 
                    begin 
                        r <= 8'hff;
                    end
                else 
                    begin  
                        r <= r + buff_white;
                    end

                if ({1'b0, g} + {1'b0, buff_white} >= 9'b100000000) 
                    begin 
                        g <= 8'hff;
                    end
                else 
                    begin  
                        g <= g + buff_white;
                    end

                if ({1'b0, b} + {1'b0, buff_white} >= 9'b100000000) 
                    begin 
                        b <= 8'hff;
                    end
                else 
                    begin  
                        b <= b + buff_white;
                    end

                state <= stateApply;
                ld <= 1'b0;
            end

            stateApply: begin

                mult1 <= buff_light_intst;
                mult2 <= buff_white;
                if (mult_ok == 1'b0 && ld == 1'b0) // because i needed to be sure it was 0 
                                                   // and to put the rising edge only when   
                                                   // mult ok was 0, meaning  the multiplicator 
                                                   // was back in initial state. 
                begin
                    ld <= 1'b1;
                end

                if (mult_ok == 1'b1)
                begin

                    state <= stateApply_R;
                    ld <= 1'b0;
                    w_temp <= mult_res;
                end
            end

            stateApply_R: begin
                mult1 <= buff_light_intst;
                mult2 <= r;
                if (mult_ok == 1'b0 && ld == 1'b0)
                begin
                    ld <= 1'b1;
                end

                if (mult_ok == 1'b1)
                begin

                    state <= stateApply_G;
                    ld <= 1'b0;
                    r_temp <= mult_res;
                end
            end

            stateApply_G: begin
                mult1 <= buff_light_intst;
                mult2 <= g;
                if (mult_ok == 1'b0 && ld == 1'b0)
                begin
                    ld <= 1'b1;
                end

                if (mult_ok == 1'b1)
                begin

                    state <= stateApply_B;
                    ld <= 1'b0;
                    g_temp <= mult_res;
                end
            end

            stateApply_B: begin

                mult1 <= buff_light_intst;
                mult2 <= b;
                if (mult_ok == 1'b0 && ld == 1'b0)
                begin
                    ld <= 1'b1;
                end

                if (mult_ok == 1'b1)
                begin

                    state <= applyOut;
                    ld <= 1'b0;
                    b_temp <= mult_res;
                end
            end

            applyOut: begin

                white_out_reg <= w_temp[15:8];  // >> 8;
                red_out_reg <= r_temp[15:8];    // >> 8;
                green_out_reg <= g_temp[15:8];  // >> 8;
                blue_out_reg <= b_temp[15:8];   // >> 8;

                state <= init;
            end

            default: state <= init;

            endcase
        end
    end
    end
endmodule