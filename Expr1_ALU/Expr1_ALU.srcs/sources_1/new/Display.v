`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/26 23:40:26
// Design Name: 
// Module Name: Display
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


module Display(
    input [31:0]Data,
    input clk_ref,
    input rst_,
    output reg [7:0] AN,//λѡ�ź�
    output reg [7:0] seg//��ѡ�ź�
    );
    
    //�ü�����ָʾ��ǰ�����������
    reg [2:0] bit_sel;
    always @(negedge rst_ or posedge clk_ref)
    begin
        if(!rst_)
            bit_sel <= 3'd0;
        else
            bit_sel <= bit_sel + 1'b1;
     end   
     //���������
     always @(*)
     begin
        case(bit_sel)
            3'b000: AN = 8'b0111_1111;
            3'b001: AN = 8'b1011_1111;
            3'b010: AN = 8'b1101_1111;
            3'b011: AN = 8'b1110_1111;
            3'b100: AN = 8'b1111_0111;
            3'b101: AN = 8'b1111_1011;
            3'b110: AN = 8'b1111_1101;
            3'b111: AN = 8'b1111_1110;
         endcase
      end
      //ȡ�������Ҫ��ʾ������
      reg [3:0] data_x;
      always @(*)
      begin
        case(bit_sel)
            3'b000: data_x =Data[31:28];
            3'b001: data_x =Data[27:24];
            3'b010: data_x =Data[23:20];
            3'b011: data_x =Data[19:16];
            3'b100: data_x =Data[15:12];
            3'b101: data_x =Data[11:8];
            3'b110: data_x =Data[7:4];
            3'b111: data_x =Data[3:0];
         endcase
       end
       //�������ݣ�����ʾ�븳ֵ��seg
       always @(*)
       begin
        case(data_x)
            4'b0000: seg = 8'b0000_0011;
            4'b0001: seg = 8'b1001_1111;
            4'b0010: seg = 8'b0010_0101;
            4'b0011: seg = 8'b0000_1101;
            4'b0100: seg = 8'b1001_1001;
            4'b0101: seg = 8'b0100_1001;
            4'b0110: seg = 8'b0100_0001;
            4'b0111: seg = 8'b0001_1111;
            4'b1000: seg = 8'b0000_0001;
            4'b1001: seg = 8'b0000_1001;
            4'b1010: seg = 8'b0001_0001;
            4'b1011: seg = 8'b1100_0001;
            4'b1100: seg = 8'b0110_0011;
            4'b1101: seg = 8'b1000_0101;
            4'b1110: seg = 8'b0110_0001;
            4'b1111: seg = 8'b0111_0001;
         default:
            seg = 8'b1111_1101;
         endcase 
       end
       
endmodule
