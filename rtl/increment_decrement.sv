
module increment_decrement (
    input  logic [7:0] exp_in,
    input  logic       control,
    output logic [7:0] exp_out
);

    always_comb begin
        if (control == 1'b1)
            exp_out = exp_in - 1'b1;
        else
            exp_out = exp_in + 1'b1;
    end

endmodule
