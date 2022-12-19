module core #(
    parameter data_size = 8,
    parameter mask_cnt_init = 1,
    parameter mask_cnt_delay = 1
) (
    // north
    input n_fill_i,
    input n_empty_i,
    input [data_size-1:0] n_data_i,
    output n_fill_o,
    output n_empty_o,
    output reg [data_size-1:0] n_data_o,
    // east
    input e_fill_i,
    input e_empty_i,
    input [data_size-1:0] e_data_i,
    output e_fill_o,
    output e_empty_o,
    output reg [data_size-1:0] e_data_o,
    // south
    input s_fill_i,
    input s_empty_i,
    input [data_size-1:0] s_data_i,
    output s_fill_o,
    output s_empty_o,
    output reg [data_size-1:0] s_data_o,
    // west
    input w_fill_i,
    input w_empty_i,
    input [data_size-1:0] w_data_i,
    output w_fill_o,
    output w_empty_o,
    output reg [data_size-1:0] w_data_o
    );
// reg, wire, parameter
wire [4:0] request, grant;
wire [data_size-1:0] l_data_w;
wire [data_size-1:0] n_data_w;
wire [data_size-1:0] e_data_w;
wire [data_size-1:0] s_data_w;
wire [data_size-1:0] w_data_w;
wire [data_size-1:0] sel_data;

wire l_fill_o;
wire l_empty_o;
reg [data_size-1:0] l_data_o;

// allocator
allocator #(
    .data_size(data_size),
    .mask_cnt_init(mask_cnt_init),
    .mask_cnt_delay(mask_cnt_delay))
unit_allocator (
    .empty({l_empty_o,n_empty_i,e_empty_i,s_empty_i,w_empty_i}),
    .request(request),
    .fill({l_fill_o,n_fill_o,e_fill_o,s_fill_o,w_fill_o}),
    .grant(grant),
    .l_data_i(l_data_w),
    .n_data_i(n_data_w),
    .e_data_i(e_data_w),
    .s_data_i(s_data_w),
    .w_data_i(w_data_w),
    .sel_data(sel_data)
);

// channel
channel #(.data_size(data_size), .is_local(1)) Local_channel (
    .fill(l_fill_o),
    .grant(grant[4]),
    .request(request[4]),
    .empty(l_empty_o),
    .i_data(l_data_o),
    .o_data(l_data_w)
);

channel #(.data_size(data_size), .is_local(0)) North_channel (
    .fill(n_fill_i),
    .grant(grant[3]),
    .request(request[3]),
    .empty(n_empty_o),
    .i_data(n_data_i),
    .o_data(n_data_w)
);

channel #(.data_size(data_size), .is_local(0)) East_channel (
    .fill(e_fill_i),
    .grant(grant[2]),
    .request(request[2]),
    .empty(e_empty_o),
    .i_data(e_data_i),
    .o_data(e_data_w)
);

channel #(.data_size(data_size), .is_local(0)) South_channel (
    .fill(s_fill_i),
    .grant(grant[1]),
    .request(request[1]),
    .empty(s_empty_o),
    .i_data(s_data_i),
    .o_data(s_data_w)
);

channel #(.data_size(data_size), .is_local(0)) West_channel (
    .fill(w_fill_i),
    .grant(grant[0]),
    .request(request[0]),
    .empty(w_empty_o),
    .i_data(w_data_i),
    .o_data(w_data_w)
);

always @(*) begin
    l_data_o <= sel_data;
    n_data_o <= sel_data;
    e_data_o <= sel_data;
    s_data_o <= sel_data;
    w_data_o <= sel_data;
end

endmodule