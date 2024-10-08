`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.10.2024 01:12:33
// Design Name: 
// Module Name: alu_tb1
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module alu_tb1;

  // Inputs
  reg [31:0] A;
  reg [31:0] B;
  reg [2:0] ALUControl;

  // Outputs
  wire [31:0] Result;

  // Instantiate the ALU
  alu uut (
    .A(A), 
    .B(B), 
    .ALUControl(ALUControl), 
    .Result(Result)
  );

  initial begin
    // Test vector 1
    A = 32'h00000003; B = 32'h00000001; ALUControl = 3'b000; // ADD operation
    #10;
    
    // Test vector 2
    A = 32'h000000f8; B = 32'h000000a3; ALUControl = 3'b000; // ADD operation
    #10;
    
    // Test vector 3
    A = 32'h00000005; B = 32'h00000003; ALUControl = 3'b001; // SUB operation
    #10
    
    // Test vector 4
    A = 32'hf00000ff; B = 32'hf00000ff; ALUControl = 3'b001; // SUB operation
    #10;
    
    // Test vector 5
    A = 32'h0000000F; B = 32'h00000008; ALUControl = 3'b010; // AND operation
    #10
    
    // Test vector 6
    A = 32'h6A4563E8; B = 32'h000006BE; ALUControl = 3'b010; // AND operation
    #10;

    // Test vector 7
    A = 32'h0000000F; B = 32'h00000008; ALUControl = 3'b011; // OR operation
    #10
    
    // Test vector 8
    A = 32'h01111111; B = 32'h00000008; ALUControl = 3'b011; // OR operation
    #10;
    
    // Test vector 9
    A = 32'hFFFFFFFF; B = 32'h00000001; ALUControl = 3'b100; // testing false condition
    #10;
    
    // Test vector 10
    A = 32'h00000001; B = 32'hFFFFFFFF; ALUControl = 3'b101; // testing false condition
    #10;

    // Finish simulation
    $stop;
  end

  initial begin
    $monitor("Time = %0t, A = %h, B = %h, ALUControl = %b, Result = %h", 
             $time, A, B, ALUControl, Result);
  end

endmodule

