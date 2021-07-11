`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/06/15 20:38:42
// Design Name: 
// Module Name: IM
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


module IM(
        input clk_im,
        input [5:0] IM_Addr,
        output [31:0] Inst_Code 
    );
    ROM_SP2 im (
      .clka(clk_im),    // input wire clka
      .addra(IM_Addr),  // input wire [5 : 0] addra
      .douta(Inst_Code)  // output wire [31 : 0] douta
);
endmodule