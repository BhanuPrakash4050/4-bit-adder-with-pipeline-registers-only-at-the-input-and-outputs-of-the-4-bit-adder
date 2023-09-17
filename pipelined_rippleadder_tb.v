`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.08.2023 12:06:33
// Design Name: 
// Module Name: pipelined_rippleadder_tb
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


module pipelined_rippleadder_tb( );
reg [3:0]A,B;
reg cin;
wire [3:0] S;
wire cout;
reg clk,rst;
pipelined_rippleadder PRA (.A(A),.B(B),.cin(cin),.clk(clk),.rst(rst),.S(S),.cout(cout));
initial
begin
clk=1'b0;
forever #5 clk =~clk;
end
initial
begin
rst=1;
#50 rst=0;
#1000 $finish;
end
initial
 begin
   A = 4'b0000;
   B = 4'b0000;
   cin= 0;
end
always
begin
#50 A=4'b0001;B=4'b1001;cin=0;
#50 A=4'b0101;B=4'b1010;cin=1;
#50 A=4'b0110;B=4'b0011;cin=0;
#50 A=4'b0110;B=4'b0011;cin=1;
#50 A=4'b0100;B=4'b0111;cin=1;
#500 $finish;
end

endmodule


