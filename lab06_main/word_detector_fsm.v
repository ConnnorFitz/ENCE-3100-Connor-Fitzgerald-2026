module word_detector_fsm(
input clk,
input char_rdy,
input reset,
input [7:0] char,
output detected
);


// states  (A = IDLE)
localparam [2:0] A = 3'b000, B = 3'b001, C = 3'b010, D = 3'b011, E = 3'b100, F = 3'b101;

reg [2:0] state = A, next_state;



// sequential reset block
always @(posedge clk) begin
	if(reset)
	state <= A;
	else
	if(char_rdy)
	state <= next_state;
end
	always @(*) begin
	next_state = (char == "a") ? B : A;
		case(state)
		B: if (char == "p") next_state = C;
		C: if (char == "p") next_state = D;
		D: if (char == "l") next_state = E;
		E: if (char == "e") next_state = F;
	endcase
end
	

	assign detected = (state == F);
	
endmodule	
	
