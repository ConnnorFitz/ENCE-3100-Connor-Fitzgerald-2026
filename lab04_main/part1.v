module part1(
	// Pinout Assignment
	input 	MAX10_CLK1_50,
	input		[7:0]		SW,
	input		[1:0]		KEY,
	output	[7:0]		LEDR,
	output	[35:0]	GPIO,
	output	[7:0]		HEX0,
	output	[7:0]		HEX1,
	output	[7:0]		HEX2,
	output	[7:0]		HEX3,
	output	[7:0]		HEX4,
	output	[7:0]		HEX5
	);
//SW[0] = enable
//SW[1] = clear

wire [7:0] q;

reg [1:0]  key_sync = 2'b11;
reg [19:0] db_cnt = 0;
reg        key_db = 1'b1, key_db_prev = 1'b1;

always @(posedge MAX10_CLK1_50) begin
	key_sync <= {key_sync[0], KEY[0]};
	if (key_sync[1] == key_db)
		db_cnt <= 0;
	else begin
		db_cnt <= db_cnt + 1'b1;
		if (&db_cnt)
			key_db <= key_sync[1];
	end
	key_db_prev <= key_db;
end

wire press = key_db_prev & ~key_db;


wire [3:0] ones = q % 10;
wire [3:0] tens = q / 10;


eightbitcounter E0(
	.enable(SW[0] & press),
	.clock(MAX10_CLK1_50),
	.clear(SW[1]),
	.Q(q)
	);
	

seg7Decoder S0(
	.m(ones),
	.out(HEX0)
	);
	
seg7Decoder S1(
	.m(tens),
	.out(HEX1)
	);
	
assign LEDR = q;
	endmodule
