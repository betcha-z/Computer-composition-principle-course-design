`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/06/18 07:36:04
// Design Name: 
// Module Name: CPU3_Top
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


module CPU3_Top(
        input clk_100M,
        input rst_n,
        input clk,
        input [1:0] SW,
        output [7:0]AN,
        output [7:0]seg,
        output [3:0] FR
     );
     wire [31:0] PC,inst,W_Data,A,B,F,MDR;
     reg [31:0] Show_Data;
    RIUSJB_CPU cpu3( 
            .rst_n(rst_n),
            .clk(clk),
            .FR(FR),
            .PC_show(PC),//PC������
            .inst_show(inst),//IR������
            .W_Data_show(W_Data),//д��Ĵ���������
            .A_show(A),//�ݴ���A����ALU������
            .B_show(B),//�ݴ���B������
            .F_show(F),//�ݴ���F������
            .MDR_show(MDR)
    );
    DISP disp(
            .rst_(rst_n),//����
            .clk_100M(clk_100M),
            .Data(Show_Data),
            .AN(AN),//λѡ�ź�
            .seg(seg)//��ѡ�ź�
    );
    always @(*)
        begin
            case(SW)
                2'b00:Show_Data = PC;
                2'b01:Show_Data = inst;
                2'b10:Show_Data = MDR;
                2'b11:Show_Data = W_Data;
                default: 
                    Show_Data = 32'b0;
           endcase
       end
endmodule
