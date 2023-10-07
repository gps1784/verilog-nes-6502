`include "../../lib/assert.vh"

`include "../../latch/d_gated_1b.v"

module latch_d_gated_1b_test;

  reg in, enabled, expected;
  wire out;

  latch_d_gated_1b test(in, out, enabled);

  initial begin
    `ASSERT_START(latch_d_gated_1b_test);
    // set to 0
    enabled  <= 1;
    in       <= 0;
    expected <= 0;
    #1;
    `ASSERT_EQ(expected, out);

    // disable the read
    enabled  <= 0;
    in       <= 1;
    expected <= 0;
    #1;
    `ASSERT_EQ(expected, out);

    // setting to 1, but disabled
    enabled  <= 0;
    in       <= 1;
    expected <= 0;
    #1;
    `ASSERT_EQ(expected, out);

    // setting to 1, now enabled
    enabled  <= 1;
    in       <= 1;
    expected <= 1;
    #1;
    `ASSERT_EQ(expected, out);

    // resetting to 0
    enabled  <= 1;
    in       <= 0;
    expected <= 0;
    #1;
    `ASSERT_EQ(expected, out);

    // now, do the opposite
    // set to 1
    enabled  <= 1;
    in       <= 1;
    expected <= 1;
    #1;
    `ASSERT_EQ(expected, out);

    // disable the read
    enabled  <= 0;
    in       <= 1;
    expected <= 1;
    #1;
    `ASSERT_EQ(expected, out);

    // setting to 0, but disabled
    enabled  <= 0;
    in       <= 0;
    expected <= 1;
    #1;
    `ASSERT_EQ(expected, out);

    // setting to 0, now enabled
    enabled  <= 1;
    in       <= 0;
    expected <= 0;
    #1;
    `ASSERT_EQ(expected, out);

    // resetting to 1
    enabled  <= 1;
    in       <= 1;
    expected <= 1;
    #1;
    `ASSERT_EQ(expected, out);

    `ASSERT_FINISH;

  end

endmodule