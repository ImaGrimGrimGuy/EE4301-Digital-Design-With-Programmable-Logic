`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/12/2018 01:31:21 PM
// Design Name: 
// Module Name: Text_Input_Output
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


module Text_Input_Output(
    input [4:0] switches,
    input reset_button,
    input preview_button,
    input save_button,
    input clk,
    output reg [7:0] decoder,
    output reg [3:0] seg_enable
    );
    
    // wires and regs
    reg [2:0] state;
    reg [2:0] nexstate;
    wire segclk;
    wire scrollclk;
    reg [1:0] tic;
    reg [7:0] msg1;
    reg [7:0] msg2;
    reg [7:0] msg3;
    reg [7:0] msg4;
    reg [4:0] write_address;
    reg [4:0] read_address;
    wire [4:0] probe_address;
    reg [4:0] entry;
    wire [4:0] data_out;
    reg [7:0] letter;
    wire [7:0] preview_letter;
    wire [7:0] next_letter;
    wire [1:0] reset_button_trigger;
    wire [1:0] save_button_trigger;
    
    // parameters
    parameter idle = 3'b101;
    parameter preview = 3'b001;
    parameter save = 3'b010;
    parameter execute = 3'b100;
    
    //modules
    clock_divider #(.timeconst(15)) digits (segclk, clk);
    clock_divider scroller (scrollclk, clk);
    block_ram memory (probe_address, entry, ((reset_button)||(save_button)), clk, data_out);
    lookup translator (next_letter, data_out);
    lookup preview_translator (preview_letter, switches);
    Button_Trigger reset_trigger (clk, reset_button, reset_button_trigger);
    Button_Trigger save_trigger (clk, save_button, save_button_trigger);
    
    initial begin
    state <= idle;
    nexstate <= idle;
    entry <= 5'h1F;
    msg1 <= 8'b11111111;
    msg2 <= 8'b11111111;
    msg3 <= 8'b11111111;
    msg4 <= 8'b11111111;
    write_address <= 0;
    read_address <=0;
    end
    
    //main loop
    always @(posedge clk) begin
        if ((reset_button_trigger == 2'b01)) begin
            entry <= 5'h1F;
        end
        
            else if (reset_button_trigger == 2'b11) begin
                write_address <= write_address + 1;
            end
        
            else if (reset_button_trigger == 2'b10) begin
                write_address <= 0;
            end
        
        else begin
            if ((save_button_trigger == 2'b01) ||(save_button_trigger == 2'b11)) begin
                entry <= switches;
            end
        
            else if (save_button_trigger == 2'b10) begin
                write_address <= write_address + 1;
            end
        
            else begin
                entry <= 5'hf1;
            end
        end
    end
    
    always @(posedge scrollclk) begin
        if (write_address > 0) begin
            msg1 <= msg2;
            msg2 <= msg3;
            msg3 <= msg4;
            msg4 <= next_letter;
            if (read_address >= (write_address + 4)) begin
                read_address <= 0;
            end
            else begin
                read_address <= read_address + 1;
            end
        end
        else begin
            msg1 <= 8'b11111111;
            msg2 <= 8'b11111111;
            msg3 <= 8'b11111111;
            msg4 <= 8'b11111111;
        end
    end
    
    assign probe_address = ((reset_button) || (save_button))? write_address : read_address;
    
    // Display Output to 7-seg display
    always @(posedge segclk) begin
        tic <= tic + 1;
    end
    
    always @ (tic) begin
        case (tic)
            2'b00 : begin decoder = (preview_button)? (8'b11111111):(msg1); seg_enable = 4'b0111; end
            2'b01 : begin decoder = (preview_button)? (8'b11111111):(msg2); seg_enable = 4'b1011; end
            2'b10 : begin decoder = (preview_button)? (8'b11111111):(msg3); seg_enable = 4'b1101; end
            2'b11 : begin decoder = (preview_button)? (preview_letter):(msg4); seg_enable = 4'b1110; end
        endcase
    end
endmodule
