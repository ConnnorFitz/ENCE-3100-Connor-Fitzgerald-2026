module p5
(
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

wire [3:0] state;
wire z = state[3];

fourbitcounter CNT(
	.enable(tick),
	.clock(MAX10_CLK1_50),
	.clear(z),
	.Q(state)
);

wire [2:0] s = state[2:0];

helloDecoder D5(
	.m(s + 3'd2), 
	.out(HEX5)
);
helloDecoder D4(
	.m(s + 3'd3), 
	.out(HEX4)
);
helloDecoder D3(
	.m(s + 3'd4), 
	.out(HEX3)
);
helloDecoder D2(
	.m(s + 3'd5), 
	.out(HEX2)
);
helloDecoder D1(
	.m(s + 3'd6), 
	.out(HEX1)
);
helloDecoder D0(
	.m(s + 3'd7), 
	.out(HEX0)
);

assign LEDR = {4'b0, state};

endmodule