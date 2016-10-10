module test(sel, in1, in2, out1);
input sel;
input [3:0] in1, in2;
output logic  [3:0]out1;

always @(in1, in2, sel)
begin
	if (sel==0)
		out1= in1;
	else 
		out1= in2;
end
endmodule

module dut();
logic [3:0] in1, in2;
logic [3:0]out1;
logic sel;

test t1(.sel(sel), .in1(in1), .in2(in2), .out1(out1));

initial begin
in1 = 0;
in2 = 0;
sel = 0;

in1 = 4'b1011; in2 = 4'b1001; sel = 0;
#10;
$display("sel=%b in1=%b in2=%b Out=%b",sel,in1,in2,out1);

in1 = 4'b0101; in2 = 4'b1000; sel = 1;
#10;
$display("sel=%b in1=%b in2=%b Out=%b",sel,in1,in2,out1);

in1 = 4'b1100; in2 = 4'b0110; sel = 0;
#10;
$display("sel=%b in1=%b in2=%b Out=%b",sel,in1,in2,out1);
end
endmodule
