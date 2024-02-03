`timescale 1ns / 1ps
`default_nettype none

module SADUnit(Clk, MEM_SAD_ReadData_A, MEM_SAD_ReadData_B,
                frame_shift, window_shift, KA1, KA2, KA3, KA4, KB1, KB2, KB3, KB4);

    input wire Clk;
    input wire [31:0] MEM_SAD_ReadData_A, MEM_SAD_ReadData_B;
    
    input wire frame_shift, window_shift;
    
    wire [127:0] current_frame_A, current_frame_B, current_window;
    
    output wire [9:0] KA1, KA2, KA3, KA4, KB1, KB2, KB3, KB4;
    

    ShiftRegister frame_A(
        .Clk(Clk),
        //.Reset(Reset),
        .shift_in(frame_shift),
        .in(MEM_SAD_ReadData_A),
        .out(current_frame_A)
    );

    ShiftRegister frame_B(
        .Clk(Clk),
        //.Reset(Reset),
        .shift_in(frame_shift),
        .in(MEM_SAD_ReadData_B),
        .out(current_frame_B)
    );

    ShiftRegister window(
        .Clk(Clk),
        //.Reset(Reset),
        .shift_in(window_shift),
        .in(MEM_SAD_ReadData_A),
        .out(current_window)
    ); 
    
     SAD_4x8bit s1(
     .A(current_window[127:96]),
     .B(MEM_SAD_ReadData_A),
     .out(KA1));
    
     SAD_4x8bit s2(
     .A(current_window[95:64]),
     .B(current_frame_A[127:96]),
     .out(KA2));
    
     SAD_4x8bit s3(
     .A(current_window[63:32]),
     .B(current_frame_A[95:64]),
     .out(KA3));
    
     SAD_4x8bit s4(
     .A(current_window[31:0]),
     .B(current_frame_A[63:32]),
     .out(KA4));
    
     SAD_4x8bit s5(
     .A(current_window[127:96]),
     .B(MEM_SAD_ReadData_B),
     .out(KB1));
    
     SAD_4x8bit s6(
     .A(current_window[95:64]),
     .B(current_frame_B[127:96]),
     .out(KB2));
    
     SAD_4x8bit s7(
     .A(current_window[63:32]),
     .B(current_frame_B[95:64]),
     .out(KB3));
    
     SAD_4x8bit s8(
     .A(current_window[31:0]),
     .B(current_frame_B[63:32]),
     .out(KB4));
    
    
endmodule
