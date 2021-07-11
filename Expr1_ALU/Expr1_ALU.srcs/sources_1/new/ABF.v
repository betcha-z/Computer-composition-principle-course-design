`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/21 12:13:26
// Design Name: 
// Module Name: ABF
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


module ABF(
    input rst_n,
    input clk_a,
    input clk_b,
    input clk_f,
    input [3:0] Flag, 
    input [31:0]Data_A,
    input [31:0]Data_B,
    input [31:0]Data_F,
    output reg [31:0]A,
    output reg [31:0]B,
    output reg [31:0]F,
    output reg [3:0]FR
    );
    always @(negedge rst_n or posedge clk_a)
        begin
            if(!rst_n)
                A <= 32'b0;
            else
                A <= Data_A;
        end 
     always @(negedge rst_n or posedge clk_b)
        begin
            if(!rst_n)
                B <= 32'b0;
            else
                B <= Data_B;
        end
       always @(negedge rst_n or posedge clk_f)
        begin
            if(!rst_n)
                begin
                    FR <= 4'b0;
                    F <= 32'b0;
                 end   
            else
                begin
                    F <= Data_F;
                    FR <= Flag;
                end    
        end 
endmodule
