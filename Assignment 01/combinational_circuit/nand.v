`timescale 1ns / 1ps

module nand_gate(
    input a, b,
    output out
    );

    assign out = ~(a & b);

endmodule
