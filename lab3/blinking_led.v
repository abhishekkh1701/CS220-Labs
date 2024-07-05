`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:18:16 01/31/2024 
// Design Name: 
// Module Name:    blinking_led 
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

`define OFF_TIME 25000000
`define ON_TIME (`OFF_TIME*2)
module blinking_led(clk,led0);
input clk;
output led0;
reg led0;
reg [31:0]counter;
initial counter = 0;
//initial led0=0;
always@(posedge clk)
begin

if(counter==`OFF_TIME) begin
counter<=counter+1;
led0<=0;
end
else if(counter==`ON_TIME) begin
led0<=1;
counter<=1;
end
else begin
counter<=counter+1;
end
end
endmodule
