`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/31/2020 11:34:53 AM
// Design Name: 
// Module Name: mux4_1
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


module mux4_1(
    input [3:0] wick,
    input [3:0] ones,
    input [3:0] tens,
    input [3:0] hundreds,
    input [1:0] s,
    output reg [3:0] mux_out
    );
    
    always @(ones or tens or hundreds or wick or s)
    begin
    case(s)
    0: mux_out<=wick;
    1: mux_out<=ones;
    2: mux_out<=tens;
    3: mux_out<=hundreds;
    endcase
    end
endmodule
