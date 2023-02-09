`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/01/19 18:39:03
// Design Name: 
// Module Name: tb
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


module tb();
    
    reg clk, rstn, up, down;
    wire [5:0] sec;
    
    initial begin
        clk = 1'b0;
        forever #0.5 clk = ~clk;
    end
    
    initial begin
        rstn = 0;
        #1
        rstn = 1;
        #530
        rstn = 0;
        #0.5
        rstn = 1;
    end
    
    initial begin
        #600
        $finish;
    end
    
    initial begin
        up = 0;
        down = 0;
        #40
        up = 1;
        #100
        up = 0;
        #120
        down = 1;
        #0.5
        down = 0;
        #20
        up = 1;
        #0.5
        up = 0;
        #46
        down = 1;
        #12
        down = 0;
    end
    
    counter u0(.clk(clk), .rstn(rstn), .up(up), .down(down), .sec(sec));
    
endmodule
