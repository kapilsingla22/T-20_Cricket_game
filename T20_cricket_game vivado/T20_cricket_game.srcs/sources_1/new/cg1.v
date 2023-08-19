`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/31/2020 08:33:20 AM
// Design Name: 
// Module Name: cg1
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


module cricket_game(
    input clk,
    input rst,
    input switch_team,
    input play,
    output game_over,
    output innings_over,
    output [7:0] runs,
    output [3:0] wicket,
    output winner_locked,
    output [15:0] leds
    );
    wire [3:0] lfsr_out;
    wire [11:0] team1_score,team2_score;
    wire [6:0] team1_ballscount,team2_ballscount;
    
 lfsr cg1_1 (clk,rst,lfsr_out);

team_score cg1_2(
     clk,
     rst,
   lfsr_out,
     game_over,
     play,
     switch_team,
       wicket,
       runs,
    team1_score,
      team2_score
    );
    
    led_controller cg1_3(
     clk,
     rst,
     game_over,
     innings_over,
      lfsr_out,
     play,
     switch_team,
     team1_ballscount,
     team2_ballscount,
    leds
    );
    
    score_comparator cg1_4(
     clk,
     rst,
      team1_score,
     team2_score,
     team1_ballscount,
     team2_ballscount,
    wicket,
    leds,
      innings_over,
      game_over,
      winner_locked
    );
    endmodule