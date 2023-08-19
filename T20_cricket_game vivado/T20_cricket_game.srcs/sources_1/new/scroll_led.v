`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/30/2020 03:48:12 PM
// Design Name: 
// Module Name: scroll_led
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


module scroll_led(
    input clk,
    output reg [15:0] led
    );
    reg slow_clk=0;
    reg [23:0] counter;
    reg [3:0] led_counter;
    always @(posedge clk)
    begin
    if(counter==125000)
    begin
    counter<=0;
    slow_clk<=~slow_clk;
    end
    else
    counter<=counter+1;
    end
    always @(posedge slow_clk)
    begin
    if(led_counter==15)
    led_counter<=0;
    else
    led_counter<=led_counter+1;
    end
    always @(posedge slow_clk)
    begin
    case(led_counter)
    4'b0000: led<=16'h0000;
    4'b0001: led<=16'hfffd;
    4'b0010: led<=16'hfffb;
    4'b0011: led<=16'hfff7;
    4'b0100: led<=16'hffef;
    4'b0101: led<=16'hffdf;
    4'b0110: led<=16'hffbf;
    4'b0111: led<=16'hff7f;
    4'b1000: led<=16'hfeff;
    4'b1001: led<=16'hfdff;
    4'b1010: led<=16'hfbff;
    4'b1011: led<=16'hf7ff;
    4'b1100: led<=16'hefff;
    4'b1101: led<=16'hdfff;
    4'b1110: led<=16'hbfff;
    4'b1111: led<=16'h7fff;
    endcase
end
endmodule
