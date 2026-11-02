module lpmcounter16(
	input enable,
	input clock,
	input clear,
	output [15:0] Q
);

lpm_counter #(
	.lpm_width(16),
	.lpm_direction("UP"),
	.lpm_type("LPM_COUNTER")
) C0 (
	.clock(clock),
	.cnt_en(enable),
	.sclr(~clear),
	.q(Q)
);

endmodule