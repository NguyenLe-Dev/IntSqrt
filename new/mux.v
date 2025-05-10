`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/26/2025 01:01:55 PM
// Design Name: 
// Module Name: mux
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


module mux(
    input [3:0] d1,
    input [3:0] d2,
    input [3:0] d3,
    input [3:0] d4,
    input [1:0] S,
    output reg [3:0] X
    );
    
    always @ (d1 or d2 or d3 or d4 or S) begin
      case (S)
         0 : X <= d1;
         1 : X <= d2;
         2 : X <= d3;
         3 : X <= d4;
         default: X<= d1;
      endcase
   end
endmodule