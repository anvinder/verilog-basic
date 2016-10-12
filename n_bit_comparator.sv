module nbitcomp(a,b, aeqb, agtb, altb);
parameter n=4;
input [n-1:0] a;
input [n-1:0] b;
output logic aeqb,agtb,altb;

always @(*)
begin
aeqb=0;
altb=0;
agtb=0;

if (a>b)
agtb=1;
if (a==b)
aeqb=1;
if (a<b)
altb=1;

end
endmodule

module dut();
parameter n=4;
logic [n-1:0]a;
logic [n-1:0]b;
logic aeqb, altb, agtb;

nbitcomp dut (.a(a), .b(b), .aeqb(aeqb), .agtb(agtb), .altb(altb) );


initial begin 

a=4'h0;
b= 4'h7;
#10;
$display("a=%h, b=%h, agtb=%h, aeqb=%h, altb=%h", a,b,agtb,aeqb,altb);
a=4'h1;
b= 4'h6;
#10;
$display("a=%h, b=%h, agtb=%h, aeqb=%h, altb=%h", a,b,agtb,aeqb,altb);
a=4'h2;
b= 4'h2;
#10;
$display("a=%h, b=%h, agtb=%h, aeqb=%h, altb=%h", a,b,agtb,aeqb,altb);
a=4'h3;
b= 4'h10;
#10;
$display("a=%h, b=%h, agtb=%h, aeqb=%h, altb=%h", a,b,agtb,aeqb,altb);
a=4'h4;
b= 4'h1;
#10;
$display("a=%h, b=%h, agtb=%h, aeqb=%h, altb=%h", a,b,agtb,aeqb,altb);
a=4'h5;
b= 4'h7;
#10;
$display("a=%h, b=%h, agtb=%h, aeqb=%h, altb=%h", a,b,agtb,aeqb,altb);
a=4'h6;
b= 4'h6;
#10;
$display("a=%h, b=%h, agtb=%h, aeqb=%h, altb=%h", a,b,agtb,aeqb,altb);
a=4'h7;
b= 4'h6;
#10;

end
endmodule
