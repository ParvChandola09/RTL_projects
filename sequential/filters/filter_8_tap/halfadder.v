module halfadder(
	input a,
	input b,
	output wire sum,
	output wire carry);

xor G1 (sum,a,b);
and G2 (carry,a,b);

endmodule
