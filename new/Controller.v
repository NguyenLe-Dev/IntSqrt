`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/29/2025 11:51:40 AM
// Design Name: 
// Module Name: Controller
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


module Controller(
    input clk,clr,start,greater,
    output reg valid = 0,
    output reg ena, add, del, sq,out
    );
    reg [3:0]state ;
    reg [3:0] next_state;
    parameter IDLE =0,LOAD =1, CHECK =2, ADD =3;
    always @(start or state) begin
        case (state)
            IDLE:    next_state = start ? LOAD : IDLE;
            LOAD:    next_state = CHECK;
            CHECK:   next_state = greater ? IDLE : ADD;
            ADD: next_state = CHECK;
        endcase
    end
    always @(negedge clk or posedge clr) begin
        if(clr) begin
            state <= IDLE;
            valid <= 0;
            ena <= 0; add <= 0; del <= 0; sq <= 0; out <= 0;
        end else begin 
            case(next_state)
                IDLE: if(greater) begin
                            ena<=0;
                            add<=0;
                            del<=0; 
                            sq<=0;
                            valid<=1;
                            out<=1;
                      end
                LOAD: begin
                    ena<=0;
                    add<=0;
                    sq<=1;
                    del<=1;
                    out<=0;
                    valid<=0;
                end
                CHECK: begin
                    ena<=1;
                    sq<=0;
                    del<=0;
                    add<=0;
                    out<=0;
                    valid<=0;
                end
                ADD: begin
                    ena<=0;
                    sq<=1;
                    del<=1;
                    add<=1;
                    out<=0;
                    valid<=0;
                end
                
            endcase
            state <= next_state;
        end
    end
endmodule
