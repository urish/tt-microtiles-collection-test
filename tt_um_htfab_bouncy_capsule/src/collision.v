`default_nettype none

module collision(
    input wire clk,
    input wire rst,
    input wire update,
    input wire rotate,
    input wire mirror,
    input wire [2:0] init_vx,
    input wire [2:0] init_vy,
    input wire [2:0] init_w,
    input wire [1:0] phi,
    input wire round_dir,
    output wire [5:0] vxt,
    output wire [5:0] vyt,
    output wire [5:0] wt,
    output wire [1:0] impact
);

reg [2:0] vx;
reg [2:0] vy;
reg [2:0] w;
reg [1:0] imp;

wire [1:0] phi_rot = rotate ? (phi + 2) : phi;
wire vs = rotate ? (mirror ? ~vx[2] : vx[2]) : (mirror ? ~vy[2] : vy[2]);
wire [1:0] vm = rotate ? vx[1:0] : vy[1:0];
wire ws = w[2];
wire [1:0] wm = w[1:0];

wire vsn;
wire [1:0] vmn;
wire wsn;
wire [1:0] wmn;
wire [1:0] impn;

coll_table i_coll_table(
    .in({vs, vm, ws, wm, phi_rot, round_dir}),
    .out({vsn, vmn, wsn, wmn, impn})
);

wire [2:0] vxn = rotate ? {vsn ^ mirror, vmn} : vx;
wire [2:0] vyn = rotate ? vy : {vsn ^ mirror, vmn};
wire [2:0] wn = {wsn, wmn};

always @(posedge clk) begin
    if(rst) begin
        vx <= init_vx;
        vy <= init_vy;
        w <= init_w;
        imp <= 2'b0;
    end else if(update) begin
        vx <= vxn;
        vy <= vyn;
        w <= wn;
        imp <= impn;
    end
end

assign vxt = vx[2] ? {1'b1, ~vx[1], vx[1]|~vx[0], vx[1]&~vx[0], vx[1]|vx[0], vx[1]&vx[0]} : {1'b0, vx[1], ~vx[1], vx[0], vx[1]^vx[0], vx[1]&vx[0]};
assign vyt = vy[2] ? {1'b1, ~vy[1], vy[1]|~vy[0], vy[1]&~vy[0], vy[1]|vy[0], vy[1]&vy[0]} : {1'b0, vy[1], ~vy[1], vy[0], vy[1]^vy[0], vy[1]&vy[0]};
assign wt = w[2] ? {1'b1, ~w[1], w[1]|~w[0], w[1]&~w[0], w[1]|w[0], w[1]&w[0]} : {1'b0, w[1], ~w[1], w[0], w[1]^w[0], w[1]&w[0]};
assign impact = imp;

endmodule
