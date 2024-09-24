`default_nettype none

module graphics_engine(
    output wire [1:0] r, g, b,
    input wire [9:0] x, 
    input wire [8:0] y,
    input wire frame_active, v_sync, 
    input wire clk, rst_n,

    input wire [6:0] video_modes
    );

    localparam [17:0] cyclic_rgb_channel = 18'b01_10_11_11_11_11_11_11_10;

    wire mode_toggle_animation = video_modes[6];
    wire mode_toggle_bg_style = video_modes[5];
    wire mode_toggle_text_style = video_modes[4];
    wire mode_toggle_overlay = video_modes[3];
    wire mode_toggle_big_sine = video_modes[2];
    wire mode_toggle_little_sine = video_modes[1];
    wire mode_negative = video_modes[0];
    
    wire [5:0] sine_off_y, sine_bg_off_y;

    wire [3:0] xy_avg;
    wire [3:0] cycle_red_colour, cycle_green_colour, cycle_blue_colour;
    
    wire [5:0] overlay_rgb, sine_rgb, sine_bg_rgb, sine_rgb_dither, sine_bg_rgb_dither, bg_rgb;
    wire overlay_active, overlay_text_active, sine_active, sine_bg_active;
    
    reg [9:0] ctr;
    wire [9:0] anim_x, anim_2x;

    assign xy_avg = anim_x[5:2] + y[4:1];
    assign cycle_green_colour = xy_avg[3:0];
    assign cycle_red_colour = cycle_green_colour - 4'd6;
    assign cycle_blue_colour = cycle_green_colour + 4'd6;

    reg [5:0] cycle_rgb;
    always @(*) begin
        cycle_rgb[5:4] = (cycle_red_colour < 4'd9) ? cyclic_rgb_channel[{cycle_red_colour, 1'b0}+:2] : 2'b00;
        cycle_rgb[3:2] = (cycle_green_colour < 4'd9) ? cyclic_rgb_channel[{cycle_green_colour, 1'b0}+:2] : 2'b00;
        cycle_rgb[1:0] = (cycle_blue_colour < 4'd9) ? cyclic_rgb_channel[{cycle_blue_colour, 1'b0}+:2] : 2'b00;
    end

    assign bg_rgb = cycle_rgb & {6{(x[0] & y[0])}};
    
    reg en_v_sync;
    always @(posedge clk, negedge rst_n) begin
        if (~rst_n)begin
            ctr <= 10'd0;
            en_v_sync <= 1'b1;
        end else begin
            if (~mode_toggle_animation) begin
              if (en_v_sync) begin
                  if (v_sync) begin
                      en_v_sync <= 1'b0;
                      ctr <= ctr + 1'd1;
                  end
              end else begin
                  if (~v_sync)
                      en_v_sync <= 1'b1;
              end
            end
        end  
    end

    assign anim_x = x + ctr;
    assign anim_2x = x + {ctr[8:0], 1'd0};
    
    overlay_creator overlay_creator1 (
        .overlay_active(overlay_active), .text_active(overlay_text_active),
        .x(x), .y(y)
    );
    
    assign sine_off_y = y[8:4] - 5'd3;
    assign sine_bg_off_y = y[8:3] - 5'd2;
    
    sine_layer sine_layer1 (
        .sine_rgb(sine_rgb), 
        .x(anim_x[8:3]), 
        .y(sine_off_y[4:0])
    );
    
    sine_layer sine_layer2 (
        .sine_rgb(sine_bg_rgb), 
        .x(anim_2x[7:2]), 
        .y(sine_bg_off_y[4:0])
    );

    assign overlay_rgb = overlay_active ? (
        mode_toggle_text_style ? cycle_rgb & {3{overlay_text_active, 1'b1}} : 
            {overlay_text_active, ctr[7], overlay_text_active, ctr[6], overlay_text_active, ctr[5]}
    ) : 6'b00_00_00;
    
    assign sine_rgb_dither = sine_rgb & {6{(x[0] | y[0])}};
    assign sine_bg_rgb_dither = sine_bg_rgb & {6{(x[0] & y[0])}};
    
    assign sine_active = |sine_rgb_dither & ~mode_toggle_big_sine;
    assign sine_bg_active = |sine_bg_rgb_dither & ~mode_toggle_little_sine;
    
    assign {r, g, b} = frame_active ? (
        (overlay_active & ~mode_toggle_overlay) ? overlay_rgb : (
            sine_active ? sine_rgb_dither : (
                sine_bg_active ? sine_bg_rgb_dither : 
                    mode_toggle_bg_style ? bg_rgb : 6'b00_00_00
            )
        )
    ) ^ {6{mode_negative}} : 6'b00_00_00;
    
    wire _unused = &{sine_off_y[5], sine_bg_off_y[5], anim_x[9], anim_x[2:0], anim_2x[9:8], anim_2x[1:0]};
endmodule