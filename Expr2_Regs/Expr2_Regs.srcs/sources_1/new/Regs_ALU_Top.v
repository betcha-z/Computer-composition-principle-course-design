`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/05/09 13:26:59
// Design Name: 
// Module Name: Regs_ALU_Top
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


module Regs_ALU_Top(
        input clk_100M,
        input rst_,
        input clk_WB,
        input clk_RR,
        input clk_F,
        input Reg_Write,
        input [3:0] ALU_OP,
        input [4:0] R_Addr_A,
        input [4:0] R_Addr_B,
        input [4:0] W_Addr,
        output [3:0] FR,
        output [7:0] An,
        output [7:0]Seg
    );
    
        wire [31:0]F;
        Regs_ALU RA1(
            .rst_(rst_),
            .clk_WB(clk_WB),
            .clk_RR(clk_RR),
            .clk_F(clk_F),
            .Reg_Write(Reg_Write),
            .ALU_OP(ALU_OP),
            .R_Addr_A(R_Addr_A),
            .R_Addr_B(R_Addr_B),
            .W_Addr(W_Addr),
            .FR(FR),
            .F(F)
            );
         DISP DISP1(
            .rst_(rst_),
            .clk_100M(clk_100M),
            .Data(F),
            .AN(An),
            .seg(Seg)
            );   
        
endmodule
