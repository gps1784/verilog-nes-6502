module assert_test;
  `include "../../lib/assert.vh"

  initial begin
    `ASSERT_PASSED("any message I like, in green.");
    `ASSERT_FAILED("any message I like, in red.");
    `ASSERT(0);
    `ASSERT(1);
    `ASSERT_ZERO(0);
    `ASSERT_ZERO(1'b1);
    `ASSERT_ZERO(2'b11);
    `ASSERT_EQ(1'b0,1'b0);
    `ASSERT_EQ(1'b0,1'b1);
    `ASSERT_SUMMARY;
    ASSERTIONS.PASSED = 0;
    ASSERTIONS.FAILED = 0;
    ASSERTIONS.TOTAL  = 0;
    `ASSERT_ZERO(ASSERTIONS.PASSED);
    `ASSERT_ZERO(ASSERTIONS.FAILED);
    `ASSERT_FINISH;
  end
endmodule