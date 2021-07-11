`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/05/31 19:40:54
// Design Name: 
// Module Name: IM_IF
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


module IM_IF(
    input rst_n,
    input clk_im,
    input PC_Write,//pcд�ź�
    input PC0_Write,
    input IR_Write,//irд�ź�
    input [1:0] PC_s,
    input [31:0] imm32,
    input [31:0] f,
    output [31:0] pc,
    output [31:0] inst
    );
    //�м����
    wire [31:0] add_out;
    reg [31:0] PC_W_Data;//д��PC������
    wire [31:0] PC_R_Data;//pc����������
    wire [31:0] IM_R_Data;
    wire [31:0] IR_W_Data;//��IM����������д��IR
    wire [5:0] IM_addr;
    assign IM_addr[5:0] = PC_R_Data[7:2];//pc��[7:2]��ΪIM��ַ
    assign IR_W_Data = IM_R_Data;
    wire clk_;
    assign clk_ = ~clk_im;
    assign pc = PC_R_Data;//���ڰ弶��֤ʱ��ʾ
    wire [31:0] pc0_out;
    wire [31:0] add2_out;
    ADD add(
            .pc_in(PC_R_Data),
            .pc_out(add_out)
            );
    PC PC1(
            .rst_n(rst_n),
            .clk(clk_),
            .Write(PC_Write),
            .W_Data(PC_W_Data),
            .R_Data(PC_R_Data)
        );
     IR  IR1(
            .rst_n(rst_n),
            .clk(clk_),
            .Write(IR_Write),
            .W_Data(IR_W_Data),
            .R_Data(inst)
        ); 
     IM IM1(
            .clk_im(clk_im),
            .IM_Addr(IM_addr),
            .Inst_Code(IM_R_Data)
        );   
    PC0 pc0(
            .rst_n(rst_n),
            .clk_pc0(clk_),
            .PC0_Write(PC0_Write),
            .pc0_in(PC_R_Data),
            .pc0_out(pc0_out)
        );
    ADDpc0 add2(
            .pc0(pc0_out),
            .imm32(imm32),
            .addpc0_out(add2_out)
    );
    always @(*)//ѡ��д��PC������
        begin
            case(PC_s)
                2'b00:PC_W_Data=add_out;
                2'b01:PC_W_Data=add2_out;
                2'b10:PC_W_Data=f;
                default:PC_W_Data = 32'b0;
            endcase
        end
endmodule
