module alu (
    A,B,ALUControl,Result
);

    //declaring inputs
    input [31:0] A,B;
    input [2:0] ALUControl;

    //declaring output
    output [31:0] Result;

    //interim wire declarations
    wire [31:0] a_and_b;
    wire [31:0] a_or_b;
    wire [31:0] not_b;
    wire [31:0] mux_1;
    wire [31:0] sum1;
    wire [31:0] mux_2;

//-----------------logic design------------------------

    //-->AND Operation
    assign a_and_b = A & B;

    //--> OR Operation
    assign a_or_b =A | B;

    //--> NOT Operation
    assign not_b = ~B;

    //-->Ternary Operator
    assign mux_1 = (ALUControl[0]== 1'b0) ? B:not_b;

    //-->sum operator
    assign sum1 = mux_1 + A + ALUControl[0];

    //-->4:1 mux
    assign mux_2 = (ALUControl[1] == 1'b0) ? sum :(ALUControl[0] == 1'b0) ? a_and_b : a_or_b;
    
    //final result
    assign Result =mux_2;

endmodule
