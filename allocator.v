module allocator #(
    parameter data_size = 8,
    parameter mask_cnt_init = 1,
    parameter mask_cnt_delay = 1   
)(
    input [4:0] empty,
    input [4:0] request,
    output reg [4:0] fill,
    output reg [4:0] grant,
    input [data_size-1:0] l_data_i,
    input [data_size-1:0] n_data_i,
    input [data_size-1:0] e_data_i,
    input [data_size-1:0] s_data_i,
    input [data_size-1:0] w_data_i,
    output reg [data_size-1:0] sel_data     
);
// reg, wire, parameter
reg [4:0] mask [0:4];
reg [2:0] mask_cnt;
reg [4:0] mask_dat;

// initialization
initial begin
    mask[0] = 5'b10000;
    mask[1] = 5'b01000;
    mask[2] = 5'b00100;
    mask[3] = 5'b00010;
    mask[4] = 5'b00001;

    mask_cnt = mask_cnt_init;

    grant = 0;
    fill = 0;
    sel_data = 0;
end

// algorithm
always @(mask_cnt) begin
    if(mask_cnt == 4) begin
        mask_cnt <= #(mask_cnt_delay) 3'b001;
    end
    else begin
        mask_cnt <= #(mask_cnt_delay) mask_cnt + 1'b1;
    end
end

always @(mask_cnt or request) begin // priority change grant
    grant = mask[mask_cnt] & request;
end

always @(grant) begin // data selection
    if(grant[4]) begin
        #2 sel_data = l_data_i;
    end
    else if(grant[3]) begin
        #2 sel_data = n_data_i;
    end
    else if(grant[2]) begin
        #2 sel_data = e_data_i;
    end
    else if(grant[1]) begin
        #2 sel_data = s_data_i;
    end
    else if(grant[0]) begin
        #2 sel_data = w_data_i;        
    end
    else begin
        sel_data = sel_data;
    end
end

always @(sel_data) begin // multicasting
    #1 fill = empty;
end

endmodule