module t_flip_flop(
input t,
input clk,
input clear,
output Qt
);

// edge trigger flip flop
wire d;
reg q;

always @(posedge clk) begin
		if (clear)
		q <= 0;
		else
		q <= d;
	end
	assign d = (q & ~t) | (t & ~q);
	assign Qt = q;
endmodule
