`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/05/31 19:25:11
// Design Name: 
// Module Name: IM_1
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


module IM_1;
    reg clk;
    reg [5:0]addr;
    wire [31:0]Inst;
    IM uut (
      .clk_im(clk),    // input wire clka
      .IM_Addr(addr),  // input wire [5 : 0] addra
      .Inst_Code(Inst)  // output wire [31 : 0] douta
);
    initial
     begin
        addr = 6'b0;
        clk=0;
      #50;
        clk=1;
      #50;
        clk=0;
      #50;
        clk=1;
      #50;
        clk=0;
        addr = addr+4;
      #50;
        clk=1;
      #50;
        clk=0;
        addr = addr+4;
        #50;
        clk=1;
      #50;
        clk=0;
        addr = addr+4;
        end
endmodule
