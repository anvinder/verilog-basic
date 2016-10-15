
module sipo(clk, reset, q);
input clk, reset;
output logic [2:0]q;

always @(posedge clk)
begin
if (reset==1)
begin
q<=3'b001;
end
else
begin
q <= {q[0], q[2:1]};

end
end
endmodule

module dut();
logic clk, reset;
logic [2:0] q;
sipo s(.clk(clk), .reset(reset), .q(q));

always #20 clk=~clk;

initial begin
clk=0;
reset=0;

@(posedge clk)
reset=1;
@(posedge clk)

reset=0;
$monitor ("q=%b ", q);


$finish;
end
endmodule
