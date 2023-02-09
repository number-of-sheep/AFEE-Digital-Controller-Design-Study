`timescale 1ns / 1ps

module counter_tb();
    
    reg rst, clk;
    wire [3:0] out;
    
    initial begin
        rst = 1;
        #10
        rst = 0;
        #120
        $finish;
    end
    
    initial begin
        clk = 1'b0;
        forever #5 clk = ~clk;
    end
    
    counter c1(.rst(rst), .clk(clk), .out(out));
    
endmodule
