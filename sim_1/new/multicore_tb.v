// Aeris El Asslouj 100%
// Group 26


`timescale 1ns / 1ps
`default_nettype none


module multicore_tb();
    reg Clk;
    reg Reset;

    wire [31:0] buf_val_1_60, buf_val_1_59, buf_val_1_58, buf_val_1_57, buf_val_1_56, buf_val_1_55, 
                    buf_val_1_54, buf_val_1_53, buf_val_1_52, buf_val_1_51, buf_val_1_50, buf_val_1_49, buf_val_1_48, buf_val_1_47, 
                    buf_val_1_46, buf_val_1_45, buf_val_1_44, buf_val_1_43, buf_val_1_42, buf_val_1_41, buf_val_1_40, buf_val_1_39, 
                    buf_val_1_38, buf_val_1_37, buf_val_1_36, buf_val_1_35, buf_val_1_34, buf_val_1_33, buf_val_1_32, buf_val_1_31, 
                    buf_val_1_30, buf_val_1_29, buf_val_1_28, buf_val_1_27, buf_val_1_26, buf_val_1_25, buf_val_1_24, buf_val_1_23, 
                    buf_val_1_22, buf_val_1_21, buf_val_1_20, buf_val_1_19, buf_val_1_18, buf_val_1_17, buf_val_1_16, buf_val_1_15, 
                    buf_val_1_14, buf_val_1_13, buf_val_1_12, buf_val_1_11, buf_val_1_10, buf_val_1_9, buf_val_1_8, buf_val_1_7, 
                    buf_val_1_6, buf_val_1_5, buf_val_1_4, buf_val_1_3, buf_val_1_2, buf_val_1_1, buf_val_1_0;
    wire [31:0] buf_val_2_60, buf_val_2_59, buf_val_2_58, buf_val_2_57, buf_val_2_56, buf_val_2_55, buf_val_2_54, buf_val_2_53, 
                    buf_val_2_52, buf_val_2_51, buf_val_2_50, buf_val_2_49, buf_val_2_48, buf_val_2_47, buf_val_2_46, buf_val_2_45, 
                    buf_val_2_44, buf_val_2_43, buf_val_2_42, buf_val_2_41, buf_val_2_40, buf_val_2_39, buf_val_2_38, buf_val_2_37, 
                    buf_val_2_36, buf_val_2_35, buf_val_2_34, buf_val_2_33, buf_val_2_32, buf_val_2_31, buf_val_2_30, buf_val_2_29, 
                    buf_val_2_28, buf_val_2_27, buf_val_2_26, buf_val_2_25, buf_val_2_24, buf_val_2_23, buf_val_2_22, buf_val_2_21, 
                    buf_val_2_20, buf_val_2_19, buf_val_2_18, buf_val_2_17, buf_val_2_16, buf_val_2_15, buf_val_2_14, buf_val_2_13, 
                    buf_val_2_12, buf_val_2_11, buf_val_2_10, buf_val_2_9, buf_val_2_8, buf_val_2_7, buf_val_2_6, buf_val_2_5, 
                    buf_val_2_4, buf_val_2_3, buf_val_2_2, buf_val_2_1, buf_val_2_0;
    wire buf_flag_60, buf_flag_59, buf_flag_58, buf_flag_57, buf_flag_56, buf_flag_55, buf_flag_54, buf_flag_53, 
                    buf_flag_52, buf_flag_51, buf_flag_50, buf_flag_49, buf_flag_48, buf_flag_47, buf_flag_46, buf_flag_45, 
                    buf_flag_44, buf_flag_43, buf_flag_42, buf_flag_41, buf_flag_40, buf_flag_39, buf_flag_38, buf_flag_37, 
                    buf_flag_36, buf_flag_35, buf_flag_34, buf_flag_33, buf_flag_32, buf_flag_31, buf_flag_30, buf_flag_29, 
                    buf_flag_28, buf_flag_27, buf_flag_26, buf_flag_25, buf_flag_24, buf_flag_23, buf_flag_22, buf_flag_21, 
                    buf_flag_20, buf_flag_19, buf_flag_18, buf_flag_17, buf_flag_16, buf_flag_15, buf_flag_14, buf_flag_13, 
                    buf_flag_12, buf_flag_11, buf_flag_10, buf_flag_9, buf_flag_8, buf_flag_7, buf_flag_6, buf_flag_5, 
                    buf_flag_4, buf_flag_3, buf_flag_2, buf_flag_1, buf_flag_0;

    wire [1951:0] buf_val_1_s;
    wire [1951:0] buf_val_2_s;
    wire [60:0] buf_flag_s;
    assign {buf_val_1_60, buf_val_1_59, buf_val_1_58, buf_val_1_57, buf_val_1_56, buf_val_1_55, 
                    buf_val_1_54, buf_val_1_53, buf_val_1_52, buf_val_1_51, buf_val_1_50, buf_val_1_49, buf_val_1_48, buf_val_1_47, 
                    buf_val_1_46, buf_val_1_45, buf_val_1_44, buf_val_1_43, buf_val_1_42, buf_val_1_41, buf_val_1_40, buf_val_1_39, 
                    buf_val_1_38, buf_val_1_37, buf_val_1_36, buf_val_1_35, buf_val_1_34, buf_val_1_33, buf_val_1_32, buf_val_1_31, 
                    buf_val_1_30, buf_val_1_29, buf_val_1_28, buf_val_1_27, buf_val_1_26, buf_val_1_25, buf_val_1_24, buf_val_1_23, 
                    buf_val_1_22, buf_val_1_21, buf_val_1_20, buf_val_1_19, buf_val_1_18, buf_val_1_17, buf_val_1_16, buf_val_1_15, 
                    buf_val_1_14, buf_val_1_13, buf_val_1_12, buf_val_1_11, buf_val_1_10, buf_val_1_9, buf_val_1_8, buf_val_1_7, 
                    buf_val_1_6, buf_val_1_5, buf_val_1_4, buf_val_1_3, buf_val_1_2, buf_val_1_1, buf_val_1_0} = buf_val_1_s;
                    
    
    assign {buf_val_2_60, buf_val_2_59, buf_val_2_58, buf_val_2_57, buf_val_2_56, buf_val_2_55, buf_val_2_54, buf_val_2_53, 
                    buf_val_2_52, buf_val_2_51, buf_val_2_50, buf_val_2_49, buf_val_2_48, buf_val_2_47, buf_val_2_46, buf_val_2_45, 
                    buf_val_2_44, buf_val_2_43, buf_val_2_42, buf_val_2_41, buf_val_2_40, buf_val_2_39, buf_val_2_38, buf_val_2_37, 
                    buf_val_2_36, buf_val_2_35, buf_val_2_34, buf_val_2_33, buf_val_2_32, buf_val_2_31, buf_val_2_30, buf_val_2_29, 
                    buf_val_2_28, buf_val_2_27, buf_val_2_26, buf_val_2_25, buf_val_2_24, buf_val_2_23, buf_val_2_22, buf_val_2_21, 
                    buf_val_2_20, buf_val_2_19, buf_val_2_18, buf_val_2_17, buf_val_2_16, buf_val_2_15, buf_val_2_14, buf_val_2_13, 
                    buf_val_2_12, buf_val_2_11, buf_val_2_10, buf_val_2_9, buf_val_2_8, buf_val_2_7, buf_val_2_6, buf_val_2_5, 
                    buf_val_2_4, buf_val_2_3, buf_val_2_2, buf_val_2_1, buf_val_2_0} = buf_val_2_s;
                    
    assign {buf_flag_60, buf_flag_59, buf_flag_58, buf_flag_57, buf_flag_56, buf_flag_55, buf_flag_54, buf_flag_53, 
                    buf_flag_52, buf_flag_51, buf_flag_50, buf_flag_49, buf_flag_48, buf_flag_47, buf_flag_46, buf_flag_45, 
                    buf_flag_44, buf_flag_43, buf_flag_42, buf_flag_41, buf_flag_40, buf_flag_39, buf_flag_38, buf_flag_37, 
                    buf_flag_36, buf_flag_35, buf_flag_34, buf_flag_33, buf_flag_32, buf_flag_31, buf_flag_30, buf_flag_29, 
                    buf_flag_28, buf_flag_27, buf_flag_26, buf_flag_25, buf_flag_24, buf_flag_23, buf_flag_22, buf_flag_21, 
                    buf_flag_20, buf_flag_19, buf_flag_18, buf_flag_17, buf_flag_16, buf_flag_15, buf_flag_14, buf_flag_13, 
                    buf_flag_12, buf_flag_11, buf_flag_10, buf_flag_9, buf_flag_8, buf_flag_7, buf_flag_6, buf_flag_5, 
                    buf_flag_4, buf_flag_3, buf_flag_2, buf_flag_1, buf_flag_0} = buf_flag_s;
    
    
    MultiCore t1(Clk, Reset, buf_val_1_s, buf_val_2_s, buf_flag_s);

	initial begin
		Clk <= 1'b0;
		forever #10 Clk <= ~Clk;
	end
	
	initial begin
	   Reset <= 1;
	   @(posedge Clk) #1;
	   @(posedge Clk) #1;
	   @(posedge Clk) #1;
	   Reset <= 0;
	    
	   
	end


endmodule
