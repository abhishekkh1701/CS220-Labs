`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:02:29 04/03/2024 
// Design Name: 
// Module Name:    top 
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
`define STATE_OUTPUT 6
`define OP_LW    6'b100011
`define OP_RFORM 6'b000000
`define MEM_READ  2'b00
`define MEM_IDLE  2'b10
module top(clk,led);
   input clk;
	
	output [7:0] led;
	
	reg [7:0] led;
	
	wire [7:0] PC;
	wire [2:0] state;
	wire [31:0] instruction;
	wire [5:0] opcode;
	wire [4:0] rs;
	wire [4:0] rt;
	wire [4:0] rd;
	wire [15:0] immediate;
	wire [5:0] func;
	wire [7:0] result;
	wire result_valid;
	wire [7:0] rsv;
	wire [7:0] rtv;
	wire [7:0] load_value;
	
	state SC(clk, PC, state);
	PC_starter IF(clk, state, PC, instruction);
	instr_sep ID(clk, state, instruction, opcode, rs, rt, rd, immediate, func);
	reg_file RF(clk, state, rs, rt, (opcode == `OP_RFORM) ? rd : rt, (opcode == `OP_LW) ? load_value : result, (opcode == `OP_LW) ? 1'b1 : result_valid, rsv, rtv);
	perform EX(clk, state, opcode, rsv, rtv, immediate, func, PC, result, result_valid);
	main_mem DATA_MEMORY(clk, state, result, (opcode == `OP_LW) ? `MEM_READ : `MEM_IDLE, rtv, load_value);
	
	always @ (posedge clk) begin
	   	if (state == `STATE_OUTPUT) begin
		   	led <= rsv;
		end
	end

endmodule
