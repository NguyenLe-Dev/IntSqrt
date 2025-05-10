`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/25/2025 04:11:59 PM
// Design Name: 
// Module Name: Datapath
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


module Datapath(
    input [7:0] a,
    input clk, clr, ena, add, del, sq,out,
    output reg [3:0] sol,
    output reg greater
    );
    reg [8:0] d;
    reg [9:0] sqrt;
    always @(posedge clk or posedge clr) begin
        if (clr) begin
             d <= 3;
            sqrt <= 1;
            sol <= 0;
            greater <= 0;
        end else begin
            
            if (add) begin 
                sqrt <= d + sqrt;
                d <= d + 2;
            end else begin
                if (sq & del) begin
                    d <= 3;
                    sqrt <= 1;
                end else if(ena) greater <= (sqrt > a);
                else greater <=0;
                sol <= (d>>1)-1;
                
            end
        end
    end
endmodule
