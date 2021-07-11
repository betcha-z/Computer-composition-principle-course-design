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
    input IR_Write,//irд�ź�
    output [31:0] pc,
    output [31:0] inst
    );
    //�м����
    wire [31:0] PC_W_Data;//д�ص�pc�������
//    reg [31:0] PC_W_data;//����pc,��4���pc
    wire [31:0] PC_R_Data;//pc����������
    wire [31:0] IM_R_Data;
    wire [31:0] IR_W_Data;//��IM����������д��IR
    wire [5:0] IM_addr;
    assign IM_addr[5:0] = PC_R_Data[7:2];//pc��[7:2]��ΪIM��ַ
//    assign PC_W_Data = PC_R_Data;
    assign IR_W_Data = IM_R_Data;
    wire clk_;
    assign clk_ = ~clk_im;
    assign pc = PC_R_Data;//���ڰ弶��֤ʱ��ʾ
    ADD add(
            .pc_in(PC_R_Data),
            .pc_out(PC_W_Data)
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
    
//      always @(posedge ~clk_im)
//        begin
//        if(PC_Write)
//            PC_W_data <= PC_R_Data + 3'b100;//PC+4
//        end        
endmodule
