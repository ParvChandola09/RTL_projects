module halfadder_tb();
reg A,B;
wire sum,carry;

halfadder HA(A,B,sum,carry);

initial
begin
	$monitor($time ," A = %b, B = %b, sum = %b, carry = %b",A,B,sum,carry);
	$dumpfile("halfadder.vcd");
	$dumpvars(0,halfadder_tb);
	#5 A = 0; B = 0;
	#5 A = 0; B = 1;
	#5 A = 1; B = 0;
	#5 A = 1; B = 1;
	#5 $finish;
end
endmodule


