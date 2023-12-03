`timescale 1ns/1ps

module filter2_tb();
parameter N = 8;
reg clk;
reg resetn1,resetn2;
reg signed [6:0] x_n;
wire signed [15:0] y_n;

//sampling clk circuit
wire smp_clk;
reg [15:0] fcw;

NCO CK1(.clk(clk), .resetn(resetn1), .fcw(16'b0000000100000000), .square(smp_clk));

filter2 #(.N(N)) DUT(.clk(smp_clk), .resetn(resetn2), .x_n(x_n), .y_n(y_n));

initial
begin
	clk <= 1'b0;
	resetn1 <= 1'b0;
	resetn2 <= 1'b0;
end

always #0.5 clk <= ~clk;

initial 
begin
	$dumpfile("filter2.vcd");
	$dumpvars(0,filter2_tb);
	$monitor($time, " x[n] = %d, rst = %d, y[n] = %d", x_n,resetn2,y_n);
	#1 resetn1 = 1'b1;
	#129 resetn2 = 1'b1; x_n = 1; //uncomment for unit step response
	
	//for impulse response
	//#129 resetn2 = 1'b1; x_n  = 0;
	//#511 x_n = 1;
	//#2 x_n = 0;
	//#129 resetn2 = 1'b1; x_n  = 0;
	//#513 x_n = 1;
	//#256 x_n = 0;


	#1000000 $finish;

end

endmodule
