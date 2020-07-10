#!/usr/bin/env bash

# set -x

assert() {
  expected="$1"
  input="$2"

  ./9cc "$input" > tmp.s
  cc -o tmp tmp.s
  ./tmp
  actual="$?"

  _assert "$actual" "$expected"
}
_assert() {
  if [ "$1" = "$2" ]; then
    echo "input => \"$1\""
  else
    echo "input => \"$2\" expected, but got \"$1\""
    exit 1
  fi
}

# assert 0 1
assert 0 0
assert 42 42
assert 30 '5+29-4'
assert 21 '5+20-4'
assert 41 " 12 + 34 - 5 "
_assert \
  "$(assert 0 "12 ++ 34" 2>&1 >&0)" \
  "$(echo -e "12 ++ 34\n    ^ Not a number")"

echo OK
