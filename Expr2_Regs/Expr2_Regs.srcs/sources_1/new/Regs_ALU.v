`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/05/08 15:52:37
// Design Name: 
// Module Name: Regs_ALU
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


module Regs_ALU(
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
        output [31:0] F
    );
    
        wire [31:0] R_Data_A, R_Data_B;
        wire [31:0] A,B;
        wire [31:0] W_Data;//从ALU计算出来的F
        assign W_Data = F;
        ALU_ABF ALU_ABF1(
                .clk_f(clk_F),
                .clk_a(clk_RR),
                .clk_b(clk_RR),
                .rst_n(rst_),
                .ALU_OP(ALU_OP),
                .Data_A(A),
                .Data_B(B),
                .F(F),
                .FR(FR)
                );
         
        Regs Regs1(
                .rst_(rst_),
                .clk_Regs(clk_WB),
                .Reg_Write(Reg_Write),
                .R_Addr_A(R_Addr_A),
                .R_Addr_B(R_Addr_B),
                .W_Addr(W_Addr),
                .W_Data(W_Data),
                .R_Data_A(R_Data_A),
                .R_Data_B(R_Data_B)
                );
                 
        assign A = R_Data_A;
        assign B = R_Data_B;     
endmodule
