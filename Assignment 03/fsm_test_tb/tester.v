`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/01/30 20:46:49
// Design Name: 
// Module Name: tester
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


module tester(
    input clk, rstn,
    input [3:0] out,
    output reg dir, en
    );

reg up_finish, down_finish;
initial begin
    dir = 1'b0;
    en  = 1'b0;
    $display("=======================================");
    $display("fsm test");
    $display("=======================================");
    #199;
    en  = 1'b1;
    dir = 1'b1;
    #2;
    $display("#######################################");
    $display("DIR=1 TEST START");
    test_fsm_up(up_finish);
    while(!up_finish) begin
        #10;
        test_fsm_up(up_finish);
    end
    $display("\n");
    en = 1'b0;
    dir = 1'b0;
    #198;
    en = 1'b1;
    #2;
    $display("#######################################");
    $display("DIR=0 TEST START");
    test_fsm_down(down_finish);
    while(!down_finish) begin
        #10;
        test_fsm_down(down_finish);
    end

    #10;
    $display("=======================================");
    $display("fsm test successful!");
    $display("=======================================");
    $finish;
end

reg [3:0] out_d;
always @(posedge clk) begin
    out_d <= out;
end

always @(rstn) begin
    if (rstn) begin
        $display("#######################################");
        $display("TEST BEGIN");
        $display("#######################################");
    end
end

task test_fsm_up(
    output reg up_finish
);
    begin
    
    up_finish = 1'b0;
    case (out_d)
        4'b0000 : begin
            if (out == 4'b0001) $display("IDLE -> A");
            else begin
                $display("FAIL! Simulation terminated");
                $stop;
            end
        end

        4'b0001 : begin
            if (out == 4'b0010) $display("A -> B");
            else begin
                $display("FAIL! Simulation terminated");
                $stop;
            end
        end

        4'b0010 : begin
            if (out == 4'b0100) $display("B -> C");
            else begin
                $display("FAIL! Simulation terminated");
                $stop;
            end
        end

        4'b0100 : begin
            if (out == 4'b1000) $display("C -> D");
            else begin
                $display("FAIL! Simulation terminated");
                $stop;
            end
        end

        4'b1000 : begin
            if (out == 4'b0001) begin
                $display("D -> A");
                up_finish = 1'b1;
            end
            else begin
                $display("FAIL! Simulation terminated");
                $stop;
            end
        end

        default : begin
            $display("out reg ERROR, simulation terminated");
            $stop;
        end
    endcase
    end
endtask

task test_fsm_down(
    output reg down_finish
);
    begin
    
    down_finish = 1'b0;
    case (out_d)
        4'b0000 : begin
            if (out == 4'b0001) $display("IDLE -> A");
            else begin
                $display("FAIL! Simulation terminated");
                $stop;
            end
        end

        4'b0001 : begin
            if (out == 4'b1000) $display("A -> D");
            else begin
                $display("FAIL! Simulation terminated");
                $stop;
            end
        end

        4'b0010 : begin
            if (out == 4'b0001) begin
                $display("B -> A");
                down_finish = 1'b1;
            end
            else begin
                $display("FAIL! Simulation terminated");
                $stop;
            end
        end

        4'b0100 : begin
            if (out == 4'b0010) $display("C -> B");
            else begin
                $display("FAIL! Simulation terminated");
                $stop;
            end
        end

        4'b1000 : begin
            if (out == 4'b0100) $display("D -> C");
            else begin
                $display("FAIL! Simulation terminated");
                $stop;
            end
        end

        default : begin
            $display("out reg ERROR, simulation terminated");
            $stop;
        end
    endcase
    end
endtask



endmodule
