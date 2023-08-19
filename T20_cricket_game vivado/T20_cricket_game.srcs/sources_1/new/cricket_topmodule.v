`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/31/2020 01:04:23 PM
// Design Name: 
// Module Name: cricket_topmodule
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


module cricket_topmodule(
    input clk,
    input rst,
    input switch_team,
    input button,
    output [6:0] seg,
    output [3:0] en,
    output dp,
    output [15:0] leds
    );
    wire play,game_over,innings_over,winner_locked;
    wire [7:0] runs;
    wire [3:0] wicket;
    debounce cg0(clk,button,play);
    cricket_game cg1(clk,rst,switch_team,play,game_over,innings_over,runs,wicket,winner_locked,leds);
    bcd_display cg2(wicket,runs, game_over, innings_over, winner_locked,clk,seg, dp, en );
    
endmodule
