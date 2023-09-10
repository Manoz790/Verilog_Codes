`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: @Manoz Kumar
// Create Date: 05/23/2023 07:21:00 PM 
// Module Name: FIFO_8x8_TB
//////////////////////////////////////////////////////////////////////////////////

module FIFO_8x8_TB();

  reg clk,reset,write_en,read_en;
  reg [7:0] data_in;
  wire [7:0] data_out;
  wire empty,full;

  // Instantiate the FIFO module
  FIFO_8x8 dut (
    .clk(clk),
    .reset(reset),
    .write_en(write_en),
    .read_en(read_en),
    .data_in(data_in),
    .data_out(data_out),
    .empty(empty),
    .full(full)
  );

  // Clock generation
  always begin
    clk = 0;
    #5;
    clk = 1;
    #5;
  end

  // Stimulus generation
  initial begin
    reset = 1;
    write_en = 0;
    read_en = 0;
    data_in = 8'h00;

    // Release reset
    #10;
    reset = 0;

    // Write data into the FIFO
    write_en = 1;
    data_in = 8'h12;
    #10;
    data_in = 8'h34;
    #10;
    data_in = 8'h56;
    #10;
    data_in = 8'h78;
    #10;
    data_in = 8'h9A;
    #10;
    data_in = 8'hBC;
    #10;
    data_in = 8'hDE;
    #10;
    data_in = 8'hFF;
    #10;
    write_en = 0;

    // Read data from the FIFO
    read_en = 1;
    #50;
    read_en = 0;

    #100;
    $finish; // End of the simulation
  end

endmodule
