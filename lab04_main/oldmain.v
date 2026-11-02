module oldmain(
	// Pinout Assignment
	input 	MAX10_CLK1_50,
	input		[7:0]		SW,
	input		[1:0]		KEY,
	output	[7:0]		LEDR,
	output	[35:0]	GPIO,
	output	[7:0]		HEX0,
	output	[7:0]		HEX1,
	output	[7:0]		HEX2,
	output	[7:0]		HEX3,
	output	[7:0]		HEX4,
	output	[7:0]		HEX5
	);
//SW[0] = enable
//SW[1] = clear

wire w_clk;

counter C0(
.in_clk(MAX10_CLK1_50),
.clear(SW[1]),
.out_clk(w_clk)
);

wire w_and;
wire w_or;
assign w_and = (SW[1] & MAX10_CLK1_50);
or(w_or, w_and, w_clk);


eightbitcounter E0(
	.enable(SW[0]),
	.clock(w_or),
	.clear(SW[1]),
	.Q(LEDR)
	);
	
	endmodule
