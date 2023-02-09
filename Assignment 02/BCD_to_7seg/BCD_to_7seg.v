`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/01/19 18:03:55
// Design Name: 
// Module Name: BCD_to_7seg
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


module BCD_to_7seg(
    input [3:0] in,
    output reg [6:0] out
    );
    
    always @(in) begin
        case(in)
            4'b0000: out <= 7'b1111110;
            4'b0001: out <= 7'b0110000;
            4'b0010: out <= 7'b1101101;
            4'b0011: out <= 7'b1111001;
            4'b0100: out <= 7'b0110011;
            4'b0101: out <= 7'b1011011;
            4'b0110: out <= 7'b1011111;
            4'b0111: out <= 7'b1110010;
            4'b1000: out <= 7'b1111111;
            4'b1001: out <= 7'b1111011;
            default: out <= 7'b0000000;
        endcase
    end
    
endmodule
