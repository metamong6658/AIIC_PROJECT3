module channel #(
    parameter data_size = 8,
    parameter is_local = 1
) (
    input fill,
    input grant,
    output request,
    output empty,
    input [data_size-1:0] i_data,
    output reg [data_size-1:0] o_data
);
// reg
wire D1, D2;
reg Q1, Q2;

initial begin
    Q1 = 0;
    Q2 = 0;
end

// D1, D2
not #1 Gnot1(D1,Q1);
not #1 Gnot2(D2,Q2);

// Q1, Q2
always @(posedge fill) begin
    #1 Q1 <= D1;
end

always @(posedge grant) begin
    #1 Q2 <= D2;
end

// wire
wire w1, w2;
buf #1 G1(w1,Q1);
buf #1 G2(w2,Q2);

// empty, request
xnor #1 G3(empty,Q1,w2);
xor #1 G4(request,w1,Q2);

// data
reg [data_size-1:0] temp1;
wire [data_size-1:0] temp2;
initial begin
    temp1 <= 0;
end

// PE
PE #(data_size) unit_PE(
    .i_data(temp1),
    .o_data(temp2)
);

always @(posedge fill) begin
    #1 temp1 <= i_data;
end    

always @(posedge grant) begin
   if(is_local) begin
    #1 o_data = temp2;
   end
   else begin
    #1 o_data = temp1;
   end 
end

endmodule