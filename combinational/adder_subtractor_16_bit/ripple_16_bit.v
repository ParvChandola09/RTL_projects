//16 bit ripple carry adder

module ripple_16_bit(
	input [15:0]A,
	input [15:0]B,
	output [15:0]S,
	output Cout);

wire C0,C1,C2,C3,C4,C5,C6,C7,C8,C9,C10,C11,C12,C13,C14;

fulladder FA0(A[0],B[0],1'b0,S[0],C0);
fulladder FA1(A[1],B[1],C0,S[1],C1);
fulladder FA2(A[2],B[2],C1,S[2],C2);
fulladder FA3(A[3],B[3],C2,S[3],C3);
fulladder FA4(A[4],B[4],C3,S[4],C4);
fulladder FA5(A[5],B[5],C4,S[5],C5);
fulladder FA6(A[6],B[6],C5,S[6],C6);
fulladder FA7(A[7],B[7],C6,S[7],C7);
fulladder FA8(A[8],B[8],C7,S[8],C8);
fulladder FA9(A[9],B[9],C8,S[9],C9);
fulladder FA10(A[10],B[10],C9,S[10],C10);
fulladder FA11(A[11],B[11],C10,S[11],C11);
fulladder FA12(A[12],B[12],C11,S[12],C12);
fulladder FA13(A[13],B[13],C12,S[13],C13);
fulladder FA14(A[14],B[14],C13,S[14],C14);
fulladder FA15(A[15],B[15],C14,S[15],Cout);

endmodule
