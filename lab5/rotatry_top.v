`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:16:47 02/14/2024 
// Design Name: 
// Module Name:    rotatry_top 
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
module rotatry_top(clk,Rot_A,Rot_B,led0, led1, led2, led3, led4, led5, led6, led7
    );
input clk,Rot_A,Rot_B;
output wire led0, led1, led2, led3, led4, led5, led6, led7;wire rotation_event, rotation_direction;
rotary one(clk, Rot_A, Rot_B, rotation_event, rotation_direction);
rotary1 two(clk, rotation_event, rotation_direction,led0, led1, led2, led3, led4, led5, led6, led7);
endmodule
