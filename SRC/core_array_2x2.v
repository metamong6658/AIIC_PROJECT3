module core_array_2x2 #(
    parameter data_size = 8,
    parameter mask_cnt_delay = 1
) (
    input [data_size-1:0] i_data1,
    input fill1,
    input [data_size-1:0] i_data2,
    input fill2
);
// core instansitation
wire fill_12, fill_21, fill_13, fill_31;
wire fill_24, fill_42, fill_34, fill_43;
wire empty_12, empty_21, empty_13, empty_31;
wire empty_24, empty_42, empty_34, empty_43;
wire [data_size-1:0] data_12, data_21, data_13, data_31;
wire [data_size-1:0] data_24, data_42, data_34, data_43;

core #(
    .data_size(data_size),
    .mask_cnt_init(0),
    .mask_cnt_delay(mask_cnt_delay)
) core1 (
    // north
    .n_fill_i(fill1),
    .n_empty_i(1'b0),
    .n_data_i(i_data1),
    .n_fill_o(),    // open
    .n_empty_o(),   // open
    .n_data_o(),    // open
    // east
    .e_fill_i(fill_21),
    .e_empty_i(empty_21),
    .e_data_i(data_21),
    .e_fill_o(fill_12),
    .e_empty_o(empty_12),
    .e_data_o(data_12),
    // south
    .s_fill_i(fill_31),
    .s_empty_i(empty_31),
    .s_data_i(data_31),
    .s_fill_o(fill_13),
    .s_empty_o(empty_13),
    .s_data_o(data_13),
    // west
    .w_fill_i(1'b0),
    .w_empty_i(1'b0),
    .w_data_i(),    // open
    .w_fill_o(),    // open
    .w_empty_o(),   // open
    .w_data_o()     // open
);

core #(
    .data_size(data_size),
    .mask_cnt_init(0),
    .mask_cnt_delay(mask_cnt_delay)
) core2 (
    // north
    .n_fill_i(fill2),
    .n_empty_i(1'b0),
    .n_data_i(i_data2),
    .n_fill_o(),    // open
    .n_empty_o(),   // open
    .n_data_o(),    // open
    // east
    .e_fill_i(1'b0),
    .e_empty_i(1'b0),
    .e_data_i(),    // open
    .e_fill_o(),    // open
    .e_empty_o(),   // open
    .e_data_o(),    // open
    // south
    .s_fill_i(fill_42),
    .s_empty_i(empty_42),
    .s_data_i(data_42),
    .s_fill_o(fill_24),
    .s_empty_o(empty_24),
    .s_data_o(data_24),
    // west
    .w_fill_i(fill_12),
    .w_empty_i(empty_12),
    .w_data_i(data_12),
    .w_fill_o(fill_21),
    .w_empty_o(empty_21),
    .w_data_o(data_21)
);

core #(
    .data_size(data_size),
    .mask_cnt_init(0),
    .mask_cnt_delay(mask_cnt_delay)
) core3 (
    // north
    .n_fill_i(fill_13),
    .n_empty_i(empty_13),
    .n_data_i(data_13),
    .n_fill_o(fill_31),
    .n_empty_o(empty_31),
    .n_data_o(data_31),
    // east
    .e_fill_i(fill_43),
    .e_empty_i(empty_43),
    .e_data_i(data_43),
    .e_fill_o(fill_34),
    .e_empty_o(empty_34),
    .e_data_o(data_34),
    // south
    .s_fill_i(1'b0),
    .s_empty_i(1'b0),
    .s_data_i(),    // open
    .s_fill_o(),    // open
    .s_empty_o(),   // open
    .s_data_o(),
    // west
    .w_fill_i(1'b0),
    .w_empty_i(1'b0),
    .w_data_i(),    // oepn
    .w_fill_o(),    // open
    .w_empty_o(),   // open
    .w_data_o()     // open
);

core #(
    .data_size(data_size),
    .mask_cnt_init(0),
    .mask_cnt_delay(mask_cnt_delay)
) core4 (
    // north
    .n_fill_i(fill_24),
    .n_empty_i(empty_24),
    .n_data_i(data_24),
    .n_fill_o(fill_42),
    .n_empty_o(empty_42),
    .n_data_o(data_42),
    // east
    .e_fill_i(1'b0),
    .e_empty_i(1'b0),
    .e_data_i(),    // open
    .e_fill_o(),    // open
    .e_empty_o(),   // open
    .e_data_o(),    // open
    // south
    .s_fill_i(1'b0),
    .s_empty_i(1'b0),
    .s_data_i(),    // open
    .s_fill_o(),    // open
    .s_empty_o(),   // open
    .s_data_o(),
    // west
    .w_fill_i(fill_34),
    .w_empty_i(empty_34),
    .w_data_i(data_34),
    .w_fill_o(fill_43),
    .w_empty_o(empty_43),
    .w_data_o(data_43)
);

endmodule