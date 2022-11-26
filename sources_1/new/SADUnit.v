`timescale 1ns / 1ps
`default_nettype none

module SADUnit(Clk, Reset, MEM_SAD_ReadData, frame_shift, window_shift, SAD_value);

    input wire Clk, Reset;
    input [31:0] MEM_SAD_ReadData;
    
    input wire frame_shift, window_shift;
    
    wire [127:0] current_frame, current_window;
    
    wire [9:0] K1, K2, K3, K4;
    output wire [31:0] SAD_value;
    wire [12:0] SAD_value_small;

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
    assign SAD_value = {{19{SAD_value_small[12]}}, SAD_value_small};
    
    
endmodule
