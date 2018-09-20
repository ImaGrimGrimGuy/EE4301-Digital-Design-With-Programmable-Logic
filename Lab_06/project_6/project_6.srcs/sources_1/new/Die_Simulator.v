`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/05/2018 12:50:33 PM
// Design Name: 
// Module Name: Die_Simulator
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


module Die_Simulator(
    output reg [7:0]q,
    input [7:0] seed,
    input rst,
    input clock,
    input pause
    );
    wire [7:0] getter;

    lsfr LSFR (getter, seed, rst, clock, pause);
    
    always @ (*) begin
        if (getter[7:4] == 3'b0111) begin
            q[7:4] <= 4'b0110;
        end
        else if (getter[7:4] == 3'b0000) begin
            q[7:4] <= 4'b0001;
        end
        else begin
            q[7:4] = getter[7:4] & 4'b0111;
        end
        
        if (getter[3:0] >= 3'b0111) begin
            q[3:0] <= 4'b0110;
        end
        else if (getter[3:0] == 3'b0000) begin
            q[3:0] <= 4'b0001;
        end
        else begin
            q[3:0] = getter[3:0] & 4'b0111;
        end
    end
endmodule
