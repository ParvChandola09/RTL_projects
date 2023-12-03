module PN_seq_tb();
reg clk,reset;
wire [3:0]q;

PN_seq p1
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
	$dumpfile("PN.vcd");
	$dumpvars(0,PN_seq_tb);
	#13 reset = 1;
	#200 $finish;
		
end

endmodule
