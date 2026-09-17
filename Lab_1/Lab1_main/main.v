module main (
input  [9:0]SW,
output [6:0]HEX0,
output [6:0]HEX1,
output [6:0]HEX2,
output [6:0]HEX3,
output [6:0]HEX4,
output [6:0]HEX5
);
wire [2:0] s = SW[9:7];
wire [2:0] M0, M1, M2, M3, M4, M5;   
p5 P0(s,4,4,4,0,1,2,2,3, M0);  
p5 P1 (s,4,4,0,1,2,2,3,4, M1); 
p5 P2 (s,4,0,1,2,2,3,4,4, M2);
p5 P3(s, 0,1,2,2,3,4,4,4, M3); 
p5 P4(s, 1,2,2,3,4,4,4,0, M4);
p5 P5(s,2,2,3,4,4,4,0,1, M5);
p4 D5(M0,HEX5);
p4 D4 (M1,HEX4);
p4 D3 (M2,HEX3);
p4 D2 (M3, HEX2);
p4 D1 (M4, HEX1);
p4 D0 (M5, HEX0);
endmodule