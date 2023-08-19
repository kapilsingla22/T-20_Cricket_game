`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/31/2020 12:14:46 PM
// Design Name: 
// Module Name: cg2
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


module bcd_display(
    input [3:0] wicket,
    input [7:0] runs,
    input game_over,
    input innings_over,
    input winner_locked,
    input clk_fpga,
    output [6:0] seg,
    output dp,
    output [3:0] en
    );
    wire clk;
    wire [3:0] ones,tens,hundreds,wick,mux_out;
    wire [1:0] s;
    slow_clk cg2_1(clk_fpga,clk);
    
     bin2bcd cg2_2(runs,wicket,game_over,innings_over,winner_locked,ones,tens,hundreds,wick);
    
    counter_2bit cg2_3(clk,s);
    
    mux4_1 cg2_4(wick,ones,tens,hundreds,s,mux_out);
    
    decoder cg2_5(s,dp,en);
    
    bcd2_7seg cg2_6(mux_out,seg);
endmodule
