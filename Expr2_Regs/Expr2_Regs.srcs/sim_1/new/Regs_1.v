`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/05/08 20:23:00
// Design Name: 
// Module Name: Regs_1
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


module Regs_1;
            reg rst_, clk_Regs, Reg_Write;
            reg [4:0] R_Addr_A;
            reg [4:0] R_Addr_B;
            reg [4:0] W_Addr;
            reg [31:0] W_Data;
            wire [31:0] R_Data_A;
            wire [31:0] R_Data_B;
        Regs uut(
                .rst_(rst_), .clk_Regs(clk_Regs), .Reg_Write(Reg_Write),
                .R_Addr_A(R_Addr_A), .R_Addr_B(R_Addr_B), .W_Addr(W_Addr), .W_Data(W_Data),
                .R_Data_A(R_Data_A), .R_Data_B(R_Data_B)
                );
                
       initial
           begin
                rst_ =1;clk_Regs = 0; Reg_Write = 1;
                R_Addr_A = 5'b00000; R_Addr_B = 5'b00001; W_Addr = 5'b1; W_Data=32'hffff_ffff;
               #50;//验证rst_
                    rst_ =0; 
               #20;
                    rst_ = 1;
               #50; //验证写
                    clk_Regs = 1; 
                #20;//0寄存器不能写入
                    clk_Regs =0;
                    W_Addr = 5'b0;
                #20;
                    clk_Regs =1;    
                #50;//读另外两个寄存器
                    R_Addr_A = 5'b00010; R_Addr_B = 5'b00011;
                #50;//当Regs_Write为0时，无法写入
                    clk_Regs =0;
                    Reg_Write =0;
                    W_Addr = 5'b00011;
                #50;
                    clk_Regs =1;
                #50;
                    clk_Regs =0;
                    Reg_Write =1;
                    W_Addr = 5'b01011;
                    W_Data=32'h5656_4321;
                    R_Addr_B = 5'b01011;
                #50;
                    clk_Regs =1;
                #50;
                    rst_ =0;    
           end                                       
endmodule
