module MIPS_Datapath(
    input clk,                 
    input reset,             
    input [31:0] instruction,   
    output [31:0] result        
);
    wire [31:0] PC, instruction_reg, ALU_result, data_out;
    wire [31:0] reg_data1, reg_data2, ALU_operand2;
    wire [4:0] reg_dest;
    wire [31:0] reg_write_data;
    wire ALU_zero, ALU_overflow;
    wire MemRead, MemWrite, RegWrite, ALUSrc, MemToReg, Branch;

    InstructionMemory instruction_memory (
        .address(PC), 
        .instruction(instruction_reg)
    );

    RegisterFile register_file (
        .clk(clk),
        .reset(reset),
        .read_reg1(instruction_reg[25:21]),  
        .read_reg2(instruction_reg[20:16]), 
        .write_reg(reg_dest),                
        .write_data(reg_write_data),         
      .reg_write(RegWrite),
        .read_data1(reg_data1), 
        .read_data2(reg_data2)
    );

    ALU alu (
        .A(reg_data1),
        .B(ALU_operand2),
        .ALU_control(instruction_reg[5:0]),  
        .result(ALU_result),
        .zero(ALU_zero),
        .overflow(ALU_overflow)
    );

    DataMemory data_memory (
        .clk(clk),
        .address(ALU_result),
        .write_data(reg_data2),
        .MemRead(MemRead),
        .MemWrite(MemWrite),
        .read_data(data_out)
    );

    Multiplexer_2to1 ALU_operand_mux (
        .A(reg_data2), 
        .B(instruction_reg[15:0]), 
        .select(ALUSrc),             
        .out(ALU_operand2)
    );
    
    assign result = (MemToReg) ? data_out : ALU_result; 
    assign reg_write_data = (MemToReg) ? data_out : ALU_result; 
    assign reg_dest = instruction_reg[15:11];

    assign PC = (reset) ? 0 : PC + 4;  
endmodule
