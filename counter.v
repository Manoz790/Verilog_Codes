`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/03/2023 11:10:09 PM
// Design Name: 
// Module Name: counter
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


/*module counter(clk,rst,q);
  input clk,rst;
  output reg [3:0]q;
//  reg [3:0]tmp=4'd0;
  always@ (posedge clk or negedge rst)begin
    if(rst)
      q<= 4'd0;
//    else if(tmp==4'd9) //mod10 counter
//       tmp<= 4'd0;
     else
      q <= q + 1'd1; 
//      else
//      tmp <= tmp - 1'd1;
     end
//  assign q = tmp;
endmodule*/

module counter_3bit(clk,rst,Q2,Q1,Q0);
input clk,rst;
output reg Q2=0,Q0=0,Q1=0;
reg D1,D2,D0;
always @(Q1,Q2,Q0) begin
 D2 = (Q2^(Q1&Q0));
 D1 = Q1^Q0;
 D0 = ~(Q0);
end
always @(posedge clk)begin
 if(rst) begin
   Q2 <= 0; Q1 <= 0;Q0 <= 0; end
  else begin
  Q2 <= D2; Q1 <= D1;
  Q0 <= D0;
  end
 end
endmodule



