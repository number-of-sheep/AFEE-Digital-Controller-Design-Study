`timescale 1ns / 1ps

module tb_vm();

reg clk, rstn, money100, money500, buy;
wire [6:0] total_money, total_bought;
wire error_sig;

vending_machine u0(.clk(clk), .rstn(rstn), .money100(money100), .money500(money500), .buy(buy), .total_money(total_money), .total_bought(total_bought), .error_sig(error_sig));

// clk
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

// others
integer i;
initial begin
    rstn = 0;
    money100 = 0;
    money500 = 0;
    buy = 0;
    
    #15
    rstn = 1;
    #10
    
    // money 100 until reaching 9900
    for (i = 0; i != 120; i = i + 1) begin
        #9 money100 = 1;
        #10 money100 = 0;
    end
    
    // buy until the total_money < 4
    for (i = 0; i != 30; i = i + 1) begin
        #9 buy = 1;
        #10 buy = 0;
    end
    
    // money 500 until reaching 9900
    for (i=0; i != 25; i = i + 1) begin
        #9 money500 = 1;
        #10 money500 = 0;
    end
    
    // buy until the total_money < 4
    for (i = 0; i != 30; i = i + 1) begin
        #9 buy = 1;
        #10 buy = 0;
    end
    
    // repeat until total_bought > 99
    for (i=0; i != 25; i = i + 1) begin
        #9 money500 = 1;
        #10 money500 = 0;
    end
    for (i = 0; i != 30; i = i + 1) begin
        #9 buy = 1;
        #10 buy = 0;
    end
    for (i=0; i != 25; i = i + 1) begin
        #9 money500 = 1;
        #10 money500 = 0;
    end    
    for (i = 0; i != 30; i = i + 1) begin
        #9 buy = 1;
        #10 buy = 0;
    end    
    for (i=0; i != 25; i = i + 1) begin
        #9 money500 = 1;
        #10 money500 = 0;
    end
    for (i = 0; i != 30; i = i + 1) begin
        #9 buy = 1;
        #10 buy = 0;
    end
    
    // test reseting all the variables
    rstn = 0;
    #10
    
    // test restarting
    rstn = 1;
    #9 money100 = 1;
    #10 money100 = 0;
    #9 buy = 1;
    #10 buy = 0;
    #10
    $finish;
end

endmodule