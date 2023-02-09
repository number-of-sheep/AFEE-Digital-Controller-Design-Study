`timescale 1ns / 1ps

module fsm(
    input clk, rstn, en, dir,
    output wire [0:3]out
    );
    
    reg [0:3]state;
    reg [0:3]nstate;
    localparam ST_IDLE = 4'b0000;
    localparam ST_A = 4'b1010;
    localparam ST_B = 4'b1011;
    localparam ST_C = 4'b1100;
    localparam ST_D = 4'b1101;
    
    always @(posedge clk or negedge rstn) begin
        if (!rstn) begin
            state <= ST_IDLE;
        end
        else if (en == 0) begin
            state <= ST_IDLE;
        end
        else begin
            state <= nstate;
        end
    end
    
    always @(*) begin
        if (!rstn) begin
            nstate = ST_IDLE;
        end
        else begin
            case(state)
            ST_IDLE : begin
                if (en == 1) begin
                    nstate = ST_A;
                end
            end
            ST_A : begin
                if (dir == 1) begin
                    nstate = ST_B;
                end
                else begin
                    nstate = ST_D;
                end
            end
            ST_B : begin
                if (dir == 1) begin
                    nstate = ST_C;
                end
                else begin
                    nstate = ST_A;
                end
            end
            ST_C : begin
                if (dir == 1) begin
                    nstate = ST_D;
                end
                else begin
                    nstate = ST_B;
                end
            end
            ST_D : begin
                if (dir == 1) begin
                    nstate = ST_A;
                end
                else begin
                    nstate = ST_C;
                end
            end
            default : begin
                nstate = ST_IDLE;
            end
            endcase
        end
    end
    
    assign out = (state == ST_A) ? 4'b0001 :
            (state == ST_B) ? 4'b0010 :
            (state == ST_C) ? 4'b0100 :
            (state == ST_D) ? 4'b1000 : 4'b0000;
endmodule
