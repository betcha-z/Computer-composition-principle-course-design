`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/06/15 21:22:45
// Design Name: 
// Module Name: DM
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


module DM(
    input clk_dm,
    input Mem_Write,
    input [7:0] DM_Addr,
    input [31:0] M_W_Data,
    output [31:0] M_R_Data    
    );
    //创建实例连接Memory模块
    RAM_SP2 Data_RAM (
      .clka(clk_dm),    // input wire clka
      .wea(Mem_Write),      // input wire [0 : 0] wea
      .addra(DM_Addr[7:2]),  // input wire [5 : 0] addra
      .dina(M_W_Data),    // input wire [31 : 0] dina
      .douta(M_R_Data)  // output wire [31 : 0] douta
    );
    
endmodule
