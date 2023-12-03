module adder_10(
	input signed [9:0]A,
	input signed [9:0]B,
	output signed [11:0]S
	);
	
wire [11:0]X,Y;
assign X = {{2{A[9]}},A};
assign Y = {{2{B[9]}},B};
wire C0,C1,C2,C3,C4,C5,C6,C7,C8,C9,C10,C11;

fulladder FA0(X[0],Y[0],1'b0,S[0],C0);
fulladder FA1(X[1],Y[1],C0,S[1],C1);
fulladder FA2(X[2],Y[2],C1,S[2],C2);
fulladder FA3(X[3],Y[3],C2,S[3],C3);
fulladder FA4(X[4],Y[4],C3,S[4],C4);
fulladder FA5(X[5],Y[5],C4,S[5],C5);
fulladder FA6(X[6],Y[6],C5,S[6],C6);
fulladder FA7(X[7],Y[7],C6,S[7],C7);
fulladder FA8(X[8],Y[8],C7,S[8],C8);
fulladder FA9(X[9],Y[9],C8,S[9],C9);
fulladder FA10(X[10],Y[10],C9,S[10],C10);
fulladder FA11(X[11],Y[11],C10,S[11],C11);

endmodule
