`include "../latch/d_gated_1b.v"

module flipflop_d_rise_1b (in, out, clock);

  input in;
  input clock;

  reg internal;

  output reg out;

  latch_d_gated_1b latch_1(.in(in),  .out(internal), .enable(~clock));
  latch_d_gated_1b latch_2(.in(internal), .out(out), .enable(clock));
  
endmodule