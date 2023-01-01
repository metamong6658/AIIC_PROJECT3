module PE #(
    parameter data_size = 8 
) (
    input [data_size-1:0] i_data,
    output [data_size-1:0] o_data
);

assign #1 o_data = i_data << 1;
    
endmodule