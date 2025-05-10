`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/02/2025 12:31:20 PM
// Design Name: 
// Module Name: digController
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


module digController(
    input clk,
    input clr,
    input [3:0] d1,
    input [3:0] d2,
    input [3:0] d3,
    input [3:0] d4,
    output [3:0] an,
    output [6:0] ag
    );
    wire ce;
    wire[1:0]s;
    wire [3:0]X;
    clock_1k cluck (.clk(clk),.clr(clr),.c_e(ce));
    anode_d anode(.clk(clk),.clr(clr),.clk_e(ce),.AN(an),.S(s));
    mux mus (.d1(d1),.d2(d2),.d3(d3),.d4(d4),.S(s),.X(X));
    hexto7 h(.x(X),.CA(ag));
endmodule