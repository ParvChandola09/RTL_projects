`timescale 1ns/1ps
module filter2 #
	(
	parameter N = 8
	)
	(
	input clk,
	input resetn,
	input signed [6:0] x_n,
	output signed [15:0] y_n
	);


wire signed [6:0] x_n_1, x_n_2, x_n_3, x_n_4, x_n_5, x_n_6, x_n_7;

D_FF D0(.clk(clk), .reset(resetn), .D(x_n), .Q(x_n_1));
D_FF D1(.clk(clk), .reset(resetn), .D(x_n_1), .Q(x_n_2));
D_FF D2(.clk(clk), .reset(resetn), .D(x_n_2), .Q(x_n_3));
D_FF D3(.clk(clk), .reset(resetn), .D(x_n_3), .Q(x_n_4));
D_FF D4(.clk(clk), .reset(resetn), .D(x_n_4), .Q(x_n_5));
D_FF D5(.clk(clk), .reset(resetn), .D(x_n_5), .Q(x_n_6));
D_FF D6(.clk(clk), .reset(resetn), .D(x_n_6), .Q(x_n_7));

wire signed [7:0] S0,S1,S2,S3;

//First addition stage
adder A0(.A(x_n), .B(x_n_7), .S(S0));
adder A1(.A(x_n_1), .B(x_n_6), .S(S1));
adder A2(.A(x_n_2), .B(x_n_5), .S(S2));
adder A3(.A(x_n_3), .B(x_n_4), .S(S3));


//filter coefficients
wire signed [7:0] h0,h1,h2,h3,h4,h5,h6,h7;

assign h0 = 8'b00011101; //29
assign h1 = 8'b11001011; //-53
assign h2 = 8'b11001100; //-52
assign h3 = 8'b00101000; //40

wire [15:0] P0,P1,P2,P3;

//multiplier stage
signed_multiplier #(.N(N)) M0(.A(S0), .B(h0), .product(P0));
signed_multiplier #(.N(N)) M1(.A(S1), .B(h1), .product(P1));
signed_multiplier #(.N(N)) M2(.A(S2), .B(h2), .product(P2));
signed_multiplier #(.N(N)) M3(.A(S3), .B(h3), .product(P3));

wire [15:0] sum1,sum2,sum3;
wire C0,C1,C2;

//Last addition stage
ripple_16_bit sf1(.A(P0), .B(P1), .S(sum1), .Cout(C0));
ripple_16_bit sf2(.A(P2), .B(P3), .S(sum2), .Cout(C1));
ripple_16_bit sf3(.A(sum1), .B(sum2), .S(sum3), .Cout(C1));

D_FF_16 D7(.clk(clk), .reset(resetn), .D(sum3&{16{resetn}}), .Q(y_n));
//assign y_n = sum3&{16{resetn}};

endmodule













