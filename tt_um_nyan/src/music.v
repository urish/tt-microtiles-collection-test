`default_nettype none

/* verilator lint_off WIDTHEXPAND */
/* verilator lint_off WIDTHTRUNC */
module music
    (
        input wire clk,
        input wire rst_n,

        output wire pwm
    );

    localparam INPUT_FREQUENCY = 25000000;                                      // 25MHz input clock
    localparam SAMPLE_RATE = 200000;                                            // 200kHz PWM rate
    localparam SAMPLE_BITS = $clog2(INPUT_FREQUENCY / SAMPLE_RATE);             // Number of bits needed for ideal sample size ($clog2(125) = 7 bits)
    localparam SAMPLE_SIZE = 2**SAMPLE_BITS;                                    // Binary sample size (128)
    localparam EXTRA_SAMPLE_BITS = 8;                                           // Additional precision in bits
    localparam EXTENDED_SAMPLE_BITS = SAMPLE_BITS + EXTRA_SAMPLE_BITS;          // Total number of sample bits (15 bits)
    localparam EXTENDED_SAMPLE_RANGE = SAMPLE_SIZE * (2 ** EXTRA_SAMPLE_BITS);  // Sample range which is also our internal resolution (32768)
    localparam TICK_WIDTH = 28 * SAMPLE_RATE / 256 / 4;                         // The full Nyan Cat loop is approx. 28 seconds and contains 256 beats, which we divide in 4
    localparam SHORT_SAMPLES = TICK_WIDTH * 3;                                  // Short note gets one beat minus a space
    localparam LONG_SAMPLES = TICK_WIDTH * 7;                                   // Long note gets two beats minus a space
    localparam SPACE_SAMPLES = TICK_WIDTH;                                      // Space between notes
    localparam NOTE_BITS = $clog2(LONG_SAMPLES);

    localparam G_SHARP = 3'd0;
    localparam F_SHARP = 3'd1;
    localparam D_SHARP = 3'd2;
    localparam D = 3'd3;
    localparam C_SHARP = 3'd4;
    localparam B = 3'd5;

    localparam SHORT_NOTE = 1'b0;
    localparam LONG_NOTE = 1'b1;

    reg [6:0] increments [5:0];
    reg [3:0] melody [24:0];
    reg [EXTENDED_SAMPLE_BITS - 1 : 0] extended_sample;
    reg [4:0] melody_pos;
    reg [EXTENDED_SAMPLE_BITS - 1 : 0] pwm_pos;
    reg [NOTE_BITS - 1 : 0] note_pos;
    reg do_note;

    wire [2:0] note;
    wire note_length;
    wire [SAMPLE_BITS - 1 : 0] sample;

    assign note = melody[melody_pos][3:1];
    assign note_length = melody[melody_pos][0];
    assign sample = extended_sample[EXTENDED_SAMPLE_BITS - 1 -: SAMPLE_BITS];
    assign pwm = (pwm_pos <= sample ? 1'b1 : 1'b0);

    initial begin
        increments[G_SHARP] = EXTENDED_SAMPLE_RANGE * 415 / SAMPLE_RATE;    // 67
        increments[F_SHARP] = EXTENDED_SAMPLE_RANGE * 370 / SAMPLE_RATE;    // 60
        increments[D_SHARP] = EXTENDED_SAMPLE_RANGE * 311 / SAMPLE_RATE;    // 50
        increments[D]       = EXTENDED_SAMPLE_RANGE * 294 / SAMPLE_RATE;    // 48
        increments[C_SHARP] = EXTENDED_SAMPLE_RANGE * 277 / SAMPLE_RATE;    // 45
        increments[B]       = EXTENDED_SAMPLE_RANGE * 247 / SAMPLE_RATE;    // 40

        melody[0] = {F_SHARP, LONG_NOTE};
        melody[1] = {G_SHARP, LONG_NOTE};
        melody[2] = {D, SHORT_NOTE};
        melody[3] = {D_SHARP, LONG_NOTE};
        melody[4] = {B, SHORT_NOTE};
        melody[5] = {D, SHORT_NOTE};
        melody[6] = {C_SHARP, SHORT_NOTE};
        melody[7] = {B, LONG_NOTE};
        melody[8] = {B, LONG_NOTE};
        melody[9] = {C_SHARP, LONG_NOTE};
        melody[10] = {D, LONG_NOTE};
        melody[11] = {D, SHORT_NOTE};
        melody[12] = {C_SHARP, SHORT_NOTE};
        melody[13] = {B, SHORT_NOTE};
        melody[14] = {C_SHARP, SHORT_NOTE};
        melody[15] = {D_SHARP, SHORT_NOTE};
        melody[16] = {F_SHARP, SHORT_NOTE};
        melody[17] = {G_SHARP, SHORT_NOTE};
        melody[18] = {D_SHARP, SHORT_NOTE};
        melody[19] = {F_SHARP, SHORT_NOTE};
        melody[20] = {C_SHARP, SHORT_NOTE};
        melody[21] = {D, SHORT_NOTE};
        melody[22] = {B, SHORT_NOTE};
        melody[23] = {C_SHARP, SHORT_NOTE};
        melody[24] = {B, SHORT_NOTE};
    end

    always @ (posedge clk) begin
        if (!rst_n) begin
            melody_pos <= 0;
            pwm_pos <= 0;
            do_note <= 1'b1;
            note_pos <= 0;
            //extended_sample <= {EXTENDED_SAMPLE_BITS{1'b0}};
        end else begin
            if (pwm_pos == SAMPLE_SIZE) begin
                pwm_pos <= 0;

                if (do_note && note_length == SHORT_NOTE && note_pos == SHORT_SAMPLES) begin
                    do_note <= 1'b0;
                    note_pos <= 0;
                end else if (do_note && note_length == LONG_NOTE && note_pos == LONG_SAMPLES) begin
                    do_note <= 1'b0;
                    note_pos <= 0;
                end else if (!do_note && note_pos == SPACE_SAMPLES) begin
                    do_note <= 1'b1;
                    note_pos <= 0;

                    if (melody_pos == 24) begin
                        melody_pos <= 0;
                    end else begin
                        melody_pos <= melody_pos + 1;
                    end
                end else begin
                    note_pos <= note_pos + 1;
                end

                if (do_note) begin
                    extended_sample <= extended_sample + increments[note];
                end
                
            end else begin
                pwm_pos <= pwm_pos + 1;
            end
        end
    end
endmodule
