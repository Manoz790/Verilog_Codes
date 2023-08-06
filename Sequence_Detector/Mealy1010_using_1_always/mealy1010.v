`timescale 1ns / 1ps
 
// Create Date: 08/06/2023 04:37:46 PM
// Module Name: mealy1010

// ***Using 1 always block***

module mealy1010(din,clk,rst,dout );
input din,clk,rst;
output reg dout;
parameter s0=2'd0,s1=2'd1,s2=2'd2,s3=2'd3;
reg [1:0]ps ;
  always @(posedge clk or posedge rst) begin
    if(rst) begin
      dout <= 1'b0;
      ps <= s0;
    end
    else begin
      case(ps)
        s0: begin
          if(din) begin
            ps <= s1;
            dout <=1'b0;
          end
          else
            dout <=1'b0;
        end
        s1: begin
          if(~din) begin
            ps <= s2;
            dout <=1'b0;
          end
          else begin
            dout <=1'b0;
          end
        end
        s2: begin
          if(~din) begin
            ps <= s0;
            dout <=1'b0;
          end
          else begin
            ps <= s3;
            dout <=1'b0;
          end
        end
        s3: begin
          if(din) begin
            ps <= s1;
            dout <=1'b0;
          end
          else begin
            ps <= s2;
            dout <=1'b1;
          end
        end
      endcase
    end
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
 