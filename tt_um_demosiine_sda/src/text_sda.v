`default_nettype none

module text_sda(
    output wire overlay_active,
    input wire [9:0] x, 
    input wire [8:0] y
    );
    
    localparam [59:0] sda_line0 = 60'b000000000001000000100000000000110000000000000000001100011100;
    localparam [59:0] sda_line1 = 60'b000000000001000001010000000001010000000000000000000010100010;
    localparam [59:0] sda_line2 = 60'b000000000001000001010000000001010000000000000000000010101001;
    localparam [59:0] sda_line3 = 60'b101001100111011001110101011001010101001100110011000100110101;
    localparam [59:0] sda_line4 = 60'b011001010101000101010101010101010011001010101010101000001001;
    localparam [59:0] sda_line5 = 60'b001001010101000101010101000101010001001010101010101000100010;
    localparam [59:0] sda_line6 = 60'b001011100101011001010010011000110001011100110111000110011100;
    localparam [59:0] sda_line7 = 60'b000000000000000000000000000000000000000000100000000000000000;
    localparam [59:0] sda_line8 = 60'b000000000000000000000000000000000000000000101000000000000000;
    localparam [59:0] sda_line9 = 60'b000000000000000000000000000000000000000000010000000000000000;
    
    wire [6:0] sda_off_x;
    wire [5:0] sda_off_y;
    
    reg sda_active;
    
    assign sda_off_x = x[9:3] - 7'd11;
    assign sda_off_y = y[8:3] - 6'd38;
    
    always @(*) begin
        case (sda_off_y)
            6'd0: sda_active = sda_line0[sda_off_x[5:0]];
            6'd1: sda_active = sda_line1[sda_off_x[5:0]];
            6'd2: sda_active = sda_line2[sda_off_x[5:0]];
            6'd3: sda_active = sda_line3[sda_off_x[5:0]];
            6'd4: sda_active = sda_line4[sda_off_x[5:0]];
            6'd5: sda_active = sda_line5[sda_off_x[5:0]];
            6'd6: sda_active = sda_line6[sda_off_x[5:0]];
            6'd7: sda_active = sda_line7[sda_off_x[5:0]];
            6'd8: sda_active = sda_line8[sda_off_x[5:0]];
            6'd9: sda_active = sda_line9[sda_off_x[5:0]];
            default: sda_active = 0;
        endcase
    end
    
    assign overlay_active = (sda_off_x < 7'd60) & sda_active;
    
    wire _unused = &{x[2:0], y[2:0]};
endmodule
