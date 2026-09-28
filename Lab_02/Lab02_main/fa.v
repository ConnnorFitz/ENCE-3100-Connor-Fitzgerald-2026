module fa(
input ci,
input a,
input b,
output s,
output co
);

wire x1,x2;
wire m1;


xor(x1,a,b);
xor(x2, x1, ci);
assign s = x2;



mux_2_1 M0(
		.s(x1),
		.x(b),
		.y(ci),
		.m(co)
	);

endmodule