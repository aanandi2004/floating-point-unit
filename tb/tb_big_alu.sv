
module tb_big_alu;

    logic [22:0] f1, f2;
    logic [23:0] big_res;

    big_alu dut (
        .f1(f1),
        .f2(f2),
        .big_res(big_res)
    );

    initial begin
        $dumpfile("big_alu.vcd");
        $dumpvars(0, tb_big_alu);

        f1 = 23'd800;
        f2 = 23'd200;
        #10;

        f1 = 23'd500;
        f2 = 23'd600;
        #10;

        $finish;
    end

endmodule
