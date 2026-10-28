module master_slave (Clock, D, Q);
	input Clock, D;
	output Q;

	wire Qm;

	d_latch M (.Clk(~Clock), .D(D), .Q(Qm));
	d_latch S (.Clk(Clock), .D(Qm), .Q(Q));
endmodule