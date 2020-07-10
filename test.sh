#!/usr/bin/env bash

# set -x

assert() {
  expected="$1"
  input="$2"

  ./9cc "$input" > tmp.s
  cc -o tmp tmp.s
  ./tmp
  actual="$?"

  if [ "$actual" = "$expected" ]; then
    echo "input => $actual"
  else
    echo "input => $actual expected, but got $actual"
    exit 1
  fi
}

# assert 0 1
assert 0 0
assert 42 42
assert 30 '5+29-4'
assert 21 '5+20-4'
assert 41 " 12 + 34 - 5 "

echo OK
