module InstructionMemory_tb;

    reg [31:0] Address;
    wire [31:0] Instruction;

    InstructionMemory uut (
        .Address(Address),
        .Instruction(Instruction)
    );

    initial begin
        $dumpfile("InstructionMemory_tb.vcd");
        $dumpvars(0, InstructionMemory_tb);

        Address = 32'd0; #10;
        $display("Instruction: %h", Instruction);

        Address = 32'd4; #10;
        $display("Instruction: %h", Instruction);

        $finish;
    end

endmodule