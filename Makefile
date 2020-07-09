.PHONY: help test clean

CFLAGS := -std=c11 -g -static

help:
	@cat $(firstword $(MAKEFILE_LIST))

9cc: 9cc.c

tmp.s: 9cc
	$(realpath $^) 123 > $@

# ./tmp; echo $?
tmp: tmp.s
	cc -o $@ $^

test: 9cc
	./test.sh

clean:
	rm -f 9cc
	rm -f *.o *~ tmp*
