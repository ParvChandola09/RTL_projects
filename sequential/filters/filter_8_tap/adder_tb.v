module adder_tb();
reg signed [6:0] A,B;
wire signed [7:0]S;

adder add0(.A(A), .B(B), .S(S));

initial 
begin
	$dumpfile("adder.vcd");
	$dumpvars(0,adder_tb);
	$monitor($time, " A = %d, B = %d, Sum = %d", A,B,S);
	#5 A = 7'b0000111; B = 7'b0000100;
	#5 A = -7; B = -4;
	#5 A = 7; B = -4;
	#5 A = -7; B = 4;
end


endmodule
