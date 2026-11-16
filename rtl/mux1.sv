module mux1(
input logic [31:0]opA,
input logic [31:0]opB,
input logic sel,
output logic [22:0] mux1_res
);

logic [22:0] fracA, fracB;

assign fracA= opA[22:0];
assign fracB= opB[22:0];

assign mux1_res = sel ? fracB: fracA;

endmodule