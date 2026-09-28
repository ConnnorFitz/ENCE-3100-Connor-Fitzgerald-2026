module rippleadd(
input [3:0]a,
input [3:0]b,
input cin,
output cout,
output [3:0]s
);



wire cr_0, cr_1, cr_2;

// fa#0
fa F0(
	.ci(cin),
	.a(a[0]),
	.b(b[0]),
	.s(s[0]),
	.co(cr_0)
);


// fa#1
fa F1(
	.ci(cr_0),
	.a(a[1]),
	.b(b[1]),
	.s(s[1]),
	.co(cr_1)
);

// fa#2
fa F2(
	.ci(cr_1),
	.a(a[2]),
	.b(b[2]),
	.s(s[2]),
	.co(cr_2)
);

// fa#3
fa F3(
	.ci(cr_2),
	.a(a[3]),
	.b(b[3]),
	.s(s[3]),
	.co(cout)
);

endmodule