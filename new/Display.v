`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/30/2025 12:26:44 PM
// Design Name: 
// Module Name: Display
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


module Display(
    input clk,
    input clr,
    input [7:0] a,
    input start,
    output [6:0] ag,
    output [3:0] an,
    output valid
    );
    wire [11:0] bcd;
    wire [7:0] show;
    wire [3:0] sol;
    
    wire ena, add, del, sq,out,greater;
    assign show = valid ? sol : a;
    BCD b(.binary(show),.ones(bcd[3:0]),.tens(bcd[7:4]),.hundreds(bcd[11:8]));
    Datapath d (.clk(clk),.clr(clr), .ena(ena), .add(add), .del(del), .sq(sq), .out(out), .greater(greater), .a(a), .sol(sol));
    Controller c (.clk(clk), .clr(clr), .start(start),.greater(greater),.valid(valid), .ena(ena), .add(add), .del(del), .sq(sq), .out(out));
    digController dig (.clk(clk),.clr(clr),.d4(0),.d3(bcd[11:8]),.d2(bcd[7:4]),.d1(bcd[3:0]),.an(an),.ag(ag));
endmodule
