`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/06/06 12:44:54
// Design Name: 
// Module Name: CU
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



module CU(
        input clk,
        input rst_n,
        input IS_R,
        input IS_IMM,
        input IS_LUI,
        input IS_LW,
        input IS_SW,
        input IS_BEQ,
        input IS_JAL,
        input IS_JALR,
        input [3:0] ALU_OP,
        input ZF,
        output reg PC_Write,
        output reg PC0_Write,
        output reg IR_Write,
        output reg Reg_Write,
        output  Mem_Write,
        output reg rs2_imm_s,
        output reg [1:0] w_data_s,
        output reg [1:0] PC_s,
        output reg [3:0] ALU_OP_o
    );
        
   reg [3:0] ST;
    reg [3:0]Next_ST;
    wire [3:0]Idle,S1,S2,S3,S4,S5,S6,S7,S8,S9,S10,S11,S12,S13,S14;
    assign Idle =4'b0;
    assign S1 =4'b0001;
    assign S2 =4'b0010;
    assign S3 =4'b0011;
    assign S4 =4'b0100;
    assign S5 =4'b0101;
    assign S6 =4'b0110;
    assign S7 =4'b0111;
    assign S8 =4'b1000;
    assign S9 =4'b1001;
    assign S10 =4'b1010;
    assign S11 =4'b1011;
    assign S12 =4'b1100;
    assign S13 =4'b1101;
    assign S14 =4'b1110;
    //第一段状态转移，在clk的边沿进行状态转移
    always@(negedge rst_n or posedge clk)
    begin
        if(!rst_n)
            ST <= Idle; //初始状态 
        else
            ST <= Next_ST;
    end
    //第二段次态函数
    always@(*)
    begin
        Next_ST = Idle;
        case(ST)
            Idle: Next_ST = S1;
            S1:
                begin
                     if(IS_LUI) Next_ST = S6;
                     else if(IS_R || IS_IMM || IS_LW || IS_SW || IS_BEQ || IS_JALR) Next_ST = S2;
                     else if(IS_JAL) Next_ST = S11;
                end
            S2: 
                begin
                    if(IS_R) Next_ST = S3;
                    else if(IS_IMM) Next_ST = S5;
                    else if(IS_LW || IS_SW || IS_JALR) Next_ST = S7;
                    else if(IS_BEQ) Next_ST =S13;
                end
           S3: 
                begin
                     if(IS_R) Next_ST = S4;
                end
           S4: Next_ST = S1;
           S5:
                 begin
                     if(IS_IMM) Next_ST = S4;
                end
           S6: Next_ST = S1;
           S7:
               begin
                     if(IS_LW) Next_ST = S8;
                     else if(IS_SW) Next_ST = S10;
                     else if(IS_JALR) Next_ST = S12;
                end
            S8:
                begin
                    if(IS_LW) Next_ST = S9;
                end
            S9:Next_ST = S1;
            S10:Next_ST = S1;
            S11:Next_ST = S1;
            S12:Next_ST = S1;
            S13:
                 begin
                     if(IS_BEQ) Next_ST = S14;
                end
            S14:Next_ST = S1;
           default: Next_ST = Idle;
        endcase
    end
    assign Mem_Write = (Next_ST == S10);
    //第三段输出函数
    always @(negedge rst_n or posedge clk)
    begin
        if(!rst_n)//全部信号初始化为0
            begin
                PC_Write <= 1'b0;
                PC0_Write <= 1'b0;
                IR_Write <= 1'b0;
                Reg_Write <= 1'b0;
                ALU_OP_o <= 4'b0;
                rs2_imm_s <= 1'b0;
                w_data_s  <= 2'b0;
                PC_s <= 2'b0;
            end
         else
            begin
                case(Next_ST)
                    S1:
                        begin
                             PC_Write <= 1'b1;
                            PC0_Write <= 1'b1;
                            IR_Write <= 1'b1;
                            Reg_Write <= 1'b0;
                            ALU_OP_o <= 4'b0;
                            rs2_imm_s <= 1'b0;
                            w_data_s  <= 2'b0;
                            PC_s <= 2'b0;
                        end
                     S2:
                         begin
                            PC_Write <= 1'b0;
                            PC0_Write <= 1'b0;
                            IR_Write <= 1'b0;
                            Reg_Write <= 1'b0;
                            ALU_OP_o <= 4'b0;
                            rs2_imm_s <= 1'b0;
                            w_data_s  <= 2'b0; 
                            PC_s <= 2'b0;
                          end
                      S3:
                         begin
                            PC_Write <= 1'b0;
                            PC0_Write <= 1'b0;
                            IR_Write <= 1'b0;
                            Reg_Write <= 1'b0;
                            ALU_OP_o <= ALU_OP;
                            rs2_imm_s <= 1'b0;
                            w_data_s  <= 2'b0;
                            PC0_Write <= 1'b0;
                            PC_s <= 2'b0;
                        end
                     S4:
                        begin
                            PC_Write <= 1'b0;
                            PC0_Write <= 1'b0;
                            IR_Write <= 1'b0;
                            Reg_Write <= 1'b1;
                            ALU_OP_o <= 4'b0;
                            rs2_imm_s <= 1'b0;
                            w_data_s  <= 2'b0;
                            PC_s <= 2'b0;
                        end
                      S5:
                         begin
                            PC_Write <= 1'b0;
                            PC0_Write <= 1'b0;
                            IR_Write <= 1'b0;
                            Reg_Write <= 1'b0;
                            ALU_OP_o <= ALU_OP;
                            rs2_imm_s <= 1'b1;
                            w_data_s  <= 2'b0;
                            PC_s <= 2'b0;
                        end
                      S6:
                         begin
                            PC_Write <= 1'b0;
                            PC0_Write <= 1'b0;
                            IR_Write <= 1'b0;
                            Reg_Write <= 1'b1;
                            ALU_OP_o <= 4'b0;
                            rs2_imm_s <= 1'b0;
                            w_data_s  <= 2'b01;
                            PC_s <= 2'b0;
                        end
                        S7:
                         begin
                            PC_Write <= 1'b0;
                            PC0_Write <= 1'b0;
                            IR_Write <= 1'b0;
                            Reg_Write <= 1'b0;
                            ALU_OP_o <= 4'b0;
                            rs2_imm_s <= 1'b1;
                            w_data_s  <= 2'b0;
                            PC_s <= 2'b0;
                        end
                        S8:
                         begin
                            PC_Write <= 1'b0;
                            PC0_Write <= 1'b0;
                            IR_Write <= 1'b0;
                            Reg_Write <= 1'b0;
                            ALU_OP_o <= 4'b0;
                            rs2_imm_s <= 1'b0;
                            w_data_s  <= 2'b01;
                            PC_s <= 2'b0;
                        end
                        S9:
                         begin
                            PC_Write <= 1'b0;
                            PC0_Write <= 1'b0;
                            IR_Write <= 1'b0;
                            Reg_Write <= 1'b1;
                            ALU_OP_o <= 4'b0;
                            rs2_imm_s <= 1'b0;
                            w_data_s  <= 2'b10;
                            PC_s <= 2'b0;
                        end
                        S10:
                         begin
                            PC_Write <= 1'b0;
                            PC0_Write <= 1'b0;
                            IR_Write <= 1'b0;
                            Reg_Write <= 1'b0;
                            ALU_OP_o <= 4'b0;
                            rs2_imm_s <= 1'b0;
                            w_data_s  <= 2'b0;
                            PC_s <= 2'b0;
                        end
                        S11:
                         begin
                            PC_Write <= 1'b1;
                            PC0_Write <= 1'b0;
                            IR_Write <= 1'b0;
                            Reg_Write <= 1'b1;
                            ALU_OP_o <= 4'b0;
                            rs2_imm_s <= 1'b0;
                            w_data_s  <= 2'b11;
                            PC_s <= 2'b01;
                        end
                        S12:
                         begin
                            PC_Write <= 1'b1;
                            PC0_Write <= 1'b0;
                            IR_Write <= 1'b0;
                            Reg_Write <= 1'b1;
                            ALU_OP_o <= 4'b0;
                            rs2_imm_s <= 1'b0;
                            w_data_s  <= 2'b11;
                            PC_s <= 2'b10;
                        end
                        S13:
                         begin
                            PC_Write <= 1'b0;
                            PC0_Write <= 1'b0;
                            IR_Write <= 1'b0;
                            Reg_Write <= 1'b0;
                            ALU_OP_o <= 4'b1000;
                            rs2_imm_s <= 1'b0;
                            w_data_s  <= 2'b0;
                            PC_s <= 2'b0;
                        end
                        S14:
                         begin
                            PC_Write <= ZF;
                            PC0_Write <= 1'b0;
                            IR_Write <= 1'b0;
                            Reg_Write <= 1'b0;
                            ALU_OP_o <= 4'b0;
                            rs2_imm_s <= 1'b0;
                            w_data_s  <= 2'b0;
                            PC_s <= 2'b01;
                        end
                    default:
                         begin
                            PC_Write <= 1'b0;
                            PC0_Write <= 1'b0;
                            IR_Write <= 1'b0;
                            Reg_Write <= 1'b0;
                            ALU_OP_o <= 4'b0;
                            rs2_imm_s <= 1'b0;
                            w_data_s  <= 2'b0;
                        end
                 endcase
            end
    end
endmodule
