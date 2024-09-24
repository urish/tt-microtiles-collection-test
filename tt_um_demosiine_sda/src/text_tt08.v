`default_nettype none

module text_tt08(
    output wire overlay_active,
    input wire [8:0] x, y
    );
    
    localparam [21:0] tt08_line0 = 22'b0000000000000001111100;
    localparam [21:0] tt08_line1 = 22'b0000000000000010000010;
    localparam [21:0] tt08_line2 = 22'b0111000111000100011111;
    localparam [21:0] tt08_line3 = 22'b1000101001100100001000;
    localparam [21:0] tt08_line4 = 22'b0111001010100101111001;
    localparam [21:0] tt08_line5 = 22'b1000101100100100101001;
    localparam [21:0] tt08_line6 = 22'b0111000111000100100001;
    localparam [21:0] tt08_line7 = 22'b0000000000000010100010;
    localparam [21:0] tt08_line8 = 22'b0000000000000000111100;
    
    wire [5:0] tt08_off_x;
    wire [5:0] tt08_off_y;
    
    reg tt08_active;
    
    assign tt08_off_x = x[8:3] - 6'd30;
    assign tt08_off_y = y[8:3] - 6'd25;
        
    always @(*) begin
        case (tt08_off_y)
            6'd0: tt08_active = tt08_line0[tt08_off_x[4:0]];
            6'd1: tt08_active = tt08_line1[tt08_off_x[4:0]];
            6'd2: tt08_active = tt08_line2[tt08_off_x[4:0]];
            6'd3: tt08_active = tt08_line3[tt08_off_x[4:0]];
            6'd4: tt08_active = tt08_line4[tt08_off_x[4:0]];
            6'd5: tt08_active = tt08_line5[tt08_off_x[4:0]];
            6'd6: tt08_active = tt08_line6[tt08_off_x[4:0]];
            6'd7: tt08_active = tt08_line7[tt08_off_x[4:0]];
            6'd8: tt08_active = tt08_line8[tt08_off_x[4:0]];
            default: tt08_active = 0;
        endcase
    end
    
    assign overlay_active = (tt08_off_x < 6'd22) & tt08_active;
    
    wire _unused = &{x[2:0], y[2:0]};
endmodule
