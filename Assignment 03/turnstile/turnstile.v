`timescale 1ns / 1ps

module turnstile(
    input clk, rstn,
    input money, push,
    output reg state
    );
    
    localparam ST_LOCKED = 1'b0;
    localparam ST_UNLOCKED = 1'b1;
    
    reg nstate;
    reg [0:5]cnt;
    
    always @(posedge clk or negedge rstn) begin
        if (!rstn) begin
            state <= ST_LOCKED;
            cnt <= 0;
        end
        else begin
            state <= nstate;
            case(state)
                ST_LOCKED : begin
                    cnt = 0;
                end
                ST_UNLOCKED : begin
                    if (cnt == 50) begin
                        state <= ST_LOCKED;
                    end
                    else begin
                        cnt <= cnt + 1;
                    end
                end
            endcase
        end
    end
    
    always @(*) begin
        if (!rstn) begin
            nstate = ST_LOCKED;
        end
        else begin
            case (state)
                ST_LOCKED : begin
                    if (money)
                        nstate = ST_UNLOCKED;
                    else
                        nstate = ST_LOCKED;
                end
                ST_UNLOCKED : begin
                    if (push)
                        nstate = ST_LOCKED;
                    else 
                        nstate = ST_UNLOCKED;
                end
                default : begin
                    nstate = ST_LOCKED;
                end
            endcase
        end
    end
    
endmodule
