module top #(
    parameter data_size = 8,
    parameter mask_cnt_delay = 1
) (
    input clk,
    input rst
);

// wire
wire [15:0] data;
wire [1:0] fill;

// random pulse generator
random_pulse_generator U1(clk,rst,data,fill);

// core_array
core_array_2x2 #(data_size, mask_cnt_delay) U2 (
    .i_data1(data[15:8]),
    .fill1(fill[1]),
    .i_data2(data[7:0]),
    .fill2(fill[0])
);

    
endmodule