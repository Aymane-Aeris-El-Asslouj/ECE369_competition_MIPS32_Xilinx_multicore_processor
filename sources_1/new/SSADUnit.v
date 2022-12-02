`timescale 1ns / 1ps
`default_nettype none

module SSADUnit(Clk, Reset, MEM_SAD_ReadData_A,
                frame_shift, window_shift, min_in, SAD_value, MEM_SAD_ALUResult, MEM_SAD_ALUResult_2, load_min,
                SAD_value_small_A, SAD_value_small_B);

    input wire Clk, Reset;
    input wire [31:0] MEM_SAD_ReadData_A, MEM_SAD_ALUResult, MEM_SAD_ALUResult_2;
    
    input wire frame_shift, window_shift, min_in, load_min;
    
    
    output reg [31:0] SAD_value;
    
    wire [31:0] min_stored, out_tag;
    input wire [12:0] SAD_value_small_A, SAD_value_small_B;
    wire [12:0] out_stored;
    
    reg [31:0] tag_in;
    
    reg [12:0] min_input;
    
    always @(*) begin
        if(window_shift | frame_shift) begin
            if(SAD_value_small_A < SAD_value_small_B) begin
                min_input <= SAD_value_small_A;
                tag_in <= MEM_SAD_ALUResult;
            end else begin
                min_input <= SAD_value_small_B;
                tag_in <= MEM_SAD_ALUResult_2;
            end
        end else begin
            min_input <= MEM_SAD_ReadData_A[12:0];
            tag_in <= MEM_SAD_ALUResult;
        end
    
    end 
    
    always @(*) begin
        if(load_min) begin
            SAD_value <= {{19{1'b0}}, out_stored};
        end else begin
            SAD_value <= out_tag;
        end
    end
    
    MinRegister mr(
            .Clk(Clk),
            .min_in(min_in),
            .max_out(Reset),
            .in(min_input),
            .out_stored(out_stored),
            .tag(tag_in),
            .out_tag(out_tag)
            );
    
    
endmodule
