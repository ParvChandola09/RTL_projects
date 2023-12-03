module and_mult #
	(
	parameter N=8
	)
	(
	input [N-1:0] A,
	input B,
	output [2*N-1:0] Y
	);

wire [N-1:0] B_pad, Y_8bit;
assign B_pad = {8{B}}; //making B same in no. of bits as A
assign Y_8bit = A&B_pad; 
assign Y = {{8{1'b0}},Y_8bit}; //padding with zeroes

endmodule	
