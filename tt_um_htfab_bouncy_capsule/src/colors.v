`default_nettype none

module colors(
    input wire clk,
    input wire rst,
    input wire update,
    input wire [1:0] entropy,
    output wire [5:0] capsule_color,
    output wire [5:0] text_color
);

reg [1:0] red;
reg [1:0] green;
reg [1:0] blue;

wire [5:0] light_text = {1'b1, red[1], 1'b1, green[1], 1'b1, blue[1]};
wire [5:0] dark_text = {red[1]&red[0], red[1]&~red[0], green[1]&green[0], green[1]&~green[0], blue[1]&blue[0], blue[1]&~blue[0]};
wire use_dark_text = green[1]&green[0];

assign capsule_color = {red, green, blue};
assign text_color = use_dark_text ? dark_text : light_text;

wire red_1_ok = green[1] || (green[0] && blue[1]);
wire green_1_ok = red[1] || blue[1];
wire green_0_ok = red[1];
wire blue_1_ok = red[1] || green[1] || green[0];

reg [1:0] channel;

always @(posedge clk) begin
    if(rst) begin
        red <= 2'b11;
        green <= 2'b01;
        blue <= 2'b01;
        channel <= 2'b10;
    end else if(update) begin
        case(channel)
            2'b00:
                begin
                    case(red)
                        2'b00: red <= 2'b01;
                        2'b01: red <= entropy[0] ? 2'b00 : 2'b10;
                        2'b10: red <= (entropy[0] && red_1_ok) ? 2'b01 : 2'b11;
                        2'b11: red <= 2'b10;
                    endcase
                    channel <= entropy[1] ? 2'b01 : 2'b10;
                end
            2'b01:
                begin
                    case(green)
                        2'b00: green <= 2'b01;
                        2'b01: green <= (entropy[0] && green_0_ok) ? 2'b00 : 2'b10;
                        2'b10: green <= (entropy[0] && green_1_ok) ? 2'b01 : 2'b11;
                        2'b11: green <= 2'b10;
                    endcase
                    channel <= entropy[1] ? 2'b10 : 2'b00;
                end
            2'b10:
                begin
                    case(blue)
                        2'b00: blue <= 2'b01;
                        2'b01: blue <= entropy[0] ? 2'b00 : 2'b10;
                        2'b10: blue <= (entropy[0] && blue_1_ok) ? 2'b01: 2'b11;
                        2'b11: blue <= 2'b10;
                    endcase
                    channel <= entropy[1] ? 2'b00 : 2'b01;
                end
            default:
                begin
                    red <= 2'b11;
                    green <= 2'b01;
                    blue <= 2'b01;
                    channel <= 2'b10;
                end
        endcase
    end
end

endmodule
