`default_nettype none

module overlay_creator(
    output wire overlay_active, text_active,
    input wire [9:0] x, 
    input wire [8:0] y
    );
    
    //TODO: Double Layer optimization
    
    wire [9:0] x_shadow;
    wire [8:0] y_shadow;
    wire shadow_active;

    wire text_demosiine_main_active, text_demosiine_shadow_active;
    wire text_tt08_main_active, text_tt08_shadow_active;
    wire text_sda_main_active, text_sda_shadow_active;
    
    assign x_shadow = x - 10'd4;
    assign y_shadow = y - 9'd4;
    
    text_demosiine text_demosiine1 (
        .overlay_active(text_demosiine_main_active),
        .x(x), .y(y)
    );
    
    text_demosiine text_demosiine2 (
        .overlay_active(text_demosiine_shadow_active),
        .x(x_shadow), .y(y_shadow)
    );
    
    text_tt08 text_tt081 (
        .overlay_active(text_tt08_main_active),
        .x(x[8:0]), .y(y)
    );
    
    text_tt08 text_tt082 (
        .overlay_active(text_tt08_shadow_active),
        .x(x_shadow[8:0]), .y(y_shadow)
    );
    
    text_sda text_sda1 (
        .overlay_active(text_sda_main_active),
        .x(x), .y(y)
    );
    
    text_sda text_sda2 (
        .overlay_active(text_sda_shadow_active),
        .x(x_shadow), .y(y_shadow)
    );
    
    assign text_active = text_demosiine_main_active | text_tt08_main_active | text_sda_main_active;
    assign shadow_active = text_demosiine_shadow_active | text_tt08_shadow_active | text_sda_shadow_active;
    
    assign overlay_active = text_active | shadow_active;
    
endmodule
