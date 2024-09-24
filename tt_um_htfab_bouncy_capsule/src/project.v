`default_nettype none

module tt_um_htfab_bouncy_capsule (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

wire rst = !rst_n;

wire pause_kinematics = ui_in[0];
wire reset_kinematics = ui_in[1];
wire mute_sound = ui_in[2];
wire kill_sound = ui_in[3];
wire hide_background = ui_in[4];
wire hide_text = ui_in[5];
wire lock_colors = ui_in[6];
wire no_reorient = ui_in[7];

wire [9:0] vga_x;
wire [9:0] vga_y;
wire hsync;
wire vsync;
wire blank;

vga_beam i_vga_beam(
    .clk(clk),
    .rst(rst),
    .x(vga_x),
    .y(vga_y),
    .hsync(hsync),
    .vsync(vsync),
    .blank(blank)
);

wire capsule_hit;
wire [1:0] collision_impact;
wire update_collision;
wire rotate_collision;
wire mirror_collision;
wire update_kinematics;
wire update_transform;
wire update_resonator;
wire handle_impact;
wire [1:0] trigger_resonator;
wire [3:0] tension;
wire round_dir;
wire [1:0] color_entropy;

orchestrator i_orchestrator(
    .clk(clk),
    .rst(rst),
    .vga_x(vga_x),
    .vga_y(vga_y),
    .capsule_hit(capsule_hit),
    .collision_impact(collision_impact),
    .pause_kinematics(pause_kinematics),
    .mute_sound(mute_sound),
    .update_collision(update_collision),
    .rotate_collision(rotate_collision),
    .mirror_collision(mirror_collision),
    .update_kinematics(update_kinematics),
    .update_transform(update_transform),
    .update_resonator(update_resonator),
    .handle_impact(handle_impact),
    .trigger_resonator(trigger_resonator),
    .tension(tension),
    .round_dir(round_dir),
    .color_entropy(color_entropy)
);

wire [2:0] phi;
wire [5:0] vx;
wire [5:0] vy;
wire [5:0] w;

collision i_collision(
    .clk(clk),
    .rst(rst),
    .update(update_collision),
    .rotate(rotate_collision),
    .mirror(mirror_collision),
    .init_vx(3'b010),
    .init_vy(3'b001),
    .init_w(3'b000),
    .phi(phi[1:0]),
    .round_dir(round_dir),
    .vxt(vx),
    .vyt(vy),
    .wt(w),
    .impact(collision_impact)
);

wire [9:0] center_x;
wire [9:0] center_y;
wire [5:0] dx;
wire [5:0] dy;

kinematics i_kinematics(
    .clk(clk),
    .rst(rst || reset_kinematics),
    .update(update_kinematics),
    .init_x(10'd320),
    .init_y(10'd240),
    .init_phi(7'd16),
    .vx(vx),
    .vy(vy),
    .w(w),
    .phi_hi(phi),
    .center_x(center_x),
    .center_y(center_y),
    .dx(dx),
    .dy(dy)
);

wire [9:0] tf_x;
wire [9:0] tf_y;
reg orient;

transform i_transform(
    .clk(clk),
    .update(rst || update_transform),
    .vga_x(vga_x),
    .vga_y(vga_y),
    .center_x(center_x),
    .center_y(center_y),
    .dx(dx),
    .dy(dy),
    .flip_x(phi[2] ^ phi[1] ^ orient),
    .flip_y(phi[2] ^ orient),
    .out_x(tf_x),
    .out_y(tf_y)
);

always @(posedge clk) begin
    if(rst) begin
        orient <= 0;
    end else begin
        if(handle_impact && !no_reorient) begin
            orient <= phi[2]^phi[1];
        end
    end
end

capsule i_capsule(
    .tf_x(tf_x),
    .tf_y(tf_y),
    .hit(capsule_hit)
);

wire bitmap_pixel;

bitmap i_bitmap(
    .in({tf_y[6:1], tf_x[7:1]}),
    .out(bitmap_pixel)
);

wire [5:0] capsule_color;
wire [5:0] text_color;

colors i_colors(
    .clk(clk),
    .rst(rst),
    .update(handle_impact && !lock_colors),
    .entropy(color_entropy),
    .capsule_color(capsule_color),
    .text_color(text_color)
);

wire [5:0] bg_color = hide_background ? 6'b0 : {1'b0, vga_x[5]^vga_y[5], 1'b0, vga_x[4]^vga_y[4], 1'b0, vga_x[3]^vga_y[3]};
wire text_hit = hide_text ? 1'b0 : bitmap_pixel;

wire [1:0] R;
wire [1:0] G;
wire [1:0] B;
assign {R, G, B} = blank ? 6'b0 : (capsule_hit ? (text_hit ? text_color : capsule_color) : bg_color);

wire [11:0] sample;
wire pdm;

resonator i_resonator (
    .clk(clk),
    .rst(rst || kill_sound),
    .trigger(trigger_resonator),
    .update(update_resonator),
    .tension(tension),
    .sample(sample)
);

delta_sigma i_delta_sigma (
    .clk(clk),
    .rst(rst),
    .sample(sample),
    .pdm(pdm)
);

wire pdm_out = pdm && !kill_sound;

reg [1:0] R_reg;
reg [1:0] G_reg;
reg [1:0] B_reg;

always @(posedge clk) begin
    R_reg <= R;
    G_reg <= G;
    B_reg <= B;
end

assign uo_out = {hsync, B_reg[0], G_reg[0], R_reg[0], vsync, B_reg[1], G_reg[1], R_reg[1]};
assign uio_out = {(8){pdm_out}};
assign uio_oe = 8'b11111111;

wire _unused = &{ena, uio_in};

endmodule
