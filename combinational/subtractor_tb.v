
module subtractor_tb();
reg signed[7:0]A,B;
wire signed[7:0]sub;
wire OvP,OvN;

subtractor sub11(A,B,sub,OvP,OvN);

initial
begin
	$monitor($time , " A = %d, B = %d, sub = %d, OvP = %d, OvN = %d",A,B,sub,OvP,OvN);
	$dumpfile("sub.vcd");
	$dumpvars(0,subtractor_tb);
	#5 A = 8'b10011100; B = 8'b00101000; //negative overflow A=-100 and B=40
	#5 A = 8'b01100100; B = 8'b11011000; //positive overflow A=100 and B=-40
	#5 A = 8'b01100100; B = 8'b00101000; //A = 100 and B = 40
	#5 A = 8'b00101000; B = 8'b01100100; //A = 40 and B = 100
	#5 $finish;
end
endmodule
