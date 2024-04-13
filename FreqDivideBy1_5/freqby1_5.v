`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Manoj Kumar
// Create Date: 04/13/2024 10:53:06 AM
// Design Name: Frequency divide by 1.5 logic
// Module Name: freqby1_5
//////////////////////////////////////////////////////////////////////////////////
`include "T_FF.v" 
module freqby1_5(clk, rst,fby1_5out,count);
input clk,rst;
output fby1_5out;
output reg [1:0] count = 2'b00;
wire w,q,qb;
   always @(posedge clk) begin
    if(rst) count <= 0;
       else if (count == 2'd2)
         count <= 0; // Reset counter
       else
         count <= count + 1; 
   end
 assign w = count[1]?clk:~clk;
   
 T_FF uut(1'b1,rst,w,q,qb);
assign fby1_5out = q;
endmodule


module Freqby1_5_tb;
reg clk,rst;
wire fby1_5out;
wire[1:0]count ;

freqby1_5 dut (.clk(clk),.rst(rst),.fby1_5out(fby1_5out), .count(count));

always #5 clk = ~clk;

initial begin
 clk = 0; rst =1; 
 #10 rst = 0;
 #500;  
 $finish;end
 // Monitor for the output clock signal
  always @(posedge fby1_5out) begin
    $display("Output clock toggled at time: %0t", $time);end
endmodule







