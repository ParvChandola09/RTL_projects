module D_FF_16
	(
	input [15:0]D,
	input clk,
	input reset,
	output reg [15:0]Q
	);


always @(posedge clk)
begin
	Q <= D&{{16{reset}}};
end

endmodule
