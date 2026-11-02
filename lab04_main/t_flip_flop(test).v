module t_flip_floptest(
	// Pinout Assignment
	input		[9:0]		SW,
	output	[9:0]		LEDR
);

t_flip_flop T0(
	.t(SW[0]),
	.clk(SW[1]),
	.clear(SW[2]),
	.Qt(LEDR[0])
);

endmodule
