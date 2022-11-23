// Aeris El Asslouj 100%
// Group 26


`timescale 1ns / 1ps


module processor_tb();
    reg Clk;
    reg Reset;
    wire [31:0] out_PC, out_v0, out_v1;
    wire signed [31:0] out_write_data;

    integer f,i;
    
    
    Processor t0(
        .Clk(Clk), 
        .Reset(Reset),
        .out_PC(out_PC),
        .out_v0(out_v0),
        .out_v1(out_v1),
        .out_write_data(out_write_data)
    ); 

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
	   
             f = $fopen("output.txt","w");
       
       
           for (i = 0; i<427; i=i+1) begin
                @(posedge Clk) #1;
                if(out_write_data != 32'b0)
                  $fwrite(f,"%d\n", $signed(out_write_data));
       end
               
               
               $fclose(f);  
	   
	end


endmodule
