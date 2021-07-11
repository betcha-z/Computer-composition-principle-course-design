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
            .PC_show(PC),//PC的数据
            .inst_show(inst),//IR的数据
            .W_Data_show(W_Data),//写入寄存器的数据
            .A_show(A),//暂存器A送入ALU的数据
            .B_show(B),//暂存器B的数据
            .F_show(F),//暂存器F的数据
            .MDR_show(MDR)
    );
    DISP disp(
            .rst_(rst_n),//清零
            .clk_100M(clk_100M),
            .Data(Show_Data),
            .AN(AN),//位选信号
            .seg(seg)//段选信号
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
