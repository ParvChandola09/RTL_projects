module seq_detector_tb();

reg clk;
reg resetn;
wire bit_in;
wire z;

seq_detector DUT
	(
	.clk(clk),
	.resetn(resetn),
	.bit_in(bit_in),
	.z(z)
	);

initial
begin
	clk = 1'b0;
	resetn = 1'b0;
end

always #5 clk = ~clk;

PN_seq PN1 
	(
	.clk(clk),
	.reset(resetn),
	.Q(bit_in)
	);

initial 
begin
	$monitor($time, " z = %b", z);
	$dumpfile("sequence.vcd");
	$dumpvars(0,seq_detector_tb);
	#13 resetn = 1;
	#400 $finish;
end
	
endmodule	
