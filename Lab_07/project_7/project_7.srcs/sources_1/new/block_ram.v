`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/12/2018 12:44:34 PM
// Design Name: 
// Module Name: block_ram
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


module block_ram(
    input [4:0] address,
    input [4:0]data_in,
    input write_enable,
    input clk,
    output [4:0] data_out
    );
    
    integer i;
    reg [4:0] memory [0:19];
    
    initial begin
        for (i = 0; i < 19; i = i+1) begin
            memory[i] = 5'h1F;
        end
    end
    
    
    always @(posedge clk) begin
        if(write_enable) begin
            memory[address] <= data_in;
        end
    end
    
    assign data_out = memory[address];
    
endmodule
