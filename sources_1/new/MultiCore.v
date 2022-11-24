// Aeris El Asslouj 100%
// Group 26
// 5 stage pipeline with branches in ID


`timescale 1ns / 1ps
`default_nettype none


module MultiCore(input wire Clk, Reset,
                output wire [31:0] out_v0_0, out_v0_1, out_v0_2, out_v0_3, out_v0_4, out_v0_5, out_v0_6, out_v0_7, out_v0_8, 
                out_v0_9, out_v0_10, out_v0_11, out_v0_12, out_v0_13, out_v0_14, out_v0_15, out_v0_16, out_v0_17, out_v0_18, 
                out_v0_19, out_v0_20, out_v0_21, out_v0_22, out_v0_23, out_v0_24, out_v0_25, out_v0_26, out_v0_27, out_v0_28, 
                out_v0_29, out_v0_30, out_v0_31, out_v0_32, out_v0_33, out_v0_34, out_v0_35, out_v0_36, out_v0_37, out_v0_38, 
                out_v0_39, out_v0_40, out_v0_41, out_v0_42, out_v0_43, out_v0_44, out_v0_45, out_v0_46, out_v0_47, out_v0_48, 
                out_v0_49, out_v0_50, out_v0_51, out_v0_52, out_v0_53, out_v0_54, out_v0_55, out_v0_56, out_v0_57, out_v0_58, 
                out_v0_59, out_v0_60);

Processor #(.memory_file("data_memory_0.mem")) c0(.Clk(Clk),.Reset(Rese),.out_v0(out_v0_0),.out_v1(),.out_write_data(),.out_PC());
Processor #(.memory_file("data_memory_1.mem")) c1(.Clk(Clk),.Reset(Reset),.out_v0(out_v0_1),.out_v1(),.out_write_data(),.out_PC());
Processor #(.memory_file("data_memory_2.mem")) c2(.Clk(Clk),.Reset(Reset),.out_v0(out_v0_2),.out_v1(),.out_write_data(),.out_PC());
Processor #(.memory_file("data_memory_3.mem")) c3(.Clk(Clk),.Reset(Reset),.out_v0(out_v0_3),.out_v1(),.out_write_data(),.out_PC());
Processor #(.memory_file("data_memory_4.mem")) c4(.Clk(Clk),.Reset(Reset),.out_v0(out_v0_4),.out_v1(),.out_write_data(),.out_PC());
Processor #(.memory_file("data_memory_5.mem")) c5(.Clk(Clk),.Reset(Reset),.out_v0(out_v0_5),.out_v1(),.out_write_data(),.out_PC());
Processor #(.memory_file("data_memory_6.mem")) c6(.Clk(Clk),.Reset(Reset),.out_v0(out_v0_6),.out_v1(),.out_write_data(),.out_PC());
Processor #(.memory_file("data_memory_7.mem")) c7(.Clk(Clk),.Reset(Reset),.out_v0(out_v0_7),.out_v1(),.out_write_data(),.out_PC());
Processor #(.memory_file("data_memory_8.mem")) c8(.Clk(Clk),.Reset(Reset),.out_v0(out_v0_8),.out_v1(),.out_write_data(),.out_PC());
Processor #(.memory_file("data_memory_9.mem")) c9(.Clk(Clk),.Reset(Reset),.out_v0(out_v0_9),.out_v1(),.out_write_data(),.out_PC());
Processor #(.memory_file("data_memory_10.mem")) c10(.Clk(Clk),.Reset(Reset),.out_v0(out_v0_10),.out_v1(),.out_write_data(),.out_PC());
Processor #(.memory_file("data_memory_11.mem")) c11(.Clk(Clk),.Reset(Reset),.out_v0(out_v0_11),.out_v1(),.out_write_data(),.out_PC());
Processor #(.memory_file("data_memory_12.mem")) c12(.Clk(Clk),.Reset(Reset),.out_v0(out_v0_12),.out_v1(),.out_write_data(),.out_PC());
Processor #(.memory_file("data_memory_13.mem")) c13(.Clk(Clk),.Reset(Reset),.out_v0(out_v0_13),.out_v1(),.out_write_data(),.out_PC());
Processor #(.memory_file("data_memory_14.mem")) c14(.Clk(Clk),.Reset(Reset),.out_v0(out_v0_14),.out_v1(),.out_write_data(),.out_PC());
Processor #(.memory_file("data_memory_15.mem")) c15(.Clk(Clk),.Reset(Reset),.out_v0(out_v0_15),.out_v1(),.out_write_data(),.out_PC());
Processor #(.memory_file("data_memory_16.mem")) c16(.Clk(Clk),.Reset(Reset),.out_v0(out_v0_16),.out_v1(),.out_write_data(),.out_PC());
Processor #(.memory_file("data_memory_17.mem")) c17(.Clk(Clk),.Reset(Reset),.out_v0(out_v0_17),.out_v1(),.out_write_data(),.out_PC());
Processor #(.memory_file("data_memory_18.mem")) c18(.Clk(Clk),.Reset(Reset),.out_v0(out_v0_18),.out_v1(),.out_write_data(),.out_PC());
Processor #(.memory_file("data_memory_19.mem")) c19(.Clk(Clk),.Reset(Reset),.out_v0(out_v0_19),.out_v1(),.out_write_data(),.out_PC());
Processor #(.memory_file("data_memory_20.mem")) c20(.Clk(Clk),.Reset(Reset),.out_v0(out_v0_20),.out_v1(),.out_write_data(),.out_PC());
Processor #(.memory_file("data_memory_21.mem")) c21(.Clk(Clk),.Reset(Reset),.out_v0(out_v0_21),.out_v1(),.out_write_data(),.out_PC());
Processor #(.memory_file("data_memory_22.mem")) c22(.Clk(Clk),.Reset(Reset),.out_v0(out_v0_22),.out_v1(),.out_write_data(),.out_PC());
Processor #(.memory_file("data_memory_23.mem")) c23(.Clk(Clk),.Reset(Reset),.out_v0(out_v0_23),.out_v1(),.out_write_data(),.out_PC());
Processor #(.memory_file("data_memory_24.mem")) c24(.Clk(Clk),.Reset(Reset),.out_v0(out_v0_24),.out_v1(),.out_write_data(),.out_PC());
Processor #(.memory_file("data_memory_25.mem")) c25(.Clk(Clk),.Reset(Reset),.out_v0(out_v0_25),.out_v1(),.out_write_data(),.out_PC());
Processor #(.memory_file("data_memory_26.mem")) c26(.Clk(Clk),.Reset(Reset),.out_v0(out_v0_26),.out_v1(),.out_write_data(),.out_PC());
Processor #(.memory_file("data_memory_27.mem")) c27(.Clk(Clk),.Reset(Reset),.out_v0(out_v0_27),.out_v1(),.out_write_data(),.out_PC());
Processor #(.memory_file("data_memory_28.mem")) c28(.Clk(Clk),.Reset(Reset),.out_v0(out_v0_28),.out_v1(),.out_write_data(),.out_PC());
Processor #(.memory_file("data_memory_29.mem")) c29(.Clk(Clk),.Reset(Reset),.out_v0(out_v0_29),.out_v1(),.out_write_data(),.out_PC());
Processor #(.memory_file("data_memory_30.mem")) c30(.Clk(Clk),.Reset(Reset),.out_v0(out_v0_30),.out_v1(),.out_write_data(),.out_PC());
Processor #(.memory_file("data_memory_31.mem")) c31(.Clk(Clk),.Reset(Reset),.out_v0(out_v0_31),.out_v1(),.out_write_data(),.out_PC());
Processor #(.memory_file("data_memory_32.mem")) c32(.Clk(Clk),.Reset(Reset),.out_v0(out_v0_32),.out_v1(),.out_write_data(),.out_PC());
Processor #(.memory_file("data_memory_33.mem")) c33(.Clk(Clk),.Reset(Reset),.out_v0(out_v0_33),.out_v1(),.out_write_data(),.out_PC());
Processor #(.memory_file("data_memory_34.mem")) c34(.Clk(Clk),.Reset(Reset),.out_v0(out_v0_34),.out_v1(),.out_write_data(),.out_PC());
Processor #(.memory_file("data_memory_35.mem")) c35(.Clk(Clk),.Reset(Reset),.out_v0(out_v0_35),.out_v1(),.out_write_data(),.out_PC());
Processor #(.memory_file("data_memory_36.mem")) c36(.Clk(Clk),.Reset(Reset),.out_v0(out_v0_36),.out_v1(),.out_write_data(),.out_PC());
Processor #(.memory_file("data_memory_37.mem")) c37(.Clk(Clk),.Reset(Reset),.out_v0(out_v0_37),.out_v1(),.out_write_data(),.out_PC());
Processor #(.memory_file("data_memory_38.mem")) c38(.Clk(Clk),.Reset(Reset),.out_v0(out_v0_38),.out_v1(),.out_write_data(),.out_PC());
Processor #(.memory_file("data_memory_39.mem")) c39(.Clk(Clk),.Reset(Reset),.out_v0(out_v0_39),.out_v1(),.out_write_data(),.out_PC());
Processor #(.memory_file("data_memory_40.mem")) c40(.Clk(Clk),.Reset(Reset),.out_v0(out_v0_40),.out_v1(),.out_write_data(),.out_PC());
Processor #(.memory_file("data_memory_41.mem")) c41(.Clk(Clk),.Reset(Reset),.out_v0(out_v0_41),.out_v1(),.out_write_data(),.out_PC());
Processor #(.memory_file("data_memory_42.mem")) c42(.Clk(Clk),.Reset(Reset),.out_v0(out_v0_42),.out_v1(),.out_write_data(),.out_PC());
Processor #(.memory_file("data_memory_43.mem")) c43(.Clk(Clk),.Reset(Reset),.out_v0(out_v0_43),.out_v1(),.out_write_data(),.out_PC());
Processor #(.memory_file("data_memory_44.mem")) c44(.Clk(Clk),.Reset(Reset),.out_v0(out_v0_44),.out_v1(),.out_write_data(),.out_PC());
Processor #(.memory_file("data_memory_45.mem")) c45(.Clk(Clk),.Reset(Reset),.out_v0(out_v0_45),.out_v1(),.out_write_data(),.out_PC());
Processor #(.memory_file("data_memory_46.mem")) c46(.Clk(Clk),.Reset(Reset),.out_v0(out_v0_46),.out_v1(),.out_write_data(),.out_PC());
Processor #(.memory_file("data_memory_47.mem")) c47(.Clk(Clk),.Reset(Reset),.out_v0(out_v0_47),.out_v1(),.out_write_data(),.out_PC());
Processor #(.memory_file("data_memory_48.mem")) c48(.Clk(Clk),.Reset(Reset),.out_v0(out_v0_48),.out_v1(),.out_write_data(),.out_PC());
Processor #(.memory_file("data_memory_49.mem")) c49(.Clk(Clk),.Reset(Reset),.out_v0(out_v0_49),.out_v1(),.out_write_data(),.out_PC());
Processor #(.memory_file("data_memory_50.mem")) c50(.Clk(Clk),.Reset(Reset),.out_v0(out_v0_50),.out_v1(),.out_write_data(),.out_PC());
Processor #(.memory_file("data_memory_51.mem")) c51(.Clk(Clk),.Reset(Reset),.out_v0(out_v0_51),.out_v1(),.out_write_data(),.out_PC());
Processor #(.memory_file("data_memory_52.mem")) c52(.Clk(Clk),.Reset(Reset),.out_v0(out_v0_52),.out_v1(),.out_write_data(),.out_PC());
Processor #(.memory_file("data_memory_53.mem")) c53(.Clk(Clk),.Reset(Reset),.out_v0(out_v0_53),.out_v1(),.out_write_data(),.out_PC());
Processor #(.memory_file("data_memory_54.mem")) c54(.Clk(Clk),.Reset(Reset),.out_v0(out_v0_54),.out_v1(),.out_write_data(),.out_PC());
Processor #(.memory_file("data_memory_55.mem")) c55(.Clk(Clk),.Reset(Reset),.out_v0(out_v0_55),.out_v1(),.out_write_data(),.out_PC());
Processor #(.memory_file("data_memory_56.mem")) c56(.Clk(Clk),.Reset(Reset),.out_v0(out_v0_56),.out_v1(),.out_write_data(),.out_PC());
Processor #(.memory_file("data_memory_57.mem")) c57(.Clk(Clk),.Reset(Reset),.out_v0(out_v0_57),.out_v1(),.out_write_data(),.out_PC());
Processor #(.memory_file("data_memory_58.mem")) c58(.Clk(Clk),.Reset(Reset),.out_v0(out_v0_58),.out_v1(),.out_write_data(),.out_PC());
Processor #(.memory_file("data_memory_59.mem")) c59(.Clk(Clk),.Reset(Reset),.out_v0(out_v0_59),.out_v1(),.out_write_data(),.out_PC());
Processor #(.memory_file("data_memory_60.mem")) c60(.Clk(Clk),.Reset(Reset),.out_v0(out_v0_60),.out_v1(),.out_write_data(),.out_PC());

endmodule
