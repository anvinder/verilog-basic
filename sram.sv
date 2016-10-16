module sram (data_a, data_b, q_a, q_b, addr_a, addr_b,we_a, we_b, clk, reset);
input [7:0] data_a, data_b;
output logic [7:0] q_a, q_b;
input clk, reset, we_a, we_b;
input [5:0] addr_a, addr_b;

logic [7:0] ram [63:0];

always @(posedge clk or posedge reset)
begin 
if (reset)
begin
q_a<=0;
end

else if (we_a)
begin
ram [addr_a]<= data_a;
q_a<=data_a;
end
else 
begin
q_a<=ram[addr_a];
end
end



always @(posedge clk or posedge reset)
begin 
if (reset)
begin
q_b<=0;
end

else if (we_b)
begin
ram [addr_b]<= data_b;
q_b<=data_b;
end
else 
begin
q_b<=ram[addr_b];
end
end
endmodule



module dut();
logic [7:0] data_a, data_b;
logic [7:0] q_a, q_b;
logic clk, reset, we_a, we_b;
logic [5:0] addr_a, addr_b;

sram s(.data_a(data_a), .data_b(data_b), .q_a(q_a), .q_b(q_b), .addr_a(addr_a), .addr_b(addr_b), .we_a(we_a), .we_b(we_b), .clk(clk), .reset(reset));

always #20 clk=~clk;
initial begin 
data_a=0;
data_b=0;
addr_a=0;
addr_b=0;
we_a=0;
we_b=0;
clk=0;


@(posedge clk);
@(posedge clk);
data_a=   8'b1010_0110;
data_b=   8'b1101_0101;
addr_a= 6'b0011_10;
addr_b= 6'b0001_01;
we_a=   1'b1;
we_b=   1'b1;

@(posedge clk);
@(posedge clk);
@(posedge clk);
@(posedge clk);
data_a=   8'b1100_0110;
data_b=   8'b1000_0101;
addr_a= 6'b1001_10;
addr_b= 6'b1101_01;
we_a=   1'b0;
we_b=   1'b0;


@(posedge clk);
@(posedge clk);
$finish;
end
endmodule
