`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/01/19 18:18:57
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
    
    reg [3:0] in;
    wire [6:0] out;
    
    initial begin
        #10
        in = 4'b0000;
        #10
        in = 4'b0001;
        #10
        in = 4'b0010;
        #10
        in = 4'b0011;
        #10
        in = 4'b0100;
        #10
        in = 4'b0101;
        #10
        in = 4'b0110;
        #10
        in = 4'b0111;
        #10
        in = 4'b1000;
        #10
        in = 4'b1001;
        #10
        $finish;
    end
    
    BCD_to_7seg u0(.in(in), .out(out));
endmodule
