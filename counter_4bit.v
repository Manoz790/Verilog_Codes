`timescale 1ns / 1ps

module counter_4bit(clk,rst,Q3,Q2,Q1,Q0 );
input clk,rst;
output reg Q3=0,Q2=0,Q0=0,Q1=0;
reg D3,D2,D1,D0;
always @(Q3,Q1,Q2,Q0) begin
 D3 = Q3^(Q2&Q1&Q0);
 D2 = (Q2^(Q1&Q0));
 D1 = Q1^Q0;
 D0 = ~(Q0);
end
always @(posedge clk)begin
 if(rst) begin
  Q3 <= 0; Q2 <= 0; Q1 <= 0;Q0 <= 0; end
  else begin
  Q3 <= D3;Q2 <= D2; Q1 <= D1;
  Q0 <= D0;
  end
 end
   
endmodule
