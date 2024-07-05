`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:04:36 01/31/2024 
// Design Name: 
// Module Name:    five_adder 
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
module five_adder(PB1,PB2,PB3,PB4,PB5,Y,led);
input PB1,PB2,PB3,PB4,PB5;
input [3:0] Y;
output [6:0] led;
wire [6:0] led;
reg [3:0] A,B,C,D;
reg [5:0] E;
wire [4:0] X,Q;
wire [5:0] Z;
initial E[5]=0;
initial E[4]=0;
always@(posedge PB1) begin
A<=Y;
end
always@(posedge PB2) begin
B<=Y;
end
always@(posedge PB3) begin
C<=Y;
end
always@(posedge PB4) begin
D<=Y;
end
always@(posedge PB5) begin
E[3:0]<=Y;
end
four_bit_adder fb1(A,B,X[3:0],X[4]);
four_bit_adder fb2(C,D,Q[3:0],Q[4]);
five_bit_adder fv1(X,Q,Z[4:0],Z[5]);
six_bit_adder sx1(Z,E,led[5:0],led[6]);

endmodule
