module tb_adder();
reg signed [7:0]A,B;
wire signed [9:0] S;

adder DUT(.A(A), .B(B), .S(S));

initial
begin
	$monitor($time, " A = %d, B = %d, S = %d", A,B,S);
	A = -4; B = 0;
end

endmodule
