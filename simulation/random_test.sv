module random_test (

    output logic req0,
    output logic req1
);

initial begin

    repeat(100) begin

        req0 = $random;
        req1 = $random;

        #10;
    end

end

endmodule