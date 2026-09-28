module p1(
input [9:0] SW,
output [9:0] LEDR,



	input MAX10_CLK1_50,
	output [7:0] HEX0,
	output [7:0] HEX1,
	output [7:0] HEX2,
	output [7:0] HEX3,
	output [7:0] HEX4,
	output [7:0] HEX5
	);

	seg7Decoder DO(
	.m(SW[3:0]),
	.out(HEX0));
	
	seg7Decoder D1(
	.m(SW[7:4]),
	.out(HEX1));
	
	
endmodule