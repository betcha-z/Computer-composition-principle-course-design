`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/26 23:55:19
// Design Name: 
// Module Name: Fdiv
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


//分频器模块
module Fdiv(
    input rst_,
    input clk_100M,
    output  reg clk_500
    );
    //要把100MHz分频为500Hz，要有17位
    reg [16:0] cnt;
    always@(negedge rst_ or posedge clk_100M)
    begin
        if(!rst_)
        begin
            cnt<=16'd0;
            clk_500<=1'b0;
        end
        else if (cnt==16'd100000)
        begin
            clk_500 <= ~clk_500;
            cnt <=16'd0;
        end
        else
            cnt <= cnt + 1'b1;
     end 
endmodule
