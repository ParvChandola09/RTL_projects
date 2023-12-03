module adder(
	input signed [6:0]A,
	input signed [6:0]B,
	output signed [7:0]S
	);

wire [7:0] X,Y;
assign X = {{A[6]},{A}};
assign Y = {{B[6]},{B}};

wire C0,C1,C2,C3,C4,C5,C6,C7;

fulladder FA0(X[0],Y[0],1'b0,S[0],C0);
fulladder FA1(X[1],Y[1],C0,S[1],C1);
fulladder FA2(X[2],Y[2],C1,S[2],C2);
fulladder FA3(X[3],Y[3],C2,S[3],C3);
fulladder FA4(X[4],Y[4],C3,S[4],C4);
fulladder FA5(X[5],Y[5],C4,S[5],C5);
fulladder FA6(X[6],Y[6],C5,S[6],C6);
fulladder FA7(X[7],Y[7],C6,S[7],C7);

endmodule
