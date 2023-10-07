.PHONY: test clean

VERFLAGS  := -g2009 -grelative-include

MAKEFILES := makefile

LIBDIR    := lib
TESTDIR   := test
SRCFILES  := $(shell find . -name "*.v" -not -path "./$(TESTDIR)/*")
LIBFILES  := $(shell find . -name "*.v*" -path "./$(LIBDIR)/*")
TESTFILES := $(addprefix $(TESTDIR)/, $(SRCFILES:./%.v=%.test.v))
TESTEXE   := $(TESTFILES:%.v=%.vvp)
TESTDUMP  := $(TESTFILES:%.v=%.vcd)

test: $(TESTEXE)
	$(foreach vvp, $(TESTEXE), vvp $(vvp);)

test/%.test.vvp: test/%.test.v %.v $(LIBFILES)
	iverilog $(VERFLAGS) -o $@ $<

%.vvp: %.v $(LIBFILES)
	iverilog $(VERFLAGS) -o $@ $<

clean:
	rm -f $(TESTEXE) $(TESTDUMP)