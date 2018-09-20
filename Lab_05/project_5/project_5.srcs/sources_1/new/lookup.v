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
    input [3:0] q
    );
    
    always @(q) begin
        case (q)
            4'h0 : decoder = 8'b00000011;
            4'h1 : decoder = 8'b10011111;
            4'h2 : decoder = 8'b00100101;
            4'h3 : decoder = 8'b00001101;
            4'h4 : decoder = 8'b10011001;
            4'h5 : decoder = 8'b01001001;
            4'h6 : decoder = 8'b00000101;
            4'h7 : decoder = 8'b00011111;
            4'h8 : decoder = 8'b00000001;
            4'h9 : decoder = 8'b00001001;
            4'hA : decoder = 8'b00010001;
            4'hB : decoder = 8'b11000001;
            4'hC : decoder = 8'b01100011;
            4'hD : decoder = 8'b10000101;
            4'hE : decoder = 8'b01100001;
            4'hF : decoder = 8'b01110001;
            default : decoder = 8'b11111111;
        endcase 
    end 
endmodule
