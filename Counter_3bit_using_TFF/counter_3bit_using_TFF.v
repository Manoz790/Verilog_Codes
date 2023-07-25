`timescale 1ns / 1ps
 
module counter_3bit_using_TFF(clk,rst,q2,q1,q0 );
input clk,rst ;
output reg q2=0,q1=0,q0=0;
reg T2,T1,T0;
always @(q2,q1,q0)begin
   T2=q1&q0; T1=q0; T0=1;end
 always@(posedge clk)begin
 if(rst)begin
     q2 <=0;q1 <=0;q0<=0;
     end
 else begin
     q2<=T2^q2;q1<=T1^q1;
     q0<=T0^q0; 
     end
    end   
endmodule
