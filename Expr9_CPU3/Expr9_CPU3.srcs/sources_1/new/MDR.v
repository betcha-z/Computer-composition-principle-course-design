`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/06/15 21:33:38
// Design Name: 
// Module Name: MDR
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


module MDR(
    input rst_n,
    input clk_dm,
    input [31:0]Data_in,
    output reg [31:0]Data_out
    );
    always @(negedge rst_n or posedge clk_dm)
        begin
            if(!rst_n)
                Data_out <= 32'b0;
            else
                Data_out <= Data_in;
        end 
endmodule

