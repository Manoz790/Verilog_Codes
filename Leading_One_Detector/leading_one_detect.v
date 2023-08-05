`timescale 1ns / 1ps
 
// Create Date: 08/05/2023 10:11:45 AM
// Module Name: leading_one_detect
 
module leading_one_detect(data_in, lead_one );
input [7:0] data_in;
output reg [3:0] lead_one;
    always@(*) begin
    lead_one=0;
    casex(data_in)
    8'b00000001:lead_one=4'h1;
    8'b0000001x:lead_one=4'h2;
    8'b000001xx:lead_one=4'h3;
    8'b00001xxx:lead_one=4'h4;
    8'b0001xxxx:lead_one=4'h5;
    8'b001xxxxx:lead_one=4'h6;
    8'b01xxxxxx:lead_one=4'h7;
    8'b1xxxxxxx:lead_one=4'h8;
    default: lead_one=4'h0;
    endcase
    end
    
endmodule



module tb_lead_one();
reg [7:0] data_in;
wire [3:0] lead_one;
leading_one_detect dut(data_in, lead_one );
initial begin
 data_in=8'd0;
 #5 data_in=8'd30;
 #5 data_in=8'd5;
 #5 data_in=8'd70;
 #5 data_in=8'd8 ;
 #5 data_in=8'd160 ;
 #5 data_in=8'd50 ;
 #5 data_in=8'd99 ;
 #5 data_in=8'd125 ;
 #5 data_in=8'd255 ;
 #15 $finish;
 end
 endmodule
 
 
 
 
 
