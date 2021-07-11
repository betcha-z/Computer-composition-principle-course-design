`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/06/15 21:11:26
// Design Name: 
// Module Name: ALU_ABF
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


module ALU_ABF(
        input clk_f,clk_a,clk_b,rst_n,
        input [3:0] ALU_OP,//
        input rs2_imm_s,//
//        input w_data_s,//
        input [31:0] imm32,
        input [31:0] Data_A,Data_B,
        output [31:0] A_show,
        output [31:0] B_show,
        output [31:0]F,
        output [3:0]FR,
        output ZF
    );
    
    
    wire [31:0]A,B,Data_F,F1;
    wire [3:0] Flag;
    
    wire [31:0] chooseB_data;
    assign chooseB_data = (rs2_imm_s == 0) ? B:imm32;//选择打入的是立即数还是寄存器里的数
    assign Data_F = F1;
    assign A_show = A;
    assign B_show = B;
    assign ZF =Flag[3];
    ABF ABF1(
            .rst_n(rst_n),
            .clk_a(clk_a),
            .clk_b(clk_b),
            .clk_f(clk_f),
            .Flag(Flag), 
            .Data_A(Data_A),
            .Data_B(Data_B),
            .Data_F(Data_F),
            .A(A),
            .B(B),
            .F(F),
            .FR(FR)
    );
    ALU ALU1(
            .ALU_OP(ALU_OP),
            .ALU_A(A),
            .ALU_B(chooseB_data),
            .ALU_F(F1),
            .ZF(Flag[3]),
            .SF(Flag[2]),
            .CF(Flag[1]),
            .OF(Flag[0])
            );       
    
endmodule
