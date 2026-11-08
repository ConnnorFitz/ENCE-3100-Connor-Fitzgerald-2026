module part1(
	// Pinout Assignment
	input 	MAX10_CLK1_50,
	input		[7:0]		SW,
	input		[1:0]		KEY,
	output	[9:0]		LEDR,
	output	[35:0]	GPIO,
	output	[7:0]		HEX0,
	output	[7:0]		HEX1,
	output	[7:0]		HEX2,
	output	[7:0]		HEX3,
	output	[7:0]		HEX4,
	output	[7:0]		HEX5
	);
	
reg [1:0]  key_sync = 2'b11;
reg [19:0] db_cnt = 0;
reg        key_db = 1'b1, key_db_prev = 1'b1;	

wire step = key_db_prev & ~key_db;
	
	always @(posedge MAX10_CLK1_50) begin
	key_sync <= {key_sync[0], KEY[1]};
	if (key_sync[1] == key_db)
		db_cnt <= 0;
	else begin
		db_cnt <= db_cnt + 1'b1;
		if (&db_cnt)
			key_db <= key_sync[1];
	end
	key_db_prev <= key_db;
end
    wire rst_n = KEY[0];
 
    reg  [7:0] A, S;
    reg        carry, overflow;
 
    wire [7:0] sum;
    wire       c_out;
 
    assign {c_out, sum} = A + S;
 
    wire ovf = (A[7] == S[7]) && (sum[7] != A[7]);
 
 
    always @(posedge MAX10_CLK1_50 or negedge rst_n)
        if (!rst_n) begin
            A        <= 8'd0;
            S        <= 8'd0;
            carry    <= 1'b0;
            overflow <= 1'b0;
        end else if(step) begin
            A        <= SW;
            S        <= sum;
            carry    <= c_out;
            overflow <= ovf;
        end
 
    assign LEDR = {overflow, carry, S};
	 

endmodule