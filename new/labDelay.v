`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/01/2025 09:00:34 AM
// Design Name: 
// Module Name: labDelay
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


module labDelay(
    input clk,clr,x,
    output [3:0] sq,
    output valid
    );
    wire [7:0] a ={x,x,x,x,x,x,x,x};
    reg x_temp,start;
    isqrt is(.clk(clk),.clr(clr),.start(start),.a(a),.sol(sq),.valid(valid));
    always @(posedge clk) begin
        if(x_temp!=x) start =1;
        else start =0;
        x_temp=x;
    end
endmodule
