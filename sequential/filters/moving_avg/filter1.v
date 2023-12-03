module filter1(
	input clk,
	input resetn,
	input signed [7:0] x_n,
	output signed [11:0] y_n
	);

	
	wire signed [7:0] x_n_1, x_n_2,x_n_3;
	

	//delay stage
	D_FF ff0(.clk(clk), .reset(resetn), .D(x_n), .Q(x_n_1));
	D_FF ff1(.clk(clk), .reset(resetn), .D(x_n_1), .Q(x_n_2));
	D_FF ff2(.clk(clk), .reset(resetn), .D(x_n_2), .Q(x_n_3));
	

	wire signed [9:0] S0,S1;
	wire signed [11:0] S2,out;

	//Summing stage
	adder A0(.A(x_n), .B(x_n_1), .S(S0));
	adder A1(.A(x_n_2), .B(x_n_3), .S(S1));
	adder_10 A2(.A(S0), .B(S1), .S(S2));
	
	
	//dividing by 4
	assign out = S2>>>2;
	D_FF2 ff4(.clk(clk), .reset(resetn), .D(out), .Q(y_n));
	//assign y_n = out[7:0]&{8{resetn}};


endmodule
	
