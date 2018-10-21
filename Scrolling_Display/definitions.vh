`timescale 1ns / 1ps

// Basic definitions
`define CYCLE 10
`define WORD  64
`define INSTR_LEN 32

// Files
`define DMEMFILE  "H:/ELC3338/Team4/ARM-Lab_Fall2018_Team4/testfiles/ramData.data"
`define IMEMFILE  "H:/ELC3338/Team4/ARM-Lab_Fall2018_Team4/testfiles/instrData.data"
`define RMEMFILE  "H:/ELC3338/Team4/ARM-Lab_Fall2018_Team4/testfiles/regData.data"

// Opcodes
`define ADD  11'b10001011000
`define CBZ  11'b10110100xxx
`define ORR  11'b10101010000
`define SUB  11'b11001011000
`define B    11'b000101xxxxx
`define AND  11'b10001010000
`define LDUR 11'b11111000010
`define STUR 11'b11111000000
`define DEFAULT_OP 11'bxxxxxxxxxxx

// ALU op signals
`define ALUOp_RTYPE 2'b10
`define ALUOp_DTYPE 2'b00
`define ALUOp_BRANCH 2'b01

// ALU control signals
`define ALU_ADD 4'b0010
`define ALU_SUB 4'b0110
`define ALU_AND 4'b0000
`define ALU_OR 4'b0001
`define ALU_BRANCH 4'b0111
`define ALU_CONTR_DEFAULT 4'b1111

