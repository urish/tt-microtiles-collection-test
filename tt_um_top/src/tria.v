/*
 * Copyright (c) 2024 Konrad Beckmann
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tria(
    input  wire [7:0] val_in, 
    output wire [7:0] val_out);

    assign val_out = val_in > 127 ? 255 - val_in : val_in;

endmodule