module arbiter_assertions (

    input logic clk,
    input logic rst,

    input logic req0,
    input logic req1,

    input logic grant0,
    input logic grant1
);

logic prev_req0;
logic prev_req1;


//====================================================
// STORE PREVIOUS REQUESTS
//====================================================

always @(posedge clk) begin

    prev_req0 <= req0;
    prev_req1 <= req1;

end


//====================================================
// ASSERTION CHECKS
//====================================================

always @(posedge clk) begin

    if(!rst) begin

        //------------------------------------------------
        // BOTH GRANTS SHOULD NEVER BE ACTIVE
        //------------------------------------------------

        if(grant0 && grant1)

            $error("ERROR: Both grants active");


        //------------------------------------------------
        // grant0 valid only if req0 existed previously
        //------------------------------------------------

        if(grant0 && !prev_req0)

            $error("ERROR: grant0 without req0");


        //------------------------------------------------
        // grant1 valid only if req1 existed previously
        //------------------------------------------------

        if(grant1 && !prev_req1)

            $error("ERROR: grant1 without req1");

    end

end

endmodule