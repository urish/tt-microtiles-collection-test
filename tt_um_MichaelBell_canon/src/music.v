`default_nettype none

module pwm_music (
    input wire clk,
    input wire rst_n,

    input wire [1:0] fast_start,

    output wire pwm,

    output wire [9:0] low_count,
    output wire [6:0] crotchet
);

    // The PWM module converts the sample of our sine wave to a PWM output
    wire [10:0] divider;
    reg [31:0] count;
    wire [2:0] cello_note_idx = count[27:25];
    reg [8:0] violin_note_idx [1:3];
    wire [2:0] violin_duration_mask;

    wire [7:0] sample_for_pwm;

    pwm_audio i_pwm(
        .clk(clk),
        .rst_n(rst_n),

        .sample(sample_for_pwm),

        .pwm(pwm)
    );
    wire _unused = &{sample_for_pwm[0], 1'b0};

    pwm_sample i_sample(
        .clk(clk),
        .rst_n(rst_n),

        .counter(count[10:0]),

        .divider(divider),

        .sample(sample_for_pwm)
    );

    assign low_count = count[9:0];
    assign crotchet = count[31:25];

    always @(posedge clk) begin
        if (!rst_n) begin
            count <= 1;
        end
        else begin
            count <= count + 1;
            //if (count[31:28] == 4'hf) count <= 1;
        end
    end

    genvar i;
    generate
        for (i = 1; i <= 3; i = i+1) begin
            always @(posedge clk) begin
                if (!rst_n) begin
                    violin_note_idx[i] <= 9'd511 - 8*i + {3'd0, fast_start, 4'h0};
                end
                else begin
                    if (count[21:0] == i && (count[24:22] & violin_duration_mask) == 0) begin
                        violin_note_idx[i] <= violin_note_idx[i] + 1;
                        if (i > 1) begin
                            if (violin_note_idx[1] == 288) begin 
                                violin_note_idx[i] <= 287+i;
                            end
                            if (violin_note_idx[1] == 489) begin
                                violin_note_idx[i] <= 497-8*i;
                            end
                        end else if (violin_note_idx[1] == 288) begin 
                            violin_note_idx[i] <= 489;
                        end
                    end
                end
            end
        end
    endgenerate

    // Cello line for Canon, 36MHz project clock
    function [10:0] cello_rom(input [2:0] idx);
        case (idx)
0: cello_rom = 11'd949;
1: cello_rom = 11'd1270;
2: cello_rom = 11'd1130;
3: cello_rom = 11'd1512;
4: cello_rom = 11'd1426;
5: cello_rom = 11'd1907;
6: cello_rom = 11'd1426;
7: cello_rom = 11'd1270;
        endcase
    endfunction

    // Violin line for Canon
    function automatic [6:0] violin_rom(input [8:0] idx);
        case (idx)
        default: violin_rom = 7'h40;
8: violin_rom = 7'd76;
9: violin_rom = 7'd75;
10: violin_rom = 7'd74;
11: violin_rom = 7'd73;
12: violin_rom = 7'd72;
13: violin_rom = 7'd71;
14: violin_rom = 7'd72;
15: violin_rom = 7'd73;
16: violin_rom = 7'd74;
17: violin_rom = 7'd73;
18: violin_rom = 7'd72;
19: violin_rom = 7'd71;
20: violin_rom = 7'd70;
21: violin_rom = 7'd69;
22: violin_rom = 7'd70;
23: violin_rom = 7'd68;
24: violin_rom = 7'd99;
25: violin_rom = 7'd101;
26: violin_rom = 7'd103;
27: violin_rom = 7'd102;
28: violin_rom = 7'd101;
29: violin_rom = 7'd99;
30: violin_rom = 7'd101;
31: violin_rom = 7'd100;
32: violin_rom = 7'd99;
33: violin_rom = 7'd97;
34: violin_rom = 7'd99;
35: violin_rom = 7'd103;
36: violin_rom = 7'd102;
37: violin_rom = 7'd104;
38: violin_rom = 7'd103;
39: violin_rom = 7'd102;
40: violin_rom = 7'd101;
41: violin_rom = 7'd99;
42: violin_rom = 7'd100;
43: violin_rom = 7'd105;
44: violin_rom = 7'd106;
45: violin_rom = 7'd108;
46: violin_rom = 7'd110;
47: violin_rom = 7'd103;
48: violin_rom = 7'd104;
49: violin_rom = 7'd102;
50: violin_rom = 7'd103;
51: violin_rom = 7'd101;
52: violin_rom = 7'd99;
53: violin_rom = 7'd106;
54: violin_rom = 7'd106;
55: violin_rom = 7'd42;
56: violin_rom = 7'd41;
57: violin_rom = 7'd42;
58: violin_rom = 7'd41;
59: violin_rom = 7'd42;
60: violin_rom = 7'd35;
61: violin_rom = 7'd34;
62: violin_rom = 7'd39;
63: violin_rom = 7'd36;
64: violin_rom = 7'd37;
65: violin_rom = 7'd35;
66: violin_rom = 7'd42;
67: violin_rom = 7'd41;
68: violin_rom = 7'd40;
69: violin_rom = 7'd41;
70: violin_rom = 7'd44;
71: violin_rom = 7'd46;
72: violin_rom = 7'd47;
73: violin_rom = 7'd45;
74: violin_rom = 7'd44;
75: violin_rom = 7'd43;
76: violin_rom = 7'd45;
77: violin_rom = 7'd44;
78: violin_rom = 7'd43;
79: violin_rom = 7'd42;
80: violin_rom = 7'd41;
81: violin_rom = 7'd40;
82: violin_rom = 7'd39;
83: violin_rom = 7'd38;
84: violin_rom = 7'd37;
85: violin_rom = 7'd36;
86: violin_rom = 7'd38;
87: violin_rom = 7'd37;
88: violin_rom = 7'd36;
89: violin_rom = 7'd35;
90: violin_rom = 7'd36;
91: violin_rom = 7'd37;
92: violin_rom = 7'd38;
93: violin_rom = 7'd39;
94: violin_rom = 7'd36;
95: violin_rom = 7'd39;
96: violin_rom = 7'd38;
97: violin_rom = 7'd37;
98: violin_rom = 7'd40;
99: violin_rom = 7'd39;
100: violin_rom = 7'd38;
101: violin_rom = 7'd39;
102: violin_rom = 7'd38;
103: violin_rom = 7'd37;
104: violin_rom = 7'd36;
105: violin_rom = 7'd35;
106: violin_rom = 7'd33;
107: violin_rom = 7'd40;
108: violin_rom = 7'd41;
109: violin_rom = 7'd42;
110: violin_rom = 7'd41;
111: violin_rom = 7'd40;
112: violin_rom = 7'd39;
113: violin_rom = 7'd38;
114: violin_rom = 7'd37;
115: violin_rom = 7'd36;
116: violin_rom = 7'd40;
117: violin_rom = 7'd39;
118: violin_rom = 7'd40;
119: violin_rom = 7'd39;
120: violin_rom = 7'd38;
121: violin_rom = 7'd101;
122: violin_rom = 7'd108;
123: violin_rom = 7'd75;
124: violin_rom = 7'd96;
125: violin_rom = 7'd106;
126: violin_rom = 7'd76;
127: violin_rom = 7'd79;
128: violin_rom = 7'd78;
129: violin_rom = 7'd79;
130: violin_rom = 7'd80;
131: violin_rom = 7'd113;
132: violin_rom = 7'd106;
133: violin_rom = 7'd73;
134: violin_rom = 7'd96;
135: violin_rom = 7'd104;
136: violin_rom = 7'd74;
137: violin_rom = 7'd74;
138: violin_rom = 7'd96;
139: violin_rom = 7'd106;
140: violin_rom = 7'd106;
141: violin_rom = 7'd109;
142: violin_rom = 7'd107;
143: violin_rom = 7'd110;
144: violin_rom = 7'd46;
145: violin_rom = 7'd12;
146: violin_rom = 7'd13;
147: violin_rom = 7'd46;
148: violin_rom = 7'd12;
149: violin_rom = 7'd13;
150: violin_rom = 7'd14;
151: violin_rom = 7'd7;
152: violin_rom = 7'd8;
153: violin_rom = 7'd9;
154: violin_rom = 7'd10;
155: violin_rom = 7'd11;
156: violin_rom = 7'd12;
157: violin_rom = 7'd13;
158: violin_rom = 7'd44;
159: violin_rom = 7'd10;
160: violin_rom = 7'd11;
161: violin_rom = 7'd44;
162: violin_rom = 7'd5;
163: violin_rom = 7'd6;
164: violin_rom = 7'd7;
165: violin_rom = 7'd8;
166: violin_rom = 7'd7;
167: violin_rom = 7'd6;
168: violin_rom = 7'd7;
169: violin_rom = 7'd5;
170: violin_rom = 7'd6;
171: violin_rom = 7'd7;
172: violin_rom = 7'd38;
173: violin_rom = 7'd8;
174: violin_rom = 7'd7;
175: violin_rom = 7'd38;
176: violin_rom = 7'd5;
177: violin_rom = 7'd4;
178: violin_rom = 7'd5;
179: violin_rom = 7'd4;
180: violin_rom = 7'd3;
181: violin_rom = 7'd4;
182: violin_rom = 7'd5;
183: violin_rom = 7'd6;
184: violin_rom = 7'd7;
185: violin_rom = 7'd8;
186: violin_rom = 7'd38;
187: violin_rom = 7'd8;
188: violin_rom = 7'd7;
189: violin_rom = 7'd40;
190: violin_rom = 7'd9;
191: violin_rom = 7'd10;
192: violin_rom = 7'd7;
193: violin_rom = 7'd8;
194: violin_rom = 7'd9;
195: violin_rom = 7'd10;
196: violin_rom = 7'd11;
197: violin_rom = 7'd12;
198: violin_rom = 7'd13;
199: violin_rom = 7'd14;
200: violin_rom = 7'd44;
201: violin_rom = 7'd10;
202: violin_rom = 7'd11;
203: violin_rom = 7'd44;
204: violin_rom = 7'd11;
205: violin_rom = 7'd10;
206: violin_rom = 7'd11;
207: violin_rom = 7'd9;
208: violin_rom = 7'd10;
209: violin_rom = 7'd11;
210: violin_rom = 7'd12;
211: violin_rom = 7'd11;
212: violin_rom = 7'd10;
213: violin_rom = 7'd9;
214: violin_rom = 7'd42;
215: violin_rom = 7'd8;
216: violin_rom = 7'd9;
217: violin_rom = 7'd42;
218: violin_rom = 7'd3;
219: violin_rom = 7'd4;
220: violin_rom = 7'd5;
221: violin_rom = 7'd6;
222: violin_rom = 7'd5;
223: violin_rom = 7'd4;
224: violin_rom = 7'd5;
225: violin_rom = 7'd10;
226: violin_rom = 7'd9;
227: violin_rom = 7'd10;
228: violin_rom = 7'd40;
229: violin_rom = 7'd10;
230: violin_rom = 7'd9;
231: violin_rom = 7'd40;
232: violin_rom = 7'd7;
233: violin_rom = 7'd6;
234: violin_rom = 7'd7;
235: violin_rom = 7'd6;
236: violin_rom = 7'd5;
237: violin_rom = 7'd6;
238: violin_rom = 7'd7;
239: violin_rom = 7'd8;
240: violin_rom = 7'd9;
241: violin_rom = 7'd10;
242: violin_rom = 7'd40;
243: violin_rom = 7'd10;
244: violin_rom = 7'd9;
245: violin_rom = 7'd42;
246: violin_rom = 7'd9;
247: violin_rom = 7'd8;
248: violin_rom = 7'd9;
249: violin_rom = 7'd10;
250: violin_rom = 7'd11;
251: violin_rom = 7'd10;
252: violin_rom = 7'd9;
253: violin_rom = 7'd10;
254: violin_rom = 7'd8;
255: violin_rom = 7'd9;
256: violin_rom = 7'd106;
257: violin_rom = 7'd96;
258: violin_rom = 7'd105;
259: violin_rom = 7'd96;
260: violin_rom = 7'd104;
261: violin_rom = 7'd96;
262: violin_rom = 7'd106;
263: violin_rom = 7'd96;
264: violin_rom = 7'd99;
265: violin_rom = 7'd96;
266: violin_rom = 7'd99;
267: violin_rom = 7'd96;
268: violin_rom = 7'd99;
269: violin_rom = 7'd96;
270: violin_rom = 7'd99;
271: violin_rom = 7'd96;
272: violin_rom = 7'd96;
273: violin_rom = 7'd103;
274: violin_rom = 7'd96;
275: violin_rom = 7'd103;
276: violin_rom = 7'd96;
277: violin_rom = 7'd101;
278: violin_rom = 7'd96;
279: violin_rom = 7'd103;
280: violin_rom = 7'd96;
281: violin_rom = 7'd102;
282: violin_rom = 7'd96;
283: violin_rom = 7'd101;
284: violin_rom = 7'd96;
285: violin_rom = 7'd102;
286: violin_rom = 7'd96;
287: violin_rom = 7'd107;
288: violin_rom = 7'd64;
289: violin_rom = 7'd76;
290: violin_rom = 7'd74;
        endcase
    endfunction

    function [9:0] violin_freq(input [4:0] note);
        case (note)
0: violin_freq = 10'd0;
1: violin_freq = 10'd568;
2: violin_freq = 10'd506;
3: violin_freq = 10'd477;
4: violin_freq = 10'd425;
5: violin_freq = 10'd379;
6: violin_freq = 10'd357;
7: violin_freq = 10'd318;
8: violin_freq = 10'd283;
9: violin_freq = 10'd252;
10: violin_freq = 10'd238;
11: violin_freq = 10'd212;
12: violin_freq = 10'd189;
13: violin_freq = 10'd178;
14: violin_freq = 10'd158;
15: violin_freq = 10'd141;
16: violin_freq = 10'd125;
17: violin_freq = 10'd118;
default: violin_freq = 10'dx;
        endcase
    endfunction

    function [2:0] raw_sine_rom(input [1:0] val);
        case (val)
0: raw_sine_rom = 3'd1;
1: raw_sine_rom = 3'd3;
2: raw_sine_rom = 3'd6;
3: raw_sine_rom = 3'd7;
        endcase
    endfunction

    // Function to compute roughly 7.5 + 7.5 * sin(2pi * val / 16)
    function automatic [3:0] sine(input [3:0] val);
        reg [1:0] negated_val;
        reg [2:0] half_sine;
        negated_val = 2'd3 - val[1:0];
        half_sine = raw_sine_rom(val[2] ? negated_val[1:0] : val[1:0]);
        sine = val[3] ? 3'd7 - half_sine : {1'b1, half_sine};
    endfunction

    wire [10:0] cello_div_in = cello_rom(cello_note_idx) + {7'd0, sine(count[22:19])};

    reg [8:0] vnote_idx;
    always @* begin
        case(count[1:0])
        0: vnote_idx = 9'dx;
        1: vnote_idx = violin_note_idx[1];
        2: vnote_idx = violin_note_idx[2];
        3: vnote_idx = violin_note_idx[3];
        endcase
    end

    wire [6:0] violin_note_mux = violin_rom(vnote_idx);
    wire [9:0] violin_divider_mux = violin_freq(violin_note_mux[4:0]);

    wire [10:0] cdivider = (violin_note_idx[1][8:7] == 2'b11) ? 11'd0 : cello_div_in;
    assign divider = (count[1:0] == 2'b00) ? cdivider : {1'b0, violin_divider_mux};
    assign violin_duration_mask = violin_note_mux[6:5] == 2'b10 ? 3'b111 : {1'b0,violin_note_mux[6:5]};

endmodule
