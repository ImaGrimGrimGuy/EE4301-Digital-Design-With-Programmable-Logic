`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/19/2018 01:05:41 PM
// Design Name: 
// Module Name: subractor8
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


module subractor8(
    output cout,
    output [7:0] d,
    input [7:0] a,
    input [7:0] b,
    input cin
    );
    
    wire[7:0] one;
    wire[7:0] bcomp;
    wire[7:1] carry;
    
    // one's complement of b
    assign bcomp[0] = ~b[0];
    assign bcomp[1] = ~b[1];
    assign bcomp[2] = ~b[2];
    assign bcomp[3] = ~b[3];
    assign bcomp[4] = ~b[4];
    assign bcomp[5] = ~b[5];
    assign bcomp[6] = ~b[6];
    assign bcomp[7] = ~b[7];
    
    // perform the subtraction 
    // diff = a + ones_complement(b) + 1
    full_adder FS0(carry[1],d[0],a[0],bcomp[0],1);
    full_adder FS1(carry[2],d[1],a[1],bcomp[1],carry[1]);
    full_adder FS2(carry[3],d[2],a[2],bcomp[2],carry[2]);
    full_adder FS3(carry[4],d[3],a[3],bcomp[3],carry[3]);
    full_adder FS4(carry[5],d[4],a[4],bcomp[4],carry[4]);
    full_adder FS5(carry[6],d[5],a[5],bcomp[5],carry[5]);
    full_adder FS6(carry[7],d[6],a[6],bcomp[6],carry[6]);
    full_adder FS7(cout,d[7],a[7],bcomp[7],carry[7]);
endmodule
