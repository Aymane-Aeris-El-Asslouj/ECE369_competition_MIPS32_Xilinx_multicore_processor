`timescale 1ns / 1ps
`default_nettype none

module SADUnit(Clk, Reset, MEM_SAD_ReadData, frame_shift, window_shift, min_in, SAD_value, MEM_SAD_ALUResult, load_min);

    input wire Clk, Reset;
    input wire [31:0] MEM_SAD_ReadData, MEM_SAD_ALUResult;
    
    input wire frame_shift, window_shift, min_in, load_min;
    
    wire [127:0] current_frame, current_window;
    
    wire [9:0] K1, K2, K3, K4;
    output reg [31:0] SAD_value;
    
    wire [31:0] min_stored, out_tag;
    wire [12:0] SAD_value_small;
    wire [12:0] out_stored;
    
    wire smaller;

    ShiftRegister frame(
        .Clk(Clk),
        //.Reset(Reset),
        .shift_in(frame_shift),
        .in(MEM_SAD_ReadData),
        .out(current_frame)
    );

    ShiftRegister window(
        .Clk(Clk),
        //.Reset(Reset),
        .shift_in(window_shift),
        .in(MEM_SAD_ReadData),
        .out(current_window)
    ); 
    
     SAD_4x8bit s1(
     .A(current_window[127:96]),
     .B(MEM_SAD_ReadData),
     .out(K1));
    
     SAD_4x8bit s2(
     .A(current_window[95:64]),
     .B(current_frame[127:96]),
     .out(K2));
    
     SAD_4x8bit s3(
     .A(current_window[63:32]),
     .B(current_frame[95:64]),
     .out(K3));
    
     SAD_4x8bit s4(
     .A(current_window[31:0]),
     .B(current_frame[63:32]),
     .out(K4));
    
    assign SAD_value_small = K1 + K2 + K3 + K4;
    
    reg [12:0] min_input;
    
    always @(*) begin
        if(window_shift | frame_shift) begin
            min_input <= SAD_value_small;
        end else begin
            min_input <= MEM_SAD_ReadData[12:0];
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
            .out_smaller(smaller),
            .out_stored(out_stored),
            .tag(MEM_SAD_ALUResult),
            .out_tag(out_tag)
            );
    
    
endmodule
