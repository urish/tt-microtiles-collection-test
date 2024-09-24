`default_nettype none

module transform(
    input wire clk,
    input wire update,
    input wire [9:0] vga_x,
    input wire [9:0] vga_y,
    input wire [9:0] center_x,
    input wire [9:0] center_y,
    input wire [5:0] dx,
    input wire [5:0] dy,
    input wire flip_x,
    input wire flip_y,
    output wire [9:0] out_x,
    output wire [9:0] out_y
);

reg [9:0] track_x;
reg [9:0] track_y;
reg [15:0] image_x;
reg [15:0] image_y;

wire [9:0] track_x_target = (vga_x < 640 && vga_y < 480) ? vga_x : 10'b0;
wire [9:0] track_y_target = (vga_y < 480) ? vga_y : 10'b0;

wire x_fix = (track_y == track_y_target) && (track_x != track_x_target);
wire y_fix = (track_y != track_y_target);
wire x_back = (track_x_target < track_x) && (track_x >= 32);
wire y_back = (track_y_target < track_y) && (track_y >= 32); 

wire [15:0] ext_dx = flip_x ? -{10'b0, dx} : {10'b0, dx};
wire [15:0] ext_dy = flip_y ? -{10'b0, dy} : {10'b0, dy};

always @(posedge clk) begin
    if(update) begin
        track_x <= center_x;
        track_y <= center_y;
        image_x <= 16'b0;
        image_y <= 16'b0;
    end else begin
        if(y_fix) begin
            if(y_back) begin
                track_y[9:5] <= track_y[9:5] - 1;
                image_x[15:5] <= image_x[15:5] - ext_dy[10:0];
                image_y[15:5] <= image_y[15:5] + ext_dx[10:0];
            end else begin
                track_y <= track_y + 1;
                image_x <= image_x + ext_dy;
                image_y <= image_y - ext_dx;
            end
        end else if(x_fix) begin
            if(x_back) begin
                track_x[9:5] <= track_x[9:5] - 1;
                image_x[15:5] <= image_x[15:5] - ext_dx[10:0];
                image_y[15:5] <= image_y[15:5] - ext_dy[10:0];
            end else begin
                track_x <= track_x + 1;
                image_x <= image_x + ext_dx;
                image_y <= image_y + ext_dy;
            end        
        end    
    end
end

assign out_x = image_x[15:6];
assign out_y = image_y[15:6];

endmodule
