`timescale 1ns / 1ps

module tb_counter();
reg clk,rst;
wire Q3,Q2,Q1,Q0;
counter_4bit uut(clk,rst,Q3,Q2,Q1,Q0);
initial begin
 clk=0; rst= 1;
 #10; rst =0;
 #200 $finish;
 end 
 always #5 clk=~clk;
endmodule
