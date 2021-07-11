`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/06/08 19:42:43
// Design Name: 
// Module Name: IR
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


module IR(
    input rst_n,
    input clk,
    input Write,//Ð´ÐÅºÅ
    input [31:0] W_Data,
    output reg [31:0] R_Data
    );
    always@(negedge rst_n or posedge clk)
    begin
        if(!rst_n)
            begin
            R_Data <= 32'b0;
            end
        else
            begin
                if(Write)
                   R_Data <= W_Data;      
            end    
    end
endmodule