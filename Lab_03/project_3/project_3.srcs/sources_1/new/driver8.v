`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/19/2018 01:20:38 PM
// Design Name: 
// Module Name: driver8
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


module driver8(output cout,
    output [7:0] s,
    input [7:0] a,
    input [7:0] b,
    input cin
    );
    // temporary variables to hold output from the add and subtract modules.
    wire [7:0] subsum;
    wire [7:0] addsum;
    wire subcarry;
    wire addcarry;
    
    // note that cin is always 0 for lower modules, because it is not implemented in this design.
    subractor8 minusguy(subcarry,subsum,a,b,0);
    adder8 plusguy(addcarry,addsum,a,b,0);
    // assign cout and s outputs based on user pressed button from pre calculated add and subtract
    // modules.
    assign cout = (cin==1)? 0 : addcarry;
    assign s = (cin==1)? subsum : addsum;
endmodule
