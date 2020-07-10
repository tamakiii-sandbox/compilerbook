#!/usr/bin/env bash

# set -x

test() {
  ./9cc "$2" > tmp.s
  cc -o tmp tmp.s
  ./tmp

  assert "$?" "$1"
}
assert() {
  if [ "$1" = "$2" ]; then
    echo "input => \"$1\""
  else
    echo "input => \"$2\" expected, but got \"$1\""
    exit 1
  fi
}

# assert 0 1
test 0 0
test 42 42
test 30 '5+29-4'
test 21 '5+20-4'
test 41 " 12 + 34 - 5 "
assert \
  "$(test 0 "12 ++ 34" 2>&1 >&0)" \
  "$(echo -e "12 ++ 34\n    ^ Not a number")"

echo OK
