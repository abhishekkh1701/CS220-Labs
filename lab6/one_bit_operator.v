`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:17:34 02/28/2024 
// Design Name: 
// Module Name:    one_bit_operator 
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
module one_bit_operator(a,b,op,sum,cout,cin);
input a,b,op,cin;
output sum,cout;
wire sum,cout;
assign sum=(a^b^op^cin);
assign cout = (a & (b^op)) | ((b^op) & cin) | (cin & a);
endmodule
