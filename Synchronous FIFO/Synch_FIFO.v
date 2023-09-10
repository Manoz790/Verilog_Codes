`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: @Manoz Kumar
// Create Date: 05/21/2023 12:39:40 PM
// Module Name: Synch_FIFO
//////////////////////////////////////////////////////////////////////////////////

module FIFO_8x8 (
  input clk,
  input reset,
  input write_en,
  input read_en,
  input [7:0] data_in,
  output reg [7:0] data_out=8'd0,
  output  empty,
  output  full
);

  reg [7:0] memory [0:7];
  reg [2:0] write_ptr,read_ptr,count;
   
  always @(posedge clk or posedge reset) begin
    if (reset) begin
      write_ptr <= 3'b0;
      read_ptr <= 3'b0;
      count <= 3'b0;
    end
    else begin
      if (write_en && !full) begin
        memory[write_ptr] <= data_in;
        write_ptr <= write_ptr + 1;
        count <= count + 1;
      end
      if (read_en && !empty) begin
        data_out <= memory[read_ptr];
        read_ptr <= read_ptr + 1;
        count <= count - 1;
      end
    end
  end

  assign empty = (count == 3'b0)?1:0;
  assign full = (count == 3'd7);

endmodule

