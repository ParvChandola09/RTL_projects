module multiplier_tb();
parameter N = 8;
reg [N-1:0]A,B;
wire [2*N-1:0] prod;

multiplier #(.N(N)) M1
	(
	.A(A),
	.B(B),
	.product(prod)
	);

initial 
begin
	$monitor($time , " A = %d, B = %d, Y = %d",A,B,prod);
	#10 A = 8'b11111111; B = 8'b11111111;  //A=255 and B=255
	#10 A = 8'b01101001; B = 8'b01001111;  //A=105 and B=79
end
endmodule



