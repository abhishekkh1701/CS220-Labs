`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:23:39 02/28/2024 
// Design Name: 
// Module Name:    seven_top 
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
module seven_top(clk,Rot_A,Rot_B,led,Y);
input clk,Rot_A,Rot_B;
input [3:0]Y;
output [7:0] led;
wire [7:0]led;
wire rotation_event,rotation_direction;
rotary one(clk, Rot_A, Rot_B, rotation_event, rotation_direction);
rotary1 two(led,clk, rotation_event, rotation_direction,Y);
endmodule
