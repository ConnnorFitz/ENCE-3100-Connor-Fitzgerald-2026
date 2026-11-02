module eightbitcounter(
input enable,
input clock,
input clear,
output [7:0]Q
);


wire [7:0]q;
wire a0, a1, a2, a3, a4, a5, a6; 
wire ena;
wire clk;
wire clr;

assign ena = enable;
assign clr = clear;
assign clk = clock;


and(a0,ena,q[0]);
and(a1,a0,q[1]);
and(a2,a1,q[2]);

and(a3,a2,q[3]);
and(a4,a3,q[4]);
and(a5,a4,q[5]);

and(a6,a5,q[6]);
and(a7,a6,q[7]);

t_flip_flop T0(
	.t(ena),
	.clk(clk),
	.clear(clr),
	.Qt(q[0])
);

t_flip_flop T1(
	.t(a0),
	.clk(clk),
	.clear(clr),
	.Qt(q[1])
);

t_flip_flop T2(
	.t(a1),
	.clk(clk),
	.clear(clr),
	.Qt(q[2])
);

t_flip_flop T3(
	.t(a2),
	.clk(clk),
	.clear(clr),
	.Qt(q[3])
);
t_flip_flop T4(
	.t(a3),
	.clk(clk),
	.clear(clr),
	.Qt(q[4])
);
t_flip_flop T5(
	.t(a4),
	.clk(clk),
	.clear(clr),
	.Qt(q[5])
);
t_flip_flop T6(
	.t(a5),
	.clk(clk),
	.clear(clr),
	.Qt(q[6])
);
t_flip_flop T7(
	.t(a6),
	.clk(clk),
	.clear(clr),
	.Qt(q[7])
);

assign Q[7:0] = q[7:0];

endmodule
