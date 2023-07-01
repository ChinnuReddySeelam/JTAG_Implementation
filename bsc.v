`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.07.2023 14:13:29
// Design Name: 
// Module Name: bsc
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


module bsc(
        input pin,sdr,sin,clk_dr,up_dr,mode,
        output sout,
        output reg pout);
        reg w1,w2,w3;
        always @(*) begin
        case(sdr)
        0 : w1 = pin;
        1 : w1 = sin;
        default : begin end
        endcase
        end
        
        always @(*) begin
        case(mode)
        0 : pout = pin;
        1 : pout = w3;
        default : begin end
        endcase
        end
        
        always @(posedge clk_dr) begin
        w2 <= w1;
        end
        
        always @(posedge up_dr) begin
        w3 <= w2;
        end
        
        assign sout = w2;
        
endmodule
