module multiplier(
input [3:0] a,
input [3:0] b,
output [7:0] p
);

wire [3:0] pp [0:3];
wire [4:0] r [0:3];

genvar i, j;
generate
for (j=0; j <4; j=j +1) begin : and_row
	assign pp[j] = a & {4{b[j]}};
	end
	assign r[0] = {1'b0, pp[0]};
	for(j = 1; j < 4; j = j +1) begin: fa_row
	wire [4:0] c;
	assign c[0] = 1'b0;
	for (i = 0; i <4; i = i +1) begin : fa_cell
	fulladder u (
		.a(r[j-1][i+1]),
		.b(pp[j][i]),
		.ci(c[i]),
		.s(r[j][i]),
		.co(c[i+1])
	);	
	end
	assign r[j][4] = c[4];
	assign p[j] = r[j][0];
	end 
	endgenerate
	
assign p[0] = pp[0][0];
assign p[7:4] = r[3][4:1];
endmodule