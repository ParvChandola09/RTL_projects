module counter
	(
	input clk,
	input reset,
	output reg [3:0]q
	);

always @(posedge clk)
begin
	q <= (q+1)&({4{~q[0]|~q[3]}})&({4{reset}});
end

endmodule
	
