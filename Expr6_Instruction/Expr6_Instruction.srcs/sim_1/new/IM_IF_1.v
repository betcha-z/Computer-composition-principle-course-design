`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/05/31 19:48:30
// Design Name: 
// Module Name: IM_IF_1
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


module IM_IF_1;
        reg rst_n;
        reg clk_im;
        reg PC_Write;//pc–¥–≈∫≈
        reg IR_Write;//ir–¥–≈∫≈
        wire [31:0] inst;
        
        IM_IF uut(
                .rst_n(rst_n),
                .clk_im(clk_im),
                .PC_Write(PC_Write),//pc–¥–≈∫≈
                .IR_Write(IR_Write),//ir–¥–≈∫≈
                .inst(inst)
                );
                
        initial
            begin
                PC_Write = 1;
                IR_Write = 1;
                rst_n = 1;
                clk_im = 0;
             #50;
                rst_n = 0;
             #50;
                rst_n = 1;   
             #50;
                clk_im = 1;
             #50;
                clk_im = 0;
             #50;
                clk_im = 1;
             #50;
                clk_im = 0;  
             #50;
                clk_im = 1;
             #50;
                clk_im = 0;
             #50;
                clk_im = 1;
             #50;
                clk_im = 0;
             #50;
                clk_im = 1;
             #50;
                clk_im = 0;
             #50;
                clk_im = 1;
             #50;
                clk_im = 0;
             #50;
                clk_im = 1;
             #50;
                clk_im = 0;   
                          
            end
       
endmodule
