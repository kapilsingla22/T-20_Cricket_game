`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/31/2020 09:20:39 AM
// Design Name: 
// Module Name: bin2bcd
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


module bin2bcd(
    input [7:0] runs,
    input [3:0] wicket,
    input game_over,
    input innings_over,
    input winner_locked,
    output  reg [3:0] ones,
    output  reg [3:0] tens,
    output  reg [3:0] hundreds,
    output  reg [3:0] wick
    );
   wire [11:0] bin;
    assign   bin={runs,wicket};
reg [15:0] bcd;
   reg [3:0] i;
    always @(runs or wicket or game_over or innings_over or winner_locked)
    begin
    if(~game_over) //keep playing 
    begin
    if(innings_over) // if inning over then print 'IO'
    begin
    wick=4'b1100;// represent ' in bcd to 7 seg
    ones=4'b0000;//represent 0 in bcd to 7 seg
    tens=4'b1110;//represent I in bcd to 7 seg
    hundreds=4'b1100;//represent ' in bcd to 7 seg
    end
    else
    begin
   bcd=0;
    for(i=0;i<12;i=i+1)
    begin
    bcd={bcd[14:0],bin[11-i]};
    if(i<11 && bcd[3:0]>4)
    bcd[3:0]=bcd[3:0] +3;
    else if(i<11 && bcd[7:4]>4)
    bcd[7:4]=bcd[7:4] +3;
    else if(i<11 && bcd[11:8]>4)
    bcd[11:8]=bcd[11:8] +3;
    else if(i<11 && bcd[15:12]>4)
    bcd[15:12]=bcd[15:12] +3;
    end
    end
    wick=bcd[3:0];
    ones=bcd[7:4];
    tens=bcd[11:8];
    hundreds=bcd[15:12];
    end
    else
    begin
    case(winner_locked)
    0: begin //print t010
    wick=4'b0000;
    ones=4'b0001;
    tens=4'b0000;
    hundreds=4'b1111; 
    end
    1: begin //print t020
    wick=4'b0000;
    ones=4'b0010;
    tens=4'b0000;
    hundreds=4'b1111; 
    end
    endcase
    end
    
    end
    
endmodule
