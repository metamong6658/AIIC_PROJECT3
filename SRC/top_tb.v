`timescale 1ns/1ns
`include "top.v"
`include "random_pulse_generator.v"
`include "core_array_2x2.v"
`include "allocator.v"
`include "channel.v"
`include "core.v"
`include "LFSR_8bit.v"
`include "PE.v"

module top_tb;
reg clk;
reg rst;

always #1 clk = ~clk;

top #(8, 2) DUT (clk,rst);

initial begin
    clk = 0;    rst = 1;
    #10;
    rst = 0;
    #100;
    $finish;
end
endmodule