`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/01/19 17:48:33
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
    
    reg [5:0] in;
    wire [7:0] out;
    
    initial begin
        #10
        in = 6'b000000;
        #10
        in = 6'b001100;
        #10
        in = 6'b010001;
        #10
        in = 6'b010010;
        #10
        in = 6'b011000;
        #10
        in = 6'b010011;
        #10
        in = 6'b101111;
        #10
        in = 6'b111111;
        #10
        $finish;
    end
    
    binary_to_BCD u0(.in(in), .out(out));
endmodule
