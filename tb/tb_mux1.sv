module tb_mux1;

    logic [31:0] opA, opB;
    logic sel;
    logic [22:0] mux1_res;

    mux1 dut (
        .opA(opA),
        .opB(opB),
        .sel(sel),
        .mux1_res(mux1_res)
    );

    initial begin
    $dumpfile("mux1.vcd");
$dumpvars(0, tb_mux1);
        opA = 32'h3F800000;
opB = 32'h3FC00000;

        sel = 0;
        #10;

        sel = 1;
        #10;

        $finish;
    end

endmodule