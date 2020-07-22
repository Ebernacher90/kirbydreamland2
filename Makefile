.PHONY: all compare

objects := main.o

all: kdl2.gb compare
compare: baserom.gb kdl2.gb
	cmp $^

%.o: %.asm
	rgbasm -o $@ $<

kdl2.gb: $(objects)
	rgblink -o $@ $^
	rgbfix -v $@