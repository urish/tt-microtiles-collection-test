`default_nettype none

module capsule(
    input wire [9:0] tf_x,
    input wire [9:0] tf_y,
    output wire hit
);

wire x_valid = (tf_x[9:7] == 3'b000) || (tf_x[9:7] == 3'b111);
wire y_valid = (tf_y[9:6] == 4'b0000) || (tf_y[9:6] == 4'b1111);
wire valid = x_valid && y_valid;

wire linear = tf_x[6] == tf_x[9];

wire [5:0] x_abs = linear ? 6'b0 : (tf_x[9] ? ~tf_x[5:0] : tf_x[5:0]);
wire [5:0] y_abs = tf_y[9] ? ~tf_y[5:0] : tf_y[5:0];

wire [5:0] arc;

arc_table i_arc_table(
    .in(x_abs),
    .out(arc)
);

assign hit = valid ? (y_abs <= arc) : 0;

endmodule
