`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.07.2023 15:28:13
// Design Name: 
// Module Name: top_module
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


module top_module(
        input pin1,pin2,pin3,clk,sdr,clk_dr,up_dr,mode,sin1,
        output pout1,pout2,pout3,pout4,sout1
        );
        wire rst,udbar,en;
        wire [3:0] cnt;
        wire sin2,sin3,sin4,sin5,sin6,sin7;
        counter1 counter_jtag(rst,clk,en,udbar,cnt);
        bsc bsc1(pin1,sdr,sin1,clk_dr,up_dr,mode,sin2,rst);
        bsc bsc2(pin2,sdr,sin2,clk_dr,up_dr,mode,sin3,en);
        bsc bsc3(pin3,sdr,sin3,clk_dr,up_dr,mode,sin4,udbar);
        bsc bsc4(cnt[0],sdr,sin4,clk_dr,up_dr,mode,sin5,pout1);
        bsc bsc5(cnt[1],sdr,sin5,clk_dr,up_dr,mode,sin6,pout2);
        bsc bsc6(cnt[2],sdr,sin6,clk_dr,up_dr,mode,sin7,pout3);
        bsc bsc7(cnt[3],sdr,sin7,clk_dr,up_dr,mode,sout1,pout4);
        
endmodule
