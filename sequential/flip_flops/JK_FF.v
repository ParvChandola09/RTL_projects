module JK_FF
	(
	input J,
	input K,
	input clk,
	input reset,
	output reg Q,
	output reg Qn
	);
		
always @(posedge clk)
begin
	Q <= ((J&~Q)|(~K&Q))&reset;    //Q(n+1) = (J.!Qn)+(!K.Qn)
	Qn <= ((~J|Q)&(K|~Q))|~reset;
end

endmodule	
