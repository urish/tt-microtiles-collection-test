module ro_buffer_counter (
    input wire rst_n,
    input wire clk,
    input wire ro_activate_1,
    input wire ro_activate_2,
    input wire [2:0] out_sel,
    output reg [7:0] out
);

   // Wires to connect the outputs of the two ring oscillators
   // Wires for RO1 outputs
wire ro1_out_A;
wire ro1_out_B;
wire ro1_out_C;
wire ro1_out_D;
wire ro1_out_E;
wire ro1_out_F;
wire ro1_out_G;
wire ro1_out_H;

// Wires for RO2 outputs (unique names for each wire)
wire ro2_out_A;
wire ro2_out_B;
wire ro2_out_C;
wire ro2_out_D;
wire ro2_out_E;
wire ro2_out_F;
wire ro2_out_G;
wire ro2_out_H;

// Registers for RO1 outputs
reg ro_1_reg_A;
reg ro_1_reg_B;
reg ro_1_reg_C;
reg ro_1_reg_D;
reg ro_1_reg_E;
reg ro_1_reg_F;
reg ro_1_reg_G;
reg ro_1_reg_H;

// Registers for RO2 outputs
reg ro_2_reg_A;
reg ro_2_reg_B;
reg ro_2_reg_C;
reg ro_2_reg_D;
reg ro_2_reg_E;
reg ro_2_reg_F;
reg ro_2_reg_G;
reg ro_2_reg_H;
 wire       xor_out;
   reg[63:0]    shift_register;

   // Instantiate the first ring oscillator 8 times
ring_osc ro1_A (
   .rst_n(rst_n),
   .clk(clk),
   .ro_activate(ro_activate_1),
   .ro_out(ro1_out_A)
);

ring_osc ro1_B (
   .rst_n(rst_n),
   .clk(clk),
   .ro_activate(ro_activate_1),
   .ro_out(ro1_out_B)
);

ring_osc ro1_C (
   .rst_n(rst_n),
   .clk(clk),
   .ro_activate(ro_activate_1),
   .ro_out(ro1_out_C)
);

ring_osc ro1_D (
   .rst_n(rst_n),
   .clk(clk),
   .ro_activate(ro_activate_1),
   .ro_out(ro1_out_D)
);

ring_osc ro1_E (
   .rst_n(rst_n),
   .clk(clk),
   .ro_activate(ro_activate_1),
   .ro_out(ro1_out_E)
);

ring_osc ro1_F (
   .rst_n(rst_n),
   .clk(clk),
   .ro_activate(ro_activate_1),
   .ro_out(ro1_out_F)
);

ring_osc ro1_G (
   .rst_n(rst_n),
   .clk(clk),
   .ro_activate(ro_activate_1),
   .ro_out(ro1_out_G)
);

ring_osc ro1_H (
   .rst_n(rst_n),
   .clk(clk),
   .ro_activate(ro_activate_1),
   .ro_out(ro1_out_H)
);

// Instantiate the second ring oscillator 8 times
ring_osc ro2_A (
   .rst_n(rst_n),
   .clk(clk),
   .ro_activate(ro_activate_2),
   .ro_out(ro2_out_A)
);

ring_osc ro2_B (
   .rst_n(rst_n),
   .clk(clk),
   .ro_activate(ro_activate_2),
   .ro_out(ro2_out_B)
);

ring_osc ro2_C (
   .rst_n(rst_n),
   .clk(clk),
   .ro_activate(ro_activate_2),
   .ro_out(ro2_out_C)
);

ring_osc ro2_D (
   .rst_n(rst_n),
   .clk(clk),
   .ro_activate(ro_activate_2),
   .ro_out(ro2_out_D)
);

ring_osc ro2_E (
   .rst_n(rst_n),
   .clk(clk),
   .ro_activate(ro_activate_2),
   .ro_out(ro2_out_E)
);

ring_osc ro2_F (
   .rst_n(rst_n),
   .clk(clk),
   .ro_activate(ro_activate_2),
   .ro_out(ro2_out_F)
);

ring_osc ro2_G (
   .rst_n(rst_n),
   .clk(clk),
   .ro_activate(ro_activate_2),
   .ro_out(ro2_out_G)
);

ring_osc ro2_H (
   .rst_n(rst_n),
   .clk(clk),
   .ro_activate(ro_activate_2),
   .ro_out(ro2_out_H)
);
           

   
   // Store the ro1 out result in a register (DFF) on the clock edge
   
always @(posedge clk or posedge rst_n) begin
    if (rst_n) begin
        ro_1_reg_A <= 1'b0;
        ro_1_reg_B <= 1'b0;
        ro_1_reg_C <= 1'b0;
        ro_1_reg_D <= 1'b0;
        ro_1_reg_E <= 1'b0;
        ro_1_reg_F <= 1'b0;
        ro_1_reg_G <= 1'b0;
        ro_1_reg_H <= 1'b0;
    end else begin
        ro_1_reg_A <= ro1_out_A;
        ro_1_reg_B <= ro1_out_B;
        ro_1_reg_C <= ro1_out_C;
        ro_1_reg_D <= ro1_out_D;
        ro_1_reg_E <= ro1_out_E;
        ro_1_reg_F <= ro1_out_F;
        ro_1_reg_G <= ro1_out_G;
        ro_1_reg_H <= ro1_out_H;
    end
end


   // Store the ro2 out result in a register (DFF) on the clock edge
   always @(posedge clk or posedge rst_n) begin
    if (rst_n) begin
        ro_2_reg_A <= 1'b0;
        ro_2_reg_B <= 1'b0;
        ro_2_reg_C <= 1'b0;
        ro_2_reg_D <= 1'b0;
        ro_2_reg_E <= 1'b0;
        ro_2_reg_F <= 1'b0;
        ro_2_reg_G <= 1'b0;
        ro_2_reg_H <= 1'b0;
    end else begin
        ro_2_reg_A <= ro2_out_A;
        ro_2_reg_B <= ro2_out_B;
        ro_2_reg_C <= ro2_out_C;
        ro_2_reg_D <= ro2_out_D;
        ro_2_reg_E <= ro2_out_E;
        ro_2_reg_F <= ro2_out_F;
        ro_2_reg_G <= ro2_out_G;
        ro_2_reg_H <= ro2_out_H;
    end
end


   // Perform bitwise XOR across all the registers from RO1 and RO2
assign xor_out = ro_1_reg_A ^ ro_2_reg_A ^ 
                 ro_1_reg_B ^ ro_2_reg_B ^ 
                 ro_1_reg_C ^ ro_2_reg_C ^ 
                 ro_1_reg_D ^ ro_2_reg_D ^ 
                 ro_1_reg_E ^ ro_2_reg_E ^ 
                 ro_1_reg_F ^ ro_2_reg_F ^ 
                 ro_1_reg_G ^ ro_2_reg_G ^ 
                 ro_1_reg_H ^ ro_2_reg_H;

   // Shift in the XOR result on the clock edge
   always @(posedge clk or posedge rst_n) begin
      if (rst_n)
         shift_register <= 64'b0;
      else
      if (ro_activate_1 | ro_activate_2)
         shift_register <= {shift_register[62:0], xor_out};
      else
         shift_register <= shift_register;
   end

   // Store the XOR result in the register on the clock edge
   always @(posedge clk or posedge rst_n) begin
      if (rst_n)
          out <= 8'h00;
      else begin
          if (out_sel == 3'b111)
              out <= shift_register[63:56];
          else if (out_sel == 3'b110)
              out <= shift_register[55:48];
          else if (out_sel == 3'b101)
              out <= shift_register[47:40];
          else if (out_sel == 3'b100)
              out <= shift_register[39:32];
          else if (out_sel == 3'b011)
              out <= shift_register[31:24];
          else if (out_sel == 3'b010)
              out <= shift_register[23:16];
          else if (out_sel == 3'b001)
              out <= shift_register[15:8];
          else if (out_sel == 3'b000)
              out <= shift_register[7:0];
          else
              out <= 8'h00;
      end
   end

endmodule
