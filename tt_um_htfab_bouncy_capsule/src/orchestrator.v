`default_nettype none

module orchestrator (
    input wire clk,
    input wire rst,
    input wire [9:0] vga_x,
    input wire [9:0] vga_y,
    input wire capsule_hit,
    input wire [1:0] collision_impact,
    input wire pause_kinematics,
    input wire mute_sound,
    output reg update_collision,
    output reg rotate_collision,
    output reg mirror_collision,
    output reg update_kinematics,
    output reg update_transform,
    output reg update_resonator,
    output reg handle_impact,
    output reg [1:0] trigger_resonator,
    output reg [3:0] tension,
    output wire round_dir,
    output wire [1:0] color_entropy
);

reg hit_left;
reg hit_right;
reg hit_top;
reg hit_bottom;
reg [9:0] lfsr;
reg [1:0] hit_priority;
reg trigger_debounce;
reg [9:0] sample_counter;

assign round_dir = lfsr[0];
assign color_entropy = lfsr[9:8];

always @(posedge clk) begin
    update_collision <= 0;
    rotate_collision <= 0;
    mirror_collision <= 0;
    update_kinematics <= 0;
    update_transform <= 0;
    update_resonator <= 0;
    handle_impact <= 0;
    trigger_resonator <= 0;
    if(rst) begin
        hit_left <= 0;
        hit_right <= 0;
        hit_top <= 0;
        hit_bottom <= 0;
        lfsr <= -1;
        hit_priority <= 0;
        trigger_debounce <= 0;
        sample_counter <= 0;
        tension <= 0;
    end else begin
        if(vga_y == 480 && vga_x == 0) begin
            lfsr <= {lfsr[8:0], ^(lfsr & 10'b1001000000)};
            update_collision <= hit_left || hit_right || hit_top || hit_bottom;
            if(hit_priority == 2'b00) begin
                rotate_collision <= (hit_left || hit_right) && !(hit_top || hit_bottom);
                mirror_collision <= (hit_top || (hit_left && ~hit_right)) && ~hit_bottom; 
            end else if(hit_priority == 2'b01) begin
                rotate_collision <= hit_left || hit_right;
                mirror_collision <= (hit_left || (hit_top && ~hit_bottom)) && ~hit_right;
            end else if(hit_priority == 2'b10) begin
                rotate_collision <= (hit_left || hit_right) && !(hit_top || hit_bottom);
                mirror_collision <= hit_top || (hit_left && ~hit_bottom);
            end else if(hit_priority == 2'b11) begin
                rotate_collision <= hit_left || hit_right;
                mirror_collision <= hit_left || (hit_top && ~hit_right);
            end
            hit_priority <= hit_priority + 1;
        end else if(vga_y == 485 && vga_x == 0) begin
            if(hit_bottom || hit_left || hit_right || hit_top) begin
                if(collision_impact != 0) begin
                    if(!trigger_debounce) begin
                        handle_impact <= 1;
                        if(!mute_sound) trigger_resonator <= collision_impact;
                        if(hit_bottom)     tension <= 4;
                        else if(hit_left)  tension <= 6;
                        else if(hit_right) tension <= 10;
                        else if(hit_top)   tension <= 14;
                    end
                    trigger_debounce <= 1;
                end
            end else begin
                trigger_debounce <= 0;
            end
        end else if(vga_y == 490 && vga_x == 0) begin
            update_kinematics <= ~pause_kinematics;
        end else if(vga_y == 495 && vga_x == 0) begin
            update_transform <= 1;
            hit_left <= 0;
            hit_right <= 0;
            hit_top <= 0;
            hit_bottom <= 0;
        end else if(vga_y < 480 && vga_x == 639) begin
            if(capsule_hit) hit_right <= 1;
        end else if(vga_y < 480 && vga_x == 0) begin
            if(capsule_hit) hit_left <= 1;
        end else if(vga_y == 479 && vga_x < 640) begin
            if(capsule_hit) hit_bottom <= 1;
        end else if(vga_y == 0 && vga_x < 640) begin
            if(capsule_hit) hit_top <= 1;
        end

        sample_counter <= sample_counter + 1;
        if(sample_counter == 0) begin
            update_resonator <= 1;
        end

    end
end

endmodule
