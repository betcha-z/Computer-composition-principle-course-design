`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/05/08 15:43:59
// Design Name: 
// Module Name: Regs
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



module Regs(
            input rst_,//�첽�����ʼ���ź�
            input clk_Regs,//ʱ���źţ�������ʱд��
            input Reg_Write,//����д�źţ�Ϊ1ʱ��д
            input [4:0] R_Addr_A,//ѡ����Ĵ����ĵ�ַ
            input [4:0] R_Addr_B,
            input [4:0] W_Addr,//ѡ��д�ĵ�ַ
            input [31:0] W_Data,//д������
            output [31:0] R_Data_A,//�����Ĵ���������
            output [31:0] R_Data_B
    );
    
    reg [31:0] REG_Files[0:31];//��������Ϊ32��S����������ÿ��Ԫ��Ϊ32Ϊ�ļĴ�������
    assign R_Data_A=REG_Files[R_Addr_A];//��ȡ����
    assign R_Data_B=REG_Files[R_Addr_B];
    integer i;       
    always @(negedge rst_ or posedge clk_Regs)//rst_�����ػ�clk_Regs������
        begin
            if(!rst_)//��ʼ��
                begin
//                    REG_Files[0]<=32'b0;
//                    REG_Files[1]<=32'h0000_0001;
//                    REG_Files[2]<=32'h0000_5566;
//                    REG_Files[3]<=32'hffff_0001;
//                    REG_Files[4]<=32'hfff8_0010;
                    for (i=0;i<32;i=i+1)
                            REG_Files[i]<=32'b0;//ȫ����0
                end
            else
                begin//д�Ĵ���
                    if(Reg_Write && W_Addr!=5'b0)
                        REG_Files[W_Addr]<=W_Data;    
                end
        end
endmodule
