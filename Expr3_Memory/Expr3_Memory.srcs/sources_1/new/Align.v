`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/05/16 14:21:56
// Design Name: 
// Module Name: Align
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


module Align(
    input [31:0] M_W_Data,
    input [1:0]Size_s,
    input [1:0]DM_Addr,
    input [31:0] dout,
    output [31:0] M_R_Data,
    output [31:0] W_Data
    );
    reg [4:0] shift_n;
    wire [3:0] Mask_Index;
    wire [31:0] Mask[0:15];
    assign Mask_Index = {Size_s,DM_Addr[1:0]};//根据这个选择移几位
    always @(*)
    begin
        case(Mask_Index)
            4'b0000:shift_n = 5'd0;
            4'b0001:shift_n = 5'd8;
            4'b0010:shift_n = 5'd16;
            4'b0011:shift_n = 5'd24;
            4'b0100:shift_n = 5'd0;
            4'b0101:shift_n = 5'd0;
            4'b0110:shift_n = 5'd16;
            4'b0111:shift_n = 5'd16;
            default:shift_n = 5'd0;
        endcase
              
     end   
     begin
            assign Mask[0]=32'h0000_00ff;
            assign Mask[1]=32'h0000_ff00;
            assign Mask[2]=32'h00ff_0000;
            assign Mask[3]=32'hff00_0000;
            assign Mask[4]=32'h0000_ffff;
            assign Mask[5]=32'h0000_ffff;
            assign Mask[6]=32'hffff_0000;
            assign Mask[7]=32'hffff_0000;
            assign Mask[8]=32'h0000_00ff;
            assign Mask[9]=32'hffff_ffff;
            assign Mask[10]=32'hffff_ffff;
            assign Mask[11]=32'hffff_ffff;
            assign Mask[12]=32'hffff_ffff;
            assign Mask[13]=32'hffff_ffff;
            assign Mask[14]=32'hffff_ffff;
            assign Mask[15]=32'hffff_ffff;
      end  
//     Mask[0:15] = {
//        32'h0000_00ff,32'h0000_ff00,32'h00ff_0000,32'hff00_0000,//byte
//        32'h0000_ffff,32'h0000_ffff,32'hffff_0000,32'hffff_0000,//half byte
//        32'hffff_ffff,32'hffff_ffff,32'hffff_ffff,32'hffff_ffff,//word
//        32'hffff_ffff,32'hffff_ffff,32'hffff_ffff,32'hffff_ffff
//        };   
      assign M_R_Data = (dout & Mask[Mask_Index]) >> shift_n;
      assign W_Data = (M_W_Data << shift_n) & Mask[Mask_Index];                  
endmodule
