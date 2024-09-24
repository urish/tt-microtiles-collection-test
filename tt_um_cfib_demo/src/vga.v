module vga(input wire clock,   input wire reset,  input wire ena, 
           input wire [3:0] sample,
           input wire s1, input wire s2, input wire s3, input wire s4,
           output reg hsync,   output reg vsync, 
           output wire hline,
           output reg [1:0] r, output reg [1:0] g, output reg [1:0] b);
           

    reg [9:0] x;
    reg [9:0] y;
    
    always @(posedge clock or posedge reset) begin
        if (reset) begin
            x <= 10'b0;
            y <= 10'b0;
        end else if (ena) begin
            x <= x + 10'b1;
            if (x == 10'd799) begin
                x <= 10'b0;
                y <= y + 10'b1;
                if (y == 10'd524) begin
                    y <= 10'b0;
                end
            end
        end
    end 
    
    localparam HVIS=10'd640;
    localparam VVIS=10'd480;
    localparam HFP=10'd16;
    localparam HSYNC=10'd96;
    localparam VFP=10'd10;
    localparam VSYNC=10'd2;
    
    localparam SPACE=10'd26;
    localparam CHANNEL=10'd128;
    
    localparam O=4'd3;
    
    reg  [3:0] sx1, sr1;
    reg  [7:0] x1;
    wire [5:0] bg  = {y[O+2+:2],2'b0,y[O+:2]};
    wire [5:0] nbg = 6'h0;
    reg  [3:0] xmin;
    reg  [3:0] xmax;
    
    localparam START1 = 320-128;
    localparam START2 = 320-128+16;
    localparam END1   = 320+128;
    localparam END2   = 320+128+16;

    assign hline = (x == HVIS & y[0]) & ena;
    
    always @(posedge clock or posedge reset) begin
        if (reset) begin
            x1    <= 8'b0;
            sr1   <= 4'b0;
            sx1   <= 4'b0;
            xmin  <= 4'b0;
            xmax  <= 4'b0;
        end else if (ena) begin

            if (hline) begin
                {sr1, sx1} <= {sx1, sample};
            end

            if (x < START2) begin
                x1           <= 8'b0;
                {xmin, xmax} <= (sx1 < sr1) ? {sx1, sr1} : {sr1, sx1};
            end else begin
                x1           <= x1 + 1'b1;
            end
                
        end
    end
    
    
    localparam DSTART  = 9'd16;
    localparam DDIFF   = 9'd16;
    localparam STARTY  = DSTART;
    localparam STARTY2 = STARTY+DDIFF;
    localparam ENDY    = 9'd480-DSTART;
    localparam ENDY2   = ENDY+DDIFF;
    
    always @(*) begin
        hsync = !(x >= HVIS+HFP && x < HVIS+HFP+HSYNC);
        vsync = !(y >= VVIS+VFP && y < VVIS+VFP+VSYNC);
        {r, g, b} = 6'b0;
        if (x < HVIS && y < VVIS) begin
            {r, g, b} = bg;
        end
        
        if (y >= STARTY && y <= ENDY && x >= START1 && x <= END1) begin
        
            {r, g, b} = (x1[7:4] >= xmin  && x1 <= {xmax,4'b0011})   ? 6'b001100 :
                        (x[3:0] == 4'b0000 || y[3:0] == 4'b0000)     ? 6'b001000 : 6'b000100;
                        
            if (y > STARTY && y < STARTY+16) begin
                if (x >  START1    && x < START1+16) begin
                    g[1] = s1;
                end
                if (x >  START1+16  && x < START1+32) begin
                    g[1] = s2;
                end
                if (x >  START1+32 && x < START1+48) begin
                    g[1] = s3;
                end
                if (x >  START1+48 && x < START1+64) begin
                    g[1] = s4;
                end
            end
                        
        end else if (y >= STARTY2 && y < ENDY2 && x >= START2 && x < END2) begin
            {r, g, b} = {1'b0,bg[5],1'b0,bg[3],1'b0,bg[1]};
        end
    end


endmodule
