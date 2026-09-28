module p3(
input [9:0]SW,
output [9:0]LEDR
);



wire cr_0, cr_1, cr_2;

// fa#0
fa F0(
	.ci(SW[8]),
	.a(SW[0]),
	.b(SW[4]),
	.s(LEDR[0]),
	.co(cr_0)
);


// fa#1
fa F1(
	.ci(cr_0),
	.a(SW[1]),
	.b(SW[5]),
	.s(LEDR[1]),
	.co(cr_1)
);

// fa#2
fa F2(
	.ci(cr_1),
	.a(SW[2]),
	.b(SW[6]),
	.s(LEDR[2]),
	.co(cr_2)
);

// fa#3
fa F3(
	.ci(cr_2),
	.a(SW[3]),
	.b(SW[7]),
	.s(LEDR[3]),
	.co(LEDR[4])
);

endmodule