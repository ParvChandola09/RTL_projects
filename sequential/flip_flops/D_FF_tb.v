module D_FF_tb();

reg D,clk,reset;
wire Q;

D_FF ff1(
	.D(D),
	.clk(clk),
	.reset(reset),
	.Q(Q)
	);


initial
begin
	clk = 1'b0;
	reset = 1'b0;
end

always #5 clk = ~clk;


initial
begin
	$monitor($time ," D = %d, reset = %d, Q = %d", D,reset,Q);
	$dumpfile("DFF.vcd");
	$dumpvars(0,D_FF_tb);
	#3 D = 1;
	#10 D = 1; reset=1;
	#10 D = 0;
	#10 D = 1;
	#10 D = 1;
	#50 $finish;
end

endmodule
