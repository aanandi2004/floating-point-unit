module big_alu(
    input logic [22:0] f1,
    input logic [22:0] f2,
    output logic [22:0] big_res
);
    assign big_res = f1 + f2;

endmodule
