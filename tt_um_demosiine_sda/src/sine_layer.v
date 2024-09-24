`default_nettype none

module sine_layer (
    output reg [5:0] sine_rgb,
    input wire [5:0] x,
    input wire [4:0] y
    );
    
    localparam [15:0] qsine_line00 = 16'b1100000000000000;
    localparam [15:0] qsine_line01 = 16'b0011100000000000;
    localparam [15:0] qsine_line02 = 16'b0000011000000000;
    localparam [15:0] qsine_line03 = 16'b0000000110000000;
    localparam [15:0] qsine_line04 = 16'b0000000001000000;
    localparam [15:0] qsine_line05 = 16'b0000000000100000;
    localparam [15:0] qsine_line06 = 16'b0000000000010000;
    localparam [15:0] qsine_line07 = 16'b0000000000001000;
    localparam [15:0] qsine_line08 = 16'b0000000000000100;
    localparam [15:0] qsine_line09 = 16'b0000000000000010;
    localparam [15:0] qsine_line10 = 16'b0000000000000001;
    
    function [3:0] sub_floor(input [3:0] a, b);
        sub_floor = (a < b) ? 4'd0 : (a - b);
    endfunction
    
    function automatic [3:0] add_ceil(input [3:0] a, b);
    reg [3:0] t;
    begin
        t = a + b;
        add_ceil = (a[3] ? (t[3] ? t : 4'd15) : t);
    end
    endfunction
    
    wire [5:0] qsine_off_x, qsine_flip_x;
    wire [4:0] qsine_off_y, qsine_flip_y;
    
    wire [4:0] qsine_line_index;
    
    function [5:0] qsine_colour(input [15:0] line, input inverted);
    begin
        if (inverted) begin
            if (qsine_off_x[4])
                qsine_colour = 6'b00_00_00;
            else begin
                if (qsine_off_x[3])
                    qsine_colour = 6'b00_00_00;
                else begin
                    if (line[qsine_flip_x[3:0] + 4'd1])
                        qsine_colour = 6'b11_00_00;
                    else if (line[qsine_flip_x[3:0] + 4'd2])
                        qsine_colour = 6'b11_10_00;
                    else if (line[qsine_flip_x[3:0] + 4'd3])
                        qsine_colour = 6'b11_11_00;
                    else if (line[qsine_flip_x[3:0] + 4'd4])
                        qsine_colour = 6'b00_11_00;
                    else if (line[qsine_flip_x[3:0] + 4'd5])
                        qsine_colour = 6'b00_10_11;
                    else if (line[qsine_flip_x[3:0] + 4'd6])
                        qsine_colour = 6'b00_00_11;
                    else if (line[qsine_flip_x[3:0] + 4'd7])
                        qsine_colour = 6'b10_00_11;
                    else
                        qsine_colour = 6'b00_00_00;
                end
            end
        end else begin
            if (qsine_off_x[4]) begin
                if (line[qsine_flip_x[3:0]])
                    qsine_colour = 6'b11_11_11;
                else if (line[add_ceil(qsine_flip_x[3:0], 4'd1)])
                    qsine_colour = 6'b11_00_00;
                else if (line[add_ceil(qsine_flip_x[3:0], 4'd2)])
                    qsine_colour = 6'b11_10_00;
                else if (line[add_ceil(qsine_flip_x[3:0], 4'd3)])
                    qsine_colour = 6'b11_11_00;
                else if (line[add_ceil(qsine_flip_x[3:0], 4'd4)])
                    qsine_colour = 6'b00_11_00;
                else if (line[add_ceil(qsine_flip_x[3:0], 4'd5)])
                    qsine_colour = 6'b00_10_11;
                else if (line[add_ceil(qsine_flip_x[3:0], 4'd6)])
                    qsine_colour = 6'b00_00_11;
                else if (line[add_ceil(qsine_flip_x[3:0], 4'd7)])
                    qsine_colour = 6'b10_00_11;
                else
                    qsine_colour = 6'b00_00_00;
            end else begin
                if (line[qsine_off_x[3:0]])
                    qsine_colour = 6'b11_11_11;
                else if (line[sub_floor(qsine_off_x[3:0], 4'd1)])
                    qsine_colour = 6'b11_00_00;
                else if (line[sub_floor(qsine_off_x[3:0], 4'd2)])
                    qsine_colour = 6'b11_10_00;
                else if (line[sub_floor(qsine_off_x[3:0], 4'd3)])
                    qsine_colour = 6'b11_11_00;
                else if (line[sub_floor(qsine_off_x[3:0], 4'd4)])
                    qsine_colour = 6'b00_11_00;
                else if (line[sub_floor(qsine_off_x[3:0], 4'd5)])
                    qsine_colour = 6'b00_10_11;
                else if (line[sub_floor(qsine_off_x[3:0], 4'd6)])
                    qsine_colour = 6'b00_00_11;
                else if (line[sub_floor(qsine_off_x[3:0], 4'd7)])
                    qsine_colour = 6'b10_00_11;
                else
                    qsine_colour = 6'b00_00_00;
            end
        end
    end
    endfunction
    
    assign qsine_off_x = x;
    assign qsine_off_y = y;
        
    assign qsine_flip_x = 6'd31 - qsine_off_x;
    assign qsine_flip_y = 5'd21 - qsine_off_y;
    
    assign qsine_line_index = qsine_off_x[5] ? qsine_flip_y : qsine_off_y;
    
    always @(*) begin
        case (qsine_line_index)
            5'h00: sine_rgb = qsine_colour(qsine_line00, 1'd0);
            5'h01: sine_rgb = qsine_colour(qsine_line01, 1'd0);
            5'h02: sine_rgb = qsine_colour(qsine_line02, 1'd0);
            5'h03: sine_rgb = qsine_colour(qsine_line03, 1'd0);
            5'h04: sine_rgb = qsine_colour(qsine_line04, 1'd0);
            5'h05: sine_rgb = qsine_colour(qsine_line05, 1'd0);
            5'h06: sine_rgb = qsine_colour(qsine_line06, 1'd0);
            5'h07: sine_rgb = qsine_colour(qsine_line07, 1'd0);
            5'h08: sine_rgb = qsine_colour(qsine_line08, 1'd0);
            5'h09: sine_rgb = qsine_colour(qsine_line09, 1'd0);
            5'h0A: sine_rgb = qsine_colour(qsine_line10, 1'd0);
            
            5'h0B: sine_rgb = qsine_colour(qsine_line10, 1'd1);
            5'h0C: sine_rgb = qsine_colour(qsine_line09, 1'd1);
            5'h0D: sine_rgb = qsine_colour(qsine_line08, 1'd1);
            5'h0E: sine_rgb = qsine_colour(qsine_line07, 1'd1);
            5'h0F: sine_rgb = qsine_colour(qsine_line06, 1'd1);
            5'h10: sine_rgb = qsine_colour(qsine_line05, 1'd1);
            5'h11: sine_rgb = qsine_colour(qsine_line04, 1'd1);
            5'h12: sine_rgb = qsine_colour(qsine_line03, 1'd1);
            default: sine_rgb = 6'b00_00_00;
        endcase
    end
    
    wire _unused = &{qsine_flip_x[5:4]};
endmodule
