`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/19/2018 03:31:36 PM
// Design Name: 
// Module Name: scrolling_display
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


module scrolling_display(
    input logic [15:0] sw,
    input logic prog, enter, clk, reset,
    output logic [7:0] an, sseg);
    
    typedef enum {DEF_DISP, DISPLAY, PROG} scrolling_states;
    scrolling_states state, next_state;
    
    always_ff @(posedge clk, posedge reset)
        if (reset)
            state <= DEF_DISP;
        else
            state <= next_state;
            
    always_comb
    begin
        case (state)
        DEF_DISP:
        begin 
            // scroll default value across 7seg 
        end
        PROG:
        begin
            // User inputs values in hex on switches (16-bit)
            // when enter button is pushed, input values pushed to bram
        end
        DISPLAY:
        begin
            // User-input value scrolls across 7seg
        end
        endcase
    end
        
    
    
endmodule
