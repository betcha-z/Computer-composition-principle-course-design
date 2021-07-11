`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/06/16 15:52:55
// Design Name: 
// Module Name: RIUSJB_CPU
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


module RIUSJB_CPU( 
       input rst_n,
       input clk,
       output [3:0]FR,
       output [31:0]PC_show,//PC的数据
       output [31:0]inst_show,//IR的数据
       output [31:0] W_Data_show,//写入寄存器的数据
       output [31:0]A_show,//暂存器A送入ALU的数据
       output [31:0]B_show,//暂存器B的数据
       output [31:0]F_show,//暂存器F的数据
       output [31:0] MDR_show
    );
    wire PC_Write;
    wire PC0_Write;
    wire IR_Write;
    wire Reg_Write;
    wire [4:0]rs1,rs2,rd;
    wire [31:0] imm32;//立即数
    wire [6:0]opcode;
    wire [6:0]funct7;
    wire [2:0]funct3;
   IM_IF_ID MFD1(
            .rst_n(rst_n),
            .clk_im(clk),
            .PC_Write(PC_Write),
            .PC0_Write(PC0_Write),
            .IR_Write(IR_Write),
            .PC_s(PC_s),
            .f(fout),
            .rs1(rs1),
            .rs2(rs2),
            .rd(rd),
            .pc(PC_show),
            .INST(inst_show),
            .imm32(imm32),
            .opcode(opcode),
            .funct3(funct3),
            .funct7(funct7)
      );
        wire rs2_imm_s;
        wire [1:0] w_data_s;
        wire [1:0] PC_s;
        wire [3:0] ALU_OP;
        wire ZF;
   ID2_CU cu(
            .rst_n(rst_n),
            .clk(clk),
            .opcode(opcode),
            .funct7(funct7),
            .funct3(funct3),
            .ZF(ZF),
            .PC_Write(PC_Write),
            .PC0_Write(PC0_Write),
            .IR_Write(IR_Write),
            .Reg_Write(Reg_Write),
            .Mem_Write(Mem_Write),
            .rs2_imm_s(rs2_imm_s),
            .w_data_s(w_data_s),
            .PC_s(PC_s),
            .ALU_OP_o(ALU_OP)
    );
    wire [31:0] fout;//F暂存器出来的
    wire [31:0] A_in,B_in;
    reg [31:0] W_Data;//Regs写入的
    wire [31:0] dm_out;
    wire [31:0] mdr;
    
    always @(*)
        begin
            case(w_data_s)
                2'b00:W_Data=fout;
                2'b01:W_Data=imm32;
                2'b10:W_Data=mdr;
                2'b11:W_Data=PC_show;
                default:W_Data = 32'b0;
            endcase
        end
    assign W_Data_show = W_Data;
    assign F_show = fout;
    Regs regs(
            .rst_(rst_n),
            .clk_Regs(~clk),
            .Reg_Write(Reg_Write),//控制写信号，为1时才写
            .R_Addr_A(rs1),//选择读寄存器的地址
            .R_Addr_B(rs2),
            .W_Addr(rd),//选择写的地址
            .W_Data(W_Data),//写的数据
            .R_Data_A(A_in),//读出寄存器的数据,送入A暂存器
            .R_Data_B(B_in)
    );
    ALU_ABF alu_abf(
        .clk_f(~clk),
        .clk_a(~clk),
        .clk_b(~clk),
        .rst_n(rst_n),
        .ALU_OP(ALU_OP),//
        .rs2_imm_s(rs2_imm_s),//
        .imm32(imm32),
        .Data_A(A_in),
        .Data_B(B_in),
        .A_show(A_show),
        .B_show(B_show),
        .F(fout),//可能写入reg的数据
        .FR(FR),
        .ZF(ZF)
    );
    DM dm1(
        .clk_dm(clk),
        .Mem_Write(Mem_Write),
        .DM_Addr(fout[7:0]),
        .M_W_Data(B_show),
        .M_R_Data(dm_out)    
    );
    MDR mdr1(
            .rst_n(rst_n),
            .clk_dm(~clk),
            .Data_in(dm_out),
            .Data_out(mdr)
    );
    assign MDR_show=mdr;
    
endmodule

