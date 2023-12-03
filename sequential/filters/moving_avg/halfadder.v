module halfadder(
	input a,
	input b,
	output wire sum,
	output wire carry);

xor #1 G1 (sum,a,b);
and #1 G2 (carry,a,b);

endmodule
