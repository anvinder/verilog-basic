module test(in, out);
input [2:0] in;
output logic  [7:0]out;


 always @(*)
    begin
case(in)
3'b000 : out= 8'b00000001;
3'b001 : out= 8'b00000010;
3'b010 : out= 8'b00000100;
3'b011 : out= 8'b00001000;
3'b100 : out= 8'b00010000;
3'b101 : out= 8'b00100000;
3'b110 : out= 8'b01000000;
3'b111 : out= 8'b10000000;

    endcase
end
endmodule

module dut();
logic [2:0] in;
logic [7:0] out;

test t1(.in(in), .out(out));

initial begin
in=3'b010;
#10;
$display("in=%b Out=%b",in, out);
in=3'b011;
#10;
$display("in=%b Out=%b",in, out);
in=3'b001;
#10;
$display("in=%b Out=%b",in, out);
in=3'b111;
#10;
$display("in=%b Out=%b",in, out);

$finish;
end
endmodule
