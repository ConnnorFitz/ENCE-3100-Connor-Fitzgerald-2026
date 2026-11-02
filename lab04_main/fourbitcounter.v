module fourbitcounter(
	input enable,
	input clock,
	input clear,
	output [3:0] Q
);

wire [3:0] t;

assign t[0] = enable;
assign t[1] = t[0] & Q[0];
assign t[2] = t[1] & Q[1];
assign t[3] = t[2] & Q[2];

t_flip_flop T0(.t(t[0]), .clk(clock), .clear(clear), .Qt(Q[0]));
t_flip_flop T1(.t(t[1]), .clk(clock), .clear(clear), .Qt(Q[1]));
t_flip_flop T2(.t(t[2]), .clk(clock), .clear(clear), .Qt(Q[2]));
t_flip_flop T3(.t(t[3]), .clk(clock), .clear(clear), .Qt(Q[3]));

endmodule