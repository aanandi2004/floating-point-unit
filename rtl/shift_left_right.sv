
module shift_left_right (
    input  logic [22:0] frac_in,
    input  logic        control,
    output logic [22:0] frac_out
);

    always_comb begin
        if (control == 1'b1)
            frac_out = frac_in << 1;
        else
            frac_out = frac_in >> 1;
    end

endmodule
