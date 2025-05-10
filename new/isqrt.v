`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/29/2025 02:00:50 PM
// Design Name: 
// Module Name: isqrt
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


module isqrt(
    input [7:0] a,
    input start,
    input clk,
    input clr,
    output [3:0] sol,
    output valid
    );
    wire ena, add, del, sq,out,greater;
    Controller c (.clk(clk),.clr(clr),.start(start),.greater(greater),.valid(valid),.ena(ena), .add(add), .del(del), .sq(sq),.out(out));
    Datapath d(.clk(clk),.clr(clr),.a(a),.ena(ena), .add(add), .del(del), .sq(sq),.out(out),.sol(sol),.greater(greater));

endmodule
