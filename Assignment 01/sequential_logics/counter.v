`timescale 1ns / 1ps

module counter(
    input rst,
    input clk,
    output reg [3:0] out
    );
    
    always @(posedge clk, negedge rst) begin
        if (rst) begin
            out = 4'b0000;
        end
        else begin
            case(out)
                4'b1010: out = 4'b0000;
                default: out = out + 1;
            endcase
        end
    end
    
endmodule
