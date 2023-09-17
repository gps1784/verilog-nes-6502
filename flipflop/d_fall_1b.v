`include "./d_rise_1b.v"

module flipflop_d_fall_1b (in, out, clock);

  input in;
  input clock;

  reg internal;

  output reg out;

  flipflop_d_rise_1b flipflop_internal(in, out, ~clock);
  
endmodule