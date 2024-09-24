/*
 * Copyright (c) 2024 Uri Shaked
 * SPDX-License-Identifier: Apache-2.0
 */

module draw_numbers (
    input wire [3:0] index,
    input wire [5:0] x,
    input wire [5:0] y,
    output reg pixel
);

  wire pixel_2;
  glyph_2 inst_glyph_2 (
      .x(x),
      .y(y),
      .pixel(pixel_2)
  );

  wire pixel_4;
  glyph_4 inst_glyph_4 (
      .x(x),
      .y(y),
      .pixel(pixel_4)
  );

  wire pixel_8;
  glyph_8 inst_glyph_8 (
      .x(x),
      .y(y),
      .pixel(pixel_8)
  );

  wire pixel_16;
  glyph_16 inst_glyph_16 (
      .x(x),
      .y(y),
      .pixel(pixel_16)
  );

  wire pixel_32;
  glyph_32 inst_glyph_32 (
      .x(x),
      .y(y),
      .pixel(pixel_32)
  );

  wire pixel_64;
  glyph_64 inst_glyph_64 (
      .x(x),
      .y(y),
      .pixel(pixel_64)
  );

  wire pixel_128;
  glyph_128 inst_glyph_128 (
      .x(x),
      .y(y),
      .pixel(pixel_128)
  );

  wire pixel_256;
  glyph_256 inst_glyph_256 (
      .x(x),
      .y(y),
      .pixel(pixel_256)
  );

  wire pixel_512;
  glyph_512 inst_glyph_512 (
      .x(x),
      .y(y),
      .pixel(pixel_512)
  );

  wire pixel_1024;
  glyph_1024 inst_glyph_1024 (
      .x(x),
      .y(y),
      .pixel(pixel_1024)
  );

  wire pixel_2048;
  glyph_2048 inst_glyph_2048 (
      .x(x),
      .y(y),
      .pixel(pixel_2048)
  );

  always @(*) begin
    case (index)
      1: pixel = pixel_2;
      2: pixel = pixel_4;
      3: pixel = pixel_8;
      4: pixel = pixel_16;
      5: pixel = pixel_32;
      6: pixel = pixel_64;
      7: pixel = pixel_128;
      8: pixel = pixel_256;
      9: pixel = pixel_512;
      10: pixel = pixel_1024;
      11: pixel = pixel_2048;
      default: pixel = 1'b0;
    endcase
  end

endmodule
