`default_nettype none

module kinematics(
    input wire clk,
    input wire rst,
    input wire update,
    input wire [9:0] init_x,
    input wire [9:0] init_y,
    input wire [6:0] init_phi,
    input wire [5:0] vx,
    input wire [5:0] vy,
    input wire [5:0] w,
    output wire [2:0] phi_hi,
    output reg [9:0] center_x,
    output reg [9:0] center_y,
    output wire [5:0] dx,
    output wire [5:0] dy
);

reg [1:0] center_x_lo;
reg [1:0] center_y_lo;
reg [10:0] phi;

assign phi_hi = phi[10:8];

wire [5:0] sin;
wire [5:0] cos;
sine_table i_sine_table(
    .in(phi[7:3]^{(5){phi[8]}}),
    .out({sin, cos})
);

assign {dx, dy} = (phi[9] ^ phi[8]) ? {sin, cos} : {cos, sin};

always @(posedge clk) begin
    if(rst) begin
        center_x <= init_x;
        center_x_lo <= 2'b0;
        center_y <= init_y;
        center_y_lo <= 2'b0;
        phi <= {init_phi, 4'b0};
    end else if(update) begin
        {center_x, center_x_lo} <= {center_x, center_x_lo} + {{(6){vx[5]}}, vx};
        {center_y, center_y_lo} <= {center_y, center_y_lo} + {{(6){vy[5]}}, vy};
        phi <= phi + {{(5){w[5]}}, w};
    end
end

endmodule
