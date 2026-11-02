module helloDecoder(
	input [2:0] m,
	output reg [7:0] out
);

always @(*)
	case (m)
		3'd3: out = 8'b10001001;
		3'd4: out = 8'b10000110;
		3'd5: out = 8'b11000111;
		3'd6: out = 8'b11000111;
		3'd7: out = 8'b11000000;
		default: out = 8'b11111111;
	endcase

endmodule