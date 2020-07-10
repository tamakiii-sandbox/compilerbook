#!/usr/bin/env bash

# set -x

test() {
  ./9cc "$1" > tmp.s
  cc -o tmp tmp.s
  ./tmp

  assert "$?" "$2"
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
test '5+29-4' 30
test '5+20-4' 21
test " 12 + 34 - 5 " 41
assert \
  "$(test "12 ++ 34" 0 2>&1 >&0)" \
  "$(echo -e "12 ++ 34\n    ^ Not a number")"

echo OK
