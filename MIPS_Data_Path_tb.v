module MIPS_Datapath_tb;
    reg clk, reset;
    reg [31:0] instruction;
    wire [31:0] result;
    
    MIPS_Datapath uut (
        .clk(clk),
        .reset(reset),
        .instruction(instruction),
        .result(result)
    );

    always begin
        #5 clk = ~clk; 
    end

    // Stimulus generation
    initial begin
        // Initialize signals
        clk = 0;
        reset = 1;
        instruction = 32'b0;

        #10 reset = 0;

        instruction = 32'b000000_00001_00010_00011_00000_100000; 
        #10;

        instruction = 32'b000000_00001_00010_00011_00000_100010; 
        #10;

        instruction = 32'b100011_00001_00010_00000_00000_000000; 
        #10;

        instruction = 32'b101011_00001_00010_00000_00000_00000;
        #10;

        instruction = 32'b000100_00001_00010_00000_00000_000000; 
        #10;

        $finish;
    end
endmodule
