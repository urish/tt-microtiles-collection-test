`default_nettype none

module text_demosiine(
    output wire overlay_active,
    input wire [9:0] x, 
    input wire [8:0] y
    );
    
    localparam [45:0] demosiine_line0 = 46'b0000000000000000001110000000000000000000001111;
    localparam [45:0] demosiine_line1 = 46'b0000000000000000000001000000000000000000010001;
    localparam [45:0] demosiine_line2 = 46'b0000000000000000000000100000000000000000100001;
    localparam [45:0] demosiine_line3 = 46'b0000000000000000000000100000000000000000100001;
    localparam [45:0] demosiine_line4 = 46'b1111010010111011100111000110010001011110100001;
    localparam [45:0] demosiine_line5 = 46'b0001010110010001001000001001011011000010100001;
    localparam [45:0] demosiine_line6 = 46'b0111011010010001001000001001010101001110100001;
    localparam [45:0] demosiine_line7 = 46'b0001010010010001000100001001010001000010010001;
    localparam [45:0] demosiine_line8 = 46'b1111010010111011100011100110010001011110001111;
    
    wire [6:0] demosiine_off_x;
    wire [5:0] demosiine_off_y;
    
    reg demosiine_active;
    
    assign demosiine_off_x = x[9:3] - 7'd18;
    assign demosiine_off_y = y[8:3] - 6'd12;
        
    always @(*) begin
        case (demosiine_off_y)
            6'd0: demosiine_active = demosiine_line0[demosiine_off_x[5:0]];
            6'd1: demosiine_active = demosiine_line1[demosiine_off_x[5:0]];
            6'd2: demosiine_active = demosiine_line2[demosiine_off_x[5:0]];
            6'd3: demosiine_active = demosiine_line3[demosiine_off_x[5:0]];
            6'd4: demosiine_active = demosiine_line4[demosiine_off_x[5:0]];
            6'd5: demosiine_active = demosiine_line5[demosiine_off_x[5:0]];
            6'd6: demosiine_active = demosiine_line6[demosiine_off_x[5:0]];
            6'd7: demosiine_active = demosiine_line7[demosiine_off_x[5:0]];
            6'd8: demosiine_active = demosiine_line8[demosiine_off_x[5:0]];
            default: demosiine_active = 0;
        endcase
    end
    
    assign overlay_active = (demosiine_off_x < 7'd46) & demosiine_active;
    
    wire _unused = &{x[2:0], y[2:0]};
endmodule
