`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/21/2018 01:57:03 PM
// Design Name: 
// Module Name: lookup
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


module lookup(
    output reg [7:0] decoder,
    input [4:0] q
    );
    
    always @(q) begin
        case (q)
            5'h0 : decoder = 8'b00010001; //A
            5'h1 : decoder = 8'b00000001; //B
            5'h2 : decoder = 8'b01100011; //C
            5'h3 : decoder = 8'b00000011; //D
            5'h4 : decoder = 8'b01100001; //E
            5'h5 : decoder = 8'b01110001; //F
            5'h6 : decoder = 8'b01000001; //G
            5'h7 : decoder = 8'b11010001; //h
            5'h8 : decoder = 8'b11110011; //I
            5'h9 : decoder = 8'b10000111; //J
            5'hA : decoder = 8'b10010001; //K
            5'hB : decoder = 8'b11100011; //L
            5'hC : decoder = 8'b00001101; //M
            5'hD : decoder = 8'b11010101; //n
            5'hE : decoder = 8'b11000101; //o
            5'hF : decoder = 8'b00110001; //P
            5'h10 : decoder = 8'b00011001; //q
            5'h11 : decoder = 8'b11110101; //r
            5'h12 : decoder = 8'b01001001; //S
            default : decoder = 8'b11111111; //blank
        endcase 
    end 
endmodule
