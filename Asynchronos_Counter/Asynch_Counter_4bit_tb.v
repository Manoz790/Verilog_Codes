`timescale 1ns / 1ps
 
// Create Date: 03/17/2024 12:23:19 PM
// Module Name: Asynch_Counter_4bit_tb
 
module Asynch_Counter_4bit_tb();
reg clkn,rstn;
wire q3,q2,q1,q0;
Asynch_Counter_4bit dut(clkn,rstn,q3,q2,q1,q0);
initial begin
clkn=0; rstn=0;  
#15 rstn=1;
#200 $finish; end
 always #5 clkn = ~ clkn;
endmodule
