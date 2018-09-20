`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/21/2018 01:22:41 PM
// Design Name: 
// Module Name: lab4_top
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


module lab4_top(
    output [7:0] decoder,
    output [3:0] seg_enable,
    output [7:0] outseed,
    input clk,
    input rst,
    input [7:0] seed
    );
    
    wire [7:0] q;
    wire cout;
    wire segclk;
    reg tic = 0;
    
    clock_divider CDIV (cout, clk);
    clock_divider #(.timeconst(15)) digits (segclk, clk);
    lsfr LSFR (q, seed, rst, cout);
    wire [7:0]decoder_s1;
    wire [7:0]decoder_s2;
    lookup LOOK_BOY1(decoder_s1,q[7:4]);
    lookup LOOK_BOY2(decoder_s2,q[3:0]);
    
    always @(posedge segclk) begin
        tic = ~tic;
    end
    
    assign outseed = seed;
    assign decoder = tic? decoder_s1: decoder_s2;
    assign seg_enable = tic? 4'b1101:4'b1110;
endmodule
