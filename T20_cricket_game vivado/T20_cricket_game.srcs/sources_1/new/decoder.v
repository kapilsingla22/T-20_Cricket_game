`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/31/2020 11:42:02 AM
// Design Name: 
// Module Name: decoder
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


module decoder(
    input [1:0] s,
    output reg dp,
    output reg [3:0] en
    );
    
    always @(s)
    begin
    case(s)
    0: begin
    en<=4'b1111;
    dp<=1'b1;
    end
    1: begin
    en<=4'b1101; //when 2nd 7 segment display from right will get on
    dp<=1'b0;    // then its corresponding decimal point should be on
    end
    2: begin
    en<=4'b1011;
    dp<=1'b1;
    end
    3: begin
    en<=4'b0111;
    dp<=1'b1;
    end
    endcase
    end
endmodule
