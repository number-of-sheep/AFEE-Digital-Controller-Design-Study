`timescale 1ns / 1ps

module tb();

reg clk, rstn, money, push;
wire pe_money, pe_push;
    
posedge_detector u_pe1(.clk(clk), .sig(money), .pe(pe_money));
posedge_detector u_pe2(.clk(clk), .sig(push), .pe(pe_push));
turnstile u0(.clk(clk), .rstn(rstn), .money(pe_money), .push(pe_push), .state(state));

initial begin
clk = 0;
forever #1 clk = ~clk;
end

initial begin
rstn = 0;
money = 0;
push = 0;
#5
rstn = 1;
end

initial begin
#10
money = 1;  // money comes in -> UNLOCK
push = 0;
#10
money = 0;
push = 0;
#10
money = 0;  // push comes in -> LOCK
push = 1;
#10
money = 0;
push = 0;
#10
money = 1;  // when UNLOCKED and count up to 50 -> LOCK
push = 0;
#10
money = 0;
push = 0;
#100
$finish;
end

endmodule