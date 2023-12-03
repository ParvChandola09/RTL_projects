module ripple_carry_adder_tb();
reg [7:0]A,B;
wire [7:0]sum;
wire Cout;

ripple_carry_adder RP(A,B,sum,Cout);

initial
begin
	$monitor($time , " A = %d, B = %d, sum = %d, Cout = %d",A,B,sum,Cout);
	$dumpfile("ripple.vcd");
	$dumpvars(0,ripple_carry_adder_tb);
	#5 A = 8'b10101100; B = 8'b10000011;//A=172 and B=131
	#5 A = 8'b00101000; B = 8'b00111100;//A=40 and B=60
	#5 $finish;
end
endmodule
