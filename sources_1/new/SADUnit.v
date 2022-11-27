`timescale 1ns / 1ps
`default_nettype none

module SADUnit(Clk, Reset, MEM_SAD_ReadData_A, MEM_SAD_ReadData_B,
                frame_shift, window_shift, min_in, SAD_value, MEM_SAD_ALUResult, load_min);

    input wire Clk, Reset;
    input wire [31:0] MEM_SAD_ReadData_A, MEM_SAD_ReadData_B, MEM_SAD_ALUResult;
    
    input wire frame_shift, window_shift, min_in, load_min;
    
    wire [127:0] current_frame_A, current_frame_B, current_window;
    
    wire [9:0] KA1, KA2, KA3, KA4, KB1, KB2, KB3, KB4;
    output reg [31:0] SAD_value;
    
    wire [31:0] min_stored, out_tag;
    wire [12:0] SAD_value_small_A, SAD_value_small_B;
    wire [12:0] out_stored;
    
    reg [31:0] tag_in;

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
    
    assign SAD_value_small_A = KA1 + KA2 + KA3 + KA4;
    assign SAD_value_small_B = KB1 + KB2 + KB3 + KB4;
    
    reg [12:0] min_input;
    
    always @(*) begin
        if(window_shift | frame_shift) begin
            if(SAD_value_small_A < SAD_value_small_B) begin
                min_input <= SAD_value_small_A;
                tag_in <= MEM_SAD_ALUResult;
            end else begin
                min_input <= SAD_value_small_B;
                tag_in <= MEM_SAD_ALUResult + 256;
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
