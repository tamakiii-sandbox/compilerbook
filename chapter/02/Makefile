.PHONY: help clean

help:
	@cat $(firstword $(MAKEFILE_LIST))

step1: step1.s
	cc -o $@ $^

clean:
	rm -f step1
