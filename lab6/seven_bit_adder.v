`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:18:44 02/28/2024 
// Design Name: 
// Module Name:    seven_bit_adder 
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
module seven_bit_adder(A,B,operation,C);
input [6:0]A;
input [6:0]B;
input operation;
output [7:0]C;
wire [7:0]C;
wire [6:0]carry;
one_bit_operator O1(A[0],B[0],operation,C[0],carry[0],operation);
one_bit_operator O2(A[1],B[1],operation,C[1],carry[1],carry[0]);
one_bit_operator O3(A[2],B[2],operation,C[2],carry[2],carry[1]);
one_bit_operator O4(A[3],B[3],operation,C[3],carry[3],carry[2]);
one_bit_operator O5(A[4],B[4],operation,C[4],carry[4],carry[3]);
one_bit_operator O6(A[5],B[5],operation,C[5],carry[5],carry[4]);
one_bit_operator O7(A[6],B[6],operation,C[6],carry[6],carry[5]);
//assign C[7]=1;
assign C[7]=carry[6]^carry[5];
endmodule
