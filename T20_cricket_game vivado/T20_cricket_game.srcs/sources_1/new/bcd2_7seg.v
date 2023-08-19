`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/31/2020 11:51:49 AM
// Design Name: 
// Module Name: bcd2_7seg
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


module bcd2_7seg(
    input [3:0] mux_out,
    output reg [6:0] seg
    );
    
   always @(mux_out)
   begin
   case(mux_out)
   0: seg<=7'b0000_001;
   1: seg<=7'b1111_001;
   2: seg<=7'b0010_010;
   3: seg<=7'b0000_110;
   4: seg<=7'b1001_100;
   5: seg<=7'b0100_100;
   6: seg<=7'b0100_000;
   7: seg<=7'b0001_111;
   8: seg<=7'b0000000;
   9: seg<=7'b0000_100;
   10: seg<=7'b0001_000;
   11: seg<=7'b1100_000;
   12: seg<=7'b1111_101; //represents '
   13: seg<=7'b1111_001; //represents I
   14: seg<=7'b1011_111;//represents '
   15: seg<=7'b1110_000; //represents t
   endcase
   
   
   end
endmodule
