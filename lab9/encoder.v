`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:17:41 04/03/2024 
// Design Name: 
// Module Name:    encoder 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

`define DELAY 100_000_000
 
module encoder(clk, PB1, led);
input clk;
input PB1;
output reg [7:0] led;
reg [15:0] register_file [0:7];
reg [26:0] counter;
reg [3:0] row_counter;
reg [3:0] sum;
reg [7:0] sum1;
reg [15:0] rf_bus;
reg flag;
 
initial begin
flag = 0;
counter = `DELAY;
row_counter = 4'b0000;
 
led = 8'b00000000;
sum = 4'b0000;
sum1= 8'b00000000;
register_file[0] = 16'b0000_0000_0000_0000;
register_file[1] = 16'b1000_1000_0000_0000;
register_file[2] = 16'b0000_0001_0000_0000;
register_file[3] = 16'b1000_0000_0000_0000;
register_file[4] = 16'b0000_0000_0000_0001;
register_file[5] = 16'b0000_1000_0000_0000;
register_file[6] = 16'b1000_0001_0001_0000;
register_file[7] = 16'b0000_0000_1000_0000;
end
 
always @ (posedge clk) begin
if(counter==0) begin
counter <= `DELAY;

if(flag ==0) begin
if(row_counter < 8) begin
rf_bus = register_file[row_counter];
 

sum = rf_bus[0]+rf_bus[1]+rf_bus[2]+rf_bus[3]+rf_bus[4]+rf_bus[5]+rf_bus[6]+rf_bus[7]+rf_bus[8]+rf_bus[9]+rf_bus[10]+rf_bus[11]+rf_bus[12]+rf_bus[13]+rf_bus[14]+rf_bus[15];

if(sum > 1 || sum ==0 ) begin
led = 8'b11111111;
end
 
else begin
if(rf_bus[0] ==1) begin
led = 8'd0;
end
else if(rf_bus[1] ==1) begin
led = 8'd1;
end
else if(rf_bus[2] ==1) begin
led = 8'd2;
end
else if(rf_bus[3] ==1) begin
led = 8'd3;
end
else if(rf_bus[4] ==1) begin
led = 8'd4;
end
else if(rf_bus[5] ==1) begin
led = 8'd5;
end
else if(rf_bus[6] ==1) begin
led= 8'd6;
end
else if(rf_bus[7] ==1) begin
led = 8'd7;
end
else if(rf_bus[8] ==1) begin
led= 8'd8;
end
else if(rf_bus[9] ==1) begin
led = 8'd9;
end
else if(rf_bus[10] ==1) begin
led= 8'd10;
end
else if(rf_bus[11] ==1) begin
led = 8'd11;
end
else if(rf_bus[12] ==1) begin
led= 8'd12;
end
else if(rf_bus[13] ==1) begin
led = 8'd13;
end
else if(rf_bus[14] ==1) begin
led = 8'd14;
end
else if(rf_bus[15] ==1) begin
led = 8'd15;
end
end
row_counter <= row_counter + 1;
sum1 <= sum1 + led;
end
else begin
led = sum1;
end
end
else begin
led = sum1[0]^sum1[1]^sum1[2]^sum1[3]^sum1[4]^sum1[5]^sum1[6]^sum1[7];
end
 
end
else begin
counter <= counter - 1;
end
end
 
always @(posedge PB1) begin
flag <= 1;
end
 
endmodule

