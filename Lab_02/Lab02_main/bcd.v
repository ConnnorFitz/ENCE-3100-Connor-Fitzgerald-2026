module bcd(
	input [3:0] in,
	output	[7:0]		H0,
	output	[7:0]		H1
);

	//assign LEDR[9:0] = SW[9:0];
	
	// PART II
	
	wire [3:0] w_m;
	
	// 7 Segment Display 
	seg7Decoder D0(
		.m(w_m), // 4bits
		.out(H0)  // 8bits
	);
	
	wire w_z;
	//assign w_z = SW[9];
	
	
	wire [2:0] w_ca;
	// MUltiplexers
	mux_2_1 M0(
		.s(w_z),
		.x(in[0]),
		.y(w_ca[0]),
		.m(w_m[0])
	);

	mux_2_1 M1(
		.s(w_z),
		.x(in[1]),
		.y(w_ca[1]),
		.m(w_m[1])
	);
	
	mux_2_1 M2(
		.s(w_z),
		.x(in[2]),
		.y(w_ca[2]),
		.m(w_m[2])
	);
	
	mux_2_1 M3(
		.s(w_z),
		.x(in[3]),
		.y(1'b0),
		.m(w_m[3])
	);
	
	// Circuit A
	CircuitA CA(
		.v({in[2], in[1], in[0]}),
		.out(w_ca)
	);
	
	// Comparator
	Comparator myC(
		.v({in[3], in[2], in[1], in[0]}),
		.z(w_z)	
	);
	
	// Circuit B
	CircuitB CB(
		.z(w_z),
		.s(H1)
	);
	
endmodule
