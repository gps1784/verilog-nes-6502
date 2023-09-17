`include "../../lib/colors.vh"

module colors_test;

  initial begin
    $display("Text should be %s%s %s%s%s%s%s",
      `COLORIZE("I", 31),
      `COLORIZE("N", 33),
      `COLORIZE("C", 32),
      `COLORIZE("O", 36),
      `COLORIZE("L", 34),
      `COLORIZE("O", 35),
      `COLORIZE("R", 31));
    $display("Text should be %s", `RED("RED"));
    $display("Text should be %s", `YELLOW("YELLOW"));
    $display("Text should be %s", `GREEN("GREEN"));
    $display("Text should be %s", `CYAN("CYAN"));
    $display("Text should be %s", `BLUE("BLUE"));
    $display("Text should be %s", `MAGENTA("MAGENTA"));
  end
endmodule