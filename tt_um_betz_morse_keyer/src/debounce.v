//`timescale 1ns/10ps

//   debounce.v
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


//    debounce( clk_i, rstn_i, sig_i, sig_o )
//
//    Used for sampling asynchronous, bouncy input signals.
//    Output signal has eliminated bounces and metastability.
//
//    To preserve data, input signals must intentionally toggle no more
//    than once every FiltLen clock cycles.

module debounce #(
  parameter FiltLen = 15000, // Output updates after FiltLen clock cycles with an unchanged input
  parameter LSync   = 3       // Synchronizer length in # flops, minimum 2
) (
  input clk_i,
  input rstn_i,
  input sig_i,
  output reg sig_o
);
  localparam COUNTER_WIDTH = $clog2(FiltLen);
  reg [COUNTER_WIDTH-1:0] cnt;
  reg [LSync-1:0] sig_r;
  
  always @(posedge clk_i or negedge rstn_i) begin
    if (!rstn_i) begin
      sig_o <= 1'b0;
      sig_r <= 'b0;
      cnt <= 0;
    end else begin
      if (cnt < FiltLen-LSync-1) begin
        if (sig_r[LSync-2] == sig_r[LSync-1]) cnt <= cnt + 1;
        else cnt <= 0;
      end else begin
        if (sig_r[LSync-2] == sig_r[LSync-1]) sig_o <= sig_r[LSync-1];
        else cnt <= 0;
      end
      sig_r <= {sig_r[LSync-2:0], sig_i};
    end
  end
endmodule

