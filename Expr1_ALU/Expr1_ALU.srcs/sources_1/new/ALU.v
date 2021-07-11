`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/21 11:03:30
// Design Name: 
// Module Name: ALU
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


module ALU(
    input [3:0] ALU_OP,
    input [31:0] ALU_A,
    input [31:0] ALU_B,
    output reg [31:0]ALU_F,
    output ZF,//���ȫ0��Ϊ1
    output SF,//���Ϊ����Ϊ0
    output CF,//�н�λ����λ��Ϊ1
    output OF//�������Ϊ1
    );
    reg C32=0;
    
    always @(*)
    begin
        case(ALU_OP)
            4'b0000:   {C32,ALU_F} = ALU_A+ALU_B;//add
            4'b0001:   ALU_F = ALU_A << ALU_B;//sll
            4'b0010:   ALU_F = ($signed(ALU_A) < $signed(ALU_B)) ?1:0;//slt
            4'b0011:   ALU_F = (ALU_A < ALU_B) ?1:0;//sltu
            4'b0100:   ALU_F = ALU_A ^ ALU_B;//xor
            4'b0101:   ALU_F = ALU_A >> ALU_B;//srl�߼����ƣ���λ��0
            4'b0110:   ALU_F = ALU_A | ALU_B;//or
            4'b0111:   ALU_F = ALU_A & ALU_B;//and��λ��
            4'b1000:   {C32,ALU_F} = ALU_A - ALU_B;//sub
            4'b1101:   ALU_F = $signed(ALU_A) >>>ALU_B;//sra�������ƣ���λ��A[31]
            default: ALU_F = 32'b0;
         endcase
      end  
      assign ZF = ~(|ALU_F);
      assign SF = ALU_F[31];
      assign CF = C32;    
      assign OF = C32^ALU_A[31]^ALU_B[31]^ALU_F[31];
        
endmodule
