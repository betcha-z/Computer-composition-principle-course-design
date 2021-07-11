`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/06/16 15:50:22
// Design Name: 
// Module Name: ADDpc0
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


module ADDpc0(
       input [31:0] pc0,
       input [31:0] imm32,
       output [31:0] addpc0_out
    );
        assign addpc0_out = pc0 +imm32;
endmodule
