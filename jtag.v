`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.07.2023 11:34:12
// Design Name: 
// Module Name: jtag
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


module jtag(
        input tck,tms,tdi,trst,
        output tdo);
        reg IR;
        reg [3:0] ps,ns;
        parameter rtd = 4'd0,tlr=4'd1,sdrs=4'd2,cdr=4'd3,sdr=4'd4,e1dr=4'd5,pdr=4'd6,e2dr=4'd7,udr=4'd8,sirs=4'd9,cir=4'd10,sir=4'd11,e1ir=4'd12,pir=4'd13,e2ir=4'd14,uir=4'd15;
        
        always @(posedge tck) begin
        ps <= ns;
        end
        always @(*) begin
        case (ps)
        tlr:begin
            if(tms) ns<=tlr;
            else ns<=rtd;
            end
        rtd:begin
            if(tms) ns<=sdrs;
            else ns<=rtd;
            end
        sdrs:begin
             if(tms) ns<=sirs;
             else ns<=cdr;
             end
        cdr:begin
            if(tms) ns<=e1dr;
            else ns<=sdr;
            end
        e1dr:begin
            if(tms) ns<=udr;
            else ns<=pdr;
            end
        pdr:begin
            if(tms) ns<=e2dr;
            else ns<=pdr;
            end
        e2dr:begin
            if(tms) ns<=udr;
            else ns<=sdr;
            end
        udr:begin
            if(tms)
            ns<=sdr;
            else ns<=rtd;
            end
        sirs:begin
            if(tms) ns<=tlr;
            else ns<=cir;
            end
        cir:begin
            if(tms) ns<=e1ir;
            else ns<=sir;
            end
        sir:begin
            if(tms) ns<=e1ir;
            else ns<=sir;
            end
        e1ir:begin
            if(tms) ns<=uir;
            else ns<=pir;
            end
        pir:begin
            if(tms) ns<=e2ir;
            else ns<=pir;
            end
        e2ir:begin
            if(tms) ns<=uir;
            else ns<=sir;
        end
        uir:begin
            if(tms) ns<=sdrs;
            else ns<=rtd;
            end
       endcase
       end     
endmodule