// Aeris El Asslouj 100%
// Group 26
// 5 stage pipeline with branches in ID


`timescale 1ns / 1ps
`default_nettype none


module MultiCore(input wire Clk, Reset,
                output wire [31:0] out_v0,
                output wire [31:0] out_v1);
localparam NUM_CORES = 30;

wire [NUM_CORES-1:0] buf_flag_s;

wire [31:0] buf_val_1_s [NUM_CORES-1:0];
wire [31:0] buf_val_2_s [NUM_CORES-1:0];

// Generate all the cores
Processor #(.memories("data_memory_child_0.mem"), .instructions("instruction_memory_child.mem")) c_0(.Clk(Clk),.Reset(Reset),.out_v0(),.out_v1(),.out_write_data(),.out_PC(),.buf_val_1(buf_val_1_s[0]),.buf_val_2(buf_val_2_s[0]),.buf_flag(buf_flag_s[0]));
Processor #(.memories("data_memory_child_1.mem"), .instructions("instruction_memory_child.mem")) c_1(.Clk(Clk),.Reset(Reset),.out_v0(),.out_v1(),.out_write_data(),.out_PC(),.buf_val_1(buf_val_1_s[1]),.buf_val_2(buf_val_2_s[1]),.buf_flag(buf_flag_s[1]));
Processor #(.memories("data_memory_child_2.mem"), .instructions("instruction_memory_child.mem")) c_2(.Clk(Clk),.Reset(Reset),.out_v0(),.out_v1(),.out_write_data(),.out_PC(),.buf_val_1(buf_val_1_s[2]),.buf_val_2(buf_val_2_s[2]),.buf_flag(buf_flag_s[2]));
Processor #(.memories("data_memory_child_3.mem"), .instructions("instruction_memory_child.mem")) c_3(.Clk(Clk),.Reset(Reset),.out_v0(),.out_v1(),.out_write_data(),.out_PC(),.buf_val_1(buf_val_1_s[3]),.buf_val_2(buf_val_2_s[3]),.buf_flag(buf_flag_s[3]));
Processor #(.memories("data_memory_child_4.mem"), .instructions("instruction_memory_child.mem")) c_4(.Clk(Clk),.Reset(Reset),.out_v0(),.out_v1(),.out_write_data(),.out_PC(),.buf_val_1(buf_val_1_s[4]),.buf_val_2(buf_val_2_s[4]),.buf_flag(buf_flag_s[4]));
Processor #(.memories("data_memory_child_5.mem"), .instructions("instruction_memory_child.mem")) c_5(.Clk(Clk),.Reset(Reset),.out_v0(),.out_v1(),.out_write_data(),.out_PC(),.buf_val_1(buf_val_1_s[5]),.buf_val_2(buf_val_2_s[5]),.buf_flag(buf_flag_s[5]));
Processor #(.memories("data_memory_child_6.mem"), .instructions("instruction_memory_child.mem")) c_6(.Clk(Clk),.Reset(Reset),.out_v0(),.out_v1(),.out_write_data(),.out_PC(),.buf_val_1(buf_val_1_s[6]),.buf_val_2(buf_val_2_s[6]),.buf_flag(buf_flag_s[6]));
Processor #(.memories("data_memory_child_7.mem"), .instructions("instruction_memory_child.mem")) c_7(.Clk(Clk),.Reset(Reset),.out_v0(),.out_v1(),.out_write_data(),.out_PC(),.buf_val_1(buf_val_1_s[7]),.buf_val_2(buf_val_2_s[7]),.buf_flag(buf_flag_s[7]));
Processor #(.memories("data_memory_child_8.mem"), .instructions("instruction_memory_child.mem")) c_8(.Clk(Clk),.Reset(Reset),.out_v0(),.out_v1(),.out_write_data(),.out_PC(),.buf_val_1(buf_val_1_s[8]),.buf_val_2(buf_val_2_s[8]),.buf_flag(buf_flag_s[8]));
Processor #(.memories("data_memory_child_9.mem"), .instructions("instruction_memory_child.mem")) c_9(.Clk(Clk),.Reset(Reset),.out_v0(),.out_v1(),.out_write_data(),.out_PC(),.buf_val_1(buf_val_1_s[9]),.buf_val_2(buf_val_2_s[9]),.buf_flag(buf_flag_s[9]));
Processor #(.memories("data_memory_child_10.mem"), .instructions("instruction_memory_child.mem")) c_10(.Clk(Clk),.Reset(Reset),.out_v0(),.out_v1(),.out_write_data(),.out_PC(),.buf_val_1(buf_val_1_s[10]),.buf_val_2(buf_val_2_s[10]),.buf_flag(buf_flag_s[10]));
Processor #(.memories("data_memory_child_11.mem"), .instructions("instruction_memory_child.mem")) c_11(.Clk(Clk),.Reset(Reset),.out_v0(),.out_v1(),.out_write_data(),.out_PC(),.buf_val_1(buf_val_1_s[11]),.buf_val_2(buf_val_2_s[11]),.buf_flag(buf_flag_s[11]));
Processor #(.memories("data_memory_child_12.mem"), .instructions("instruction_memory_child.mem")) c_12(.Clk(Clk),.Reset(Reset),.out_v0(),.out_v1(),.out_write_data(),.out_PC(),.buf_val_1(buf_val_1_s[12]),.buf_val_2(buf_val_2_s[12]),.buf_flag(buf_flag_s[12]));
Processor #(.memories("data_memory_child_13.mem"), .instructions("instruction_memory_child.mem")) c_13(.Clk(Clk),.Reset(Reset),.out_v0(),.out_v1(),.out_write_data(),.out_PC(),.buf_val_1(buf_val_1_s[13]),.buf_val_2(buf_val_2_s[13]),.buf_flag(buf_flag_s[13]));
Processor #(.memories("data_memory_child_14.mem"), .instructions("instruction_memory_child.mem")) c_14(.Clk(Clk),.Reset(Reset),.out_v0(),.out_v1(),.out_write_data(),.out_PC(),.buf_val_1(buf_val_1_s[14]),.buf_val_2(buf_val_2_s[14]),.buf_flag(buf_flag_s[14]));
Processor #(.memories("data_memory_child_15.mem"), .instructions("instruction_memory_child.mem")) c_15(.Clk(Clk),.Reset(Reset),.out_v0(),.out_v1(),.out_write_data(),.out_PC(),.buf_val_1(buf_val_1_s[15]),.buf_val_2(buf_val_2_s[15]),.buf_flag(buf_flag_s[15]));
Processor #(.memories("data_memory_child_16.mem"), .instructions("instruction_memory_child.mem")) c_16(.Clk(Clk),.Reset(Reset),.out_v0(),.out_v1(),.out_write_data(),.out_PC(),.buf_val_1(buf_val_1_s[16]),.buf_val_2(buf_val_2_s[16]),.buf_flag(buf_flag_s[16]));
Processor #(.memories("data_memory_child_17.mem"), .instructions("instruction_memory_child.mem")) c_17(.Clk(Clk),.Reset(Reset),.out_v0(),.out_v1(),.out_write_data(),.out_PC(),.buf_val_1(buf_val_1_s[17]),.buf_val_2(buf_val_2_s[17]),.buf_flag(buf_flag_s[17]));
Processor #(.memories("data_memory_child_18.mem"), .instructions("instruction_memory_child.mem")) c_18(.Clk(Clk),.Reset(Reset),.out_v0(),.out_v1(),.out_write_data(),.out_PC(),.buf_val_1(buf_val_1_s[18]),.buf_val_2(buf_val_2_s[18]),.buf_flag(buf_flag_s[18]));
Processor #(.memories("data_memory_child_19.mem"), .instructions("instruction_memory_child.mem")) c_19(.Clk(Clk),.Reset(Reset),.out_v0(),.out_v1(),.out_write_data(),.out_PC(),.buf_val_1(buf_val_1_s[19]),.buf_val_2(buf_val_2_s[19]),.buf_flag(buf_flag_s[19]));
Processor #(.memories("data_memory_child_20.mem"), .instructions("instruction_memory_child.mem")) c_20(.Clk(Clk),.Reset(Reset),.out_v0(),.out_v1(),.out_write_data(),.out_PC(),.buf_val_1(buf_val_1_s[20]),.buf_val_2(buf_val_2_s[20]),.buf_flag(buf_flag_s[20]));
Processor #(.memories("data_memory_child_21.mem"), .instructions("instruction_memory_child.mem")) c_21(.Clk(Clk),.Reset(Reset),.out_v0(),.out_v1(),.out_write_data(),.out_PC(),.buf_val_1(buf_val_1_s[21]),.buf_val_2(buf_val_2_s[21]),.buf_flag(buf_flag_s[21]));
Processor #(.memories("data_memory_child_22.mem"), .instructions("instruction_memory_child.mem")) c_22(.Clk(Clk),.Reset(Reset),.out_v0(),.out_v1(),.out_write_data(),.out_PC(),.buf_val_1(buf_val_1_s[22]),.buf_val_2(buf_val_2_s[22]),.buf_flag(buf_flag_s[22]));
Processor #(.memories("data_memory_child_23.mem"), .instructions("instruction_memory_child.mem")) c_23(.Clk(Clk),.Reset(Reset),.out_v0(),.out_v1(),.out_write_data(),.out_PC(),.buf_val_1(buf_val_1_s[23]),.buf_val_2(buf_val_2_s[23]),.buf_flag(buf_flag_s[23]));
Processor #(.memories("data_memory_child_24.mem"), .instructions("instruction_memory_child.mem")) c_24(.Clk(Clk),.Reset(Reset),.out_v0(),.out_v1(),.out_write_data(),.out_PC(),.buf_val_1(buf_val_1_s[24]),.buf_val_2(buf_val_2_s[24]),.buf_flag(buf_flag_s[24]));
Processor #(.memories("data_memory_child_25.mem"), .instructions("instruction_memory_child.mem")) c_25(.Clk(Clk),.Reset(Reset),.out_v0(),.out_v1(),.out_write_data(),.out_PC(),.buf_val_1(buf_val_1_s[25]),.buf_val_2(buf_val_2_s[25]),.buf_flag(buf_flag_s[25]));
Processor #(.memories("data_memory_child_26.mem"), .instructions("instruction_memory_child.mem")) c_26(.Clk(Clk),.Reset(Reset),.out_v0(),.out_v1(),.out_write_data(),.out_PC(),.buf_val_1(buf_val_1_s[26]),.buf_val_2(buf_val_2_s[26]),.buf_flag(buf_flag_s[26]));
Processor #(.memories("data_memory_child_27.mem"), .instructions("instruction_memory_child.mem")) c_27(.Clk(Clk),.Reset(Reset),.out_v0(),.out_v1(),.out_write_data(),.out_PC(),.buf_val_1(buf_val_1_s[27]),.buf_val_2(buf_val_2_s[27]),.buf_flag(buf_flag_s[27]));
Processor #(.memories("data_memory_child_28.mem"), .instructions("instruction_memory_child.mem")) c_28(.Clk(Clk),.Reset(Reset),.out_v0(),.out_v1(),.out_write_data(),.out_PC(),.buf_val_1(buf_val_1_s[28]),.buf_val_2(buf_val_2_s[28]),.buf_flag(buf_flag_s[28]));
Processor #(.memories("data_memory_child_29.mem"), .instructions("instruction_memory_child.mem")) c_29(.Clk(Clk),.Reset(Reset),.out_v0(),.out_v1(),.out_write_data(),.out_PC(),.buf_val_1(buf_val_1_s[29]),.buf_val_2(buf_val_2_s[29]),.buf_flag(buf_flag_s[29]));

wire [4:0] buf_val_1_addr;
wire [31:0] buf_val_1_select;
wire [4:0] buf_val_2_addr;
wire [31:0] buf_val_2_select;
assign buf_val_1_select = buf_val_1_s[buf_val_1_addr];
assign buf_val_2_select = buf_val_2_s[buf_val_2_addr];

wire all_buf_flags;
assign all_buf_flags = ((~buf_flag_s) == {NUM_CORES{1'b0}});

Processor #(.memories("data_memory_parent.mem"), .instructions("instruction_memory_parent.mem")) c_m(.Clk(Clk),.Reset(Reset),
            .out_v0(out_v0),.out_v1(out_v1),.out_write_data(),.out_PC(),
            .buf_val_1_addr(buf_val_1_addr),
            .buf_val_2_addr(buf_val_2_addr),
            .buf_val_1_select(buf_val_1_select),
            .buf_val_2_select(buf_val_2_select),
            .all_buf_flags(all_buf_flags)
            );

endmodule
