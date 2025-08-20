module DataMemory_tb;

    reg [31:0] Address;
    reg [31:0] WriteData;
    reg MemRead;
    reg MemWrite;
    wire [31:0] ReadData;

    DataMemory uut (
        .Address(Address),
        .WriteData(WriteData),
        .MemRead(MemRead),
        .MemWrite(MemWrite),
        .ReadData(ReadData)
    );

    initial begin
        $dumpfile("DataMemory_tb.vcd");
        $dumpvars(0, DataMemory_tb);

        MemRead = 0; MemWrite = 1; Address = 32'd0; WriteData = 32'hDEADBEEF; #10;
        MemWrite = 0; MemRead = 1; #10;

        $display("ReadData: %h", ReadData);
        $finish;
    end

endmodule