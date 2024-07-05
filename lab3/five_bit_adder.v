`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:09:38 01/31/2024 
// Design Name: 
// Module Name:    five_bit_adder 
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
module five_bit_adder(x,y,z,cout);
input [4:0] x;
input [4:0] y;
output [4:0] z;
wire [4:0] z;
output cout;
wire cout;
wire [3:0] carry;
full_adder FA50 (x[0], y[0], 1'b0, z[0], carry[0]);
full_adder FA51 (x[1], y[1], carry[0], z[1], carry[1]);
full_adder FA52 (x[2], y[2], carry[1], z[2], carry[2]);
full_adder FA53 (x[3], y[3], carry[2], z[3], carry[3]);
full_adder FA54 (x[4], y[4], carry[3], z[4], cout);

endmodule
