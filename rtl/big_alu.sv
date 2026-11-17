module big_alu(
    input logic [22:0] f1,
    input logic [22:0] f2,
    output logic [23:0] big_res
);
    logic carry;
    assign big_res = f1 + f2;
    assign carry=big_res[23];

endmodule
