module bit_flip(
	input clk,
	input resetn,
	input [0:14] y_r,
	output [0:9] check,
	output reg [0:14] y_n
	);

//assign y = y_n&{15{resetn}};
//calculating check vector

assign check[0] = y_n[0]^y_n[4]^y_n[5];
assign check[1] = y_n[0]^y_n[1]^y_n[6];
assign check[2] = y_n[1]^y_n[2]^y_n[7];
assign check[3] = y_n[2]^y_n[3]^y_n[8];
assign check[4] = y_n[3]^y_n[4]^y_n[9];
assign check[5] = y_n[5]^y_n[10]^y_n[14];
assign check[6] = y_n[8]^y_n[10]^y_n[11];
assign check[7] = y_n[6]^y_n[11]^y_n[12];
assign check[8] = y_n[9]^y_n[12]^y_n[13];
assign check[9] = y_n[7]^y_n[13]^y_n[14];



always @(posedge clk) begin
y_n[0] = (~y_n[0]&(check[0]&check[1])&resetn) | (y_n[0]&(~check[0]&check[1])&resetn) | (y_n[0]&(check[0]&~check[1])&resetn) | (y_n[0]&(~check[0]&~check[1])&resetn) | (y_r[0]&~resetn);
y_n[1] = (~y_n[1]&(check[1]&check[2])&resetn) | (y_n[1]&(~check[1]&check[2])&resetn) | (y_n[1]&(check[1]&~check[2])&resetn) | (y_n[1]&(~check[1]&~check[2])&resetn) | (y_r[1]&~resetn);
y_n[2] = (~y_n[2]&(check[2]&check[3])&resetn) | (y_n[2]&(~check[2]&check[3])&resetn) | (y_n[2]&(check[2]&~check[3])&resetn) | (y_n[2]&(~check[2]&~check[3])&resetn) | (y_r[2]&~resetn);
y_n[3] = (~y_n[3]&(check[3]&check[4])&resetn) | (y_n[3]&(~check[3]&check[4])&resetn) | (y_n[3]&(check[3]&~check[4])&resetn) | (y_n[3]&(~check[3]&~check[4])&resetn) | (y_r[3]&~resetn);
y_n[4] = (~y_n[4]&(check[0]&check[4])&resetn) | (y_n[4]&(~check[0]&check[4])&resetn) | (y_n[4]&(check[0]&~check[4])&resetn) | (y_n[4]&(~check[0]&~check[4])&resetn) | (y_r[4]&~resetn);
y_n[5] = (~y_n[5]&(check[0]&check[5])&resetn) | (y_n[5]&(~check[0]&check[5])&resetn) | (y_n[5]&(check[0]&~check[5])&resetn) | (y_n[5]&(~check[0]&~check[5])&resetn) | (y_r[5]&~resetn);
y_n[6] = (~y_n[6]&(check[1]&check[7])&resetn) | (y_n[6]&(~check[1]&check[7])&resetn) | (y_n[6]&(check[1]&~check[7])&resetn) | (y_n[6]&(~check[1]&~check[7])&resetn) | (y_r[6]&~resetn);
y_n[7] = (~y_n[7]&(check[2]&check[9])&resetn) | (y_n[7]&(~check[2]&check[9])&resetn) | (y_n[7]&(check[2]&~check[9])&resetn) | (y_n[7]&(~check[2]&~check[9])&resetn) | (y_r[7]&~resetn);
y_n[8] = (~y_n[8]&(check[3]&check[6])&resetn) | (y_n[8]&(~check[3]&check[6])&resetn) | (y_n[8]&(check[3]&~check[6])&resetn) | (y_n[8]&(~check[3]&~check[6])&resetn) | (y_r[8]&~resetn);
y_n[9] = (~y_n[9]&(check[4]&check[8])&resetn) | (y_n[9]&(~check[4]&check[8])&resetn) | (y_n[9]&(check[4]&~check[8])&resetn) | (y_n[9]&(~check[4]&~check[8])&resetn) | (y_r[9]&~resetn);
y_n[10] = (~y_n[10]&(check[5]&check[6])&resetn) | (y_n[10]&(~check[5]&check[6])&resetn) | (y_n[10]&(check[5]&~check[6])&resetn) | (y_n[10]&(~check[5]&~check[6])&resetn) | (y_r[10]&~resetn);
y_n[11] = (~y_n[11]&(check[6]&check[7])&resetn) | (y_n[11]&(~check[6]&check[7])&resetn) | (y_n[11]&(check[6]&~check[7])&resetn) | (y_n[11]&(~check[6]&~check[7])&resetn) | (y_r[11]&~resetn);
y_n[12] = (~y_n[12]&(check[7]&check[8])&resetn) | (y_n[12]&(~check[7]&check[8])&resetn) | (y_n[12]&(check[7]&~check[8])&resetn) | (y_n[12]&(~check[7]&~check[8])&resetn) | (y_r[12]&~resetn);
y_n[13] = (~y_n[13]&(check[8]&check[9])&resetn) | (y_n[13]&(~check[8]&check[9])&resetn) | (y_n[13]&(check[8]&~check[9])&resetn) | (y_n[13]&(~check[8]&~check[9])&resetn) | (y_r[13]&~resetn);
y_n[14] = (~y_n[14]&(check[5]&check[9])&resetn) | (y_n[14]&(~check[5]&check[9])&resetn) | (y_n[14]&(check[5]&~check[9])&resetn) | (y_n[14]&(~check[5]&~check[9])&resetn) | (y_r[14]&~resetn);

end





/*always @(posedge clk) begin
	
	if(check[0]&&check[1])
		y_n1[0] <= ~y_n1[0];
	else
		y_n1[0] <= y_n1[0];

	if(check[1]&&check[2])
		y_n1[1] <= ~y_n1[1];
	else
		y_n1[1] <= y_n1[1];

	if(check[2]&&check[3])
		y_n1[2] <= ~y_n1[2];
	else
		y_n1[2] <= y_n1[2];

	if(check[3]&&check[4])
		y_n1[3] <= ~y_n1[3];
	else
		y_n1[3] <= y_n1[3];

	if(check[0]&&check[4])
		y_n1[4] <= ~y_n1[4];
	else
		y_n1[4] <= y_n1[4];

	if(check[0]&&check[5])
		y_n1[5] <= ~y_n1[5];
	else
		y_n1[5] <= y_n1[5];

	if(check[1]&&check[7])
		y_n1[6] <= ~y_n1[6];
	else
		y_n1[6] <= y_n1[6];

	if(check[2]&&check[9])
		y_n1[7] <= ~y_n1[7];
	else
		y_n1[7] <= y_n1[7];

	if(check[3]&&check[6])
		y_n1[8] <= ~y_n1[8];
	else
		y_n1[8] <= y_n1[8];

	if(check[4]&&check[8])
		y_n1[9] <= ~y_n1[9];
	else
		y_n1[9] <= y_n1[9];

	if(check[5]&&check[6])
		y_n1[10] <= ~y_n1[10];
	else
		y_n1[10] <= y_n1[10];

	if(check[6]&&check[7])
		y_n1[11] <= ~y_n1[11];
	else
		y_n1[11] <= y_n1[11];

	if(check[7]&&check[8])
		y_n1[12] <= ~y_n1[12];
	else
		y_n1[12] <= y_n1[12];

	if(check[8]&&check[9])
		y_n1[13] <= ~y_n1[13];
	else
		y_n1[13] <= y_n1[13];

	if(check[5]&&check[9])
		y_n1[14] <= ~y_n1[14];
	else
		y_n1[14] <= y_n1[14];

end*/

	
endmodule
