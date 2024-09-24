module ascon_sbox(input wire  rst_n,
          input wire  clk,
          input wire  activate_sbox,
          input wire [4:0]  sbox_in,
          output wire [4:0]  sbox_out);

   reg  en;
   
   assign sbox_out = en ? ps(sbox_in) : 5'b00000;
   
   always @(posedge clk or posedge rst_n) begin
    if (rst_n)
        en <= 1'b0;
    else if (activate_sbox)
        en <= 1'b1;
    else
        en <= 1'b0;
    end

   function [4 : 0] ps(input [4 : 0] x);
    begin : ps_inst
      reg x0, x0_1, x0_2, x0_3, x0_4;
      reg x1, x1_1, x1_2, x1_3;
      reg x2, x2_1, x2_2, x2_3, x2_4;
      reg x3, x3_1, x3_2, x3_3;
      reg x4, x4_1, x4_2, x4_3;

      x0 = x[4];
      x1 = x[3];
      x2 = x[2];
      x3 = x[1];
      x4 = x[0];

      x0_1 = x0 ^ x4;
      x2_1 = x2 ^ x1;
      x4_1 = x4 ^ x3;

      x0_2 = ~x0_1 & x1;
      x1_1 = ~x1 & x2_1;
      x2_2 = ~x2_1 & x3;
      x3_1 = ~x3 & x4_1;
      x4_2 = ~x4_1 & x0_1;

      x0_3 = x0_1 ^ x1_1;
      x1_2 = x1 ^ x2_2;
      x2_3 = x2_1 ^ x3_1;
      x3_2 = x3 ^ x4_2;
      x4_3 = x4_1 ^ x0_2;

      x0_4 = x0_3 ^ x4_3;
      x1_3 = x1_2 ^ x0_3;
      x2_4 = ~x2_3;
      x3_3 = x3_2 ^ x2_3;

      ps = {x0_4, x1_3, x2_4, x3_3, x4_3};
    end
  endfunction // ps
   
endmodule
