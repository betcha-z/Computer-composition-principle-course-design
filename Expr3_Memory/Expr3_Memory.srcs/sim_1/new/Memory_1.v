`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/05/11 21:26:10
// Design Name: 
// Module Name: Memory_1
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


module Memory_1;
    reg clk_dm;
    reg Mem_Write;
    reg [7:0] DM_Addr;
    reg [31:0] M_W_Data;
    wire [31:0] M_R_Data;
    
    Memory uut(
        .clk_dm(clk_dm),
        .Mem_Write(Mem_Write),
        .DM_Addr(DM_Addr),
        .M_W_Data(M_W_Data),
        .M_R_Data(M_R_Data)
        );
     initial
        begin
            clk_dm=0;Mem_Write=0; DM_Addr=8'b0000_0000;   M_W_Data=32'hbbcc0011; 
            #50;
            clk_dm=1;
            #50;
            clk_dm=0; DM_Addr=8'b0000_1010;
            #50;
            clk_dm=1;
            #50;
            clk_dm=0;DM_Addr=8'b10000_00;
            #50;
            clk_dm=1;
            #50;
            clk_dm=0;Mem_Write=1;
            #50;
            clk_dm=1;
        end
endmodule
