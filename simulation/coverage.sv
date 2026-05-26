module coverage (

    input logic clk,

    input logic req0,
    input logic req1,

    input logic grant0,
    input logic grant1
);

integer req0_count = 0;
integer req1_count = 0;
integer dual_req_count = 0;

always @(posedge clk) begin

    if(req0)

        req0_count = req0_count + 1;

    if(req1)

        req1_count = req1_count + 1;

    if(req0 && req1)

        dual_req_count = dual_req_count + 1;

end


final begin

    $display("----- COVERAGE REPORT -----");

    $display("req0 active cycles      = %0d", req0_count);

    $display("req1 active cycles      = %0d", req1_count);

    $display("dual request cycles     = %0d", dual_req_count);

end

endmodule