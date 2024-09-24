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

module tt_um_thexeno_rgbw_controller (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // will go high when the design is enabled
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

    wire reset;
    wire mosi;
    wire cs;
    wire red_pin;
    wire green_pin;
    wire blue_pin;
    wire white_pin;

    /* for test/debug: exporting the internal signals of the CwPU (color wheel processor unit) */
    reg [7:0] uo_out_reg;
    // test/debug enable, active high
    wire test_pin;


    // Internal signals

    reg test_pin_sync;
    reg [7:0] cnt_test_reg;

    wire rdy;
    wire sck;
    wire [7:0] r_duty_w;
    wire [7:0] g_duty_w;
    wire [7:0] b_duty_w;
    wire [7:0] w_duty_w;
    wire [7:0] mode_spi_w;
    wire [7:0] white_spi_w;
    wire [7:0] rx_byte_spi;
    wire [7:0] lint_spi_w;
    wire [7:0] red_spi_w;
    wire [7:0] green_spi_w;
    wire [7:0] blue_spi_w;
    wire [7:0] colorIdx_spi_w;
    wire [7:0] a;
    wire [7:0] b;
    wire [15:0] result;
    wire load;
    wire m_rdy;
    //wire clk_div_en;
    wire clk_enable;
    wire controlled_reset;


    // List all unused inputs to prevent warnings
    wire _unused = &{ena, ui_in[7], ui_in[2:0], uio_in[7:0], 1'b0};

    // assign all the IO to the relative wires/regs
    // uo, uio
    assign uio_out = uo_out_reg;
    assign uio_oe = 8'hff;
    assign uo_out[7:4] = 0;
    assign uo_out[0] = red_pin;
    assign uo_out[1] = green_pin;
    assign uo_out[2] = blue_pin ;
    assign uo_out[3] = white_pin;
    // ui
    assign reset = rst_n;
    assign sck = ui_in[5]; // pico sck spi0 gpio18
    assign mosi = ui_in[6]; // pico mosi spi0 gpio19
    assign cs = ui_in[4]; // pico cs spi0 gpio17
    assign test_pin = ui_in[3];
    //assign clk_div_en = ui_in[7];


    // Components instantiation
    
    clock_prescaler_module clock_halver (
        .clk(clk),
        .clk_presc_pulse(clk_enable),
        .reset(rst_n),
        .reset_out(controlled_reset)
    );



    mult8x8_module mult (
        .clk(clk),
        .reset(controlled_reset),
        .ld(load),
        .mult_rdy(m_rdy),
        .a(a),
        .b(b),
        .result(result)        
    );

    pwm_gen_module pwm (
        .clk(clk),
        .clk_en(clk_enable),
        .reset(controlled_reset),
        .duty0(r_duty_w),
        .duty1(g_duty_w),
        .duty2(b_duty_w),
        .duty3(w_duty_w),
        .d0(red_pin),
        .d1(green_pin),
        .d2(blue_pin),
        .d3(white_pin)
    );

    color_wheel_processor color (
        .clk(clk),
        .clk_en(clk_enable),
        .reset(controlled_reset),
        .mult1(a),
        .mult2(b),
        .mult_res(result),
        .mult_ok(m_rdy),
        .ld(load),
        .mode(mode_spi_w),
        .lint(lint_spi_w),
        .color_idx(colorIdx_spi_w),
        .white_in(white_spi_w),
        .red_in(red_spi_w),
        .green_in(green_spi_w),
        .blue_in(blue_spi_w),
        .red_out_reg(r_duty_w),
        .green_out_reg(g_duty_w),
        .blue_out_reg(b_duty_w),
        .white_out_reg(w_duty_w)
    );

    

    data_dispatcher_module deserializer (
        .buff_rx_spi(rx_byte_spi),
        .clk_en(clk_enable),
        .reset(controlled_reset),
        .rdy(rdy),
        .clk(clk),
        .lint_spi_out(lint_spi_w),
        .red_spi_out(red_spi_w),
        .green_spi_out(green_spi_w),
        .blue_spi_out(blue_spi_w),
        .colorIdx_spi_out(colorIdx_spi_w),
        .white_spi_out(white_spi_w),
        .mode_spi_out(mode_spi_w)
    ) ;

    spi_slave_module spi_rx (
        .sck(sck),
        .cs(cs), 
        .clk(clk),
        .clk_en(clk_enable),
        .mosi(mosi),
        .reset(controlled_reset),
        .rdy(rdy),
        .data(rx_byte_spi)
    ) ;

/* this will output a sequence of the CwP signals that can be debugged */
always @(posedge clk) 
begin
    if (reset == 1'b0)
    begin
        cnt_test_reg <= 0;
        test_pin_sync <= 0;
    end
    else begin
    test_pin_sync <= test_pin;
    if (test_pin_sync == 1'b1)
        begin
        cnt_test_reg <= cnt_test_reg + 1;
        case(cnt_test_reg)
            8'd0: uo_out_reg <= lint_spi_w;
            8'd1: uo_out_reg <= red_spi_w;
            8'd2: uo_out_reg <= green_spi_w;
            8'd3: uo_out_reg <= blue_spi_w;
            8'd4: uo_out_reg <= colorIdx_spi_w;
            8'd5: uo_out_reg <= mode_spi_w;
            8'd6: uo_out_reg <= white_spi_w;
            8'd7: uo_out_reg <= r_duty_w;
            8'd8: uo_out_reg <= g_duty_w;
            8'd9: uo_out_reg <= b_duty_w;
            8'd10: uo_out_reg <= w_duty_w;
            default: uo_out_reg <= cnt_test_reg;
        endcase
        end
    end
end


endmodule