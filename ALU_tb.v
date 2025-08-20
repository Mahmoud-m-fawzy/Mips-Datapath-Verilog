module MIPS_ALU_tb;

    reg [31:0] A, B;        
    reg [3:0] ALUControl;   
    wire [31:0] ALUResult;  
    wire Zero;              

    MIPS_ALU uut (
        .A(A),
        .B(B),
        .ALUControl(ALUControl),
        .ALUResult(ALUResult),
        .Zero(Zero)
    );

    initial begin

        $dumpfile("ALU_tb.vcd");
        $dumpvars(0, MIPS_ALU_tb);

        // Test AND
        A = 32'hF0F0F0F0; B = 32'h0F0F0F0F; ALUControl = 4'b0000; #1;
        $display("AND: %h & %h = %h , Zero = %b", A, B, ALUResult, Zero);

        // Test OR
        A = 32'hF0F0F0F0; B = 32'h0F0F0F0F; ALUControl = 4'b0001; #1;
        $display("OR: %h | %h = %h, Zero = %b", A, B, ALUResult, Zero);

        // Test ADD
        A = 32'd10; B = 32'd20; ALUControl = 4'b0010; #1;
        $display("ADD: %d + %d = %d, Zero = %b", A, B, ALUResult, Zero);

        // Test SUB
        A = 32'd20; B = 32'd20; ALUControl = 4'b0110; #1;
        $display("SUB: %d - %d = %d, Zero = %b", A, B, ALUResult, Zero);

        // Test SLT
        A = 32'd15; B = 32'd20; ALUControl = 4'b0111; #1;
        $display("SLT: %d < %d = %d, Zero = %b", A, B, ALUResult, Zero);
        $finish;
    end
endmodule
