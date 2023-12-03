module JK_FF_tb();

reg J,K,clk,reset;
wire Q,Qn;

JK_FF ff1(
	.J(J),
	.K(K),
	.clk(clk),
	.reset(reset),
	.Q(Q),
	.Qn(Qn)
	);

initial
begin
	clk = 1'b0;
	reset = 1'b0;
end

always #5 clk = ~clk;

initial
begin
	$monitor($time ," J = %d, K = %d, reset = %d, Q = %d", J,K,reset,Q);
	$dumpfile("JKFF.vcd");
	$dumpvars(0,JK_FF_tb);
	#3 J=1; K=1;
	#10 reset=1; J=1; K=1;
	#10 J=0; K=1;
	#10 J=0; K=0;
	#10 J=1; K=0;
	#50 $finish;

end

endmodule
