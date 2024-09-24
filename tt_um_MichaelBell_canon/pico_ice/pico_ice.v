/*
 * Copyright (c) 2024 Michael Bell
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module pwm_audio_top (
        input clk,
        input rst_n,

        input [7:0] ui_in,
        input [7:0] uio_in,
        output [7:0] uo_out

);
    localparam CLOCK_FREQ = 40_000_000;

    wire [7:0] sample;

`ifdef TONE
    pwm_audio i_pwm(
        .clk(clk),
        .rst_n(rst_n),

        .sample(sample),

        .pwm(uo_out[7])
    );

    pwm_sample i_sample(
        .clk(clk),
        .rst_n(rst_n),

        .divider({ui_in, uio_in[3:0]}),

        .sample(sample)
    );
`else
    pwm_music i_music(
        .clk(clk),
        .rst_n(rst_n),

        .pwm(uo_out[7])
    );
`endif

  // All output pins must be assigned. If not used, assign to 0.
  assign uo_out[6:0] = 0;

  // List all unused inputs to prevent warnings
  wire _unused = &{uio_in[7:4], 1'b0};

endmodule
