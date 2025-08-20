module DataMemory (
    input [31:0] Address,        // 32-bit address to fetch or store data
    input [31:0] WriteData,      // 32-bit data to write to memory
    input MemRead,               // Control signal for read operation
    input MemWrite,              // Control signal for write operation
    output reg [31:0] ReadData   // 32-bit data fetched from memory
);

    reg [7:0] memory [0:511];    // 512 bytes of memory

    initial begin
        for (integer i = 0; i < 512; i = i + 1) begin
            memory[i] = 8'b0;
        end
    end

    always @(*) begin
        if (MemRead) begin
            ReadData = {memory[Address], memory[Address+1], memory[Address+2], memory[Address+3]};
        end else if (MemWrite) begin
            {memory[Address], memory[Address+1], memory[Address+2], memory[Address+3]} = WriteData;
        end
    end

endmodule