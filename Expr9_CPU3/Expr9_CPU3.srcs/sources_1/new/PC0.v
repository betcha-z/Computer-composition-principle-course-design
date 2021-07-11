`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/06/16 15:46:07
// Design Name: 
// Module Name: PC0
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


module PC0(
        input rst_n,
        input clk_pc0,
        input [31:0] pc0_in,
        input PC0_Write,
        output reg [31:0] pc0_out
    );
    always @(negedge rst_n or posedge clk_pc0)
        begin
            if(!rst_n)
                pc0_out <= 32'b0;
            else if(PC0_Write)
                pc0_out <= pc0_in;
        end 
endmodule
