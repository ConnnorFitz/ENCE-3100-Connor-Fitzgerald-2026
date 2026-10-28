module part4 (D, Clock, Qa, Qb, Qc);
	input D, Clock;
	output Qa, Qb, Qc;

	d_latch L1 (.D(D), .Clk(Clock), .Q(Qa));
	D_pos F1 (.D(D), .Clk(Clock), .Q(Qb));
	D_neg F2 (.D(D), .Clk(Clock), .Q(Qc));
endmodule