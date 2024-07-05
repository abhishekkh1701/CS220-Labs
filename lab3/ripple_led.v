`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:46:15 01/31/2024 
// Design Name: 
// Module Name:    ripple_led 
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
`define SHIFT_TIME 50000000
module ripple_led(clk,led0,led1,led2,led3,led4,led5,led6,led7);
input clk;
output led0,led1,led2,led3,led4,led5,led6,led7;
reg led0,led1,led2,led3,led4,led5,led6,led7;
reg [31:0] counter;
initial led0=1;
initial led1=0;
initial led2=0;
initial led3=0;
initial led4=0;
initial led5=0;
initial led6=0;
initial led7=0;
initial counter=0;
always@(posedge clk) begin
counter<=counter+1;
if(counter==`SHIFT_TIME) begin
led1 <= led0;
led2 <= led1;
led3 <= led2;
led4 <= led3;
led5 <= led4;
led6 <= led5;
led7 <= led6;
led0 <= led7;
counter<=0;
end
end
endmodule

