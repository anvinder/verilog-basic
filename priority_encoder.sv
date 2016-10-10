module test(in, out);
input [7:0] in;
output logic  [2:0]out;
integer i;

 always @(*)
    begin
          for (i=0;i<8;i=i+1)
        begin
          if (in[i]==1)
            out = i;
        end
    end
endmodule

module dut();
logic [7:0] in;
logic [2:0] out;
integer i;
test t1(.in(in), .out(out));

 //  initial clk 	= 0;
  //  always #5 clk  = ~clk;	

initial begin
in = 0;

for (i=0;i<=255;i++)
begin
in=i;
#2;
$display("in=%b Out=%b",in, out);
end

$finish;
end
endmodule
