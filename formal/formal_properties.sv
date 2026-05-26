module formal_properties (

    input logic clk,

    input logic grant0,
    input logic grant1
);

always @(posedge clk) begin

    assert(!(grant0 && grant1));

end

endmodule