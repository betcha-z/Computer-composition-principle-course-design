`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/05/31 21:30:33
// Design Name: 
// Module Name: ID1
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


module ID1(
        input [31:0]inst,
        output [4:0]rs1,
        output [4:0]rs2,
        output [4:0]rd,
        output [31:0]imm32,
        output [6:0]opcode,
        output [2:0] funct3,
        output [7:0] funct7
    );
    wire [5:0] I_fmt;
    wire R_Type, I_Type, S_Type, B_Type, U_Type, J_Type;
    assign funct7 = inst[31:25];
    assign rs2 = inst[24:20];
    assign rs1 = inst[19:15];
    assign funct3 = inst[14:12];
    assign rd = inst[11:7];
    assign opcode = inst[6:0];
    assign R_Type = (opcode == 7'b0110011);
    assign I_Type = ((opcode == 7'b0010011)|(opcode == 7'b0000011)|(opcode == 7'b1100111));//
    assign S_Type = (opcode == 7'b0100011);
    assign B_Type = (opcode == 7'b1100011);
    assign U_Type = ((opcode == 7'b0110111)|(opcode == 7'b0010111));
    assign J_Type = (opcode == 7'b1101111);
    assign I_fmt ={R_Type,I_Type, S_Type, B_Type, U_Type, J_Type};
    ImmU ImmU1(
            .I_fmt(I_fmt),
            .inst(inst),
            .imm32(imm32)
            );
endmodule
