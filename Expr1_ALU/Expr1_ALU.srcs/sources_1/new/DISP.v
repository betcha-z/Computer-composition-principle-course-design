`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/26 23:56:54
// Design Name: 
// Module Name: DISP
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


//�������ʾ��ͨ��ģ��
module DISP(
    input rst_,//����
    input clk_100M,
    input [31:0]Data,
    output [7:0]AN,//λѡ�ź�
    output [7:0]seg//��ѡ�ź�
    );
    wire clk_ref;
    Fdiv Fdiv1(
        .rst_(rst_),
        .clk_100M(clk_100M),
        .clk_500(clk_ref)
        );
     Display disp1(
        .Data(Data),
        .clk_ref(clk_ref),
        .rst_(rst_),
        .AN(AN),
        .seg(seg)
        );
endmodule