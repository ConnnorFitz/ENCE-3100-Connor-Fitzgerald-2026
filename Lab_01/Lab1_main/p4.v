module p4 (c, HEX0);
input  [2:0]c;
 output [6:0]HEX0;

   wire c0 = c[0];
 wire c1 = c[1];
    wire c2 = c[2];

  assign HEX0[0] = c2 | ~c0;
  assign HEX0[1] = c2 | (c1 & ~c0) | (~c1 & c0);
  assign HEX0[2] = c2 | (c1 & ~c0) | (~c1 & c0);
    assign HEX0[3] = c2 | (~c1 & ~c0);
    assign HEX0[4] = c2;
    assign HEX0[5] = c2;
    assign HEX0[6] = c2 | c1;

endmodule