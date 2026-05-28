`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/24/2024 04:05:11 PM
// Design Name: 
// Module Name: VGAtest
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


module VGAtest(
    output [3:0] vgaRed,
    output [3:0] vgaGreen,
    output [3:0] vgaBlue,
    output Hsync,
    output Vsync,
    input clk,
    input rst
);
    wire pixel_clk;
    wire [9:0] currentRow, currentColumn;

    // Generate 25 MHz pixel clock
    clockDivider #(4) pixel_clock_gen(
        .clk(clk),
        .rst(rst),
        .clk_out(clk)
    );

    // VGA sync generator
    sync_generator sync_gen(
        .clk(clk),
        .rst(rst),
        .Horizontal_sync(Hsync),
        .Vertical_sync(Vsync),
        .currentRow(currentRow),
        .currentColumn(currentColumn)
    );

    // Generate a test pattern
    wire checkerboard;
    assign checkerboard = ((currentColumn / 32) % 2) ^ ((currentRow / 32) % 2); 

    // Gradient based on pixel position
    wire [3:0] red_gradient = currentColumn[9:6]; 
    wire [3:0] green_gradient = currentRow[8:5]; 

    // Combine patterns for RGB output
    assign vgaRed = checkerboard ? 4'hF : red_gradient;  
    assign vgaGreen = checkerboard ? 4'hF : green_gradient;
    assign vgaBlue = 4'h0;
endmodule
