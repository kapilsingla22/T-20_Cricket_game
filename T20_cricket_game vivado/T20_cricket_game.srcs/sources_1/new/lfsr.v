`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 22 G
// Engineer: ASTAAD
// 
// Create Date: 10/29/2020 06:11:34 PM
// Design Name: 
// Module Name: lfsr
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


module lfsr(
    input clk,
    input rst,
    output [3:0] lfsr_out
    );
    reg [5:0] shift;
    wire a;
    assign a=shift[1] ^ shift[0];
    always @(posedge clk or posedge rst)
    begin
    if(rst)
    shift <= 6'b 111111;
    else
    shift <= {a,shift[5:1]};
    end   
    assign lfsr_out = shift[3:0];
endmodule
