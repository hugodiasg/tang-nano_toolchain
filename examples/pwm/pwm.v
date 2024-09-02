module PWM #(
    parameter DATA_WIDTH = 8
)(
    input clk,
    input [DATA_WIDTH-1:0] threshold,
    input nrst,
    output reg pwm
);

    reg [DATA_WIDTH-1:0] counter;
    reg [DATA_WIDTH-1:0] regthreshold;

    always @(posedge clk) begin
        if (!nrst)
        begin
           regthreshold <= threshold;                
        end else begin
            counter <= counter + 1;

            if (counter >= regthreshold) begin
                pwm <= 1;
            end else begin
                pwm <= 0;
            end      
        end

    end
endmodule
