module latch_d_gated_1b (in, out, enable);

  input in;
  input enable;

  output reg out;

  always @(in or enable) begin
    if (enable)
      out <= in;
  end
  
endmodule