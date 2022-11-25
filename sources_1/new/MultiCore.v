// Aeris El Asslouj 100%
// Group 26
// 5 stage pipeline with branches in ID


`timescale 1ns / 1ps
`default_nettype none


module MultiCore(input wire Clk, Reset,
                output wire [1951:0] buf_val_1_s, buf_val_2_s,
                output wire [60:0] buf_flag_s
);

// Generate all the cores
localparam NUM_CORES = 61;
genvar i;
generate
    for(i = 0; i < NUM_CORES; i= i+1) begin
            Processor #(.p_num(i)) c_i(.Clk(Clk),.Reset(Reset),
            .out_v0(),.out_v1(),.out_write_data(),.out_PC(),
            .buf_val_1(buf_val_1_s[31+32*i:32*i]),
            .buf_val_2(buf_val_2_s[31+32*i:32*i]),
            .buf_flag(buf_flag_s[i])
            );
    end
endgenerate
endmodule
