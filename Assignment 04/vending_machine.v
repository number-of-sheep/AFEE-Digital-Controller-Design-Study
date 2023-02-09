`timescale 1ns / 1ps

module vending_machine(
    input clk, rstn,
    input money100, money500, buy,
    output reg [6:0]total_money,
    output reg [6:0]total_bought,
    output reg error_sig
    );

    reg [2:0] state, nstate;
    localparam ST_IDLE = 3'b000;
    localparam ST_PutMoney100 = 3'b001;
    localparam ST_PutMoney500 = 3'b010;
    localparam ST_DrinkOut = 3'b011;
    localparam ST_ERROR = 3'b100;

    posedge_detector p0(.clk(clk), .sig(money100), .pe(pe_money100));
    posedge_detector p1(.clk(clk), .sig(money500), .pe(pe_money500));
    posedge_detector p2(.clk(clk), .sig(buy), .pe(pe_buy));

    // state -> next state
    always @(posedge clk or negedge rstn) begin
        if (!rstn) begin
            state <= ST_IDLE;
        end
        else begin
            state <= nstate;
        end
    end

    // setting up what 'next state' would be
    always @(*) begin
        if (!rstn) begin
            nstate = ST_IDLE;
        end
        else begin
            case(state)
                ST_IDLE : begin
                    if (pe_money100) begin
                        if (total_money <= 98) begin
                            nstate = ST_PutMoney100;
                        end
                        else begin
                            nstate = ST_ERROR;
                        end
                    end
                    else if (pe_money500) begin
                        if (total_money <= 94) begin
                            nstate = ST_PutMoney500;
                        end
                        else begin
                            nstate = ST_ERROR;
                        end
                    end
                    else if (pe_buy) begin
                        if (total_money >= 4 & total_bought <= 98) begin
                            nstate = ST_DrinkOut;
                        end
                        else begin
                            nstate = ST_ERROR;
                        end
                    end
                    else nstate = ST_IDLE;
                end

                ST_PutMoney100 : begin
                    nstate = ST_IDLE;
                end

                ST_PutMoney500 : begin
                    nstate = ST_IDLE;
                end

                ST_DrinkOut : begin
                    nstate = ST_IDLE;
                end

                ST_ERROR : begin
                    nstate = ST_IDLE;
                end

                default : nstate = ST_IDLE;
            endcase
        end
    end

    // calculate total money & bought, set error signal
    always @(posedge clk or negedge rstn) begin
        if (!rstn) begin
            total_money <= 0;
            total_bought <= 0;
            error_sig <= 0;
        end
        else begin
            case(state)
                ST_IDLE : begin
                end

                ST_PutMoney100 : begin
                    total_money <= total_money + 1;
                    error_sig <= 0;
                end

                ST_PutMoney500 : begin
                    total_money <= total_money + 5;
                    error_sig <= 0;
                end

                ST_DrinkOut : begin
                    total_bought <= total_bought + 1;
                    total_money <= total_money - 4;
                    error_sig <= 0;
                end

                ST_ERROR : begin
                    error_sig <= 1;
                end
            endcase
        end
    end

endmodule
