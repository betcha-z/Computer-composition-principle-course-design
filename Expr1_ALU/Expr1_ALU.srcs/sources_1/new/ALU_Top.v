`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/21 14:06:26
// Design Name: 
// Module Name: ALU_Top
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


module ALU_Top(
    input rst_n,clk_a,clk_b,clk_f,
    input clk_100M,
    input [19:0] SW,
    output [3:0] FR,
    output [7:0] An,
    output [7:0]Seg
    );
    
//     reg [31:0]F;
//     reg [31:0] Data_A,Data_B;
//     reg [3:0]Flag;
//     always @(negedge clk_n or posedge clk_a)
//            begin
//                if(!clk_n)
//                    begin
//                        Data_A = 32'b0;
//                        Data_B = 32'b0;
//                        F =32'b0;
//                        Flag = 4'b0;
//                    end
//                else
//                    Data_A= {{12{SW[19]}},SW[19:0]};
//             end   
    wire [31:0]F;
    wire [31:0] Data32;
    wire [3:0] ALU_OP; 
    assign ALU_OP = {SW[3:0]};                
    assign Data32={{12{SW[19]}},SW[19:0]};
    ALU_ABF ALU_ABF1(
            .rst_n(rst_n),
            .clk_f(~clk_f),
            .clk_a(~clk_a),
            .clk_b(~clk_b),
            .ALU_OP(ALU_OP),
            .Data_A(Data32),
            .Data_B(Data32),
            .FR(FR),
            .F(F)
            );
    DISP DISP1(
            .rst_(rst_n),
            .clk_100M(clk_100M),
            .Data(F),
            .AN(An),
            .seg(Seg)
            );
endmodule
