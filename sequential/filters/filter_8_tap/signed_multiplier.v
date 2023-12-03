module signed_multiplier #
	(
	parameter N = 8
	)
	(
	input [N-1:0] A,
	input [N-1:0] B,

	output [2*N-1:0] product
	);

wire [2*N-1:0] prod1,prod2,prod3,prod4,prod5,prod6,prod7,prod8;

// multiplication of A with each bit of B
and_signed_mult #(.N(N)) and1
	(
	.A(A),
	.B(B[0]),
	.Y(prod1)
	);

and_signed_mult #(.N(N)) and2
	(
	.A(A),
	.B(B[1]),
	.Y(prod2)
	); 

and_signed_mult #(.N(N)) and3
	(
	.A(A),
	.B(B[2]),
	.Y(prod3)
	);

and_signed_mult #(.N(N)) and4
	(
	.A(A),
	.B(B[3]),
	.Y(prod4)
	);

and_signed_mult #(.N(N)) and5
	(
	.A(A),
	.B(B[4]),
	.Y(prod5)
	);

and_signed_mult #(.N(N)) and6
	(
	.A(A),
	.B(B[5]),
	.Y(prod6)
	);

and_signed_mult #(.N(N)) and7
	(
	.A(A),
	.B(B[6]),
	.Y(prod7)
	);

and_signed_mult #(.N(N)) and8
	(
	.A(A),
	.B(B[7]),
	.Y(prod8)
	);


wire [2*N-1:0] p1,p2,p3,p4,p5,p6,p7,p8;
//shifted values
assign p1 = prod1;
assign p2 = prod2<<1;
assign p3 = prod3<<2;
assign p4 = prod4<<3;
assign p5 = prod5<<4;
assign p6 = prod6<<5;
assign p7 = prod7<<6;
assign p8 = prod8<<7;

//adding the outputs
wire [2*N-1:0]S0,S1,S2,S3,S00,S11,S2p7;
wire C0,C1,C2,C3,C4,C5,C6,ovp,ovn;

ripple_16_bit A1
	(
	.A(p1),
	.B(p2),
	.S(S0),
	.Cout(C0)
	);

ripple_16_bit A2
	(
	.A(p3),
	.B(p4),
	.S(S1),
	.Cout(C1)
	);

ripple_16_bit A3
	(
	.A(p5),
	.B(p6),
	.S(S2),
	.Cout(C2)
	);

ripple_16_bit A4
	(
	.A(S2),
	.B(p7),
	.S(S2p7),
	.Cout(C3)
	);

ripple_16_bit A5
	(
	.A(S0),
	.B(S1),
	.S(S00),
	.Cout(C4)
	);

ripple_16_bit A6
	(
	.A(S00),
	.B(S2p7),
	.S(S11),
	.Cout(C5)
	);

subtractor_16_bit sub1
	(
	.A(S11),
	.B(p8),
	.sub(product),
	.OvP(ovp),
	.OvN(ovn)
	);

endmodule
