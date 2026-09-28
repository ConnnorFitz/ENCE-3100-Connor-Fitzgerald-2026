module p4(
	input [9:0] SW,
	output [9:0] LEDR,
	
	input 	MAX10_CLK1_50,
	output	[7:0]		HEX0,
	output	[7:0]		HEX1,
	output	[7:0]		HEX2,
	output	[7:0]		HEX3,
	output	[7:0]		HEX4,
	output	[7:0]		HEX5
);

// need: [1:0]Ripple Adder, [2:0]Comparator, CircuitB, Seg7decoder |CHECK|

// !!wire everything!!
wire [3:0] a,b;

// SW to input assign
assign a[3:0] = SW[3:0];
assign b[3:0] = SW[7:4];
assign cin = SW[8];


// wire x
wire x_0;

// wire y
wire y_0;

// wire from first adder to OR gate
wire ra_cout;

// wire from first ripple to second ripple/third comp(C2)
wire [3:0]sr1;


// wire from C2 to OR gate
wire z_0;

// wire from second ripple adder to seg7decoder
wire [3:0]ss;


// top comparator
Comparator C0(
	.v(a[3:0]),
	.z(x_0)
);

// bottom comparator
Comparator C1(
	.v(b[3:0]),
	.z(y_0)
);

// first ripple adder
rippleadd R0(
	.a(a[3:0]),
	.b(b[3:0]),
	.cin(cin),
	.cout(ra_cout),
	.s(sr1)
);



// middle comparator
Comparator C2(
	.v(sr1),
	.z(z_0)
);


// or gate producing z variable
or(z_out, ra_cout, z_0);


// second ripple adder
rippleadd R1(
	.a(sr1),
	.b({1'b0,z_out, z_out, 1'b0}),
	.cin(1'b0),
	.cout(),
	.s(ss)
);



CircuitB B0(
	.z(z_out),
	.s(HEX1)
);



seg7Decoder S0(
	.m(ss),
	.out(HEX0)
);

// or gate lighting up led to show if bcd > 9
or(gt9,x_0,y_0);

// link to LEDR[0]
assign LEDR[0] = gt9;

endmodule