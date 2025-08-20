module MIPS_ALU (
    input [31:0] A, B,           
    input [3:0] ALUControl,      
    output reg [31:0] ALUResult, 
    output reg Zero             
);

    initial begin
        ALUResult = 32'b0;
        Zero = 1'b0;
    end

    always @(*) begin
        case (ALUControl)
            4'b0000: ALUResult = A & B;        
            4'b0001: ALUResult = A | B;        
            4'b0010: ALUResult = A + B;       
            4'b0110: ALUResult = A - B;       
            4'b0111: ALUResult = (A < B) ? 1 : 0;
            default: ALUResult = 32'b0;        
        endcase
        Zero = (ALUResult == 32'b0) ? 1 : 0;
    end

endmodule
