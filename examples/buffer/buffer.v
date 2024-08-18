module buffer(
    //input enable,
    input in,
    output wire out,
    output wire led
);


//assign out = in & enable;
assign out = in;
assign led = ~in;

endmodule
