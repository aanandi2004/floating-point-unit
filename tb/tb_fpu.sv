
module tb_fpu;

    logic [31:0] opA, opB;
    logic [31:0] fpu_out;

    fpu dut (
        .opA(opA),
        .opB(opB),
        .fpu_out(fpu_out)
    );

    initial begin
        $dumpfile("fpu.vcd");
        $dumpvars(0, tb_fpu);

        // Case 1: Equal exponents
        opA = 32'h3FC00000;
        opB = 32'h3F900000;
        #10;
        $display("Case 1: fpu_out = %h", fpu_out);
        if (fpu_out !== 32'h3FD00000)
            $display("FAIL: Case 1");
        else
            $display("PASS: Case 1");

        // Case 2: Operand A has smaller exponent
        opA = 32'h3FC00000;
        opB = 32'h40800000;
        #10;
        $display("Case 2: fpu_out = %h", fpu_out);
        if (fpu_out !== 32'h40900000)
            $display("FAIL: Case 2");
        else
            $display("PASS: Case 2");

        // Case 3: Operand B has smaller exponent
        opA = 32'h40800000;
        opB = 32'h3FC00000;
        #10;
        $display("Case 3: fpu_out = %h", fpu_out);
        if (fpu_out !== 32'h40900000)
            $display("FAIL: Case 3");
        else
            $display("PASS: Case 3");

        $finish;
    end

endmodule
