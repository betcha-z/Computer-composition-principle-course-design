`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/06/06 12:19:47
// Design Name: 
// Module Name: ID2
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


module ID2(
        input [6:0] opcode,
        input [2:0] funct3,
        input [6:0] funct7,
        output reg IS_R,
        output reg IS_IMM,
        output reg IS_LUI,
        output reg IS_LW,
        output reg IS_SW,
        output reg IS_BEQ,
        output reg IS_JAL,
        output reg IS_JALR,
        output reg [3:0] ALU_OP        
    );
      
      always@(*)
      begin
          case(opcode)
              7'b0110011://R
                begin
                    IS_R = 1;
                    IS_IMM = 0;
                    IS_LUI = 0;
                    IS_LW =0;
                    IS_SW =0;
                    IS_BEQ =0;
                    IS_JAL =0;
                    IS_JALR =0;
                    ALU_OP = {funct7[5],funct3};//R
                end
              7'b0010011://I
                 begin
                    IS_R = 0;
                    IS_IMM = 1;
                    IS_LUI = 0;
                    IS_LW =0;
                    IS_BEQ =0;
                    IS_JAL =0;
                    IS_JALR =0;
                    ALU_OP = (funct3==3'b101)?{funct7[5],funct3}:{1'b0,funct3};
                 end//I
              7'b0110111://U
                  begin
                    IS_R = 0;
                    IS_IMM = 0;
                    IS_LUI = 1;
                    IS_LW =0;
                    IS_SW =0;
                    IS_BEQ =0;
                    IS_JAL =0;
                    IS_JALR =0;
                    ALU_OP = 4'b0;
                  end
               7'b0000011://lw
                  begin
                    IS_R = 0;
                    IS_IMM = 0;
                    IS_LUI = 0;
                    IS_LW =1;
                    IS_SW =0;
                    IS_BEQ =0;
                    IS_JAL =0;
                    IS_JALR =0;
                    ALU_OP = 4'b0;
                  end
                7'b0100011://sw
                    begin
                    IS_R = 0;
                    IS_IMM = 0;
                    IS_LUI = 0;
                    IS_LW =0;
                    IS_SW =1;
                    IS_BEQ =0;
                    IS_JAL =0;
                    IS_JALR =0;
                    ALU_OP = 4'b0;
                  end
                  7'b1100011://beq
                    begin
                    IS_R = 0;
                    IS_IMM = 0;
                    IS_LUI = 0;
                    IS_LW =0;
                    IS_SW =0;
                    IS_BEQ =1;
                    IS_JAL =0;
                    IS_JALR =0;
                    ALU_OP = 4'b0;
                  end
                  7'b1101111://jal
                    begin
                    IS_R = 0;
                    IS_IMM = 0;
                    IS_LUI = 0;
                    IS_LW =0;
                    IS_SW =0;
                    IS_BEQ =0;
                    IS_JAL =1;
                    IS_JALR =0;
                    ALU_OP = 4'b0;
                  end
                  7'b1100111://jalr
                    begin
                    IS_R = 0;
                    IS_IMM = 0;
                    IS_LUI = 0;
                    IS_LW =0;
                    IS_SW =0;
                    IS_BEQ =0;
                    IS_JAL =0;
                    IS_JALR =1;
                    ALU_OP = 4'b0;
                  end
              default:
                  begin 
                    IS_R = 0;
                    IS_IMM = 0;
                    IS_LUI = 0;
                    IS_LW =0;
                    IS_SW =0;
                    IS_BEQ =0;
                    IS_JAL =0;
                    IS_JALR =0;
                    ALU_OP = 4'b0;
                  end
           endcase
      end       
      
endmodule
