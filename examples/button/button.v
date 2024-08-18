module button(
    input b,
    output wire led,
    output wire out
);


assign led = ~b;
assign out = ~b;

endmodule
