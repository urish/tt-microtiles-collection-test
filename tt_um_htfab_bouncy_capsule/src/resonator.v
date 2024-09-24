`default_nettype none

module resonator (
    input wire clk,
    input wire rst,
    input wire [1:0] trigger,
    input wire update,
    input wire [3:0] tension,
    output wire [11:0] sample
);

reg signed [15:0] v;
reg signed [11:0] x;
reg [3:0] counter;

wire signed [16:0] vn = $signed({v[15], v}) - $signed({{(9){x[11]}}, x[11:4]});
wire signed [12:0] xn = $signed({x[11], x}) + $signed({{(7){v[15]}}, v[15:10]});

assign sample = x;

always @(posedge clk) begin
    if (rst) begin
        v <= 0;
        x <= 0;
        counter <= 0;
    end else if(trigger != 0) begin
        v <= 0;
        x <= {1'b0, {(5){trigger}}, trigger[1]};
        counter <= 0;
    end else if(update) begin
        if((&v[15:13] || ~|v[15:13]) && (&x[11:9] || ~|x[11:9])) begin
            v <= v - (v >>> 9);  // increased damping
        end else begin
            v <= v - (v >>> 11);
        end
        counter <= tension;
    end else if(counter > 1) begin
        counter <= counter - 1;
        if(vn[16] != vn[15]) begin
            v <= {vn[16], {(15){vn[15]}}};  // saturation
        end else begin
            v <= vn[15:0];
        end
    end else if(counter == 1) begin
        counter <= 0;
        if(xn[12] != xn[11]) begin
            x <= {xn[12], {(11){xn[11]}}};  // saturation
        end else begin
            x <= xn[11:0];
        end
    end
end

endmodule
