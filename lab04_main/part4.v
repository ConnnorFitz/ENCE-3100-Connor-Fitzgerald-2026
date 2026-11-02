module part4(
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
	
reg [25:0] cnt = 0;
wire tick = (cnt == 26'd49_999_999);

always @(posedge MAX10_CLK1_50)
	cnt <= tick ? 26'd0 : cnt + 1'b1;
wire [3:0]  digit;
wire z;

Comparator CMP(
	.v(digit), 
	.z(z)
);


fourbitcounter DIG(
	.enable(tick), 
	.clock(MAX10_CLK1_50), 
	.clear(z), 
	.Q(digit)
);


seg7Decoder S0(
	.m(digit), 
	.out(HEX0)
	);

assign LEDR = {4'b0, digit};

endmodule