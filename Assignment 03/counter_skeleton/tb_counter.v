`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/01/19 15:27:05
// Design Name: 
// Module Name: tb_counter
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


module tb_counter();

reg clk, rstn;
reg start, up, down;
wire [5:0] sec;

counter u_counter(
    .clk(clk),
    .rstn(rstn),
    .start(start),
    .up(up),
    .down(down),
    .sec(sec)
);

initial begin
    clk = 1'b1;
    forever #5 clk = ~clk;
end

integer i;
initial begin
    rstn    = 1'b0;
    start   = 1'b0;
    up      = 1'b0;
    down    = 1'b0;

    #9 rstn = 1'b1;

    #9 start = 1'b1;
    #9 start = 1'b0;

    #200019 up = 1'b1;
    #19     up = 1'b0;
    for (i = 0; i != 100; i = i + 1) begin
        #9  up = 1'b1;
        #10 up = 1'b0;
    end

    #300049 down = 1'b1;
    #9      down = 1'b0;
    for (i = 0; i != 100; i = i + 1) begin
        #9  down = 1'b1;
        #10 down = 1'b0;
    end

    #499999;
    $finish;
end


endmodule

