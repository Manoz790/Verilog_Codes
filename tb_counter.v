`timescale 1ns / 1ps

module tb_counter();
reg clk,rst;
wire q2,q1,q0;
counter_3bit_using_TFF uut(clk,rst,q2,q1,q0);
initial begin
 clk=0; rst= 1;
 #10; rst =0;
 #200 $finish;
 end 
 always #5 clk=~clk;
endmodule
