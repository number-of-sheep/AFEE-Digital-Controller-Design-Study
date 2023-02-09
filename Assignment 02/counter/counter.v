`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/01/19 18:31:02
// Design Name: 
// Module Name: counter
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


module counter(
    input clk, rstn,
    input up, down,
    output reg [5:0] sec
    );
    
    reg [6:0] cnt;
    
    always @(posedge clk, negedge rstn) begin
        if (!rstn) begin
            cnt = 7'b0000000;
            sec = 6'b000000;
        end
        
        else begin
            cnt = cnt + 1;
            if (cnt == 7'b1100100) begin
                sec = sec + 1;
                cnt = 7'b0000000;
            end
            
            if (sec == 59) begin
                sec = 6'b000000;
            end
            
            else if (up) begin
                sec = sec + 1;
            end
            else if (down) begin
                sec = sec - 1;
            end
        end
    end
    
endmodule
