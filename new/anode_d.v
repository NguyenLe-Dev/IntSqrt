`timescale 1ns / 1ps
module anode_d(
    input clk,
    input clk_e,
    input clr,
    output reg[3:0] AN,
    output reg[1:0] S
    );
    reg clk_en;
    always @(posedge clk or posedge clr) begin
        if(clr) begin
            S <=0;
            clk_en <=0;
        end else begin
            clk_en <= clk_e;
            if(clk_e&&!clk_en) begin
                S<=S+1;
            end
        end
    end 
    
    always @ (S) begin
    case (S)
        2'b00:AN <= 4'b1110;
        2'b01:AN <= 4'b1101;
        2'b10:AN <= 4'b1011;  //  S=2
        2'b11:AN <= 4'b0111;  //  S=3
       default: AN <= 4'b1110; //  default state
        
    endcase
    end
endmodule