`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/01/30 20:34:39
// Design Name: 
// Module Name: tb_fsm_test
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_fsm_test();

reg clk, rstn;
wire [3:0] out;

initial begin
    clk = 1'b1;
    forever #5 clk = ~clk;
end

initial begin
    rstn = 1'b0;
    #100;
    rstn = 1'b1;
end

tester u_tester(
    .clk(clk),
    .rstn(rstn),
    .dir(dir),
    .en(en),
    .out(out)
);

/* connect your own module */
fsm u_testee(
    .clk(clk),
    .rstn(rstn),
    .dir(dir),
    .en(en),
    .out(out)
);

endmodule
