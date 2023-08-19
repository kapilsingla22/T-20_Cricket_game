`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 22 G
// Engineer: Astaad
// 
// Create Date: 10/29/2020 06:23:20 PM
// Design Name: 
// Module Name: team_score
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


module team_score(
    input clk,
    input rst,
    input [3:0] lfsr_out,
    input game_over,
    input play,
    input switch_team,
    output reg [3:0] wicket,
    output reg [7:0] runs,
    output reg [11:0] team1_score,
    output reg [11:0] team2_score
    );
    parameter single=16,double=32,triple=48,four=64,six=96;    
    always @(posedge clk or posedge rst)
    begin
    if(rst)
    begin
    runs<=0;
    wicket<=0;
    team1_score<=0;
    team2_score<=0;
    end
    else if(game_over)
    begin
    runs<=runs;
    wicket<=wicket;
    team1_score<=team1_score;
    team2_score<=team2_score;
      end
    else if(play)
    begin
    if((~switch_team) && (wicket<10))
    begin
    case(lfsr_out)
    0,1,2   :  team1_score<=team1_score;
    3,4,5,6 :  team1_score<=team1_score + single;
    7,8,9   :  team1_score<=team1_score + double;
    10      :  team1_score<=team1_score + triple;
    11      :  team1_score<=team1_score + four;
    12      :  team1_score<=team1_score + six;
    13,14   :  team1_score<=team1_score + single;
    15      :  team1_score<=team1_score + 1;
    endcase
    runs<=team1_score[11:4];
    wicket<=team1_score[3:0];
    end
    else if((switch_team) && (wicket<10))
    begin
    case(lfsr_out)
    0,1,2   :  team2_score<=team1_score;
    3,4,5,6 :  team2_score<=team1_score + single;
    7,8,9   :  team2_score<=team1_score + double;
    10      :  team2_score<=team1_score + triple;
    11      :  team2_score<=team1_score + four;
    12      :  team2_score<=team1_score + six;
    13,14   :  team2_score<=team1_score + single;
    15      :  team2_score<=team1_score + 1;
    endcase
     runs<=team2_score[11:4];
    wicket<=team2_score[3:0];
    end
    end
    else 
    begin
    case(switch_team)
    0: begin
    runs<=team1_score[11:4];
    wicket<=team1_score[3:0];
    end
    1: begin
    runs<=team2_score[11:4];
    wicket<=team2_score[3:0];
    end
    endcase
    end
    
end
endmodule
