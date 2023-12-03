
module ripple_16_bit_tb();
reg [15:0]A,B;
wire [15:0]sum;
wire Cout;

ripple_16_bit RP(A,B,sum,Cout);

initial
begin
	$monitor($time , " A = %d, B = %d, sum = %d, Cout = %d",A,B,sum,Cout);
	$dumpfile("ripple.vcd");
	$dumpvars(0,ripple_16_bit_tb);
	#5 A = 16'b0000000010101100; B = 16'b0000000010000011;//A=172 and B=131
	#5 A = 16'b0000000110010000; B = 16'b0000001001011000;//A=400 and B=600
	#5 A = 16'b1111111111111111; B = 16'b0000000000000001;//A=65535 and B=1
end
endmodule
