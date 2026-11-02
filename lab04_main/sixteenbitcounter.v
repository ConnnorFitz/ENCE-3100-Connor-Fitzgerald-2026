module sixteenbitcounter(
	input enable,
	input clock,
	input clear,
	output reg [15:0] Q
);

always @(posedge clock or negedge clear)
	if (!clear)
		Q <= 16'd0;
	else if (enable)
		Q <= Q + 1'b1;

endmodule