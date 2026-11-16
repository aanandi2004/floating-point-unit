module tb_small_alu;

    logic [31:0] opA, opB;
    logic [7:0] exp_diff;

    small_alu dut (
        .opA(opA),
        .opB(opB),
        .exp_diff(exp_diff)
    );

    initial begin

    $dumpfile("small_alu.vcd");
$dumpvars(0, tb_small_alu);
        opA = 32'h3E800000;
        opB = 32'h41000000;
        #10;

        opA = 32'h41000000;
        opB = 32'h3E800000;
        #10;

        $finish;
    end

endmodule