`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:08:02 01/31/2024 
// Design Name: 
// Module Name:    four_bit_adder 
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
module four_bit_adder(x,y,z,cout);
input [3:0] x;
input [3:0] y;
output [3:0] z;
wire [3:0] z;
output cout;
wire cout;
wire [2:0] carry;
full_adder FA40 (x[0], y[0], 1'b0, z[0], carry[0]);
full_adder FA41 (x[1], y[1], carry[0], z[1], carry[1]);
full_adder FA42 (x[2], y[2], carry[1], z[2], carry[2]);
full_adder FA43 (x[3], y[3], carry[2], z[3], cout);
endmodule
