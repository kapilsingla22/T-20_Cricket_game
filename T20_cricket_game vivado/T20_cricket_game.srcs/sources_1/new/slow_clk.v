`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/31/2020 11:06:58 AM
// Design Name: 
// Module Name: slow_clk
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


module slow_clk(
    input clk_fpga,
    output  clk
    );
    reg [15:0] counter;
    reg clk=0;
    always @(posedge clk_fpga)
    begin
    if(counter==50000)
    begin
    clk=~clk;
    counter<=0;
    end
    else
    counter<=counter+1;
    end
endmodule
