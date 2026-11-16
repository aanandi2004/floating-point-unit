
module tb_shift_left_right;

    logic [22:0] frac_in;
    logic control;
    logic [22:0] frac_out;

    shift_left_right dut (
        .frac_in(frac_in),
        .control(control),
        .frac_out(frac_out)
    );

    initial begin
        $dumpfile("shift_left_right.vcd");
        $dumpvars(0, tb_shift_left_right);

        // Case 1: Left shift
        frac_in = 23'b00000000000000000000100;
        control = 1'b1;
        #10;

        // Case 2: Right shift
        frac_in = 23'b00000000000000000000100;
        control = 1'b0;
        #10;

        // Case 3: Left shift
        frac_in = 23'b00000000000000000100000;
        control = 1'b1;
        #10;

        // Case 4: Right shift
        frac_in = 23'b00000000000000000100000;
        control = 1'b0;
        #10;

        $finish;
    end

endmodule
