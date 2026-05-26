module scoreboard (

    input logic clk,

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
// SCOREBOARD CHECKS
//====================================================

always @(posedge clk) begin

    //------------------------------------------------
    // NO DOUBLE GRANT
    //------------------------------------------------

    if(grant0 && grant1)

        $error("ERROR: Both grants active");


    //------------------------------------------------
    // grant0 must match previous req0
    //------------------------------------------------

    if(grant0 && !prev_req0)

        $error("ERROR: grant0 without req0");


    //------------------------------------------------
    // grant1 must match previous req1
    //------------------------------------------------

    if(grant1 && !prev_req1)

        $error("ERROR: grant1 without req1");

end

endmodule