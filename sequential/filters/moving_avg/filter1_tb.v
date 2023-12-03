`timescale 1ns/1ps
module filter1_tb();
reg clk;
reg resetn1,resetn2;
reg signed [7:0] x_n;
wire signed [11:0] y_n;

//sampling clk circuit
wire smp_clk;
reg [15:0] fcw;

NCO CK1(.clk(clk), .resetn(resetn1), .fcw(16'b0000000100000000), .square(smp_clk));

filter1 DUT(.clk(smp_clk), .resetn(resetn2), .x_n(x_n), .y_n(y_n));

initial
begin
	clk <= 1'b0;
	resetn1 <= 1'b0;
	resetn2 <= 1'b0;
end

always #0.5 clk <= ~clk;

initial 
begin
	$dumpfile("filter1.vcd");
	$dumpvars(0,filter1_tb);
	$monitor($time, "x[n] = %d, reset=%d y[n] = %f", x_n,resetn2,y_n);
	#1 resetn1 = 1'b1;
	#139 resetn2 = 1'b1; x_n = 4;
	//#300 x_n = 0;
	#20000 $finish;
end
endmodule

