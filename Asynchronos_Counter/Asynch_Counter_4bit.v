`timescale 1ns / 1ps
 
// Create Date: 03/17/2024 12:07:23 PM
// Module Name: Asynch_Counter_4bit

module Asynch_Counter_4bit(clkn,rstn,q3,q2,q1,q0);
input clkn,rstn;
output wire q3,q2,q1,q0;
jk_ff1 g1(.j(1'b1),.k(1'b1),.clk(clkn),.rst(rstn),.q(q3));
jk_ff1 g2(.j(1'b1),.k(1'b1),.clk(q3),.rst(rstn),.q(q2));
jk_ff1 g3(.j(1'b1),.k(1'b1),.clk(q2),.rst(rstn),.q(q1));
jk_ff1 g4(.j(1'b1),.k(1'b1),.clk(q1),.rst(rstn),.q(q0));
endmodule

module jk_ff1(j,k,clk,rst,q);
input j,k,clk,rst;
output reg q;
always @(posedge clk,negedge rst) begin
    if(!rst)
        q <= 1'b0;
    else begin
        case({j,k})
        2'd0: q <= q;
        2'd1: q <= 1'b0;
        2'd2: q <= 1'b1;
        2'd3: q <= ~q;
        default: q <= 1'd0;
        endcase
        end
      end
endmodule
