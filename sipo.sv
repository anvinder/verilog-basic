
module sipo(data_in, clk, reset, data_out);
input data_in, clk, reset;
output logic [3:0]data_out;

always @(posedge clk)
begin

if (reset==1)
begin
data_out<=0;
end
else
begin
data_out[3] <= data_in;
data_out[2:0]<= data_out [3:1];
end
end
endmodule

module dut();
logic clk, data_in,reset;
logic [3:0] data_out;
sipo s(.clk(clk), .data_in(data_in), .reset(reset), .data_out(data_out));

always #20 clk=~clk;

initial begin
data_in=0;
clk=0;
reset=0;
//$monitor ("data_in=%b, data_out=%b", data_in,data_out);

@(posedge clk)
reset=1;

reset=0;
data_in=1;
@(posedge clk)
$monitor ("data_in=%b, data_out=%b", data_in, data_out);


data_in=0;
@(posedge clk)
$monitor ("data_in=%b, data_out=%b", data_in, data_out);


data_in=1;
@(posedge clk)
$monitor ("data_in=%b, data_out=%b", data_in, data_out);

data_in=0;
@(posedge clk)
$monitor ("data_in=%b, data_out=%b", data_in, data_out);


$finish;
end
endmodule
