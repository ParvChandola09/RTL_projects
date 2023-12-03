module D_FF
	(
	input [7:0]D,
	input clk,
	input reset,
	output reg [7:0]Q
	);


always @(posedge clk)
begin
	Q <= D&{{8{reset}}};
end

endmodule
