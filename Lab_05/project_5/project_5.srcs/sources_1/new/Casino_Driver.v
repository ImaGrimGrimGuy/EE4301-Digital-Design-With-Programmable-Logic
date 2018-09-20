`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/28/2018 12:40:38 PM
// Design Name: 
// Module Name: Casino_Driver
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


module Casino_Driver(    
    output reg [7:0] decoder,
    output reg [3:0] seg_enable,
    output [7:0] outseed,
    output [7:0] msg,
    input clk,
    input roll,
    input [7:0] seed,
    input rst
    );
    
    wire [7:0] q;
    parameter win_msg1 = 8'b10000011;
    parameter win_msg2 = 8'b10011111;
    parameter loss_msg1 = 8'b11100011;
    parameter loss_msg2 = 8'b11000101;
    parameter default_msg = 8'b11111111;
    reg [7:0] msg1;
    reg [7:0] msg2;
    wire cout;
    wire segclk;
    reg [1:0] tic;
    wire [7:0]decoder_s1;
    wire [7:0]decoder_s2;
    
    initial begin 
        tic = 0;
    end
    
    clock_divider CDIV (cout, clk);
    clock_divider #(.timeconst(15)) digits (segclk, clk);
    lsfr LSFR (q, seed, rst, cout);
    lookup LOOK_BOY1(decoder_s1,q[7:4]);
    lookup LOOK_BOY2(decoder_s2,q[3:0]);
    
    always @(posedge segclk) begin
        tic <= tic + 1;
        msg1 <= rst? default_msg:(roll? ((decoder_s1 == decoder_s2)? win_msg1:loss_msg1):(msg1));
        msg2 <= rst? default_msg:(roll? ((decoder_s1 == decoder_s2)? win_msg2:loss_msg2):(msg2));
    end
    
    assign outseed = seed;
    /*
    assign decoder = tic? decoder_s1: decoder_s2;
    assign seg_enable = tic? 4'b1101:4'b1110;

    assign msg = (tic)? msg1:msg2;
    */
    always @ (tic) begin
        case (tic)
            2'b00 : begin decoder = msg1; seg_enable = 4'b0111; end
            2'b01 : begin decoder = msg2; seg_enable = 4'b1011; end
            2'b10 : begin decoder = decoder_s1; seg_enable = 4'b1101; end
            2'b11 : begin decoder = decoder_s2; seg_enable = 4'b1110; end
        endcase
    end
endmodule
