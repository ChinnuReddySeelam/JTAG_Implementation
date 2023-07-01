`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.07.2023 14:08:15
// Design Name: 
// Module Name: counter1
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


module counter1(
input rst,clk,en,udbar,
output reg [3:0] cnt);
        always@(posedge clk) begin
        if(rst) cnt<=0;
        else begin
        if(en) begin
        if(udbar) cnt<=cnt+1;
        else cnt<=cnt-1;
        end
        end
        end
endmodule