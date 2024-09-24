module styler_linegen (
	input wire [3:0] scanlineIn,
	input wire yoffset,
	input wire yscale,
	input wire faint,
	input wire inverse,
	input wire underline,
	input wire strikethru,
	input wire overline,
	input wire doubleUnderline,
	input wire doubleStrikethru,
	input wire doubleOverline,
	input wire dottedUnderline,
	input wire dottedStrikethru,
	input wire dottedOverline,
	input wire faintPhase,
	input wire lineEnable,
	input wire cursorEnable,
	input wire cursorBlink,
	input wire cursorPhase,
	input wire cursorTop,
	input wire cursorBottom,
	input wire yPreMirror,
	input wire yPostMirror,
	output wire [3:0] scanlineOut,
	output wire inverseOut,
	output wire faintOut,
	output wire faintPhaseOut,
	output wire solidLineOut
);

	wire [3:0] s0 = scanlineIn;
	wire [3:0] s1 = yPreMirror ? (s0 ^ 4'hF) : s0;

	wire sl0 = lineEnable & (underline | doubleUnderline | dottedUnderline) & (doubleUnderline ? (s1 == 13 || s1 == 15) : (s1 == 13));
	wire sl1 = lineEnable & (strikethru | doubleStrikethru | dottedStrikethru) & (doubleStrikethru ? (s1 == 6 || s1 == 8) : (s1 == 7));
	wire sl2 = lineEnable & (overline | doubleOverline | dottedOverline) & (doubleOverline ? (s1 == 0 || s1 == 2) : (s1 == 0));
	wire solidLine = sl0 | sl1 | sl2;
	wire dottedLine = (sl0 & dottedUnderline) | (sl1 & dottedStrikethru) | (sl2 & dottedOverline);
	wire cursor = cursorEnable & (cursorPhase | ~cursorBlink) & (
		(~(cursorTop | cursorBottom)) | (cursorTop & (s1 < 3)) | (cursorBottom & (s1 > 12))
	);

	wire [3:0] s2 = yscale ? {1'b0, s1[3:1]} : s1;
	wire [3:0] s3 = yoffset ? (s2 ^ 4'h8) : s2;
	wire [3:0] s4 = yPostMirror ? (s3 ^ 4'hF) : s3;

	assign scanlineOut = s4;
	assign inverseOut = inverse ^ cursor;
	assign faintOut = faint | dottedLine;
	assign faintPhaseOut = faintPhase ^ s1[0];
	assign solidLineOut = solidLine;

endmodule


module styler_style (
	input wire [15:0] bitmapIn,
	input wire xoffset,
	input wire xscale,
	input wire bold,
	input wire faint,
	input wire faintPhase,
	input wire solidLine,
	input wire italic,
	input wire reverse,
	input wire xPreMirror,
	input wire [3:0] scanline,
	output wire [15:0] bitmapOut
);

	wire [15:0] b0 = bitmapIn;
	wire [15:0] b1 = xPreMirror ? {
		b0[0], b0[1], b0[2], b0[3], b0[4], b0[5], b0[6], b0[7],
		b0[8], b0[9], b0[10], b0[11], b0[12], b0[13], b0[14], b0[15]
	} : b0;
	wire [15:0] b2 = (
		(italic & ~reverse) ? (
			(scanline < 4) ? {2'b00, b1[15:2]} :
			(scanline < 8) ? {1'b0, b1[15:1]} :
			(scanline < 12) ? b1[15:0] :
			{b1[14:0], 1'b0}
		) :
		(reverse & ~italic) ? (
			(scanline < 4) ? {b1[13:0], 2'b00} :
			(scanline < 8) ? {b1[14:0], 1'b0} :
			(scanline < 12) ? b1[15:0] :
			{1'b0, b1[15:1]}
		) :
		b1
	);
	wire [15:0] b3 = bold ? (b2 | {1'b0, b2[15:1]}) : b2;
	wire [15:0] b4 = xoffset ? {b3[7:0], b3[15:8]} : b3;
	wire [15:0] b5 = xscale ? {
		b4[15], b4[15], b4[14], b4[14], b4[13], b4[13], b4[12], b4[12],
		b4[11], b4[11], b4[10], b4[10], b4[9], b4[9], b4[8], b4[8]
	} : b4;
	wire [15:0] b6 = solidLine ? 16'hFFFF : b5;
	wire [15:0] b7 = faint ? (b6 & (faintPhase ? 16'hAAAA : 16'h5555)) : b6;

	assign bitmapOut = b7;

endmodule


module styler_invert (
	input wire [15:0] bitmapIn,
	input wire blink,
	input wire alternate,
	input wire inverse,
	input wire hidden,
	input wire blinkPhase,
	input wire blinkEnable,
	input wire faint,
	input wire faintPhase,
	input wire solidLine,
	input wire xPostMirror,
	output wire [15:0] bitmapOut
);

	wire [15:0] b0 = bitmapIn;
	wire [15:0] b1 = solidLine ? 16'hFFFF : b0;
	wire [15:0] b2 = faint ? (b1 & (faintPhase ? 16'hAAAA : 16'h5555)) : b1;
	wire [15:0] b3 = hidden ? 16'h0000 : b2;
	wire [15:0] b4 = (blink & blinkPhase & blinkEnable) ? 16'h0000 : b3;
	wire [15:0] b5 = (alternate & blinkPhase & blinkEnable) ? (b4 ^ 16'hFFFF) : b4;
	wire [15:0] b6 = inverse ? (b5 ^ 16'hFFFF) : b5;
	wire [15:0] b7 = xPostMirror ? {
		b6[0], b6[1], b6[2], b6[3], b6[4], b6[5], b6[6], b6[7],
		b6[8], b6[9], b6[10], b6[11], b6[12], b6[13], b6[14], b6[15]
	} : b6;

	assign bitmapOut = b7;

endmodule


module styler (
	input wire [3:0] scanlineIn,
	input wire [15:0] bitmapIn,
	input wire xoffset,
	input wire xscale,
	input wire yoffset,
	input wire yscale,
	input wire xPreMirror,
	input wire xPostMirror,
	input wire yPreMirror,
	input wire yPostMirror,
	input wire bold,
	input wire faint,
	input wire italic,
	input wire reverseItalic,
	input wire blink,
	input wire alternate,
	input wire inverse,
	input wire hidden,
	input wire underline,
	input wire doubleUnderline,
	input wire dottedUnderline,
	input wire strikethru,
	input wire doubleStrikethru,
	input wire dottedStrikethru,
	input wire overline,
	input wire doubleOverline,
	input wire dottedOverline,
	input wire blinkEnable,
	input wire lineEnable,
	input wire cursorEnable,
	input wire cursorBlink,
	input wire cursorTop,
	input wire cursorBottom,
	input wire faintPhase,
	input wire blinkPhase,
	input wire cursorPhase,
	output wire [3:0] scanlineOut,
	output wire [15:0] bitmapOut
);

	wire inverseInt;
	wire faintInt;
	wire faintPhaseInt;
	wire solidLineInt;
	wire [15:0] bitmapInt;

	styler_linegen lg(
		scanlineIn,
		yoffset,
		yscale,
		faint,
		inverse,
		underline,
		strikethru,
		overline,
		doubleUnderline,
		doubleStrikethru,
		doubleOverline,
		dottedUnderline,
		dottedStrikethru,
		dottedOverline,
		faintPhase,
		lineEnable,
		cursorEnable,
		cursorBlink,
		cursorPhase,
		cursorTop,
		cursorBottom,
		yPreMirror,
		yPostMirror,
		scanlineOut,
		inverseInt,
		faintInt,
		faintPhaseInt,
		solidLineInt
	);

	styler_style sty(
		bitmapIn,
		xoffset,
		xscale,
		bold,
		faintInt,
		faintPhaseInt,
		solidLineInt,
		italic,
		reverseItalic,
		xPreMirror,
		scanlineOut,
		bitmapInt
	);

	styler_invert inv(
		bitmapInt,
		blink,
		alternate,
		inverseInt,
		hidden,
		blinkPhase,
		blinkEnable,
		faintInt,
		faintPhaseInt,
		solidLineInt,
		xPostMirror,
		bitmapOut
	);

endmodule
