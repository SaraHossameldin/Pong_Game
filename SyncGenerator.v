`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/24/2024 03:29:13 PM
// Design Name: 
// Module Name: SyncGenerator
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


module sync_generator(
    input clk,
    input rst,
    output reg Horizontal_sync,
    output reg Vertical_sync,
    output reg [9:0] currentRow,
    output reg [9:0] currentColumn
);
    
    
    parameter H_ACTIVE = 640; 
    parameter V_ACTIVE = 480; 

    initial
    begin
        currentColumn = 0;
        currentRow = 0;
    end

    always @(posedge clk) 
    begin
        if (rst) begin
            currentColumn <= 0;
            currentRow <= 0;
        end else begin
            if (currentColumn == 799) begin
                currentColumn <= 0;
                if (currentRow == 524)
                    currentRow <= 0;
                else
                    currentRow <= currentRow + 1;
            end else begin
                currentColumn <= currentColumn + 1;
            end
        end
    end

    always @(*) begin
        Horizontal_sync = (currentColumn < 96 || (currentColumn > 112 && currentColumn < 752)) ? 1 : 0;
        Vertical_sync = (currentRow < 2 || (currentRow > 34 && currentRow < 515)) ? 1 : 0;
    end
endmodule
