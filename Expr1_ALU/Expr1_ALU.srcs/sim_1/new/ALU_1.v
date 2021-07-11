`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/21 11:50:35
// Design Name: 
// Module Name: ALU_1
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


module ALU_1;
    reg [3:0]ALU_OP;
    reg [31:0]ALU_A,ALU_B;
    wire [31:0]ALU_F;
    wire ZF,SF,CF,OF;
    ALU uut(
        .ALU_OP(ALU_OP), .ALU_A(ALU_A), .ALU_B(ALU_B), 
        .ALU_F(ALU_F), .ZF(ZF), .SF(SF), .CF(CF), .OF(OF)
        );
    
    initial
        begin
                ALU_A={0};ALU_B={0};ALU_OP=4'b0;
            #50;
                ALU_A=32'b1000_0000_0000_0000_0000_0000_0000_0010;
                ALU_B={{31{0}},1};  
            #50;
                ALU_OP=4'b0;
            #50;
                ALU_OP=4'b0001; 
             #50;
                ALU_OP=4'b0011;    
            #50;
                ALU_OP=4'b0010;
            #50;
                ALU_OP=4'b0100;
            #50;
                ALU_OP=4'b0101;
            #50;
                ALU_OP=4'b0110;  
            #50;
                ALU_OP=4'b0111;
            #50;
                ALU_OP=4'b1000;
             #50;
                ALU_OP=4'b1101;
             #50;
                ALU_A=32'b0111_1111_1111_1111_1111_1111_1111_1111;
                ALU_B=32'bb0111_1111_1111_1111_1111_1111_1111_1111;  
                ALU_OP=4'b0000;
              #50;
                ALU_A=32'b0000_1111_1111_1111_1111_1111_1111_1111;
                ALU_B=32'b0001_1111_1111_1111_1111_1111_1111_1111;  
                ALU_OP=4'b0000;  
//             #50;
//                ALU_A={32{1'b1}};ALU_B=1;ALU_OP=1000;
//            #50;
//                ALU_A={32{1'b1}};ALU_B=1;ALU_OP=1101;               
        end
            
endmodule
