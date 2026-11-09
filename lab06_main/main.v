
`default_nettype none

module main(
	// Board I/Os
	input		MAX10_CLK1_50,
	input 	[9:0]		SW,
	output	[9:0]		LEDR,
	inout		[35:0]	GPIO,
	output 	[7:0]		HEX0, HEX1, HEX2, HEX3, HEX4, HEX5
	//inout		[15:0]	ARDUINO_IO
);

	
	wire w_clk = MAX10_CLK1_50;
	wire RxD_data_ready;
	wire [7:0] RxD_data;
	reg [7:0] GPout;

	async_receiver RX(
		.clk(w_clk), 
		.RxD(GPIO[35]), 
		.RxD_data_ready(RxD_data_ready), 
		.RxD_data(RxD_data)
	);
	
	always @(posedge w_clk) 
		if(RxD_data_ready) 
			GPout <= RxD_data;

	async_transmitter TX(
		.clk(w_clk), 
		.TxD(GPIO[33]), 
		.TxD_start(RxD_data_ready), 
		.TxD_data(RxD_data)
	);
	
	
	wire detected;
	
word_detector_fsm F0(
	.clk(w_clk),
	.char_rdy(RxD_data_ready),
	.reset(SW[9]),
	.char(RxD_data),
	.detected(detected)
);


	localparam timer = 25_000_000;
	
	reg [24:0] t_count = 0;
	reg [3:0] half = 0;
	
	always @(posedge w_clk)
	if(RxD_data_ready) begin
		t_count <= 25'd0;
		half <= 4'd0;
		end
		else
		if(half != 4'd10) begin
			if(t_count == timer -1) begin
				t_count <= 25'd0;
				half <= half +4'd1;
			end
			else
			t_count <= t_count + 25'd1;
		end
		
	wire flashing = detected & (half != 4'd10);
	wire on = flashing & ~half[0];

	
	wire [7:0] seg_char, seg_a, seg_p, seg_l, seg_e;
	
char2seg CHAR(
		.char(GPout),
		.HEX0(seg_char)
);

char2seg A(
		.char("a"),
		.HEX0(seg_a)
);
	
char2seg P(
		.char("p"),
		.HEX0(seg_p)
);

char2seg L(
		.char("l"),
		.HEX0(seg_l)
);

char2seg E(
		.char("e"),
		.HEX0(seg_e)
);
	
	assign HEX0 = flashing ? (on ? seg_e : 8'hFF) : seg_char;
	assign HEX1 = on ? seg_l: 8'hFF;
	assign HEX2 = on ? seg_p: 8'hFF;
	assign HEX3 = on ? seg_p: 8'hFF;
	assign HEX4 = on ? seg_a: 8'hFF;
	assign HEX5 = 8'hFF;
	
	assign LEDR = {detected, 1'b0, GPout};
	
endmodule

`default_nettype wire
