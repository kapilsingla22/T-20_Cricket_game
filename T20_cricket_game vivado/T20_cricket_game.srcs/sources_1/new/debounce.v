`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/31/2020 12:57:15 PM
// Design Name: 
// Module Name: debounce
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


module debounce(
    input clk,
    input button,
    output play
    );
    wire q1,q1bar,q2,q2bar;
    dff cg0_1(button,clk,q1,q1bar);
    dff cg0_2(q1,clk,q2,q2bar);
    and(play,q1,q2bar);
endmodule
