`timescale 1ns / 1ps

module tb();

reg clk, en, dir;
wire [0:3]out;

fsm u0(.clk(clk), .en(en), .dir(dir), .out(out));

initial begin
clk = 1'b0;
forever #1 clk = ~clk;
end

initial begin
en = 0;
dir = 0;
#10
en = 1;
dir = 0;
#20
en = 1;
dir = 1;
#20
en = 0;
dir = 1;
#20
$finish;
end

endmodule
