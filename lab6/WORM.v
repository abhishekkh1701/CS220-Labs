`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:52:29 03/06/2024 
// Design Name: 
// Module Name:    WORM 
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
module rotatory_input(clk, ROT_A, ROT_B, rotation_event);
	 
	 input clk, ROT_A, ROT_B;
	 
	 output rotation_event;
	 reg rotation_event;
	 
	 always@(posedge clk) begin
		if(ROT_A == 1 && ROT_B == 1) begin
				rotation_event <= 1;
		end
		else if(ROT_A == 0 && ROT_B == 0) begin
				rotation_event <= 0;
		end
	 end
	 
endmodule

module full_adder(a,b,cin,sum,cout);
	input a;
	input b;
	input cin;
	
	output sum;
	wire sum;
	
	output cout;
	wire cout;
	
	assign sum = a^b^cin;
	assign cout = (a&b)|(b&cin)|(cin&a);
	
endmodule

module five_bit_adder(coordinate , direction , distance, position , carry);

	 input[3:0] coordinate;
	 input direction;
	 input[1:0] distance;
	 
	 output[3:0] position;
	 wire [3:0] position;
	 
	 output carry;
	 wire carry;
	 
	 wire carry_temp[2:0];

	 full_adder FA0(coordinate[0], distance[0]^direction, direction ,position[0], carry_temp[0]);
	 full_adder FA1(coordinate[1], distance[1]^direction, carry_temp[0], position[1], carry_temp[1]);
    full_adder FA2(coordinate[2], direction, carry_temp[1], position[2], carry_temp[2]);
	 full_adder FA3(coordinate[3], direction, carry_temp[2], position[3], carry);

endmodule


module WORM(clk ,inp ,rotation_event, x_coordinate, y_coordinate);

	 input clk;
	 input[3:0] inp;
	 input rotation_event;
	 
	 output[3:0] x_coordinate;
	 reg[3:0] x_coordinate;
	 
	 output[3:0] y_coordinate;
	 reg[3:0] y_coordinate;
	 
	 reg dir_x;
	 reg dir_y;
	 
	 reg[1:0] dir;
	 reg[1:0] dis;
	 
	 reg[1:0] dis_x;
	 reg[1:0] dis_y;
	 
	 reg [3:0] temp_x;
	 reg [3:0] temp_y;
	 
	 wire [3:0] x;
	 wire [3:0] y;
	 
	 wire carry_x;
	 wire carry_y;
	 
	 reg prev_rotation_event;	
	 
	 initial begin
		 prev_rotation_event = 1'b0;
		 dir_x = 1'b0;
		 dir_y = 1'b0;
		 x_coordinate = 4'b0000;
		 y_coordinate = 4'b0000;
	 end

	 always @(posedge clk) begin
		 if((prev_rotation_event == 0) && (rotation_event == 1)) begin
			 temp_x <= x_coordinate;
			 temp_y <= y_coordinate;
			
			 dir <= inp[1:0];
			 dis <= inp[3:2];
			 if(dir == 2'b00 || dir == 2'b01) begin
				 if(dir == 2'b00) begin
				    dir_x <= 1;
				 end
				 
				 else begin
					 dir_x <= 0;
				 end
				 
				 dis_x <= dis;
				 dis_y <= 2'b00;
				
				 if(dir_x & !carry_x) begin
					 x_coordinate <= 0;
				 end
				 
				 else if(!dir_x & carry_x) begin
					 x_coordinate <= 4'b1111;
				 end
				 
				 else begin
					 x_coordinate <= x;
				 end
				 
			 end
			 
			 else begin
			 
				 if(dir == 2'b10) begin
					 dir_y <= 0;
				 end
				 
				 else begin
					 dir_y <= 1;
				 end
				 
				 dis_y <= dis;
				 dis_x <= 2'b00;
				
				 if(dir_y & !carry_y) begin
					 y_coordinate <= 0;
				 end
				 
				 else if(!dir_y & carry_y) begin
					 y_coordinate <= 4'b1111;
				 end
				 
				 else begin
					 y_coordinate <= y;
				 end
			 end
		 end
	    prev_rotation_event <= rotation_event;
	end
	
	five_bit_adder uut0(temp_x, dir_x, dis_x, x, carry_x);
	five_bit_adder uut1(temp_y, dir_y, dis_y, y, carry_y);	
		
endmodule

module square_grid_top( clk, inp, ROT_A, ROT_B, x_coordinate, y_coordinate);

	input clk, ROT_A, ROT_B;
	input[3:0] inp;
	
	output[3:0] x_coordinate;
	wire[3:0] x_coordinate;
	
	output[3:0] y_coordinate;
	wire[3:0] y_coordinate;
	
	wire rotation_event;
	
	rotatory_input uut2(clk, ROT_A, ROT_B, rotation_event);
	WORM uut3(clk, inp, rotation_event, x_coordinate , y_coordinate);

endmodule

