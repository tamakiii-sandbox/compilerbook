.PHONY: help install deppendencies check test format clean

SHELL := bash

CFLAGS := -std=c11 -g -static

help:
	@cat $(firstword $(MAKEFILE_LIST))

install: \
	dependencies

dependencies:
	type cc > /dev/null
	type clang-format > /dev/null

9cc: 9cc.c

tmp.s: 9cc
	$(realpath $^) 123 > $@

# ./tmp; echo $?
tmp: tmp.s
	cc -o $@ $^

test: 9cc
	./test.sh

check:
	diff -u <(clang-format -style=llvm 9cc.c) 9cc.c

format:
	clang-format -i -style=llvm 9cc.c

clean:
	rm -f 9cc
	rm -f *.o *~ tmp*
