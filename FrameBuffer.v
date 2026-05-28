`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/24/2024 03:28:38 PM
// Design Name: 
// Module Name: FrameBuffer
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module FrameBuffer(
input [9:0] currentRow,
input [9:0] currentColumn,
output reg currentPixel
    );
  
 reg framebuffer [639:0][479:0];
 
 initial begin
 integer i,j;
 for(i=0;i<640;i=i+1) begin
   for(j=0;j<480;j=j+1) begin
   framebuffer[i][j]=0;
   end
   end
 end
 always @(*) begin
 if (currentRow< 640 && currentColumn <480)
  currentPixel= framebuffer[currentRow][currentColumn];
  else 
  currentPixel=0;
  end
endmodule
