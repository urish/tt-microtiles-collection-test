/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_pyamnihc_dummy_counter (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

  // All output pins must be assigned. If not used, assign to 0.

  assign uio_oe = 8'b1111_1111;
  // sync
  reg [3:0] count_en_p;
  reg count_en_r;
  wire count_en_in;
  assign count_en_in = ui_in[0];
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        count_en_p <= 'b0;
        count_en_r <= 'b0;
    end else begin
        {count_en_r, count_en_p} <= {count_en_p, count_en_in};
    end
  end
  
  // debounce
  reg count_en_db_r;
  reg [3:0] counter_db_r;
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        count_en_db_r <= 'b0;
        counter_db_r <= 'b0;
    end else begin
        if (count_en_db_r != count_en_r) begin
            counter_db_r <= counter_db_r + 1;
        end else begin
            counter_db_r <= 'b0;
        end
        if (counter_db_r == 4'b1111) begin
            count_en_db_r <= count_en_r;
        end else begin
            count_en_db_r <= count_en_db_r;
        end
    end
  end
  
  reg [15:0] counter_r;
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        counter_r <= 'b0;
    end else begin
        if (count_en_db_r) begin
            counter_r <= counter_r + 1'b1;    
        end else begin
            counter_r <= counter_r;
        end
    end
  end

  wire mult_en_in;
  assign mult_en_in = ui_in[1];

  wire [2:0] m_a;
  wire [2:0] m_b;
  assign m_a = ui_in[4:2];
  assign m_b = ui_in[7:5];

  wire [15:0] product;
  assign product = m_a * m_b * (counter_r[9:0] + 1'b1);

  assign uo_out = mult_en_in ? product[7:0] : counter_r[7:0];
  assign uio_out = mult_en_in ? product[15:8] : counter_r[15:8];

  // List all unused inputs to prevent warnings
  wire _unused = &{ena, uio_in};

endmodule
