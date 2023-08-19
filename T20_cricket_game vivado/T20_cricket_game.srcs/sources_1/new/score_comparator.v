`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/30/2020 05:06:09 PM
// Design Name: 
// Module Name: score_comparator
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


module score_comparator(
    input clk,
    input rst,
    input [11:0] team1_score,
    input [11:0] team2_score,
    input [6:0] team1_ballscount,
    input [6:0] team2_ballscount,
    input [3:0] wicket,
    input [15:0] balls,
    output reg innings_over,
    output reg game_over,
    output reg winner_locked
    );
    
    always @(posedge clk)
    begin
    if(wicket>=10 || balls>=120)
    innings_over<=0;
    else
        innings_over<=1;
 end
 always@(posedge clk or posedge rst)
 begin
 if(rst)
 game_over<=0;
 else if((team1_score[3:0]>=10 || team1_ballscount>=120) && (team2_score[3:0]>=10 || team2_ballscount>=120))
 game_over<=1;
 else
 game_over<=game_over;
 end
 always@(game_over)
 begin
 if(team1_score[11:4]>team2_score[11:4])
 winner_locked<=0;
 else
 winner_locked<=1;
 end
endmodule
