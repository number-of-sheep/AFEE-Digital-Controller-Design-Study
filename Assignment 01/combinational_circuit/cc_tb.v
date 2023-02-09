`timescale 1ns / 1ps

module cc_tb();

    reg a, b;
    wire nor_out, nand_out, sum, carry;
    
    initial begin
        #10
            a <= 1'b0;
            b <= 1'b0;
        #10
            a <= 1'b0;
            b <= 1'b1;
        #10
            a <= 1'b1;
            b <= 1'b0;
        #10
            a <= 1'b1;
            b <= 1'b1;
        #10
            $finish;
    end
    
    nor_gate nor1(.a(a), .b(b), .out(nor_out));
    nand_gate nand1(.a(a), .b(b), .out(nand_out));
    half_adder h1(.a(a), .b(b), .s(sum), .c(carry));
    
endmodule
