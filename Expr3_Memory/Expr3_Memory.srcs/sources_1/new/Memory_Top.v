`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/05/11 19:04:20
// Design Name: 
// Module Name: Memory_Top
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


module Memory_Top(
    input rst_,
    input clk_100M,
    input clk_dm,
    input Mem_Write,
    input [7:0] DM_Addr,
    input [1:0] M_W_Data_s,
    output [7:0] An,
    output [7:0]Seg
    );
    wire [31:0] W_DATA;//中间变量
    reg [31:0] DATA;//四个常量用于写入存储器
    wire [31:0] R_DATA;//从存储器读出的数据后接入数码管显示
    Memory Mem1(
         .clk_dm(clk_dm),
         .Mem_Write(Mem_Write),
         .DM_Addr(DM_Addr),
         .M_W_Data(W_DATA),
         .M_R_Data(R_DATA)   
    );
    DISP  DISP1(
        .rst_(rst_),//清零
        .clk_100M(clk_100M),
        .Data(R_DATA),
        .AN(An),//位选信号
        .seg(Seg)//段选信号
    );
    always @(*)
        begin
            case(M_W_Data_s)
                    2'b00: DATA= 32'h66554433;
                    2'b01: DATA= 32'hbbbbcccc;
                    2'b10: DATA= 32'h11002233;
                    2'b11: DATA= 32'h00000000;
                    default: DATA = 32'b0;
            endcase    
        end  
     assign W_DATA =DATA; 
endmodule
