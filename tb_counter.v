`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/03/2023 11:21:17 PM
// Design Name: 
// Module Name: tb_counter
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


module tb_counter();
reg clk,rst;
//wire [2:0]count;
wire Q2,Q1,Q0;
counter_3bit uut(clk,rst,Q2,Q1,Q0);
initial begin
 clk=0; rst= 1;
 #10; rst =0;
// #80; mode=0;
 end 
 always #5 clk=~clk;
initial begin
 #200 $finish; end 
endmodule
