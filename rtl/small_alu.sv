module small_alu(
input logic [31:0]opA,
input logic [31:0]opB,
output logic [7:0] exp_diff
);
logic [7:0] exp1,exp2;

assign exp1=opA[30:23];
assign exp2=opB[30:23];
always_comb begin
    if(exp2>exp1)
        exp_diff=exp2-exp1;
    else
        exp_diff = exp1-exp2;
end
endmodule
