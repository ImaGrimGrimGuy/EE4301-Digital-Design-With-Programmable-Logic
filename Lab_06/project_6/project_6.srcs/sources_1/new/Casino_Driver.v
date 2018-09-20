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
    input clk,
    input roll,
    input [7:0] seed,
    input rst
    );
    
    // messages
    parameter win_msg1 = 8'b10000011;
    parameter win_msg2 = 8'b10011111;
    parameter loss_msg1 = 8'b11100011;
    parameter loss_msg2 = 8'b11000101;
    parameter roll_msg1 = 8'b11110101;
    parameter roll_msg2 = 8'b11000101;
    parameter default_msg = 8'b11111111;
    //states
    parameter idle = 4'b000;
    parameter roll_1 = 4'b001;
    parameter roll_2 = 4'b010;
    parameter lose = 4'b011;
    parameter win = 4'b100;
    //placeholders and temp variables
    wire [7:0] sum;
    wire cout;
    reg pause = 0;
    reg [2:0] state;
    reg [2:0] nexstate;
    reg [7:0] msg1;
    reg [7:0] msg2;
    wire segclk;
    wire rollclk;
    reg [1:0] tic;
    wire [7:0] decoder_s1;
    wire [7:0] decoder_s2;
    wire [7:0] dice;
    reg [7:0] saved = 8'h00;
    
    initial begin 
        tic = 0;
        msg1 = default_msg;
        msg2 = default_msg;
    end

    clock_divider #(.timeconst(15)) digits (segclk, clk);
    clock_divider #(.timeconst(35)) rolling (rollclk, clk);
    Die_Simulator Roll(dice, seed, rst, rollclk, pause);
    // adder8 points(cout, sum, {4'b0000,dice[7:4]}, {4'b0000,dice[3:0]}, 0);
    assign sum = dice[7:4] + dice[3:0];
    lookup LOOK_BOY1(decoder_s1,dice[7:4]);
    lookup LOOK_BOY2(decoder_s2,dice[3:0]);
    
    always @(posedge clk) begin
        if (rst) begin
            state <= idle;
            nexstate <= idle;
            msg1 <= default_msg;
            msg2 <= default_msg;
            saved <= 8'h00;
            pause <= 0;
        end
        else begin
        case (state)
            idle : begin 
                if (saved == 0) begin
                    if (roll) begin
                        nexstate <= roll_1;
                        pause <= 1;
                    end
                    else begin
                        nexstate <= idle;
                    end
                end
                else begin
                    msg1 <= roll_msg1;
                    msg2 <= roll_msg2;
                    if (roll) begin
                        nexstate <= roll_2;
                        pause <= 1;
                    end
                    else begin
                        nexstate <= idle;
                    end
                end
            end
            roll_1 : begin
                if (roll) begin
                    nexstate <= roll_1;
                end
                else begin
                    if ((sum == 7)||(sum == 11)) begin
                        nexstate <= win;
                    end
                    else if ((sum == 2)||(sum == 3)||(sum == 12)) begin
                    nexstate <= lose;
                    end
                    else begin
                        saved <= sum;
                        nexstate <= idle;
                        pause <= 0;
                    end
                end
            end
            roll_2 : begin
                if (roll) begin
                    nexstate <= roll_2;
                end
                else begin
                    if (sum == saved) begin
                        nexstate <= win;
                    end
                    else if (sum == 7) begin
                        nexstate <= lose;
                    end
                    else begin
                        nexstate <= idle;
                        pause <= 0;
                    end
                end
            end
            win : begin
                msg1 <= win_msg1;
                msg2 <= win_msg2;
            end
            lose : begin
                msg1 <= loss_msg1;
                msg2 <= loss_msg2;
            end
            default : begin
            end
        endcase
        state = nexstate;
        end
    end
    
    
    always @(posedge segclk) begin
        tic <= tic + 1;
    end
    
    assign outseed = seed;
    
    always @ (tic) begin
        case (tic)
            2'b00 : begin decoder = msg1; seg_enable = 4'b0111; end
            2'b01 : begin decoder = msg2; seg_enable = 4'b1011; end
            2'b10 : begin decoder = decoder_s1; seg_enable = 4'b1101; end
            2'b11 : begin decoder = decoder_s2; seg_enable = 4'b1110; end
        endcase
    end
endmodule
