`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.08.2023 11:53:59
// Design Name: 
// Module Name: pipelined_rippleadder
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


module pipelined_rippleadder(
    input [3:0]A,
    input [3:0]B,
    input cin,
    input clk,
    input rst,
    output reg [3:0] S,
    output reg cout
);
    wire [3:0] S_f;
    wire cout_f;
    reg [3:0]A_r,B_r;
    reg cin_r;
   Ripple_adder R4A (.A(A_r),.B(B_r),.cin(cin_r),.S(S_f),.cout(cout_f));
    
    always @(posedge clk,posedge rst)
     begin
     if(rst)
        begin
          A_r <= 4'b0000;
          B_r <= 4'b0000;
          cin_r <=1'b0;
          S<=4'b0000;
         cout<=0;
        end 
      else
        begin
          A_r <= A;
          B_r <= B;
          cin_r <= cin;
          S<=S_f;
          cout<=cout_f;
         end
      end      
endmodule

