// Aeris El Asslouj 100%
// Group 26


`timescale 1ns / 1ps
`default_nettype none


module multicore_tb();
    reg Clk;
    reg Reset;
    wire [31:0] out_v0_0, out_v0_1, out_v0_2, out_v0_3, out_v0_4, out_v0_5, out_v0_6, out_v0_7, out_v0_8, 
                out_v0_9, out_v0_10, out_v0_11, out_v0_12, out_v0_13, out_v0_14, out_v0_15, out_v0_16, out_v0_17, out_v0_18, 
                out_v0_19, out_v0_20, out_v0_21, out_v0_22, out_v0_23, out_v0_24, out_v0_25, out_v0_26, out_v0_27, out_v0_28, 
                out_v0_29, out_v0_30, out_v0_31, out_v0_32, out_v0_33, out_v0_34, out_v0_35, out_v0_36, out_v0_37, out_v0_38, 
                out_v0_39, out_v0_40, out_v0_41, out_v0_42, out_v0_43, out_v0_44, out_v0_45, out_v0_46, out_v0_47, out_v0_48, 
                out_v0_49, out_v0_50, out_v0_51, out_v0_52, out_v0_53, out_v0_54, out_v0_55, out_v0_56, out_v0_57, out_v0_58, 
                out_v0_59, out_v0_60;
    
    
    MultiCore t1(Clk, Reset, out_v0_0, out_v0_1, out_v0_2, out_v0_3, out_v0_4, out_v0_5, out_v0_6, out_v0_7, out_v0_8, 
                out_v0_9, out_v0_10, out_v0_11, out_v0_12, out_v0_13, out_v0_14, out_v0_15, out_v0_16, out_v0_17, out_v0_18, 
                out_v0_19, out_v0_20, out_v0_21, out_v0_22, out_v0_23, out_v0_24, out_v0_25, out_v0_26, out_v0_27, out_v0_28, 
                out_v0_29, out_v0_30, out_v0_31, out_v0_32, out_v0_33, out_v0_34, out_v0_35, out_v0_36, out_v0_37, out_v0_38, 
                out_v0_39, out_v0_40, out_v0_41, out_v0_42, out_v0_43, out_v0_44, out_v0_45, out_v0_46, out_v0_47, out_v0_48, 
                out_v0_49, out_v0_50, out_v0_51, out_v0_52, out_v0_53, out_v0_54, out_v0_55, out_v0_56, out_v0_57, out_v0_58, 
                out_v0_59, out_v0_60);

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
