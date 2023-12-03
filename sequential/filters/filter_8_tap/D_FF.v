module D_FF
	(
	input [6:0]D,
	input clk,
	input reset,
	output reg [6:0]Q
	);


always @(posedge clk)
begin
	Q <= D&{{7{reset}}};
end

endmodule
