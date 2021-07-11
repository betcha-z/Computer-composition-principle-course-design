`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/05/31 21:58:07
// Design Name: 
// Module Name: ImmU_1
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


module ImmU_1;
        reg [5:0] I_fmt;
        reg [31:0] inst;
        wire [31:0] imm32;
        ImmU uut(
            .I_fmt(I_fmt),
            .inst(inst),
            .imm32(imm32)
            );
        initial
            begin
                I_fmt = 6'b100000;
                inst = 32'b1100_1100_1100_1100_1100_1100_1100_1100;
              #50;  I_fmt = 6'b010000;
             #50; I_fmt = 6'b001000;
             #50; I_fmt = 6'b000100;
             #50 I_fmt = 6'b000010;
             #50; I_fmt = 6'b000001;
             end
endmodule
