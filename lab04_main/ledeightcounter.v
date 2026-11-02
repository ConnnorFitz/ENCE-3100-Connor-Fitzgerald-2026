module ledeightcounter(
input IN_clk,
input IN_clear,
input IN_enable,
output eightout

	);
//SW[0] = enable
//SW[1] = clear
//IN_clk needs MAX10_CLK1_50
//IN_clear needs SW[1]
// IN_enable needs SW[0]
// eightout == [7:0]Q

wire w_clk;

counter C0(
.in_clk(IN_clk),
.clear(IN_clear),
.out_clk(w_clk)
);

wire w_and;
wire w_or;
assign w_and = (IN_clk & IN_clear);
or(w_or, w_and, w_clk);


eightbitcounter E0(
	.enable(IN_enable),
	.clock(w_or),
	.clear(IN_clear),
	.Q(eightout)
	);
	
	endmodule
