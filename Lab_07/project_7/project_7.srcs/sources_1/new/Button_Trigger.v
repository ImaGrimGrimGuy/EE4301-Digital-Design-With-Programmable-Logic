`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/12/2018 03:33:05 PM
// Design Name: 
// Module Name: Button_Trigger
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


module Button_Trigger(
    input clk,
    input button,
    output reg[1:0] trigger
    );
    
    always @(posedge clk) begin
        trigger = {trigger[0],button};
    end
    
endmodule
