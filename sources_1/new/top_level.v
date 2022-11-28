// Aeris El Asslouj 100%
// Group 26
// 5 stage pipeline with branches in ID


`timescale 1ns / 1ps
`default_nettype none


module top_module(Clk, Reset, out7, en_out);


input wire Clk;
input wire Reset;
output [6:0] out7;
output [7:0] en_out;

wire [31:0] out_PC, out_write_data, out_v0, out_v1;
wire ClkOut;

ClkDiv aaa(Clk, 1'b0, ClkOut);
MultiCore mmm(ClkOut, Reset, out_v0, out_v1);
Two4DigitDisplay ccc(Clk, out_v0[15:0], out_v1[15:0], out7, en_out);


endmodule
