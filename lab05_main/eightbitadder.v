module eightbitadder(
input [7:0] a, b,
input ci,
output [7:0] s,
output co
);

assign {co, s} = a + b + ci;

endmodule