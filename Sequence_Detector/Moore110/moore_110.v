`timescale 1ns / 1ps
// Create Date: 08/06/2023 01:15:37 AM
// Module Name: moore_110
 // ***Using 2 always block***
module moore_110(x_in,clk,rst,out );
input x_in,clk,rst;
output  out;
parameter s0=2'd0,s1=2'd1,s2=2'd2,s3=2'd3;
reg [1:0]ps,ns;
always @(posedge clk,negedge rst) begin
    if(rst) 
     ps<=s0;
    else
     ps<=ns; end
 always@(ps,x_in) begin
  case(ps)
  s0:begin
     if(x_in) ns=s1; else ns=s0; end
  s1:begin
     if(x_in) ns=s2; else ns=s0; end
  s2:begin
     if(x_in) ns=s2; else ns=s3; end
  s3:begin
     if(x_in) ns=s1; else ns=s0; end
   default: ns=s0;
  endcase
  end
   /*always@(ps,clk) begin
   case(ps)
   s0:out<=0;
   s1:out<=0;
   s2:out<=0;
   s3:out<=1;
   default:out<=0;
   endcase
   end*/
  assign out=(ps==s3);
endmodule

//TestBench Code
module tb_moore_110();
reg x_in,clk,rst;
wire out;
moore_110 uut(x_in,clk,rst,out );

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
 


