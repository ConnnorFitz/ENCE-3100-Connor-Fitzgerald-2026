module p5 (
input  [9:0]SW,
output [6:0]HEX0,
output [6:0]HEX1,
output [6:0]HEX2,
output [6:0]HEX3,
output [6:0]HEX4
);
wire [2:0] s = SW[9:7];
wire [2:0] M0, M1, M2, M3, M4;
   p3 P0 (s, 0,1,2,2,3, M0);
   p3 P1 (s, 1,2,2,3,0, M1); 
   p3 P2 (s, 2,2,3,0,1, M2);
   p3 P3 (s, 2,3,0,1,2, M3);
   p3 P4 (s, 3,0,1,2,2, M4);
		p4 D4 (M0, HEX4);
	 p4 D3 (M1, HEX3);
    p4 D2 (M2, HEX2);
    p4 D1 (M3, HEX1);
    p4 D0 (M4, HEX0);

endmodule