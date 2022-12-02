// Aeris El Asslouj 100%
// Group 26
// 5 stage pipeline with branches in ID


`timescale 1ns / 1ps
`default_nettype none


module top_module(Clk, Reset, out7, en_out);


input wire Clk;
input wire Reset;
output wire [6:0] out7;
output wire [7:0] en_out;

reg [6:0] f2_out7, f3_out7;
reg [7:0] f2_en_out, f3_en_out;


wire [6:0] f1_out7;
wire [7:0] f1_en_out;

wire [15:0] end_v0, end_v1, endf_v0, endf_v1, end_s0, endf_s0;
reg [15:0] end1_v0, end1_v1, end1_s0, end2_v0, end2_v1, end2_s0, end3_v0, end3_v1, end3_s0;

wire [31:0] out_PC, out_write_data, out_v0, out_v1, out_s0;
//wire ClkOut;

assign end_v0 = out_v0[15:0];
assign end_v1 = out_v1[15:0];
assign endf_v0 = end3_v0;
assign endf_v1 = end3_v1;

always @(posedge Clk) begin
    end1_v0 <= end_v0;
    end2_v0 <= end1_v0;
    end3_v0 <= end2_v0;
    end1_v1 <= end_v1;
    end2_v1 <= end1_v1;
    end3_v1 <= end2_v1;
    end1_s0 <= end_s0;
    end2_s0 <= end1_s0;
    end3_s0 <= end2_s0;
    
//    out7 <= f3_out7;
//    f3_out7 <= f2_out7;
//    f2_out7 <= f1_out7;
//    en_out <= f3_en_out;
//    f3_en_out <= f2_en_out;
//    f2_en_out <= f1_en_out;

end

//ClkDiv aaa(Clk, 1'b0, ClkOut);
MultiCore mmm(Clk, Reset, out_v0, out_v1, out_s0);
Two4DigitDisplay ccc(Clk, {endf_v0[7:0], endf_v1[7:0]}, endf_s0, out7, en_out);



endmodule
