`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/05/31 21:05:39
// Design Name: 
// Module Name: ImmU
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


module ImmU(
        input [5:0] I_fmt,
        input [31:0] inst,
        output [31:0] imm32
    );
    reg [31:0] Imm;
    wire [3:0] chooseshamt;
    assign chooseshamt = {inst[30],inst[14:12]};
    always @(*)
    begin
        case(I_fmt)
        6'b010000:
            begin
                if(chooseshamt == 4'b0001 || chooseshamt == 4'b0101 || chooseshamt == 4'b1101)
                    Imm = {27'b0,inst[24:20]};//shamt0¿©’π÷¡32Œª
                else Imm = {{20{inst[31]}},inst[31:20]};//I
            end
        6'b001000: Imm = {{20{inst[31]}},inst[31:25],inst[11:7]};//S
        6'b000100: Imm = {{20{inst[31]}},inst[7],inst[30:25],inst[11:8],1'b0};//B
        6'b000010: Imm = {inst[31:20],12'b0};//U
        6'b000001: Imm = {{12{inst[31]}},inst[19:12],inst[20],inst[30:21]};//J
        default: Imm = 32'b0;
            endcase
    end
    assign imm32 = Imm;
endmodule
