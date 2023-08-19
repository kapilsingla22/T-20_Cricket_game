`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/30/2020 04:19:13 PM
// Design Name: 
// Module Name: led_controller
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


module led_controller(
    input clk,
    input rst,
    input game_over,
    input innings_over,
    input [3:0] lfsr_out,
    input play,
    input switch_team,
    output reg [6:0] team1_ballscount,
    output reg [6:0] team2_ballscount,
    output reg [15:0] leds
    );
    wire scroll_leds;
    always @(posedge clk or posedge rst)
    begin
    if(rst)
    begin
    team1_ballscount<=0;
    team2_ballscount<=0;
    leds<=0;
    end
    else if(play )
    begin
    if(innings_over==0 && ~switch_team)
    begin
    case(lfsr_out)
    13,14    : team1_ballscount<=team1_ballscount;
    default  : team1_ballscount<=team1_ballscount +1;
    endcase
    leds<=team1_ballscount;
    end
    else if(innings_over==1 && switch_team)
    begin
    case(lfsr_out)
    13,14    : team2_ballscount<=team2_ballscount;
    default  : team2_ballscount<=team2_ballscount +1;
    endcase
    leds<=team2_ballscount;
    end
    end
    else if(game_over)
   leds<= scroll_leds;
   else if(~switch_team)
   leds<=team1_ballscount;
   else
   leds<=team2_ballscount;
    end
    scroll_led l1(clk,scroll_leds);
endmodule
