module D_FF
	(
	input D,
	input clk,
	input reset,
	output reg Q
	);


always @(posedge clk)
begin
	Q <= D&reset;
end

endmodule
