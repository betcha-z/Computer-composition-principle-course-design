`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/06/16 01:02:01
// Design Name: 
// Module Name: RIUS_CPU1
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


module RIUSJB_CPU1;       
       reg rst_n;
       reg clk;
       wire [3:0] FR;
       wire [31:0] PC_show;
       wire [31:0]inst_show;
       wire [31:0] W_Data_show;
       wire [31:0]A_show;
       wire [31:0] B_show;
       wire [31:0]F_show;
       wire [31:0] MDR_show;
    RIUSJB_CPU uut(
        .rst_n(rst_n),
        .clk(clk),
        .FR(FR),
        .PC_show(PC_show),
        .inst_show(inst_show),
        .W_Data_show(W_Data_show),
        .A_show(A_show),
        .B_show(B_show),
        .F_show(F_show),
        .MDR_show(MDR_show)
        );
        
      initial
      begin
        rst_n =0;
        clk = 0;
         #50;
           rst_n = 1;
       end
        always #50 clk = ~clk;
            
endmodule
