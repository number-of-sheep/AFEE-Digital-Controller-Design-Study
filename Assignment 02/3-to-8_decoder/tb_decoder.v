`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/01/19 16:59:31
// Design Name: 
// Module Name: tb_decoder
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


module tb_decoder();
    
    reg [2:0] in;
    wire [7:0] out;
    
    initial begin
        #10
        in = 3'b000;
        #10
        in = 3'b001;
        #10
        in = 3'b010;
        #10
        in = 3'b011;
        #10
        in = 3'b100;
        #10
        in = 3'b101;
        #10
        in = 3'b110;
        #10
        in = 3'b111;
        #10
        $finish;
    end
    
    decoder u0(.in(in), .out(out));
    
endmodule
