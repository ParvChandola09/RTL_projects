module SR_FF_tb();

reg S,R,clk,reset;
wire Q,Qn;

SR_FF ff1(
	.S(S),
	.R(R),
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
	$monitor($time ," S = %d, R = %d, reset = %d, Q = %d", S,R,reset,Q);
	$dumpfile("SRFF.vcd");
	$dumpvars(0,SR_FF_tb);
	#3 S=1; R=0;
	#10 reset=1;
	#10 S=0; R=0;
	#10 S=0; R=1;
	#10 S=1; R=0;
	#50 $finish;

end

endmodule

