`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/24/2024 03:29:37 PM
// Design Name: 
// Module Name: PixelClock
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

module clockDivider #(parameter n = 4) 
(input clk, rst, output reg clk_out);
    wire [31:0] count;

    counter_x_bit #(32, n) counterMod(
        .clk(clk),
        .reset(rst),
        .count(count)
    );

    always @ (posedge clk, posedge rst) begin
        if (rst)
            clk_out <= 0;
        else if (count == n - 1)
            clk_out <= ~clk_out;
    end
endmodule

module counter_x_bit #(parameter x = 3, n = 6)
(input clk, reset, output [x-1:0] count);
    reg [x-1:0] count;

    always @(posedge clk, posedge reset) begin
        if (reset == 1)
            count <= 0;
        else if (count == n - 1)
            count <= 0;
        else
            count <= count + 1;
    end
endmodule
 