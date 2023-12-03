module fulladder(
	input A,
	input B,
	input Cin,
	output sum,
	output carry);

wire S1,C1,C2;
halfadder HA1(A,B,S1,C1);
halfadder HA2(S1,Cin,sum,C2);
or #1 G1 (carry,C1,C2);

endmodule


