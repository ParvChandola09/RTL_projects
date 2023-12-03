module PN_seq
	(
	input clk,
	input reset,
	output reg [0:3]q
	);


always @(posedge clk)
begin
	q[0] <= (q[3]^q[0])&reset;
	q[1] <= q[0]&reset;
	q[2] <= q[1]&reset;
	q[3] <= q[2]|~reset;
end


//D_FF ff0(.D(q[0]^q[1]^q[2]^q[3]), .clk(clk), .Q(q[0]&reset));
//D_FF ff1(.D(q[0]), .clk(clk), .Q(q[1]&reset));
//D_FF ff2(.D(q[1]), .clk(clk), .Q(q[2]&reset));
//D_FF ff3(.D(q[2]), .clk(clk), .Q(q[3]|~reset));

endmodule


// D flip-flop
module D_FF
	(
	input D,
	input clk,
	output reg Q
	);


always @(posedge clk)
begin
	Q <= D;
end

endmodule
