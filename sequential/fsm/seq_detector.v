module seq_detector
	(
	input clk,
	input resetn,
	input bit_in,
	output reg z
	);

reg [1:0] NS;
wire [1:0] PS;

D_FF ff1(.D(NS[0]), .clk(clk), .reset(resetn), .Q(PS[0]));
D_FF ff2(.D(NS[1]), .clk(clk), .reset(resetn), .Q(PS[1]));

always @(*)
begin
	NS[0] = bit_in;
	NS[1] = (~PS[1]&PS[0]&~bit_in)|(PS[1]&~PS[0]&bit_in)|(PS[1]&PS[0]&~bit_in);
	z = PS[1]&PS[0]&bit_in;
end


	
endmodule
