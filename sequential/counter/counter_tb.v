module counter_tb();
reg clk,reset;
wire [3:0]q;

counter c1
	(
	.clk(clk),
	.reset(reset),
	.q(q)
	);

initial
begin
	clk = 1'b0;
	reset = 1'b0;
end

always #5 clk = ~clk;

initial
begin
	$monitor($time, " q = %d", q);
	$dumpfile("count.vcd");
	$dumpvars(0,counter_tb);
	#13 reset=1;
	#200 $finish;
end

endmodule
	

