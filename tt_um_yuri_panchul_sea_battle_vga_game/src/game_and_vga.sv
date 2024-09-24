`include "game_config.svh"

module game_and_vga
(
    input        clk,
    input        rst,

    input        left,
    input        right,

    output       hsync,
    output       vsync,

    output [1:0] red,
    output [1:0] green,
    output [1:0] blue
);

    //------------------------------------------------------------------------

    localparam clk_mhz       = 25,
               pixel_mhz     = 25,

               screen_width  = 640,
               screen_height = 480,

               strobe_to_update_xy_counter_width
                   = $clog2 (clk_mhz * 1000 * 1000) - 6,

               w_x           = $clog2 ( screen_width  ),
               w_y           = $clog2 ( screen_height );

    //------------------------------------------------------------------------

    wire display_on;

    wire [w_x - 1:0] x;
    wire [w_y - 1:0] y;

    wire [`GAME_RGB_WIDTH - 1:0] game_rgb;

    game_top
    # (
        .clk_mhz                           (clk_mhz                          ),
        .pixel_mhz                         (pixel_mhz                        ),
        .screen_width                      (screen_width                     ),
        .screen_height                     (screen_height                    ),
        .strobe_to_update_xy_counter_width (strobe_to_update_xy_counter_width)
    )
    i_game_top
    (
        .clk              (   clk            ),
        .rst              (   rst            ),

        .launch_key       (   left | right   ),
        .left_right_keys  ( { left , right } ),

        .display_on       (   display_on     ),

        .x                (   x              ),
        .y                (   y              ),

        .rgb              (   game_rgb       )
    );

    assign red   = { 2 { game_rgb [2] } };
    assign green = { 2 { game_rgb [1] } };
    assign blue  = { 2 { game_rgb [0] } };

    //------------------------------------------------------------------------

    wire [9:0] x10; assign x = x10;
    wire [9:0] y10; assign y = y10;

    vga
    # (
        .CLK_MHZ     ( clk_mhz    ),
        .PIXEL_MHZ   ( pixel_mhz  )
    )
    i_vga
    (
        .clk         ( clk        ),
        .rst         ( rst        ),
        .hsync       ( hsync      ),
        .vsync       ( vsync      ),
        .display_on  ( display_on ),
        .hpos        ( x10        ),
        .vpos        ( y10        ),
        .pixel_clk   (            )
    );

endmodule
