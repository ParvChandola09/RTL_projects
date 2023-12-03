module subtractor_16_bit_tb();
reg signed[15:0]A,B;
wire signed[15:0]sub;
wire OvP,OvN;

subtractor_16_bit sub11(A,B,sub,OvP,OvN);

initial
begin
	$monitor($time , " A = %d, B = %d, sub = %d, OvP = %d, OvN = %d",A,B,sub,OvP,OvN);
	$dumpfile("sub_16_bit.vcd");
	$dumpvars(0,subtractor_16_bit_tb);
	#5 A = 16'b1000001100000000; B = 16'b0000111110100000; //A=-32000 and B=4000
	#5 A = 16'b0111110100000000; B = 16'b1111000001100000; //A=32000 and B=-4000
	#5 A = 16'b0111110100000000; B = 16'b0000111110100000; //A = 32000 and B = 4000
	#5 A = 16'b0000111110100000; B = 16'b0111110100000000; //A = 4000 and B = 32000
	#5 $finish;
end
endmodule
