module and_signed_mult #
	(
	parameter N=8
	)
	(
	input [N-1:0] A,
	input B,
	output [2*N-1:0] Y
	);

wire [N-1:0] B_pad,Y_pad;
assign B_pad = {8{B}};
assign Y_pad = A&B_pad;
assign Y = {{8{Y_pad[7]}},Y_pad};

endmodule	
