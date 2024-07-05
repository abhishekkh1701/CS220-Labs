`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:19:44 02/07/2024 
// Design Name: 
// Module Name:    LCD_driver 
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
module LCD_driver( clk, line1, line2, lcd_e, lcd_w, lcd_rs, data);

input clk;
input [127:0] line1, line2;
output lcd_e, lcd_w, lcd_rs;
output [3:0] data;
wire lcd_e, lcd_w, lcd_rs;
wire [3:0] data;
wire[55:0] helper;
wire[7:0] break;
reg [22:0] counter;
reg [2:0] stage;

reg lcd_er, lcd_wr, lcd_rsr;
reg [3:0] data_r;
reg [1:0] flag;
reg [7:0] index1,index2,index3,index4;

initial 
begin
lcd_er=0; lcd_wr=0; lcd_rsr =0;flag=0; counter=0; stage =0; index1 = 55; index2=127; index3=7; index4=127;
end


assign helper=56'h333228060C0180;
assign break = 8'hC0;

always @(posedge clk)
begin
	counter = counter + 1;
	if(stage == 3'b000 && counter == 1000000 )
	begin
		if(flag==2'b00)
		begin
			lcd_er=0;
			flag = flag+1;
		end
		else if(flag == 2'b01)
		begin
			data_r[3] = helper[index1];
			data_r[2] = helper[index1-1];
			data_r[1] = helper[index1-2];
			data_r[0] = helper[index1-3];
			flag = flag+1;	
		end
		else if(flag == 2'b10)
		begin
			
			if (index1 == 3)
			begin
				stage = 3'b001;
				flag=0;
			end
			lcd_er =  1;
			flag = 0;
			index1 = index1-4;
		end
		counter = 0;
	end
	else if(stage == 3'b001 && counter == 1000000)
	begin
		
		if(flag == 2'b00)
		begin
			lcd_er = 0;
			flag = flag+1;
		end
		else if(flag == 2'b01)
		begin
			lcd_rsr =1;
			lcd_wr =0;
			data_r[3] = line1[index2];
			data_r[2] = line1[index2-1];
			data_r[1] = line1[index2-2];
			data_r[0] = line1[index2-3];
			flag = flag+1;
			
		end
		else if(flag == 2'b10)
		begin
			if (index2 == 3)
			begin
				stage = 3'b010;
				flag=0;
			end
			lcd_er=1;
			flag = 0;
			index2 = index2-4;
		end
		counter = 0;
	end
	else if(stage == 3'b010 && counter == 1000000)
	begin
		
		if(flag == 2'b00)
		begin
			lcd_er=0;
			flag = flag+1;
		end
		else if(flag == 2'b01)
		begin
			lcd_rsr = 0;
			lcd_wr = 0;
			data_r[3] = break[index3];
			data_r[2] = break[index3-1];
			data_r[1] = break[index3-2];
			data_r[0] = break[index3-3];
			flag = flag+1;
		end
		else if(flag == 2'b10)
		begin
			if (index3 ==3)
			begin
				stage = 3'b011;
				flag=0;
			end
			lcd_er=1;
			flag = 0;
			index3 = index3-4;
		end
		counter = 0;
	end
	else if(stage == 3'b011 && counter == 1000000)
	begin
		if(flag==2'b00)
		begin
			lcd_er=0;
			flag = flag+1;
		end
		else if(flag == 2'b01)
		begin
			lcd_rsr = 1;
			lcd_wr = 0;
			data_r[3] = line2[index4];
			data_r[2] = line2[index4-1];
			data_r[1] = line2[index4-2];
			data_r[0] = line2[index4-3];
			flag=flag+1;	
		end
		else if(flag == 2'b10)
		begin
			if (index4 ==3)
			begin
				stage = 3'b110;
			end
			lcd_er = 1;
			flag = 0;
			index4 = index4-4;
		end
		counter = 0;
	end
	else if(stage == 3'b110 && counter == 1000000)
	begin
		lcd_er = 0;
	end	
end


assign data[3:0] = data_r[3:0];
assign lcd_e = lcd_er;
assign lcd_w = lcd_wr;
assign lcd_rs = lcd_rsr; 

endmodule

