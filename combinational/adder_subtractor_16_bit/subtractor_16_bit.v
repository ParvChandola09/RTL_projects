module subtractor_16_bit(
	input signed[15:0]A,
	input signed[15:0]B,
	output signed[15:0]sub,
	output OvP,
	output OvN);

//for calculating the complement of B
wire signed[15:0]B_negation;
wire [15:0]comp = 16'b0000000000000001;
wire signed[15:0]B_comp;
wire Cout,borrow;
assign B_negation = ~B;
ripple_16_bit RP0(B_negation,comp,B_comp,Cout);

//for subtraction
ripple_16_bit RP1(A,B_comp,sub,borrow);
assign OvN = A[15]&B_comp[15]&~sub[15];
assign OvP = ~A[15]&~B_comp[15]&sub[15];
endmodule


