`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/06/01 12:46:56
// Design Name: 
// Module Name: IM_IF_ID
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


module IM_IF_ID(
        input rst_n,
        input clk_im,
        input PC_Write,
        input PC0_Write,
        input IR_Write,
        input [1:0] PC_s,
        input [31:0] f,
        output [4:0]rs1,
        output [4:0]rs2,
        output [4:0]rd,
        output [31:0] pc,
        output [31:0] INST,
        output [31:0] imm32,
        output [6:0] opcode,
        output [2:0] funct3,
        output [6:0] funct7
      );
      wire [31:0] inst;
      assign INST = inst;
      IM_IF im_if1(
         .rst_n(rst_n),
         .clk_im(clk_im),
         .PC_Write(PC_Write),//pc–¥–≈∫≈
         .PC0_Write(PC0_Write),
         .IR_Write(IR_Write),//ir–¥–≈∫≈
         .PC_s(PC_s),
         .imm32(imm32),
         .f(f),
         .pc(pc),
         .inst(inst)
         );
      ID1 id1(
         .inst(inst),
        .rs1(rs1),
        .rs2(rs2),
        .rd(rd),
        .imm32(imm32),
        .opcode(opcode),
        .funct3(funct3),
        .funct7(funct7)
        );  
        
       
endmodule