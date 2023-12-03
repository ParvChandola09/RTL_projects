module D_FF2
	(
	input [11:0]D,
	input clk,
	input reset,
	output reg [11:0]Q
	);


always @(posedge clk)
begin
	Q <= D&{{12{reset}}};
end

endmodule
