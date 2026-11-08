module eightmultiplier(
input [7:0] a, b,
output [15:0] p
);

wire [7:0] pp [0:7];
wire [8:0] r [0:7];

genvar j;
generate
	for (j = 0; j < 8; j = j+1) begin : and_row
	assign pp[j] = a & {8{b[j]}};
	end
	assign r[0]  = {1'b0, pp[0]};
	
	for (j=1; j < 8; j = j +1) begin : add_row
	eightbitadder u (
		.a(r[j-1][8:1]), 
		.b(pp[j]),
		.ci(1'b0),
		.s(r[j][7:0]),
		.co(r[j][8])
	);
	assign p[j] = r[j][0];
	end
	endgenerate
	assign p[0] = pp[0][0];
	assign p[15:8] = r[7][8:1];

endmodule

