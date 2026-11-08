module part4(
	// Pinout Assignment
	input 	MAX10_CLK1_50,
	input		[9:0]		SW,
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
	 
	reg [7:0] A, B;
	reg [15:0] P;
	wire [15:0] prod;
	
eightmultiplier E0(
	.a(A),
	.b(B),
	.p(prod)
);

always @(posedge MAX10_CLK1_50 or negedge  rst_n)
	if(!rst_n) begin
	A <= 8'd0;
	B <= 8'd0;
	P <= 16'd0;
	end 
	else begin
	if (step) begin
	if (SW[8]) 
		B <= SW[7:0];
	else
		A <= SW[7:0];
	end
	P <= prod;
end

	wire [7:0] nw = SW[8] ? B : A;

seg7Decoder S0(
	.m(P[3:0]),
	.out(HEX0)
	);
	
seg7Decoder S1(
	.m(P[7:4]),
	.out(HEX1)
	);
	
seg7Decoder S2(
	.m(P[11:8]),
	.out(HEX2)
	);
	
seg7Decoder S3(
	.m(P[15:12]),
	.out(HEX3)
	);
	
seg7Decoder S4(
	.m(nw[3:0]),
	.out(HEX4)
	);

	seg7Decoder S5(
	.m(nw[7:4]),
	.out(HEX5)
	);
	
	assign LEDR = {1'b0, SW[8], 8'd0};
	
endmodule
	
	
	
	
	
	
	
	
	