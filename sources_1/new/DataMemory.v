`timescale 1ns / 1ps
`default_nettype none

module DataMemory(EX_MEM_Address, EX_MEM_WriteData, Clk, EX_MEM_MemWrite, EX_MEM_MemRead,
                EX_MEM_HalfControl, EX_MEM_ByteControl,

                MEM_ReadData); 
    
    parameter memories = "none_2.mem";

    input wire [31:0] EX_MEM_Address; 	// Input Address 
    input wire [31:0] EX_MEM_WriteData; // Data that needs to be written into the address 
    input wire Clk;
    input wire EX_MEM_MemWrite, EX_MEM_MemRead, EX_MEM_HalfControl, EX_MEM_ByteControl; 
    
	//reg [31:0] Memory[0:127];
    
    //output reg[31:0] MEM_ReadData; // Contents of memory location at Address
    output wire [31:0] MEM_ReadData; // Contents of memory location at Address
    
    //reg [31:0] ReadWord; //ReadWord_2;
    
    //wire HalfOffset;
    //wire ByteOffset;
    //reg [15:0] HalfWord;
    //reg [7:0] Byte;
    /* Please fill in the implementation here */
    wire [6:0] core_address;
    assign core_address = EX_MEM_Address[8:2];
    
//    initial begin
//        $readmemh(memories, Memory);
//    end
    
    // BRAM_SINGLE_MACRO: Single Port RAM
// 7 Series
// Xilinx HDL Libraries Guide, version 2012.2
/////////////////////////////////////////////////////////////////////
// READ_WIDTH | BRAM_SIZE | READ Depth | ADDR Width | //
// WRITE_WIDTH | | WRITE Depth | | WE Width //
// ============|===========|=============|============|============//
// 37-72 | "36Kb" | 512 | 9-bit | 8-bit //
// 19-36 | "36Kb" | 1024 | 10-bit | 4-bit //
// 19-36 | "18Kb" | 512 | 9-bit | 4-bit //
// 10-18 | "36Kb" | 2048 | 11-bit | 2-bit //
// 10-18 | "18Kb" | 1024 | 10-bit | 2-bit //
// 5-9 | "36Kb" | 4096 | 12-bit | 1-bit //
// 5-9 | "18Kb" | 2048 | 11-bit | 1-bit //
// 3-4 | "36Kb" | 8192 | 13-bit | 1-bit //
// 3-4 | "18Kb" | 4096 | 12-bit | 1-bit //
// 2 | "36Kb" | 16384 | 14-bit | 1-bit //
// 2 | "18Kb" | 8192 | 13-bit | 1-bit //
// 1 | "36Kb" | 32768 | 15-bit | 1-bit //
// 1 | "18Kb" | 16384 | 14-bit | 1-bit //
/////////////////////////////////////////////////////////////////////
BRAM_SINGLE_MACRO #(
.BRAM_SIZE("36Kb"), // Target BRAM, "18Kb" or "36Kb"
.DEVICE("7SERIES"), // Target Device: "7SERIES"
.DO_REG(0), // Optional output register (0 or 1)
.INIT(36'h000000000), // Initial values on output port
.INIT_FILE (memories),
.WRITE_WIDTH(32), // Valid values are 1-72 (37-72 only valid when BRAM_SIZE="36Kb")
.READ_WIDTH(32), // Valid values are 1-72 (37-72 only valid when BRAM_SIZE="36Kb")
.SRVAL(36'h000000000), // Set/Reset value forr port output
.WRITE_MODE("WRITE_FIRST") // "WRITE_FIRST", "READ_FIRST", or "NO_CHANGE"
) BRAM_SINGLE_MACRO_inst (
.DO(MEM_ReadData), // Output data, width defined by READ_WIDTH parameter
.ADDR(EX_MEM_Address[11:2]), // Input address, width defined by read/write port depth
.CLK(~Clk), // 1-bit input clock
.DI(EX_MEM_WriteData), // Input data port, width defined by WRITE_WIDTH parameter
.EN(1'b1), // 1-bit input RAM enable
.REGCE(1'b0), // 1-bit input output register enable
.RST(1'b0), // 1-bit input reset
.WE({4{EX_MEM_MemWrite}}) // Input write enable, width defined by write port depth
);
// End of BRAM_SINGLE_MACRO_inst instantiation
    
    
    
    // Writes are positive triggered 
//    always@(posedge Clk) begin
//        if(EX_MEM_MemWrite) begin
//            if(EX_MEM_HalfControl) begin
//                if(HalfOffset)
//                    Memory[core_address][31:16] <= EX_MEM_WriteData[15:0];
//                else
//                    Memory[core_address][15:0] <= EX_MEM_WriteData[15:0];
//            end else if(EX_MEM_ByteControl) begin
//                if(HalfOffset)
//                    if(ByteOffset)
//                        Memory[core_address][31:24] <= EX_MEM_WriteData[7:0];
//                    else
//                        Memory[core_address][23:16] <= EX_MEM_WriteData[7:0];
//                else
//                    if(ByteOffset)
//                        Memory[core_address][15:8] <= EX_MEM_WriteData[7:0];
//                    else
//                        Memory[core_address][7:0] <= EX_MEM_WriteData[7:0];
//            end else begin
              //  Memory[core_address] <= EX_MEM_WriteData;
            //end 
//        end
//    end 
    
//    always@(*) begin
//        if(EX_MEM_MemRead) begin
//            ReadWord <= Memory[core_address]; 
//            //ReadWord_2 <= Memory[core_address+1]; 
//        end
//        else begin
//            ReadWord <= 32'bZZZZ; 
//            //ReadWord_2 <= 32'bZZZZ; 
//        end
//    end
    
//    assign HalfOffset = EX_MEM_Address[1];
//    assign ByteOffset = EX_MEM_Address[0];
    
//    always @(*) begin
//        if(HalfOffset)
//            HalfWord <= ReadWord[31:16];
//        else
//            HalfWord <= ReadWord[15:0];
//    end
    
//    always @(*) begin
//        if(ByteOffset)
//            Byte <= HalfWord[15:8];
//        else
//            Byte <= HalfWord[7:0];
//    end
    
    //wire [63:0] large_read_word;
    //assign large_read_word = {ReadWord, ReadWord_2};
    
    //always@(*) begin
    
//        if(EX_MEM_HalfControl) begin
//            MEM_ReadData <= {{16{HalfWord[15]}}, HalfWord};
//        end else if (EX_MEM_ByteControl) begin
//            MEM_ReadData <= {{24{Byte[7]}}, Byte};
//        end else begin
          //  MEM_ReadData <= ReadWord;
//            if(HalfOffset) begin
//                if(ByteOffset) begin
//                    MEM_ReadData <= large_read_word[39:8];
//                end else begin
//                    MEM_ReadData <= large_read_word[47:16];
//                end
//            end else begin
//                if(ByteOffset) begin
//                    MEM_ReadData <= large_read_word[55:24];
//                end else begin
//                    MEM_ReadData <= large_read_word[63:32];
//                end
//            end
        //end
   // end

endmodule
