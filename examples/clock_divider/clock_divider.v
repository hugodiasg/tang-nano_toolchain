module clock_divider
  // Parameters section
  #(parameter WIDTH = 8)
(
  // Ports section
  input clk_in, nrst,
  input [WIDTH-1:0] scale,
  output clk_out 
);
  integer count ; // counter
  integer CONST = 258000 ;// 2 ; // CONSTANT to multiply the 'scale'
  //reg  [WIDTH-1:0] scale_reg ; // register to save the scale_reg when reset is triggered
  reg  [31:0] true_scale ; // the 'true' scale defined as 'scale_reg * CONST'
  reg signal_clk_out ; // register to save the clk_out and send it to this port

  initial begin
      signal_clk_out = 0 ;
      count = 0 ;   
      //scale_reg [WIDTH-1:0] = scale ;
  end

  always @(negedge nrst or posedge clk_in) begin 
    if (!nrst) begin
      signal_clk_out <= 0 ;
      count <= 0 ;
  //    scale_reg <=  scale; // set the scale to a internal register scale_reg when update_scale is triggered
      true_scale <= scale*CONST ; // update the true scale
    end
    else begin
        if (count == (true_scale/2 - 1)) begin
          signal_clk_out <= ~signal_clk_out ; // toggle the signal_clk_out then 'count == true_scale'
          count <= 0 ;
        end else begin 
          count <= count + 1 ;
        end
    end 
  end

