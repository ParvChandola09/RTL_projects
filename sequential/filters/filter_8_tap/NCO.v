`timescale 1ns/1ps
module NCO
	(
	input clk,
	input resetn,
	input [15:0] fcw,
	output reg square
	);
	
	reg [15:0] SW;
	always @(posedge clk)
	begin
		SW <= (SW + fcw)&({16{resetn}});
	end

	always @(posedge clk)
	begin
		square <= SW[15]&resetn;
	end

endmodule
