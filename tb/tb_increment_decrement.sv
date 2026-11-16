
module tb_increment_decrement;

    logic [7:0] exp_in;
    logic control;
    logic [7:0] exp_out;

    shift_left_right dut (
        .exp_in(exp_in),
        .control(control),
        .exp_out(exp_out)
    );

    initial begin
        $dumpfile("shift_left_right.vcd");
        $dumpvars(0, tb_shift_left_right);

        // Case 1: Control = 1 (Decrement)
        exp_in = 8'd130;
        control = 1'b1;
        #10;

        // Case 2: Control = 0 (Increment)
        exp_in = 8'd130;
        control = 1'b0;
        #10;

        // Case 3: Control = 1 (Decrement)
        exp_in = 8'd127;
        control = 1'b1;
        #10;

        // Case 4: Control = 0 (Increment)
        exp_in = 8'd127;
        control = 1'b0;
        #10;

        $finish;
    end

endmodule
