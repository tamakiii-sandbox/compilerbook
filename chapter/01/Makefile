.PHONY: help clean

help:
	@cat $(firstword $(MAKEFILE_LIST))

test1: test1.c
	cc -o $@ $^

test2: test2.c
	cc -o $@ $^

test2s: test2.s
	cc -o $@ $^

test3: test3.c
	cc -o $@ $^

# ./test3s; echo $?
test3s: test3.s
	cc -o $@ $^

clean:
	rm -f test
	rm -f test2
	rm -f test2s
	rm -f test3
	rm -f test3s
