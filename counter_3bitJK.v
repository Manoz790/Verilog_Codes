`timescale 1ns / 1ps
 
module counter_3bitJK(clk,rst,q2,q1,q0 );
input clk,rst ;
output reg q2=0,q1=0,q0=0;
reg j2,k2,j1,k1,j0,k0;
always @(q2,q1,q0)begin
  j2 = q1&q0; k2 = q1&q0; j1 =q0;k1 =q0;
  j0 = ~q0; k0 = 1; end
 always@(posedge clk) begin
 if(rst)begin
       q2 <=0;q1 <=0;q0<=0;end
 else begin
       q2<=(j2&(~q2))|(~k2&q2); 
       q1<=(j1&(~q1))|(~k1&q1); 
       q0<=(j0&(~q0))|(~k0&q0);
       end
    end
endmodule
