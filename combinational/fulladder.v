module fulladder(
	input A,
	input B,
	input Cin,
	output sum,
	output carry);

wire S1,C1,C2;
halfadder HA1(A,B,S1,C1);
halfadder HA2(S1,Cin,sum,C2);
assign carry = C1||C2;

endmodule


//Halfadder module
module halfadder(
	input a,
	input b,
	output wire sum,
	output wire carry);

assign sum = a^b;
assign carry = a&b;

endmodule
