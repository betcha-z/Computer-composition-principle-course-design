`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/06/15 21:12:42
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
            input rst_,//异步清零初始化信号
            input clk_Regs,//时钟信号，上跳沿时写入
            input Reg_Write,//控制写信号，为1时才写
            input [4:0] R_Addr_A,//选择读寄存器的地址
            input [4:0] R_Addr_B,
            input [4:0] W_Addr,//选择写的地址
            input [31:0] W_Data,//写的数据
            output [31:0] R_Data_A,//读出寄存器的数据
            output [31:0] R_Data_B
    );
    
    reg [31:0] REG_Files[0:31];//创建长度为32的S数组数组中每个元素为32为的寄存器类型
    assign R_Data_A=REG_Files[R_Addr_A];//读取数据
    assign R_Data_B=REG_Files[R_Addr_B];
    integer i;       
    always @(negedge rst_ or posedge clk_Regs)//rst_下跳沿或clk_Regs上跳沿
        begin
            if(!rst_)//初始化
                begin
                    for (i=0;i<32;i=i+1)
                            REG_Files[i]<=32'b0;//全部赋0
                end
            else
                begin//写寄存器
                    if(Reg_Write && W_Addr!=5'b0)
                        REG_Files[W_Addr]<=W_Data;    
                end
        end
endmodule

