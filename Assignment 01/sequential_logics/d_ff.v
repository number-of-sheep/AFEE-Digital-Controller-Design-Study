`timescale 1ns / 1ps

module d_ff(
    input rst,
    input clk,
    input data,
    output reg out
    );
    
    always @(rst) begin
        out = 0;
    end
    
    always @(posedge clk) begin
        out = data;
    end
        
endmodule
