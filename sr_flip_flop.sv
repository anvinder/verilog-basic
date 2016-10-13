module sr_ff(clk,s,r,q,qbar, reset);
input clk, s,r, reset;
output logic q,qbar;

assign qbar=~q;

always @( posedge clk or posedge reset)
begin
if (reset)
begin
q<=0;
end
else 
begin
q<=s || (~r && q);
end
end
endmodule



module dut();
logic clk, s,r,q,qbar,reset;
sr_ff sr(.clk(clk), .s(s), .r(r), .reset(reset), .q(q), .qbar(qbar));

always #20 clk=~clk;

initial begin
s=0;
r=1;
clk=0;
reset=0;
@(posedge clk)
$monitor ("s=%b, r=%b, q=%b", s,r,q);


end
endmodule
