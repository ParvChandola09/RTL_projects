module tb_bit_flip();
reg clk,resetn;
reg [0:14] y_r;
wire [0:9] check;
wire [0:14] y_n;

bit_flip DUT(.clk(clk), .resetn(resetn),.y_r(y_r), .check(check), .y_n(y_n));

initial
begin
	clk = 0;
	resetn = 0;
end

always #5 clk <= ~clk; 

initial 
begin	
	$dumpfile("bitflip.vcd");
	$dumpvars(0,tb_bit_flip);
	$monitor($time, "y_r = %b, check = %b, y_n=%b", y_r, check,y_n);
	//y_r = 15'b000000000000001;
	y_r = 15'b000000010000011;
	//y_r = 15'b100000000000000;
	#12 resetn=1; 
	#100 $finish;
end

endmodule
