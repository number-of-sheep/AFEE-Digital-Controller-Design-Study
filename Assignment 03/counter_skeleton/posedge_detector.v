`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/01/19 15:25:35
// Design Name: 
// Module Name: posedge_detector
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


module posedge_detector(
    input clk,
    input sig,
    output wire pe
    );

reg sig_dly;
always @(posedge clk) begin
    sig_dly <= ~sig;
end

assign pe = sig & sig_dly;

endmodule
