`include "./colors.vh"

module ASSERTIONS;
  integer PASSED = 0;
  integer FAILED = 0;
  integer TOTAL  = 0;
  string  FILE    = "";
  integer FILELEN = 0;
endmodule

`define ASSERT_DISPLAY(msg) $display("%s:%0d (in %m) %s", `__FILE__, `__LINE__, msg)

`define ASSERT_PASSED(msg) \
  do begin \
    ASSERTIONS.PASSED += 1; \
    ASSERTIONS.TOTAL  += 1; \
    `ASSERT_DISPLAY(`GREEN(msg)); \
  end while(0)

`define ASSERT_FAILED(msg) \
  do begin \
    ASSERTIONS.FAILED += 1; \
    ASSERTIONS.TOTAL  += 1; \
    `ASSERT_DISPLAY(`RED(msg)); \
  end while(0)

`define ASSERT_START(mod) \
  do begin \
    ASSERTIONS.PASSED = 0; \
    ASSERTIONS.FAILED = 0; \
    ASSERTIONS.TOTAL  = 0; \
    $display("------------------------------"); \
    $display(`CYAN($sformatf("%s", `__FILE__))); \
    $display("------------------------------"); \
    ASSERTIONS.FILE    = $sformatf("%s", `__FILE__); \
    ASSERTIONS.FILELEN = ASSERTIONS.FILE.len(); \
    ASSERTIONS.FILE    = $sformatf("%s.vcd", ASSERTIONS.FILE.substr(0, ASSERTIONS.FILELEN - 3)); \
    $dumpfile(ASSERTIONS.FILE); \
    $dumpvars(0, mod); \
  end while(0)

`define ASSERT_SUMMARY \
  do begin \
    $display("------------------------------"); \
    $display(`YELLOW($sformatf("Assertions made:   %d", ASSERTIONS.TOTAL))); \
    $display(`GREEN( $sformatf("Assertions passed: %d", ASSERTIONS.PASSED))); \
    $display(`RED(   $sformatf("Assertions failed: %d", ASSERTIONS.FAILED))); \
    $display("------------------------------"); \
  end while(0)

`define ASSERT_FINISH \
  do begin \
    `ASSERT_SUMMARY; \
    if((ASSERTIONS.TOTAL == ASSERTIONS.PASSED) && (ASSERTIONS.FAILED == 0)) begin \
      $display(`GREEN("[SUITE PASSED]")); \
      $finish_and_return(0); \
    end else begin \
      $display(`GREEN("[SUITE PASSED]")); \
      $finish_and_return(1); \
    end \
  end while(0)

`define ASSERT(act) \
  do begin \
    if(act) begin \
      `ASSERT_PASSED("`ASSERT PASSED"); \
    end else begin \
      `ASSERT_FAILED("`ASSERT FAILED"); \
    end \
  end while(0)

`define ASSERT_ZERO(act) \
  do begin \
    if(act) begin \
      `ASSERT_FAILED($sformatf("`ASSERT_ZERO FAILED: expected=0, actual=%d", act)); \
    end else begin \
      `ASSERT_PASSED("`ASSERT_ZERO PASSED"); \
    end \
  end while(0)

`define ASSERT_EQ(exp, act) \
  do begin \
    if(exp == act) begin \
      `ASSERT_PASSED($sformatf("`ASSERT_EQ PASSED: expected=%d", exp)); \
    end else begin \
      `ASSERT_FAILED($sformatf("`ASSERT_EQ FAILED: expected=%d actual=%d", exp, act)); \
    end \
  end while(0)