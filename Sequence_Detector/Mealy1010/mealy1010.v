`timescale 1ns / 1ps
 
// Create Date: 08/06/2023 04:37:46 PM
// Module Name: mealy1010

// ***Using 2 always block***

module mealy1010(din,clk,rst,dout );
input din,clk,rst;
output reg dout;
parameter s0=2'd0,s1=2'd1,s2=2'd2,s3=2'd3;
reg [1:0]ps,ns ;
  always@(posedge clk,posedge rst) begin
  if(rst) ps <=s0;
  else
     ps <= ns; end
     
  always@(ps,din) begin
  case(ps)
  s0:if(din) begin
     ns <= s1; dout <= 0; end
     else begin
     ns <= s0; dout <= 0; end
  s1:if(din) begin
     ns <= s1; dout <= 0; end
     else begin
     ns <= s2; dout <= 0; end
  s2:if(din) begin
     ns <= s3; dout <= 0; end
     else begin
     ns <= s0; dout <= 0; end
  s3:if(din) begin
     ns <= s1; dout <= 0; end
     else begin
     ns <= s2; dout <= 1; end
   default:begin
           ns <= s0; dout <= 0 ;end
   endcase
   end
endmodule
   
//TestBench code

module tb_mealy1010();
reg din,clk,rst;
wire dout;
mealy1010 uut(din,clk,rst,dout );

initial begin
 clk=1'b0; rst=1; din=0; 
 #5 rst = 1'b0; 
 #6 din = 1;
 #4 din = 0;
 #4 din = 1;
 #4 din = 0;
 #4 din = 1;
 #4 din = 0;
 #4 din = 1;
 #4 din = 0;
 #10; $finish; end
 
 always #2 clk= ~clk;
endmodule
 