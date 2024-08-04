module clock_divider
  // Parameters section
  #(parameter WIDTH = 8)
(
  // Ports section
  input clk_in, nrst,
  input [WIDTH-1:0] scale,
  output clk_out 
);
  integer count; // counter
  integer CONST = 258000; // CONSTANT to multiply the 'scale'
  reg [31:0] true_scale; // the 'true' scale defined as 'scale * CONST'
  reg signal_clk_out; // register to save the clk_out and send it to this port

  initial begin
      signal_clk_out = 0;
      count = 0;
      signal_clk_out = 0;
  end

  always @(negedge nrst or posedge clk_in) begin 
    if (!nrst) begin
      signal_clk_out <= 0;
      count <= 0;
      true_scale <= scale * CONST; // update the true scale
    end
    else begin
        if (count == (true_scale / 2 - 1)) begin
          signal_clk_out <= ~signal_clk_out; // toggle the signal_clk_out when 'count == true_scale / 2 - 1'
          count <= 0;
        end else begin 
          count <= count + 1;
        end
    end 
  end

  assign clk_out = (true_scale == 0) ? clk_in : signal_clk_out; // if the true_scale is zero, the clk_in is buffered to the output

endmodule
