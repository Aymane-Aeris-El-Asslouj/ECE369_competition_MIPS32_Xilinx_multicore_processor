`timescale 1ns / 1ps
`default_nettype none

module Alternative_Memory(EX_MEM_Address, EX_MEM_WriteData, Clk, EX_MEM_MemWrite, EX_MEM_MemRead,
                EX_MEM_HalfControl, EX_MEM_ByteControl,

                MEM_ReadData); 

    input [31:0] EX_MEM_Address; 	// Input Address 
    input [31:0] EX_MEM_WriteData; // Data that needs to be written into the address 
    input wire Clk;
    input wire EX_MEM_MemWrite, EX_MEM_MemRead, EX_MEM_HalfControl, EX_MEM_ByteControl; 
    integer i;              //used for indexing while initializing Memory array
    
	reg [31:0] Memory[0:8191];
    
    output reg[31:0] MEM_ReadData; // Contents of memory location at Address
    
    reg [31:0] ReadWord, ReadWord_2;
    
    wire HalfOffset;
    wire ByteOffset;
    reg [15:0] HalfWord;
    reg [7:0] Byte;
    /* Please fill in the implementation here */
    wire [12:0] core_address;
    assign core_address = EX_MEM_Address[14:2];
    
    initial begin

        $readmemh("data_memory.mem", Memory);
            
    end
    
    // Writes are positive triggered 
    always@(posedge Clk) begin
        if(EX_MEM_MemWrite) begin
            if(EX_MEM_HalfControl) begin
                if(HalfOffset)
                    Memory[core_address][31:16] <= EX_MEM_WriteData[15:0];
                else
                    Memory[core_address][15:0] <= EX_MEM_WriteData[15:0];
            end else if(EX_MEM_ByteControl) begin
                if(HalfOffset)
                    if(ByteOffset)
                        Memory[core_address][31:24] <= EX_MEM_WriteData[7:0];
                    else
                        Memory[core_address][23:16] <= EX_MEM_WriteData[7:0];
                else
                    if(ByteOffset)
                        Memory[core_address][15:8] <= EX_MEM_WriteData[7:0];
                    else
                        Memory[core_address][7:0] <= EX_MEM_WriteData[7:0];
            end else begin
                Memory[core_address] <= EX_MEM_WriteData;
            end 
        end
    end 
    
    always@(*) begin
        if(EX_MEM_MemRead) begin
            ReadWord <= Memory[core_address]; 
            ReadWord_2 <= Memory[core_address+1]; 
        end
        else begin
            ReadWord <= 32'bZZZZ; 
            ReadWord_2 <= 32'bZZZZ; 
        end
    end
    
    assign HalfOffset = EX_MEM_Address[1];
    assign ByteOffset = EX_MEM_Address[0];
    
    always @(*) begin
        if(HalfOffset)
            HalfWord <= ReadWord[31:16];
        else
            HalfWord <= ReadWord[15:0];
    end
    
    always @(*) begin
        if(ByteOffset)
            Byte <= HalfWord[15:8];
        else
            Byte <= HalfWord[7:0];
    end
    
    wire [63:0] large_read_word;
    assign large_read_word = {ReadWord, ReadWord_2};
    
    always@(*) begin
    
        if(EX_MEM_HalfControl) begin
            MEM_ReadData <= {{16{HalfWord[15]}}, HalfWord};
        end else if (EX_MEM_ByteControl) begin
            MEM_ReadData <= {{24{Byte[7]}}, Byte};
        end else begin
            if(HalfOffset) begin
                if(ByteOffset) begin
                    MEM_ReadData <= large_read_word[39:8];
                end else begin
                    MEM_ReadData <= large_read_word[47:16];
                end
            end else begin
                if(ByteOffset) begin
                    MEM_ReadData <= large_read_word[55:24];
                end else begin
                    MEM_ReadData <= large_read_word[63:32];
                end
            end
        end
    end
    
    
    
    
    
    
    
    
    
    
    
    
// 7 Series
// Xilinx HDL Libraries Guide, version 2012.2
//////////////////////////////////////////////////////////////////////////
// DATA_WIDTH_A/B | BRAM_SIZE | RAM Depth | ADDRA/B Width | WEA/B Width //
// ===============|===========|===========|===============|=============//
// 19-36 | "36Kb" | 1024 | 10-bit | 4-bit //
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
//////////////////////////////////////////////////////////////////////////
//BRAM_TDP_MACRO #(
//.BRAM_SIZE("36Kb"),
//.DEVICE("7SERIES"),
//.INIT_FILE ("NONE"),
//.READ_WIDTH_A (32),
//.READ_WIDTH_B (32),
//.WRITE_WIDTH_A(32),
//.WRITE_WIDTH_B(32)
//) BRAM_TDP_MACRO_inst (
//.DOA(ReadWordA),
//.DOB(ReadWordB),
//.ADDRA(EX_MEM_Address),
//.ADDRB(EX_MEM_Address+1),
//.CLKA(Clk),
//.CLKB(~Clk),
//.DIA(WriteWordA),
//.DIB(WriteWordB),
//.ENA(EX_MEM_MemRead | EX_MEM_MemWrite),
//.ENB(EX_MEM_MemRead | EX_MEM_MemWrite),
//.REGCEA(1'b0),
//.REGCEB(1'b0),
//.RSTA(1'b0),
//.RSTB(1'b0),
//.WEA(EX_MEM_MemWrite),
//.WEB(EX_MEM_MemWrite)
//);
    
    
    
    
    
    
    
    
    
    

endmodule
