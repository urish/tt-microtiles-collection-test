`default_nettype none

module lod #(parameter N=16) (
  input wire [N-1:0] in,
  output wire [N-1:0] out
);
  
  wire [N-1:0] prev_zeros;
  
  assign out[N-1] = in[N-1];
  assign prev_zeros[N-1] = ~in[N-1];
  
  genvar i;
  generate 
    for(i = 1; i < N; i = i + 1) begin : lod_bits
      assign out[N-i-1] = prev_zeros[N-i] && in[N-i-1]; 
      assign prev_zeros[N-i-1] = prev_zeros[N-i] && ~in[N-i-1];
  	end
  endgenerate
endmodule