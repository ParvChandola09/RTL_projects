module ripple_carry_adder(
	input [7:0]A,
	input [7:0]B,
	output [7:0]S,
	output Cout);

wire C0,C1,C2,C3,C4,C5,C6;
fulladder FA0(A[0],B[0],1'b0,S[0],C0);
fulladder FA1(A[1],B[1],C0,S[1],C1);
fulladder FA2(A[2],B[2],C1,S[2],C2);
fulladder FA3(A[3],B[3],C2,S[3],C3);
fulladder FA4(A[4],B[4],C3,S[4],C4);
fulladder FA5(A[5],B[5],C4,S[5],C5);
fulladder FA6(A[6],B[6],C5,S[6],C6);
fulladder FA7(A[7],B[7],C6,S[7],Cout);

endmodule

//full adder
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
