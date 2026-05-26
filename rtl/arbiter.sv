module arbiter (

    input  logic clk,
    input  logic rst,

    input  logic req0,
    input  logic req1,

    output logic grant0,
    output logic grant1
);

logic turn;


always_ff @(posedge clk or posedge rst) begin

    //------------------------------------------------
    // RESET
    //------------------------------------------------

    if(rst) begin

        grant0 <= 0;
        grant1 <= 0;

        turn <= 0;

    end

    //------------------------------------------------
    // NORMAL OPERATION
    //------------------------------------------------

    else begin

        // IMPORTANT:
        // Clear grants every cycle
        // Prevent stale grant bugs

        grant0 <= 0;
        grant1 <= 0;

        //------------------------------------------------
        // BOTH REQUESTS ACTIVE
        //------------------------------------------------

        if(req0 && req1) begin

            if(turn == 0) begin

                grant0 <= 1;
                turn <= 1;

            end

            else begin

                grant1 <= 1;
                turn <= 0;

            end

        end

        //------------------------------------------------
        // ONLY REQ0 ACTIVE
        //------------------------------------------------

        else if(req0) begin

            grant0 <= 1;

        end

        //------------------------------------------------
        // ONLY REQ1 ACTIVE
        //------------------------------------------------

        else if(req1) begin

            grant1 <= 1;

        end

    end

end

endmodule