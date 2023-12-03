module fulladder_tb();

reg A,B,Cin;
wire sum,Cout;

fulladder FA(A,B,Cin,sum,Cout);

initial
begin
	$monitor($time , " A=%b, B=%b, Cin=%b, sum=%b, Cout=%b",A,B,Cin,sum,Cout);
	$dumpfile("fulladder.vcd");
	$dumpvars(0,fulladder_tb);
	#5 A = 0; B = 0; Cin = 0;
	#5 A = 0; B = 0; Cin = 1;
	#5 A = 0; B = 1; Cin = 0;
	#5 A = 0; B = 1; Cin = 1;
	#5 A = 1; B = 0; Cin = 0;
	#5 A = 1; B = 0; Cin = 1;
	#5 A = 1; B = 1; Cin = 0;
	#5 A = 1; B = 1; Cin = 1;
	#5 $finish;
end
endmodule


