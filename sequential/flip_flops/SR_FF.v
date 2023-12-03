module SR_FF
	(
	input clk,
	input reset,
	input S,
	input R,
	output reg Q,
	output reg Qn
	);

always @(posedge clk)
begin
	Q <= (S|(~R&Q))&reset;
	Qn <= (~S&(R|~Q))|~reset;
end
	
endmodule	
