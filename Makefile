.PHONY: all compare

objects := main.o

all: kdl2.gb compare
compare: baserom.gb kdl2.gb
	cmp $^

tools:
	$(MAKE) -C tools

tidy:
	rm -f $(ROM) $(OBJS) $(ROM:.gb=.sym) $(ROM:.gb=.map)
	$(MAKE) -C tools clean

clean: tidy
	find . \( -iname '*.1bpp' -o -iname '*.2bpp' -o -iname '*.pcm' \) -exec rm {} +

%.o: %.asm
	rgbasm -o $@ $<

kdl2.gb: $(objects)
	rgblink -o $@ $^
	rgbfix -v $@