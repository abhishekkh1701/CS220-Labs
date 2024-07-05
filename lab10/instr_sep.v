`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:11:43 04/03/2024 
// Design Name: 
// Module Name:    instr_sep 
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
`define STATE_FIELDS 1
module instr_sep(clk, state, instruction, opcode, rs, rt, rd, immediate, func);

   input clk;
	input [2:0] state;
	input [31:0] instruction;
	
	output [5:0] opcode;
	output [4:0] rs;
	output [4:0] rt;
	output [4:0] rd;
	output [15:0] immediate;
	output [5:0] func;
	
	reg [5:0] opcode;
	reg [4:0] rs;
	reg [4:0] rt;
	reg [4:0] rd;
	reg [15:0] immediate;
	reg [5:0] func;
	
	always @ (posedge clk) begin
	   	if (state == `STATE_FIELDS) begin
		   opcode <= instruction[31:26];
			rs <= instruction[25:21];
			rt <= instruction[20:16];
			rd <= instruction[15:11];
			immediate <= instruction[15:0];
			func <= instruction[5:0];
		end
	end
endmodule
