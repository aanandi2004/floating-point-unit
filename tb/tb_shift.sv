
module tb_shift;

    logic [31:0] opA, opB;
    logic [7:0] exp_diff;
    logic [22:0] shift_res;

    shift dut (
        .opA(opA),
        .opB(opB),
        .exp_diff(exp_diff),
        .shift_res(shift_res)
    );

    initial begin
        $dumpfile("shift.vcd");
        $dumpvars(0, tb_shift);

        // Case 1: Operand A has the smaller exponent
        opA = 32'h3FC00000;
        opB = 32'h40400000;
        exp_diff = 8'd1;
        #10;

        // Case 2: Operand B has the smaller exponent
        opA = 32'h40400000;
        opB = 32'h3FC00000;
        exp_diff = 8'd1;
        #10;

        $finish;
    end

endmodule
