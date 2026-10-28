module pinout(
	// Pinout Assignment
	input		[9:0]		SW,
	input		[1:0]		Key,
	output	[9:0]		LEDR,
	output	[35:0]	GPIO,
	output	[7:0]		HEX0,
	output	[7:0]		HEX1,
	output	[7:0]		HEX2,
	output	[7:0]		HEX3,
	output	[7:0]		HEX4,
	output	[7:0]		HEX5
	);

	// Your Code
	// assign LEDR[9:0] = SW[9:0];
Seg7_Display SEG0(
	.bin_number(SW[3:0]),
	.seg_display(HEX0)
);

Seg7_Display SEG1(
	.bin_number(SW[7:4]),
	.seg_display(HEX1)
);

endmodule

