/*
 * Copyright (c) 2024 Jayjay Wong
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_jayjaywong12 (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

  // All units in words, or 4 bits
  localparam WORD_SIZE_BITS = 4;
  localparam INSTRUCT_SIZE = 1;
  localparam MAX_VECTOR_SIZE = 16;
  localparam NUM_VECTORS = 2;
  localparam OUTPUT_SIZE = 2;

  // Does not reset with rst_n
  reg [WORD_SIZE_BITS - 1:0] mem [INSTRUCT_SIZE + (NUM_VECTORS * MAX_VECTOR_SIZE) + OUTPUT_SIZE];
  
  localparam INSTRUCT_OFFSET = 0;
  localparam VECTOR_OFFSET = INSTRUCT_OFFSET + INSTRUCT_SIZE;
  localparam OUTPUT_OFFSET = VECTOR_OFFSET + NUM_VECTORS * MAX_VECTOR_SIZE;

  localparam [1:0] OPCODE_READ = 2'h0;
  localparam [1:0] OPCODE_WRITE = 2'h1;
  localparam [1:0] OPCODE_RUN = 2'h2;

  localparam [1:0] STATE_RESET = 2'h0;
  localparam [1:0] STATE_RUNNING = 2'h1;
  localparam [1:0] STATE_DONE = 2'h2;
  localparam [1:0] STATE_ACCUMULATING = 2'h3;

  reg [1:0] state;
  wire [1:0] op = ui_in[7:6];
  wire [5:0] addr = ui_in[5:0];

  always @(posedge clk) begin
    if (rst_n) begin
      if (state == STATE_RESET && op == OPCODE_RUN) begin
        state <= STATE_RUNNING;
      end else if (state == STATE_RUNNING) begin
        state <= STATE_ACCUMULATING;
        prev_acc <= uo_out;
      end else if (state == STATE_ACCUMULATING) begin
        state <= STATE_DONE;
      end
    end else begin
      state <= STATE_RESET;
      prev_acc <= 0;
    end
  end

  assign uo_out[7:0] = {mem[OUTPUT_OFFSET + 1], mem[OUTPUT_OFFSET]};

  // State is always output
  assign uio_out[5:4] = state[1:0];
  assign uio_oe[5:4] = 2'b11;

  assign uio_oe[7:6] = 2'b0; // Unused, set input
  assign uio_out[7:6] = 2'b0; // Be a good citizen

  wire read_operation = op == OPCODE_READ;
  // Read operation, use bidir pins as outputs
  assign uio_oe[3:0] = {4{read_operation}};
  assign uio_out[3:0] = mem[addr];
  wire write_operation = op == OPCODE_WRITE;

  reg [2 * WORD_SIZE_BITS - 1:0] products[MAX_VECTOR_SIZE];
  wire  vector_length_mask[MAX_VECTOR_SIZE - 1:0];
  wire [3:0] vector_length = mem[0];
  reg [2*WORD_SIZE_BITS-1:0] prev_acc;

  // This is a TON of combinational logic, hope it fits in a clock cycle...
  genvar i;
  generate
    for (i = 0; i < MAX_VECTOR_SIZE; i = i + 1) begin
      assign vector_length_mask[i] = (vector_length == 0) || vector_length > i;
      always @(posedge clk) begin
        if (rst_n) begin
          if (state == STATE_RUNNING && vector_length_mask[i]) begin
            products[i] <= (mem[VECTOR_OFFSET + i] *
              mem[VECTOR_OFFSET + i + MAX_VECTOR_SIZE]);
          end else begin 
            products[i] <= 0;
          end
        end else begin
          products[i] <= 0;
        end
      end
    end
  endgenerate

  // A truly unneeded amount of combinational logic
  wire [2 * WORD_SIZE_BITS - 1:0] sum1[8];
  wire [2 * WORD_SIZE_BITS - 1:0] sum2[4];
  wire [2 * WORD_SIZE_BITS - 1:0] sum3[2];
  wire [2 * WORD_SIZE_BITS - 1:0] sum4;

  assign sum1[0] = products[0] + products[1] + prev_acc;
  assign sum1[1] = products[2] + products[3];
  assign sum1[2] = products[4] + products[5];
  assign sum1[3] = products[6] + products[7];
  assign sum1[4] = products[8] + products[9];
  assign sum1[5] = products[10] + products[11];
  assign sum1[6] = products[12] + products[13];
  assign sum1[7] = products[14] + products[15];

  assign sum2[0] = sum1[0] + sum1[1];
  assign sum2[1] = sum1[2] + sum1[3];
  assign sum2[2] = sum1[4] + sum1[5];
  assign sum2[3] = sum1[6] + sum1[7];

  assign sum3[0] = sum2[0] + sum2[1];
  assign sum3[1] = sum2[2] + sum2[3];
  
  assign sum4 = sum3[0] + sum3[1];

  always @(posedge clk) begin
    if (rst_n) begin
      if (state == STATE_ACCUMULATING) begin
        mem[OUTPUT_OFFSET] <= sum4[3:0];
        mem[OUTPUT_OFFSET + 1] <= sum4[7:4];
      end else if (write_operation) begin
        mem[addr] <= uio_in[3:0];
      end
    end
  end


endmodule
