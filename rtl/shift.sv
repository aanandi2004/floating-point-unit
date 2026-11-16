
module shift(
    input logic [31:0] opA,
    input logic [31:0] opB,
    input logic [7:0] exp_diff,
    output logic [22:0] shift_res
);

logic [7:0] exp1, exp2;
logic [22:0] frac_A, frac_B;

assign exp1 = opA[30:23];
assign exp2 = opB[30:23];

assign frac_A = opA[22:0];
assign frac_B = opB[22:0];

always_comb begin
    if (exp1 < exp2)
        shift_res = frac_A >> exp_diff;
    else
        shift_res = frac_B >> exp_diff;
end

endmodule
