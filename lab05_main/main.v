module main(
	// Pinout Assignment
	input 	MAX10_CLK1_50,
	input		[9:0]		SW,
	input		[1:0]		KEY,
	output	[9:0]		LEDR,
	output	[35:0]	GPIO,
	output	[7:0]		HEX0,
	output	[7:0]		HEX1,
	output	[7:0]		HEX2,
	output	[7:0]		HEX3,
	output	[7:0]		HEX4,
	output	[7:0]		HEX5
	);
	
	wire [7:0] s;
	
multiplier M0(
	.a(SW[7:4]),
	.b(SW[3:0]),
	.p(s)
);

seg7Decoder S0(
	.m(s[3:0]),
	.out(HEX0)
	);

seg7Decoder S1(
	.m(s[7:4]),
	.out(HEX1)
	);
	

seg7Decoder S2(
	.m(SW[3:0]),
	.out(HEX3)
	);

seg7Decoder S3(
	.m(SW[7:4]),
	.out(HEX5)
	);
	
	
assign HEX2 = 8'hFF;
assign HEX4 = 8'hFF;

endmodule