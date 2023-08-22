`timescale 1ns / 1ps
 
// Create Date: 08/22/2023 10:56:04 PM
// Module Name: Fibonacci
 
/*module Fibonacci(
    input clk,
    input rst,
    output  [7:0] fib
);

reg [7:0] a , b ;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        a <= 0; b <= 1; end
    else begin
        a <= b;
        b <= a + b;     
    end
end
assign fib = a;
endmodule*/

module Fibonacci(
    input clk,
    input rst,
    output reg [7:0] fib
);

reg [7:0] a=0 , b=1,next ;

always @(posedge clk or posedge rst) begin
    if (rst)  
        fib <= 0;  
    else begin
        next = a + b;
        a <= b;
        b <= next;  
        fib <= a;   
    end
end
 
endmodule


module tb_Fibonacci();

reg clk = 0, rst = 0;
wire [7:0] fib;

Fibonacci uut (
    .clk(clk),
    .rst(rst),
    .fib(fib)
);

always #5 clk = ~clk;  

initial begin   
    clk = 0;
    rst = 1;
    #10 rst = 0;  
    #100;
    $finish;
end
initial begin
    $monitor("fib = %d", fib);
end
endmodule

