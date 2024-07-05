`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:20:51 02/28/2024 
// Design Name: 
// Module Name:    rotary 
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
module rotary(clk,Rot_A,Rot_B,rotation_event,rotation_direction);
     input clk, Rot_A, Rot_B;
     output rotation_event, rotation_direction;
     reg rotation_event, rotation_direction;
     always@(posedge clk) begin
     if(Rot_A==1&&Rot_B==1)begin
     rotation_event<=1;
     end
     else if(Rot_A==0&&Rot_B==0)begin
     rotation_event<=0;
     end
     else if(Rot_A==0&&Rot_B==1)begin
     rotation_direction<=1;
     end
     else if(Rot_A==1&&Rot_B==0)begin
     rotation_direction<=0;
     end
     end
endmodule
