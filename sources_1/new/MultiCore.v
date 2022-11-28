// Aeris El Asslouj 100%
// Group 26
// 5 stage pipeline with branches in ID


`timescale 1ns / 1ps
`default_nettype none


module MultiCore(input wire Clk, Reset,
                output wire [31:0] out_v0,
                output wire [31:0] out_v1);
localparam NUM_CHILDREN = 6;
localparam NUM_PARENTS = 5;

wire [NUM_CHILDREN-1:0] buf_flag_a, buf_flag_b, buf_flag_c, buf_flag_d, buf_flag_e;
wire [NUM_PARENTS-1:0] buf_flag_f;

wire [31:0] buf_val_1_a [NUM_CHILDREN-1:0];
wire [31:0] buf_val_1_b [NUM_CHILDREN-1:0];
wire [31:0] buf_val_1_c [NUM_CHILDREN-1:0];
wire [31:0] buf_val_1_d [NUM_CHILDREN-1:0];
wire [31:0] buf_val_1_e [NUM_CHILDREN-1:0];
wire [31:0] buf_val_1_f [NUM_PARENTS-1:0];
wire [31:0] buf_val_2_a [NUM_CHILDREN-1:0];
wire [31:0] buf_val_2_b [NUM_CHILDREN-1:0];
wire [31:0] buf_val_2_c [NUM_CHILDREN-1:0];
wire [31:0] buf_val_2_d [NUM_CHILDREN-1:0];
wire [31:0] buf_val_2_e [NUM_CHILDREN-1:0];
wire [31:0] buf_val_2_f [NUM_PARENTS-1:0];

// Generate all the cores
Processor #(.memories("data_memory_child_0.mem"), .instructions("instruction_memory_child.mem")) c_0(.Clk(Clk),.Reset(Reset),.out_v0(),.out_v1(),.out_write_data(),.out_PC(),.buf_val_1(buf_val_1_a[0]),.buf_val_2(buf_val_2_a[0]),.buf_flag(buf_flag_a[0]));
Processor #(.memories("data_memory_child_1.mem"), .instructions("instruction_memory_child.mem")) c_1(.Clk(Clk),.Reset(Reset),.out_v0(),.out_v1(),.out_write_data(),.out_PC(),.buf_val_1(buf_val_1_a[1]),.buf_val_2(buf_val_2_a[1]),.buf_flag(buf_flag_a[1]));
Processor #(.memories("data_memory_child_2.mem"), .instructions("instruction_memory_child.mem")) c_2(.Clk(Clk),.Reset(Reset),.out_v0(),.out_v1(),.out_write_data(),.out_PC(),.buf_val_1(buf_val_1_a[2]),.buf_val_2(buf_val_2_a[2]),.buf_flag(buf_flag_a[2]));
Processor #(.memories("data_memory_child_3.mem"), .instructions("instruction_memory_child.mem")) c_3(.Clk(Clk),.Reset(Reset),.out_v0(),.out_v1(),.out_write_data(),.out_PC(),.buf_val_1(buf_val_1_a[3]),.buf_val_2(buf_val_2_a[3]),.buf_flag(buf_flag_a[3]));
Processor #(.memories("data_memory_child_4.mem"), .instructions("instruction_memory_child.mem")) c_4(.Clk(Clk),.Reset(Reset),.out_v0(),.out_v1(),.out_write_data(),.out_PC(),.buf_val_1(buf_val_1_a[4]),.buf_val_2(buf_val_2_a[4]),.buf_flag(buf_flag_a[4]));
Processor #(.memories("data_memory_child_5.mem"), .instructions("instruction_memory_child.mem")) c_5(.Clk(Clk),.Reset(Reset),.out_v0(),.out_v1(),.out_write_data(),.out_PC(),.buf_val_1(buf_val_1_a[5]),.buf_val_2(buf_val_2_a[5]),.buf_flag(buf_flag_a[5]));
Processor #(.memories("data_memory_child_6.mem"), .instructions("instruction_memory_child.mem")) c_6(.Clk(Clk),.Reset(Reset),.out_v0(),.out_v1(),.out_write_data(),.out_PC(),.buf_val_1(buf_val_1_b[0]),.buf_val_2(buf_val_2_b[0]),.buf_flag(buf_flag_b[0]));
Processor #(.memories("data_memory_child_7.mem"), .instructions("instruction_memory_child.mem")) c_7(.Clk(Clk),.Reset(Reset),.out_v0(),.out_v1(),.out_write_data(),.out_PC(),.buf_val_1(buf_val_1_b[1]),.buf_val_2(buf_val_2_b[1]),.buf_flag(buf_flag_b[1]));
Processor #(.memories("data_memory_child_8.mem"), .instructions("instruction_memory_child.mem")) c_8(.Clk(Clk),.Reset(Reset),.out_v0(),.out_v1(),.out_write_data(),.out_PC(),.buf_val_1(buf_val_1_b[2]),.buf_val_2(buf_val_2_b[2]),.buf_flag(buf_flag_b[2]));
Processor #(.memories("data_memory_child_9.mem"), .instructions("instruction_memory_child.mem")) c_9(.Clk(Clk),.Reset(Reset),.out_v0(),.out_v1(),.out_write_data(),.out_PC(),.buf_val_1(buf_val_1_b[3]),.buf_val_2(buf_val_2_b[3]),.buf_flag(buf_flag_b[3]));
Processor #(.memories("data_memory_child_10.mem"), .instructions("instruction_memory_child.mem")) c_10(.Clk(Clk),.Reset(Reset),.out_v0(),.out_v1(),.out_write_data(),.out_PC(),.buf_val_1(buf_val_1_b[4]),.buf_val_2(buf_val_2_b[4]),.buf_flag(buf_flag_b[4]));
Processor #(.memories("data_memory_child_11.mem"), .instructions("instruction_memory_child.mem")) c_11(.Clk(Clk),.Reset(Reset),.out_v0(),.out_v1(),.out_write_data(),.out_PC(),.buf_val_1(buf_val_1_b[5]),.buf_val_2(buf_val_2_b[5]),.buf_flag(buf_flag_b[5]));
Processor #(.memories("data_memory_child_12.mem"), .instructions("instruction_memory_child.mem")) c_12(.Clk(Clk),.Reset(Reset),.out_v0(),.out_v1(),.out_write_data(),.out_PC(),.buf_val_1(buf_val_1_c[0]),.buf_val_2(buf_val_2_c[0]),.buf_flag(buf_flag_c[0]));
Processor #(.memories("data_memory_child_13.mem"), .instructions("instruction_memory_child.mem")) c_13(.Clk(Clk),.Reset(Reset),.out_v0(),.out_v1(),.out_write_data(),.out_PC(),.buf_val_1(buf_val_1_c[1]),.buf_val_2(buf_val_2_c[1]),.buf_flag(buf_flag_c[1]));
Processor #(.memories("data_memory_child_14.mem"), .instructions("instruction_memory_child.mem")) c_14(.Clk(Clk),.Reset(Reset),.out_v0(),.out_v1(),.out_write_data(),.out_PC(),.buf_val_1(buf_val_1_c[2]),.buf_val_2(buf_val_2_c[2]),.buf_flag(buf_flag_c[2]));
Processor #(.memories("data_memory_child_15.mem"), .instructions("instruction_memory_child.mem")) c_15(.Clk(Clk),.Reset(Reset),.out_v0(),.out_v1(),.out_write_data(),.out_PC(),.buf_val_1(buf_val_1_c[3]),.buf_val_2(buf_val_2_c[3]),.buf_flag(buf_flag_c[3]));
Processor #(.memories("data_memory_child_16.mem"), .instructions("instruction_memory_child.mem")) c_16(.Clk(Clk),.Reset(Reset),.out_v0(),.out_v1(),.out_write_data(),.out_PC(),.buf_val_1(buf_val_1_c[4]),.buf_val_2(buf_val_2_c[4]),.buf_flag(buf_flag_c[4]));
Processor #(.memories("data_memory_child_17.mem"), .instructions("instruction_memory_child.mem")) c_17(.Clk(Clk),.Reset(Reset),.out_v0(),.out_v1(),.out_write_data(),.out_PC(),.buf_val_1(buf_val_1_c[5]),.buf_val_2(buf_val_2_c[5]),.buf_flag(buf_flag_c[5]));
Processor #(.memories("data_memory_child_18.mem"), .instructions("instruction_memory_child.mem")) c_18(.Clk(Clk),.Reset(Reset),.out_v0(),.out_v1(),.out_write_data(),.out_PC(),.buf_val_1(buf_val_1_d[0]),.buf_val_2(buf_val_2_d[0]),.buf_flag(buf_flag_d[0]));
Processor #(.memories("data_memory_child_19.mem"), .instructions("instruction_memory_child.mem")) c_19(.Clk(Clk),.Reset(Reset),.out_v0(),.out_v1(),.out_write_data(),.out_PC(),.buf_val_1(buf_val_1_d[1]),.buf_val_2(buf_val_2_d[1]),.buf_flag(buf_flag_d[1]));
Processor #(.memories("data_memory_child_20.mem"), .instructions("instruction_memory_child.mem")) c_20(.Clk(Clk),.Reset(Reset),.out_v0(),.out_v1(),.out_write_data(),.out_PC(),.buf_val_1(buf_val_1_d[2]),.buf_val_2(buf_val_2_d[2]),.buf_flag(buf_flag_d[2]));
Processor #(.memories("data_memory_child_21.mem"), .instructions("instruction_memory_child.mem")) c_21(.Clk(Clk),.Reset(Reset),.out_v0(),.out_v1(),.out_write_data(),.out_PC(),.buf_val_1(buf_val_1_d[3]),.buf_val_2(buf_val_2_d[3]),.buf_flag(buf_flag_d[3]));
Processor #(.memories("data_memory_child_22.mem"), .instructions("instruction_memory_child.mem")) c_22(.Clk(Clk),.Reset(Reset),.out_v0(),.out_v1(),.out_write_data(),.out_PC(),.buf_val_1(buf_val_1_d[4]),.buf_val_2(buf_val_2_d[4]),.buf_flag(buf_flag_d[4]));
Processor #(.memories("data_memory_child_23.mem"), .instructions("instruction_memory_child.mem")) c_23(.Clk(Clk),.Reset(Reset),.out_v0(),.out_v1(),.out_write_data(),.out_PC(),.buf_val_1(buf_val_1_d[5]),.buf_val_2(buf_val_2_d[5]),.buf_flag(buf_flag_d[5]));
Processor #(.memories("data_memory_child_24.mem"), .instructions("instruction_memory_child.mem")) c_24(.Clk(Clk),.Reset(Reset),.out_v0(),.out_v1(),.out_write_data(),.out_PC(),.buf_val_1(buf_val_1_e[0]),.buf_val_2(buf_val_2_e[0]),.buf_flag(buf_flag_e[0]));
Processor #(.memories("data_memory_child_25.mem"), .instructions("instruction_memory_child.mem")) c_25(.Clk(Clk),.Reset(Reset),.out_v0(),.out_v1(),.out_write_data(),.out_PC(),.buf_val_1(buf_val_1_e[1]),.buf_val_2(buf_val_2_e[1]),.buf_flag(buf_flag_e[1]));
Processor #(.memories("data_memory_child_26.mem"), .instructions("instruction_memory_child.mem")) c_26(.Clk(Clk),.Reset(Reset),.out_v0(),.out_v1(),.out_write_data(),.out_PC(),.buf_val_1(buf_val_1_e[2]),.buf_val_2(buf_val_2_e[2]),.buf_flag(buf_flag_e[2]));
Processor #(.memories("data_memory_child_27.mem"), .instructions("instruction_memory_child.mem")) c_27(.Clk(Clk),.Reset(Reset),.out_v0(),.out_v1(),.out_write_data(),.out_PC(),.buf_val_1(buf_val_1_e[3]),.buf_val_2(buf_val_2_e[3]),.buf_flag(buf_flag_e[3]));
Processor #(.memories("data_memory_child_28.mem"), .instructions("instruction_memory_child.mem")) c_28(.Clk(Clk),.Reset(Reset),.out_v0(),.out_v1(),.out_write_data(),.out_PC(),.buf_val_1(buf_val_1_e[4]),.buf_val_2(buf_val_2_e[4]),.buf_flag(buf_flag_e[4]));
Processor #(.memories("data_memory_child_29.mem"), .instructions("instruction_memory_child.mem")) c_29(.Clk(Clk),.Reset(Reset),.out_v0(),.out_v1(),.out_write_data(),.out_PC(),.buf_val_1(buf_val_1_e[5]),.buf_val_2(buf_val_2_e[5]),.buf_flag(buf_flag_e[5]));


wire [2:0] buf_val_1_a_addr, buf_val_1_b_addr, buf_val_1_c_addr, buf_val_1_d_addr, buf_val_1_e_addr, buf_val_1_f_addr;
wire [31:0] buf_val_1_a_slc, buf_val_1_b_slc, buf_val_1_c_slc, buf_val_1_d_slc, buf_val_1_e_slc, buf_val_1_f_slc;
wire [2:0] buf_val_2_a_addr, buf_val_2_b_addr, buf_val_2_c_addr, buf_val_2_d_addr, buf_val_2_e_addr, buf_val_2_f_addr;
wire [31:0] buf_val_2_a_slc, buf_val_2_b_slc, buf_val_2_c_slc, buf_val_2_d_slc, buf_val_2_e_slc, buf_val_2_f_slc;
assign buf_val_1_a_slc = buf_val_1_a[buf_val_1_a_addr];
assign buf_val_1_b_slc = buf_val_1_b[buf_val_1_b_addr];
assign buf_val_1_c_slc = buf_val_1_c[buf_val_1_c_addr];
assign buf_val_1_d_slc = buf_val_1_d[buf_val_1_d_addr];
assign buf_val_1_e_slc = buf_val_1_e[buf_val_1_e_addr];
assign buf_val_1_f_slc = buf_val_1_f[buf_val_1_f_addr];
assign buf_val_2_a_slc = buf_val_2_a[buf_val_2_a_addr];
assign buf_val_2_b_slc = buf_val_2_b[buf_val_2_b_addr];
assign buf_val_2_c_slc = buf_val_2_c[buf_val_2_c_addr];
assign buf_val_2_d_slc = buf_val_2_d[buf_val_2_d_addr];
assign buf_val_2_e_slc = buf_val_2_e[buf_val_2_e_addr];
assign buf_val_2_f_slc = buf_val_2_f[buf_val_2_f_addr];

wire all_buf_flags_a, all_buf_flags_b, all_buf_flags_c, all_buf_flags_d, all_buf_flags_e, all_buf_flags_f;
assign all_buf_flags_a = ((~buf_flag_a) == {NUM_CHILDREN{1'b0}});
assign all_buf_flags_b = ((~buf_flag_b) == {NUM_CHILDREN{1'b0}});
assign all_buf_flags_c = ((~buf_flag_c) == {NUM_CHILDREN{1'b0}});
assign all_buf_flags_d = ((~buf_flag_d) == {NUM_CHILDREN{1'b0}});
assign all_buf_flags_e = ((~buf_flag_e) == {NUM_CHILDREN{1'b0}});
assign all_buf_flags_f = ((~buf_flag_f) == {NUM_PARENTS{1'b0}});

Processor #(.memories("data_memory_parent.mem"), .instructions("instruction_memory_parent.mem")) p_0(
            .Clk(Clk),.Reset(Reset),.out_v0(),.out_v1(),.out_write_data(),.out_PC(),.buf_val_1(buf_val_1_f[0]),
            .buf_val_2(buf_val_2_f[0]),.buf_flag(buf_flag_f[0]), .buf_val_1_addr(buf_val_1_a_addr),
            .buf_val_2_addr(buf_val_2_a_addr), .buf_val_1_select(buf_val_1_a_slc),
            .buf_val_2_select(buf_val_2_a_slc), .all_buf_flags(all_buf_flags_a) );
Processor #(.memories("data_memory_parent.mem"), .instructions("instruction_memory_parent.mem")) p_1(
            .Clk(Clk),.Reset(Reset),.out_v0(),.out_v1(),.out_write_data(),.out_PC(),.buf_val_1(buf_val_1_f[1]),
            .buf_val_2(buf_val_2_f[1]),.buf_flag(buf_flag_f[1]), .buf_val_1_addr(buf_val_1_b_addr),
            .buf_val_2_addr(buf_val_2_b_addr), .buf_val_1_select(buf_val_1_b_slc),
            .buf_val_2_select(buf_val_2_b_slc), .all_buf_flags(all_buf_flags_b) );
Processor #(.memories("data_memory_parent.mem"), .instructions("instruction_memory_parent.mem")) p_2(
            .Clk(Clk),.Reset(Reset),.out_v0(),.out_v1(),.out_write_data(),.out_PC(),.buf_val_1(buf_val_1_f[2]),
            .buf_val_2(buf_val_2_f[2]),.buf_flag(buf_flag_f[2]), .buf_val_1_addr(buf_val_1_c_addr),
            .buf_val_2_addr(buf_val_2_c_addr), .buf_val_1_select(buf_val_1_c_slc),
            .buf_val_2_select(buf_val_2_c_slc), .all_buf_flags(all_buf_flags_c) );
Processor #(.memories("data_memory_parent.mem"), .instructions("instruction_memory_parent.mem")) p_3(
            .Clk(Clk),.Reset(Reset),.out_v0(),.out_v1(),.out_write_data(),.out_PC(),.buf_val_1(buf_val_1_f[3]),
            .buf_val_2(buf_val_2_f[3]),.buf_flag(buf_flag_f[3]), .buf_val_1_addr(buf_val_1_d_addr),
            .buf_val_2_addr(buf_val_2_d_addr), .buf_val_1_select(buf_val_1_d_slc),
            .buf_val_2_select(buf_val_2_d_slc), .all_buf_flags(all_buf_flags_d) );
Processor #(.memories("data_memory_parent.mem"), .instructions("instruction_memory_parent.mem")) p_4(
            .Clk(Clk),.Reset(Reset),.out_v0(),.out_v1(),.out_write_data(),.out_PC(),.buf_val_1(buf_val_1_f[4]),
            .buf_val_2(buf_val_2_f[4]),.buf_flag(buf_flag_f[4]), .buf_val_1_addr(buf_val_1_e_addr),
            .buf_val_2_addr(buf_val_2_e_addr), .buf_val_1_select(buf_val_1_e_slc),
            .buf_val_2_select(buf_val_2_e_slc), .all_buf_flags(all_buf_flags_e) );

Processor #(.memories("data_memory_grand_parent.mem"), .instructions("instruction_memory_grand_parent.mem")) g_p(.Clk(Clk),.Reset(Reset),
            .out_v0(out_v0),.out_v1(out_v1),.out_write_data(),.out_PC(),
            .buf_val_1_addr(buf_val_1_f_addr),
            .buf_val_2_addr(buf_val_2_f_addr),
            .buf_val_1_select(buf_val_1_f_slc),
            .buf_val_2_select(buf_val_2_f_slc),
            .all_buf_flags(all_buf_flags_f)
            );

endmodule
