`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/01/19 17:04:14
// Design Name: 
// Module Name: binary_to_BCD
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


module binary_to_BCD(
    input [5:0] in,
    output [7:0] out
    );
    
    wire [3:0] c1, c2, c3;
    wire [3:0] d1, d2, d3;
    
    assign d1 = {1'b0, in[5:3]};
    assign d2 = {c1[2:0], in[2]};
    assign d3 = {c2[2:0], in[1]};
    
    add3 u0(.in(d1), .out(c1));
    add3 u1(.in(d2), .out(c2));
    add3 u2(.in(d3), .out(c3));
    
    assign out = {1'b0, c1[3], c2[3], c3[3], c3[2], c3[1], c3[0], in[0]};
    
endmodule
