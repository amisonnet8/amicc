#!/usr/bin/env sh

assert() {
  expected="$1"
  input="$2"

  ./amicc "$input" > tmp.s
  cc -o tmp.out tmp.s
  ./tmp.out
  actual="$?"

  if [ "$actual" = "$expected" ]; then
    echo "$input => $actual"
  else
    echo "$input => $expected expected, but got $actual"
    exit 1
  fi
}

assert 0 0
assert 102 102
assert 21 "5+20-4"

echo OK
