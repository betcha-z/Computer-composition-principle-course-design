`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/06/01 12:22:37
// Design Name: 
// Module Name: Fetch_Show_T
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


module Fetch_Show_T(
        input clk_100M,
        input rst_n,
        input clk_im,
        input IR_Write,
        input PC_Write,
        input [2:0] SW,//选择数码管和led灯显示哪组数据的开关SW[2]控制led
        output [7:0]AN,
        output [7:0]seg,
        output [16:0]LED//显示灯，显示{rs1,rs2,rd}15位或{opcode,funct3,funct7}17位
    );
    
        wire [16:0] led1;
        wire [16:0] led2;
        wire [4:0] rs1;
        wire [4:0] rs2;
        wire [4:0] rd;
        wire [6:0] opcode;
        wire [2:0] funct3;
        wire [6:0] funct7;
        reg [16:0] led;
        wire [31:0]pc;
        wire [31:0] inst;
        reg [31:0] data;
        wire [31:0] imm32;
        
        assign led1 = {rs1,rs2,rd,2'b0};
        assign led2 = {opcode,funct3,funct7};
        assign LED = led;
        
        always @(*)
        begin
            case(SW)
                3'b000:
                    begin led = led1;data = pc;end
                3'b001:   
                    begin led = led1;data = inst;end 
                3'b010:
                    begin led = led1;data = imm32;end
                3'b100:
                    begin led = led2;data = pc;end
                3'b101:
                    begin led = led2;data = inst;end
                3'b110:
                    begin led = led2;data = imm32;end
                default: 
                    begin led = 17'b0;data = 32'b0;end
           endcase
       end
                    
        IM_IF_ID MFD1(
                .rst_n(rst_n),
                .clk_im(clk_im),
                .PC_Write(PC_Write),
                .IR_Write(IR_Write),
                .rs1(rs1),
                .rs2(rs2),
                .rd(rd),
                .pc(pc),
                .INST(inst),
                .imm32(imm32),
                .opcode(opcode),
                .funct3(funct3),
                .funct7(funct7)
        );
        DISP disp(
             .rst_(rst_n),//清零
            .clk_100M(clk_100M),
            .Data(data),
            .AN(AN),//位选信号
            .seg(seg)//段选信号   
        );
        
endmodule
