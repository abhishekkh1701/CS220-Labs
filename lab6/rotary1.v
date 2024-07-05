`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:22:13 02/28/2024 
// Design Name: 
// Module Name:    rotary1 
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
module rotary1(led,clk,rotation_event,rotation_direction,Y);
output [7:0]led;
wire [7:0]led;
input [3:0]Y;
input clk, rotation_event, rotation_direction;
reg prev_rotation_event=1'b1;
reg [2:0]counter;
initial counter=3'b000;
reg [6:0]A;
reg[6:0]B;
reg operation;
 always @(posedge clk) begin
   prev_rotation_event <= rotation_event;
     if (prev_rotation_event==0 && rotation_event==1) begin
      if(counter==0) begin
      A[0]<=Y[0];
      A[1]<=Y[1];
      A[2]<=Y[2];
      A[3]<=Y[3];
      end
      if(counter==1) begin
      A[4]<=Y[0];
      A[5]<=Y[1];
      A[6]<=Y[2];
      end
      else if(counter==2) begin
      B[0]<=Y[0];
      B[1]<=Y[1];
      B[2]<=Y[2];
      B[3]<=Y[3];
      end
      else if(counter==3) begin
      B[4]<=Y[0];
      B[5]<=Y[1];
      B[6]<=Y[2];
      end
      else if(counter==4) begin
      operation<=Y[0];
      end
		counter<=counter+1;
      if(counter==5) begin
      counter<=0;
      end
     end
 end
 seven_bit_adder sa(A,B,operation,led);

endmodule
