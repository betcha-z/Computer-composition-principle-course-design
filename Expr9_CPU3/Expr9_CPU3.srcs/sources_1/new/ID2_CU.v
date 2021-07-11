`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/06/08 16:51:35
// Design Name: 
// Module Name: ID2_CU
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

//连接ID2和CU成译码和控制单元
module ID2_CU(
        input rst_n,
        input clk,
        input [6:0] opcode,
        input [6:0] funct7,
        input [2:0] funct3,
        input ZF,
        output PC_Write,
        output PC0_Write,
        output IR_Write,
        output Reg_Write,
        output Mem_Write,
        output rs2_imm_s,
        output [1:0] w_data_s,
        output [1:0] PC_s,
        output [3:0] ALU_OP_o
    );
    wire IS_R,IS_IMM,IS_LUI,IS_LW,IS_SW,IS_BEQ,IS_JAL,IS_JALR;
    wire [3:0] alu_op;
    ID2 Id21(
            .opcode(opcode),
            .funct3(funct3),
            .funct7(funct7),
            .IS_R(IS_R),
            .IS_IMM(IS_IMM),
            .IS_LUI(IS_LUI),
            .IS_LW(IS_LW),
            .IS_SW(IS_SW),
            .IS_BEQ(IS_BEQ),
            .IS_JAL(IS_JAL),
            .IS_JALR(IS_JALR),
            .ALU_OP(alu_op)        
    );
    CU  cu(
            .clk(clk),
            .rst_n(rst_n),
            .IS_R(IS_R),
            .IS_IMM(IS_IMM),
            .IS_LUI(IS_LUI),
            .IS_LW(IS_LW),
            .IS_SW(IS_SW),
            .IS_BEQ(IS_BEQ),
            .IS_JAL(IS_JAL),
            .IS_JALR(IS_JALR),
            .ALU_OP(alu_op),
            .ZF(ZF),
            .PC_Write(PC_Write),
            .PC0_Write(PC0_Write),
            .IR_Write(IR_Write),
            .Reg_Write(Reg_Write),
            .Mem_Write(Mem_Write),
            .rs2_imm_s(rs2_imm_s),
            .PC_s(PC_s),
            .w_data_s(w_data_s),
            .ALU_OP_o(ALU_OP_o)
    );
endmodule
