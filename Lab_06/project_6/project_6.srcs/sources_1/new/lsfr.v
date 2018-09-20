`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/21/2018 01:04:57 PM
// Design Name: 
// Module Name: lsfr
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


module lsfr(output reg [7:0]q,
            input [7:0]seed,
            input rst,
            input clock,
            input pause);

    wire din;

    always @(posedge clock) begin
        if (rst) begin
            q <= seed;
        end
        else begin
            if (pause == 0) begin
                q <= {q[6:0],din};
            end
        end
    end
    assign din = q[1]^q[2]^q[3]^q[7];
endmodule
