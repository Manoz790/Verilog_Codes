`timescale 1ns / 1ps
// Create Date: 08/06/2023 02:18:58 AM 
// Module Name: mealy110
// ***Using 2 always block***
module mealy110( x_in,clk,rst,out );
input x_in,clk,rst;
output reg out;
parameter s0=2'd0,s1=2'd1,s2=2'd2;
reg [1:0]ps,ns;
always @(posedge clk,negedge rst) begin
    if(rst) 
     ps<=s0;
    else
     ps<=ns; end
 always@(ps,x_in) begin
  case(ps)
  s0:if(x_in)begin 
       ns=s1; out<=0; end 
     else begin 
       ns=s0; out<=0; end
  s1:if(x_in)begin 
        ns=s2;out<=0; end
     else begin 
        ns=s0;out<=0; end
  s2:if(x_in)begin 
       ns=s2; out<=0; end
     else begin
       ns=s0; out<=1; end
   default:begin 
           ns=s0; out<=0; end
  endcase
  end
   
endmodule

//TestBench Code

module tb_mealy110();
reg x_in,clk,rst;
wire out;
mealy110 uut(x_in,clk,rst,out );

initial begin
 clk=1'b0; rst=1; x_in=0; 
 #5 rst = 1'b0; 
 #5 x_in = 1;
 #4 x_in = 1;
 #5 x_in = 0;
 #5 x_in = 1;
 #5 x_in = 1;
 #6 x_in = 0;
 #10; $finish; end
 
 always #2 clk= ~clk;
endmodule
