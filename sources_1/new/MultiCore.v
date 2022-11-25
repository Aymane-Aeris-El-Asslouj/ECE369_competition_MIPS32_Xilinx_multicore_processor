// Aeris El Asslouj 100%
// Group 26
// 5 stage pipeline with branches in ID


`timescale 1ns / 1ps
`default_nettype none


module MultiCore(input wire Clk, Reset,
                output wire [31:0] out_v0,
                output wire [31:0] out_v1);
localparam NUM_CORES = 61;

wire [NUM_CORES-1:0] buf_flag_s;

wire [31:0] buf_val_1_s [NUM_CORES-1:0];
wire [31:0] buf_val_2_s [NUM_CORES-1:0];

// Generate all the cores
genvar i;
generate
    for(i = 0; i < NUM_CORES; i= i+1) begin
            Processor #(.p_num(i), .instructions("instruction_memory.mem")) c_i(.Clk(Clk),.Reset(Reset),
            .out_v0(),.out_v1(),.out_write_data(),.out_PC(),
            .buf_val_1(buf_val_1_s[i]),
            .buf_val_2(buf_val_2_s[i]),
            .buf_flag(buf_flag_s[i])
            );
    end
endgenerate

wire [5:0] buf_val_1_addr;
wire [31:0] buf_val_1_select;
wire [5:0] buf_val_2_addr;
wire [31:0] buf_val_2_select;
assign buf_val_1_select = buf_val_1_s[buf_val_1_addr];
assign buf_val_2_select = buf_val_2_s[buf_val_2_addr];

wire all_buf_flags;
assign all_buf_flags = ((~buf_flag_s) == {NUM_CORES{1'b0}});

Processor #(.p_num(0), .instructions("instruction_memory_master.mem")) c_m(.Clk(Clk),.Reset(Reset),
            .out_v0(out_v0),.out_v1(out_v1),.out_write_data(),.out_PC(),
            .buf_val_1_addr(buf_val_1_addr),
            .buf_val_2_addr(buf_val_2_addr),
            .buf_val_1_select(buf_val_1_select),
            .buf_val_2_select(buf_val_2_select),
            .all_buf_flags(all_buf_flags)
            );

endmodule
