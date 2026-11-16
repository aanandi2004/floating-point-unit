
module fpu (
    input  logic [31:0] opA,
    input  logic [31:0] opB,
    output logic [31:0] fpu_out
);

    logic [7:0] exp_diff;
    logic [7:0] exp_large;

    logic sel;

    logic [22:0] mux1_res;
    logic [22:0] shift_res;
    logic [22:0] big_res;

    // Select the operand with the larger exponent
    assign sel = (opA[30:23] < opB[30:23]);

    // Select the larger exponent
    assign exp_large = sel ? opB[30:23] : opA[30:23];

    // Calculate exponent difference
    small_alu u1 (
        .opA(opA),
        .opB(opB),
        .exp_diff(exp_diff)
    );

    // Select fraction of larger exponent
    mux1 u2 (
        .opA(opA),
        .opB(opB),
        .sel(sel),
        .mux1_res(mux1_res)
    );

    // Align smaller fraction
    shift u3 (
        .opA(opA),
        .opB(opB),
        .exp_diff(exp_diff),
        .shift_res(shift_res)
    );

    // Add aligned fractions
    big_alu u4 (
        .f1(mux1_res),
        .f2(shift_res),
        .big_res(big_res)
    );

    // Assemble simplified positive-number output
    assign fpu_out = {1'b0, exp_large, big_res};

endmodule
