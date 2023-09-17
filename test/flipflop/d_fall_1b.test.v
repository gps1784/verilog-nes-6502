`include "../../lib/assert.vh"

`include "../../flipflop/d_fall_1b.v"

`timescale 1ns / 1ps
module flipflop_d_fall_1b_test;

  reg in, clock, expected;
  wire out;

  flipflop_d_fall_1b test(in, out, clock);

  initial begin
    `ASSERT_START(flipflop_d_fall_1b_test);

    clock    <= 1; // high to flush
    in       <= 0;
    #1;

    // set to 0
    clock    <= 0; // low
    in       <= 0;
    expected <= 0;
    #1;

    `ASSERT_EQ(expected, out);

    clock    <= 1; // high
    in       <= 1;
    expected <= 0;
    #1;

    clock    <= 0; // low
    in       <= 1;
    expected <= 1;
    #1;
    `ASSERT_EQ(expected, out);

    // set to 1
    clock    <= 1; // high
    in       <= 1;
    expected <= 1;
    #1;
    `ASSERT_EQ(expected, out);

    // stay at 1
    clock    <= 0; // low
    in       <= 1;
    expected <= 1;
    #1;
    `ASSERT_EQ(expected, out);

    clock    <= 1; // high
    in       <= 0;
    expected <= 1;
    #1;
    `ASSERT_EQ(expected, out);

    // set to 0
    clock    <= 0; // low
    in       <= 0;
    expected <= 0;
    #1;
    `ASSERT_EQ(expected, out);

    // set to 0 (latch)
    clock    <= 1; // high
    in       <= 0;
    expected <= 0;
    #1;
    `ASSERT_EQ(expected, out);

    // set to 0
    clock    <= 0; // low
    in       <= 0;
    expected <= 0;
    #1;
    `ASSERT_EQ(expected, out);

  end
endmodule

