`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:49:24 02/07/2024 
// Design Name: 
// Module Name:    LCD_driver_second 
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


module LCD_driver_top(clk,lcd_e,lcd_rs,lcd_w,data);

input clk;

output wire lcd_e,lcd_rs,lcd_w;
output wire [3:0]data;
wire [127:0]line1,line2;
LCD_driver L0(clk,"WELCOME TO CSE, ","IIT KANPUR      ", lcd_e, lcd_w, lcd_rs, data);
endmodule


