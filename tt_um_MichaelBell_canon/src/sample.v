`default_nettype none

module pwm_sample (
    input wire clk,
    input wire rst_n,

    input wire [10:0] counter,
    input wire [10:0] divider,
    output reg [7:0] sample
);

    // The sample is a complete wave over 256 entries.
    // Every divider+1 clocks, we move to the next entry in the table.
    wire [10:0] thresh1;
    wire [9:0] thresh2;
    wire [9:0] thresh3;
    wire [9:0] thresh4;
    wire [7:0] sample_idx1;
    wire [7:0] sample_idx2;
    wire [7:0] sample_idx3;
    wire [7:0] sample_idx4;
    reg [8:0] sample_acc;

    reg [10:0] thresh;
    always @(posedge clk) begin
        case (counter[1:0])
        3: thresh <= thresh1;
        0: thresh <= {1'b0, thresh2};
        1: thresh <= {1'b0, thresh3};
        2: thresh <= {1'b0, thresh4};
        endcase
    end

    reg [7:0] sample_idx;
    always @(posedge clk) begin
        case (counter[1:0])
        3: sample_idx <= sample_idx1;
        0: sample_idx <= sample_idx2;
        1: sample_idx <= sample_idx3;
        2: sample_idx <= sample_idx4;
        endcase
    end

    wire wen = ((counter[1:0] == 0) ? counter : {counter[9:0], 1'b0}) - ((counter[1:0] == 0) ? thresh : {thresh[9:0], 1'b0}) < 11'd8;
    wire wen1 = !rst_n || (wen && (counter[1:0] == 2'b00));
    wire wen2 = !rst_n || (wen && (counter[1:0] == 2'b01));
    wire wen3 = !rst_n || (wen && (counter[1:0] == 2'b10));
    wire wen4 = !rst_n || (wen && (counter[1:0] == 2'b11));

    wire divider_zero = divider == 0;

    wire [10:0] next_thresh = rst_n ? (thresh + (divider_zero ? 11'd4 : divider)) : 0;
    wire [7:0] next_sample_idx = rst_n ? (sample_idx + 1) : 0;

    latch_reg #(.WIDTH(11 + 8)) t1(
        .clk(clk),
        .wen(wen1),
        .data_in({next_thresh, next_sample_idx}),
        .data_out({thresh1, sample_idx1})
        );
    latch_reg #(.WIDTH(10 + 8)) t2(
        .clk(clk),
        .wen(wen2),
        .data_in({next_thresh[9:0], next_sample_idx}),
        .data_out({thresh2, sample_idx2})
        );
    latch_reg #(.WIDTH(10 + 8)) t3(
        .clk(clk),
        .wen(wen3),
        .data_in({next_thresh[9:0], next_sample_idx}),
        .data_out({thresh3, sample_idx3})
        );
    latch_reg #(.WIDTH(10 + 8)) t4(
        .clk(clk),
        .wen(wen4),
        .data_in({next_thresh[9:0], next_sample_idx}),
        .data_out({thresh4, sample_idx4})
        );

    // From a cello
    function [6:0] sample_rom(input [7:0] val);
        case (val)
0: sample_rom = 7'd117;
1: sample_rom = 7'd116;
2: sample_rom = 7'd115;
3: sample_rom = 7'd110;
4: sample_rom = 7'd109;
5: sample_rom = 7'd106;
6: sample_rom = 7'd106;
7: sample_rom = 7'd106;
8: sample_rom = 7'd106;
9: sample_rom = 7'd105;
10: sample_rom = 7'd99;
11: sample_rom = 7'd96;
12: sample_rom = 7'd94;
13: sample_rom = 7'd90;
14: sample_rom = 7'd89;
15: sample_rom = 7'd84;
16: sample_rom = 7'd83;
17: sample_rom = 7'd82;
18: sample_rom = 7'd78;
19: sample_rom = 7'd76;
20: sample_rom = 7'd67;
21: sample_rom = 7'd65;
22: sample_rom = 7'd63;
23: sample_rom = 7'd63;
24: sample_rom = 7'd62;
25: sample_rom = 7'd56;
26: sample_rom = 7'd53;
27: sample_rom = 7'd49;
28: sample_rom = 7'd36;
29: sample_rom = 7'd33;
30: sample_rom = 7'd25;
31: sample_rom = 7'd23;
32: sample_rom = 7'd22;
33: sample_rom = 7'd25;
34: sample_rom = 7'd25;
35: sample_rom = 7'd12;
36: sample_rom = 7'd7;
37: sample_rom = 7'd3;
38: sample_rom = 7'd5;
39: sample_rom = 7'd6;
40: sample_rom = 7'd7;
41: sample_rom = 7'd5;
42: sample_rom = 7'd2;
43: sample_rom = 7'd2;
44: sample_rom = 7'd3;
45: sample_rom = 7'd9;
46: sample_rom = 7'd10;
47: sample_rom = 7'd17;
48: sample_rom = 7'd21;
49: sample_rom = 7'd26;
50: sample_rom = 7'd37;
51: sample_rom = 7'd38;
52: sample_rom = 7'd39;
53: sample_rom = 7'd40;
54: sample_rom = 7'd41;
55: sample_rom = 7'd43;
56: sample_rom = 7'd42;
57: sample_rom = 7'd36;
58: sample_rom = 7'd35;
59: sample_rom = 7'd36;
60: sample_rom = 7'd51;
61: sample_rom = 7'd55;
62: sample_rom = 7'd61;
63: sample_rom = 7'd62;
64: sample_rom = 7'd63;
65: sample_rom = 7'd59;
66: sample_rom = 7'd55;
67: sample_rom = 7'd43;
68: sample_rom = 7'd42;
69: sample_rom = 7'd48;
70: sample_rom = 7'd51;
71: sample_rom = 7'd54;
72: sample_rom = 7'd64;
73: sample_rom = 7'd66;
74: sample_rom = 7'd73;
75: sample_rom = 7'd74;
76: sample_rom = 7'd74;
77: sample_rom = 7'd66;
78: sample_rom = 7'd63;
79: sample_rom = 7'd59;
80: sample_rom = 7'd59;
81: sample_rom = 7'd59;
82: sample_rom = 7'd61;
83: sample_rom = 7'd61;
84: sample_rom = 7'd62;
85: sample_rom = 7'd64;
86: sample_rom = 7'd65;
87: sample_rom = 7'd70;
88: sample_rom = 7'd70;
89: sample_rom = 7'd73;
90: sample_rom = 7'd75;
91: sample_rom = 7'd78;
92: sample_rom = 7'd87;
93: sample_rom = 7'd89;
94: sample_rom = 7'd96;
95: sample_rom = 7'd98;
96: sample_rom = 7'd100;
97: sample_rom = 7'd103;
98: sample_rom = 7'd104;
99: sample_rom = 7'd102;
100: sample_rom = 7'd101;
101: sample_rom = 7'd97;
102: sample_rom = 7'd96;
103: sample_rom = 7'd96;
104: sample_rom = 7'd95;
105: sample_rom = 7'd95;
106: sample_rom = 7'd93;
107: sample_rom = 7'd91;
108: sample_rom = 7'd90;
109: sample_rom = 7'd80;
110: sample_rom = 7'd77;
111: sample_rom = 7'd68;
112: sample_rom = 7'd67;
113: sample_rom = 7'd66;
114: sample_rom = 7'd65;
115: sample_rom = 7'd64;
116: sample_rom = 7'd60;
117: sample_rom = 7'd58;
118: sample_rom = 7'd56;
119: sample_rom = 7'd46;
120: sample_rom = 7'd42;
121: sample_rom = 7'd33;
122: sample_rom = 7'd32;
123: sample_rom = 7'd31;
124: sample_rom = 7'd28;
125: sample_rom = 7'd27;
126: sample_rom = 7'd24;
127: sample_rom = 7'd23;
128: sample_rom = 7'd23;
129: sample_rom = 7'd18;
130: sample_rom = 7'd17;
131: sample_rom = 7'd12;
132: sample_rom = 7'd11;
133: sample_rom = 7'd9;
134: sample_rom = 7'd10;
135: sample_rom = 7'd10;
136: sample_rom = 7'd16;
137: sample_rom = 7'd18;
138: sample_rom = 7'd29;
139: sample_rom = 7'd33;
140: sample_rom = 7'd37;
141: sample_rom = 7'd45;
142: sample_rom = 7'd46;
143: sample_rom = 7'd43;
144: sample_rom = 7'd42;
145: sample_rom = 7'd41;
146: sample_rom = 7'd46;
147: sample_rom = 7'd49;
148: sample_rom = 7'd66;
149: sample_rom = 7'd73;
150: sample_rom = 7'd79;
151: sample_rom = 7'd95;
152: sample_rom = 7'd97;
153: sample_rom = 7'd94;
154: sample_rom = 7'd91;
155: sample_rom = 7'd89;
156: sample_rom = 7'd81;
157: sample_rom = 7'd80;
158: sample_rom = 7'd81;
159: sample_rom = 7'd83;
160: sample_rom = 7'd85;
161: sample_rom = 7'd94;
162: sample_rom = 7'd97;
163: sample_rom = 7'd106;
164: sample_rom = 7'd107;
165: sample_rom = 7'd102;
166: sample_rom = 7'd99;
167: sample_rom = 7'd95;
168: sample_rom = 7'd84;
169: sample_rom = 7'd82;
170: sample_rom = 7'd80;
171: sample_rom = 7'd80;
172: sample_rom = 7'd80;
173: sample_rom = 7'd80;
174: sample_rom = 7'd80;
175: sample_rom = 7'd73;
176: sample_rom = 7'd70;
177: sample_rom = 7'd67;
178: sample_rom = 7'd59;
179: sample_rom = 7'd57;
180: sample_rom = 7'd57;
181: sample_rom = 7'd58;
182: sample_rom = 7'd59;
183: sample_rom = 7'd65;
184: sample_rom = 7'd66;
185: sample_rom = 7'd66;
186: sample_rom = 7'd65;
187: sample_rom = 7'd62;
188: sample_rom = 7'd52;
189: sample_rom = 7'd49;
190: sample_rom = 7'd42;
191: sample_rom = 7'd42;
192: sample_rom = 7'd41;
193: sample_rom = 7'd46;
194: sample_rom = 7'd48;
195: sample_rom = 7'd54;
196: sample_rom = 7'd55;
197: sample_rom = 7'd55;
198: sample_rom = 7'd54;
199: sample_rom = 7'd53;
200: sample_rom = 7'd50;
201: sample_rom = 7'd50;
202: sample_rom = 7'd50;
203: sample_rom = 7'd51;
204: sample_rom = 7'd52;
205: sample_rom = 7'd56;
206: sample_rom = 7'd58;
207: sample_rom = 7'd62;
208: sample_rom = 7'd64;
209: sample_rom = 7'd65;
210: sample_rom = 7'd68;
211: sample_rom = 7'd68;
212: sample_rom = 7'd69;
213: sample_rom = 7'd69;
214: sample_rom = 7'd69;
215: sample_rom = 7'd68;
216: sample_rom = 7'd68;
217: sample_rom = 7'd66;
218: sample_rom = 7'd66;
219: sample_rom = 7'd65;
220: sample_rom = 7'd65;
221: sample_rom = 7'd65;
222: sample_rom = 7'd67;
223: sample_rom = 7'd68;
224: sample_rom = 7'd70;
225: sample_rom = 7'd76;
226: sample_rom = 7'd77;
227: sample_rom = 7'd78;
228: sample_rom = 7'd79;
229: sample_rom = 7'd78;
230: sample_rom = 7'd78;
231: sample_rom = 7'd78;
232: sample_rom = 7'd78;
233: sample_rom = 7'd78;
234: sample_rom = 7'd83;
235: sample_rom = 7'd85;
236: sample_rom = 7'd87;
237: sample_rom = 7'd92;
238: sample_rom = 7'd93;
239: sample_rom = 7'd91;
240: sample_rom = 7'd90;
241: sample_rom = 7'd90;
242: sample_rom = 7'd89;
243: sample_rom = 7'd88;
244: sample_rom = 7'd91;
245: sample_rom = 7'd95;
246: sample_rom = 7'd100;
247: sample_rom = 7'd104;
248: sample_rom = 7'd104;
249: sample_rom = 7'd108;
250: sample_rom = 7'd110;
251: sample_rom = 7'd112;
252: sample_rom = 7'd116;
253: sample_rom = 7'd117;
254: sample_rom = 7'd119;
255: sample_rom = 7'd119;
        endcase
    endfunction

    // From a violin
    function [6:0] violin_sample_rom(input [7:0] val);
        case (val)
0: violin_sample_rom = 7'd6;
1: violin_sample_rom = 7'd13;
2: violin_sample_rom = 7'd21;
3: violin_sample_rom = 7'd24;
4: violin_sample_rom = 7'd34;
5: violin_sample_rom = 7'd37;
6: violin_sample_rom = 7'd50;
7: violin_sample_rom = 7'd60;
8: violin_sample_rom = 7'd69;
9: violin_sample_rom = 7'd72;
10: violin_sample_rom = 7'd84;
11: violin_sample_rom = 7'd93;
12: violin_sample_rom = 7'd100;
13: violin_sample_rom = 7'd101;
14: violin_sample_rom = 7'd106;
15: violin_sample_rom = 7'd111;
16: violin_sample_rom = 7'd113;
17: violin_sample_rom = 7'd113;
18: violin_sample_rom = 7'd111;
19: violin_sample_rom = 7'd111;
20: violin_sample_rom = 7'd109;
21: violin_sample_rom = 7'd109;
22: violin_sample_rom = 7'd105;
23: violin_sample_rom = 7'd102;
24: violin_sample_rom = 7'd100;
25: violin_sample_rom = 7'd100;
26: violin_sample_rom = 7'd97;
27: violin_sample_rom = 7'd94;
28: violin_sample_rom = 7'd92;
29: violin_sample_rom = 7'd92;
30: violin_sample_rom = 7'd91;
31: violin_sample_rom = 7'd89;
32: violin_sample_rom = 7'd87;
33: violin_sample_rom = 7'd86;
34: violin_sample_rom = 7'd86;
35: violin_sample_rom = 7'd85;
36: violin_sample_rom = 7'd83;
37: violin_sample_rom = 7'd82;
38: violin_sample_rom = 7'd81;
39: violin_sample_rom = 7'd82;
40: violin_sample_rom = 7'd84;
41: violin_sample_rom = 7'd85;
42: violin_sample_rom = 7'd87;
43: violin_sample_rom = 7'd91;
44: violin_sample_rom = 7'd96;
45: violin_sample_rom = 7'd97;
46: violin_sample_rom = 7'd101;
47: violin_sample_rom = 7'd105;
48: violin_sample_rom = 7'd108;
49: violin_sample_rom = 7'd109;
50: violin_sample_rom = 7'd112;
51: violin_sample_rom = 7'd114;
52: violin_sample_rom = 7'd114;
53: violin_sample_rom = 7'd114;
54: violin_sample_rom = 7'd112;
55: violin_sample_rom = 7'd109;
56: violin_sample_rom = 7'd104;
57: violin_sample_rom = 7'd103;
58: violin_sample_rom = 7'd98;
59: violin_sample_rom = 7'd91;
60: violin_sample_rom = 7'd85;
61: violin_sample_rom = 7'd83;
62: violin_sample_rom = 7'd78;
63: violin_sample_rom = 7'd73;
64: violin_sample_rom = 7'd70;
65: violin_sample_rom = 7'd68;
66: violin_sample_rom = 7'd67;
67: violin_sample_rom = 7'd67;
68: violin_sample_rom = 7'd69;
69: violin_sample_rom = 7'd73;
70: violin_sample_rom = 7'd74;
71: violin_sample_rom = 7'd79;
72: violin_sample_rom = 7'd86;
73: violin_sample_rom = 7'd93;
74: violin_sample_rom = 7'd94;
75: violin_sample_rom = 7'd101;
76: violin_sample_rom = 7'd109;
77: violin_sample_rom = 7'd115;
78: violin_sample_rom = 7'd117;
79: violin_sample_rom = 7'd122;
80: violin_sample_rom = 7'd125;
81: violin_sample_rom = 7'd126;
82: violin_sample_rom = 7'd126;
83: violin_sample_rom = 7'd126;
84: violin_sample_rom = 7'd124;
85: violin_sample_rom = 7'd120;
86: violin_sample_rom = 7'd119;
87: violin_sample_rom = 7'd114;
88: violin_sample_rom = 7'd108;
89: violin_sample_rom = 7'd102;
90: violin_sample_rom = 7'd100;
91: violin_sample_rom = 7'd94;
92: violin_sample_rom = 7'd89;
93: violin_sample_rom = 7'd84;
94: violin_sample_rom = 7'd83;
95: violin_sample_rom = 7'd79;
96: violin_sample_rom = 7'd76;
97: violin_sample_rom = 7'd73;
98: violin_sample_rom = 7'd73;
99: violin_sample_rom = 7'd70;
100: violin_sample_rom = 7'd69;
101: violin_sample_rom = 7'd67;
102: violin_sample_rom = 7'd67;
103: violin_sample_rom = 7'd65;
104: violin_sample_rom = 7'd64;
105: violin_sample_rom = 7'd62;
106: violin_sample_rom = 7'd61;
107: violin_sample_rom = 7'd60;
108: violin_sample_rom = 7'd58;
109: violin_sample_rom = 7'd57;
110: violin_sample_rom = 7'd57;
111: violin_sample_rom = 7'd57;
112: violin_sample_rom = 7'd57;
113: violin_sample_rom = 7'd58;
114: violin_sample_rom = 7'd58;
115: violin_sample_rom = 7'd59;
116: violin_sample_rom = 7'd60;
117: violin_sample_rom = 7'd61;
118: violin_sample_rom = 7'd62;
119: violin_sample_rom = 7'd62;
120: violin_sample_rom = 7'd63;
121: violin_sample_rom = 7'd63;
122: violin_sample_rom = 7'd62;
123: violin_sample_rom = 7'd62;
124: violin_sample_rom = 7'd60;
125: violin_sample_rom = 7'd58;
126: violin_sample_rom = 7'd57;
127: violin_sample_rom = 7'd54;
128: violin_sample_rom = 7'd51;
129: violin_sample_rom = 7'd48;
130: violin_sample_rom = 7'd45;
131: violin_sample_rom = 7'd44;
132: violin_sample_rom = 7'd42;
133: violin_sample_rom = 7'd40;
134: violin_sample_rom = 7'd40;
135: violin_sample_rom = 7'd40;
136: violin_sample_rom = 7'd40;
137: violin_sample_rom = 7'd41;
138: violin_sample_rom = 7'd42;
139: violin_sample_rom = 7'd42;
140: violin_sample_rom = 7'd44;
141: violin_sample_rom = 7'd45;
142: violin_sample_rom = 7'd47;
143: violin_sample_rom = 7'd47;
144: violin_sample_rom = 7'd48;
145: violin_sample_rom = 7'd49;
146: violin_sample_rom = 7'd49;
147: violin_sample_rom = 7'd49;
148: violin_sample_rom = 7'd49;
149: violin_sample_rom = 7'd47;
150: violin_sample_rom = 7'd45;
151: violin_sample_rom = 7'd45;
152: violin_sample_rom = 7'd42;
153: violin_sample_rom = 7'd39;
154: violin_sample_rom = 7'd35;
155: violin_sample_rom = 7'd34;
156: violin_sample_rom = 7'd31;
157: violin_sample_rom = 7'd28;
158: violin_sample_rom = 7'd26;
159: violin_sample_rom = 7'd25;
160: violin_sample_rom = 7'd23;
161: violin_sample_rom = 7'd21;
162: violin_sample_rom = 7'd21;
163: violin_sample_rom = 7'd21;
164: violin_sample_rom = 7'd22;
165: violin_sample_rom = 7'd23;
166: violin_sample_rom = 7'd25;
167: violin_sample_rom = 7'd26;
168: violin_sample_rom = 7'd28;
169: violin_sample_rom = 7'd31;
170: violin_sample_rom = 7'd34;
171: violin_sample_rom = 7'd34;
172: violin_sample_rom = 7'd36;
173: violin_sample_rom = 7'd38;
174: violin_sample_rom = 7'd40;
175: violin_sample_rom = 7'd40;
176: violin_sample_rom = 7'd41;
177: violin_sample_rom = 7'd42;
178: violin_sample_rom = 7'd43;
179: violin_sample_rom = 7'd43;
180: violin_sample_rom = 7'd43;
181: violin_sample_rom = 7'd43;
182: violin_sample_rom = 7'd43;
183: violin_sample_rom = 7'd43;
184: violin_sample_rom = 7'd44;
185: violin_sample_rom = 7'd45;
186: violin_sample_rom = 7'd46;
187: violin_sample_rom = 7'd47;
188: violin_sample_rom = 7'd48;
189: violin_sample_rom = 7'd49;
190: violin_sample_rom = 7'd51;
191: violin_sample_rom = 7'd52;
192: violin_sample_rom = 7'd53;
193: violin_sample_rom = 7'd54;
194: violin_sample_rom = 7'd54;
195: violin_sample_rom = 7'd53;
196: violin_sample_rom = 7'd53;
197: violin_sample_rom = 7'd51;
198: violin_sample_rom = 7'd48;
199: violin_sample_rom = 7'd45;
200: violin_sample_rom = 7'd44;
201: violin_sample_rom = 7'd40;
202: violin_sample_rom = 7'd37;
203: violin_sample_rom = 7'd34;
204: violin_sample_rom = 7'd34;
205: violin_sample_rom = 7'd32;
206: violin_sample_rom = 7'd31;
207: violin_sample_rom = 7'd30;
208: violin_sample_rom = 7'd30;
209: violin_sample_rom = 7'd31;
210: violin_sample_rom = 7'd32;
211: violin_sample_rom = 7'd34;
212: violin_sample_rom = 7'd35;
213: violin_sample_rom = 7'd37;
214: violin_sample_rom = 7'd40;
215: violin_sample_rom = 7'd43;
216: violin_sample_rom = 7'd44;
217: violin_sample_rom = 7'd47;
218: violin_sample_rom = 7'd50;
219: violin_sample_rom = 7'd54;
220: violin_sample_rom = 7'd54;
221: violin_sample_rom = 7'd56;
222: violin_sample_rom = 7'd58;
223: violin_sample_rom = 7'd59;
224: violin_sample_rom = 7'd60;
225: violin_sample_rom = 7'd61;
226: violin_sample_rom = 7'd61;
227: violin_sample_rom = 7'd62;
228: violin_sample_rom = 7'd62;
229: violin_sample_rom = 7'd63;
230: violin_sample_rom = 7'd64;
231: violin_sample_rom = 7'd65;
232: violin_sample_rom = 7'd65;
233: violin_sample_rom = 7'd67;
234: violin_sample_rom = 7'd70;
235: violin_sample_rom = 7'd72;
236: violin_sample_rom = 7'd73;
237: violin_sample_rom = 7'd75;
238: violin_sample_rom = 7'd77;
239: violin_sample_rom = 7'd77;
240: violin_sample_rom = 7'd77;
241: violin_sample_rom = 7'd76;
242: violin_sample_rom = 7'd74;
243: violin_sample_rom = 7'd71;
244: violin_sample_rom = 7'd70;
245: violin_sample_rom = 7'd65;
246: violin_sample_rom = 7'd59;
247: violin_sample_rom = 7'd52;
248: violin_sample_rom = 7'd50;
249: violin_sample_rom = 7'd41;
250: violin_sample_rom = 7'd32;
251: violin_sample_rom = 7'd22;
252: violin_sample_rom = 7'd20;
253: violin_sample_rom = 7'd12;
254: violin_sample_rom = 7'd7;
255: violin_sample_rom = 7'd4;
        endcase
    endfunction

    reg [7:0] sample_val;
    always @* begin
        case(counter[1:0])
        0: sample_val = 8'dx;
        1: sample_val = sample_idx2;
        2: sample_val = sample_idx3;
        3: sample_val = sample_idx4;
        endcase
    end

    wire [6:0] sample_mux = divider_zero ? 7'h40 : violin_sample_rom(sample_val);
    wire [8:0] sample_sum = sample_acc + {2'b00,sample_mux};

    always @(posedge clk) begin
        if (!rst_n) begin
            sample_acc <= 0;
        end 
        else begin
            case(counter[1:0])
            0: sample_acc <= divider_zero ? 9'h40 : {2'b00, sample_rom(sample_idx1)};
            1,2: sample_acc <= sample_sum;
            3: begin
                sample <= sample_sum[8:1];
                sample_acc <= 0;
            end
            endcase
        end
    end

endmodule
