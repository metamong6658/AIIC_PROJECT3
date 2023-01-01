module random_pulse_generator(
input clk,
input rst,
output reg [15:0] data,
output reg [1:0] fill
    );
reg [2:0] en=0;
 
reg [7:0] temp;

wire [7:0] LFSR;

always @(posedge clk) begin

if(en==0)begin
temp<=LFSR;
en<=1;
end
else if(en==1)begin
data[15:8]<=LFSR;
data[7:0]<=temp;
en<=2;
end
else if(en==2)begin
fill<=LFSR[1:0];
en<=0;
end
end
LFSR_8bit y (clk, LFSR);
endmodule