module fulladder(
input a,
input b,
input ci,
output s,
output co
);

assign {co, s} = a + b + ci;

endmodule
