module signed_multiplier_tb();
parameter N = 8;
reg signed [N-1:0]A,B;
wire signed [2*N-1:0] prod;

signed_multiplier #(.N(N)) M1
	(
	.A(A),
	.B(B),
	.product(prod)
	);

initial 
begin
	$monitor($time , " A = %d, B = %d, Y = %d",A,B,prod);
	#10 A = 7; B = 81; //2 x 3
	#10 A = -7; B = 81; //
	#10 A = 7; B = -81;
	#10 A = -7; B = -81; //-123x-79
	//#10 A = 8'b11111001; B = 8'b11111010;
	//#10 A = 8'b11100111; B = 8'b11100111;
	//#10 $finish;
end
endmodule
