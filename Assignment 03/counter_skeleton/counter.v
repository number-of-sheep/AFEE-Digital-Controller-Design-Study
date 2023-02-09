`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/01/19 15:13:52
// Design Name: 
// Module Name: counter
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

module counter(
    input clk, rstn,
    input start, up, down,
    output reg [5:0] sec
    );

reg [6:0] cnt;

localparam  ST_IDLE = 0,
            ST_CNT  = 1,
            ST_UP   = 2,
            ST_DOWN = 3;

reg [1:0] state, nstate;

// cnt control
always @(posedge clk or negedge rstn) begin
    if (!rstn || state == ST_IDLE) begin
        cnt <= 0;
    end
    else if (cnt == 50) begin
        cnt = 0;
    end
    begin
        cnt = cnt + 1;
    end
end

posedge_detector u_pe1(.clk(clk), .sig(start), .pe(pe_start));
posedge_detector u_pe2(.clk(clk), .sig(up), .pe(pe_up));
posedge_detector u_pe3(.clk(clk), .sig(down), .pe(pe_down));

// sec control
always @(posedge clk or negedge rstn) begin
    if (!rstn || state == ST_IDLE) begin
        sec <= 0;
    end
    else begin
        if (state == ST_UP) begin
            sec = sec + 1;
            if (sec == 60) begin
                sec = 0;
            end
        end
        else if (state == ST_DOWN) begin
            if (sec == 0) begin
                sec = 60;
            end
            sec = sec - 1;
        end
    end
end

// state control 
always @(posedge clk or negedge rstn) begin
    if (!rstn) begin
        state <= ST_IDLE;
    end
    else begin
        state <= nstate;
    end
end

// FSM
always @(*) begin
    if (!rstn) begin
        nstate = ST_IDLE;
    end
    else begin
        case(state)
            ST_IDLE : begin
                if (pe_start) begin
                    nstate = ST_CNT;
                end
            end

            ST_CNT : begin
                if (pe_up) begin
                    nstate = ST_UP;
                end
                else if (pe_down) begin
                    nstate = ST_DOWN;
                end
                else if (cnt == 50) begin
                    nstate = ST_UP;
                end
            end

            ST_UP : begin
                nstate = ST_CNT;
            end

            ST_DOWN : begin
                nstate = ST_CNT;
            end
            
            default : begin
                nstate = ST_IDLE;
            end
        endcase
    end
end

endmodule
