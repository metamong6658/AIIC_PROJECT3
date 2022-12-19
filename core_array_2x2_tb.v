`timescale 1ns/1ns
`include "core_array_2x2.v"
`include "core.v"
`include "channel.v"
`include "allocator.v"
`include "PE.v"

module core_array_2x2_tb;
parameter data_size = 8;
parameter mask_cnt_delay = 1;
reg [data_size-1:0] i_data1;
reg fill1;
reg [data_size-1:0] i_data2;
reg fill2;
wire [data_size-1:0] o_data1;
wire [data_size-1:0] o_data2;
    
// Instantiation
core_array_2x2 #(
    .data_size(data_size),
    .mask_cnt_delay(mask_cnt_delay)
) unit_top (
    .i_data1(i_data1),
    .fill1(fill1),
    .i_data2(i_data2),
    .fill2(fill2),
    .o_data1(o_data1),
    .o_data2(o_data2)
);

// Test
initial begin
    i_data1 = 0;    i_data2 = 0;
    fill1 = 0;      fill2 = 0;
    #10;
    i_data1 = 128;    i_data2 = 234;
    #1;
    fill1 = 1;      fill2 = 0;
    #1;
    fill1 = 0;      fill2 = 1;
    #10;
    i_data1 = 105;    i_data2 = 89;
    #1;
    fill1 = 1;      fill2 = 1;
    #1;
    fill1 = 0;      fill2 = 0;
    #1;
    fill1 = 1;      fill2 = 1;
    #100;
    $finish;
end

endmodule