#!/bin/sh
# gcd.sh : 2つの自然数の最大公約数(GCD)を求めるシェルスクリプト
if [ $# -ne 2 ]; then
  echo "input 2 natural numbers" 1>&2
  exit 1
fi
for n in "$1" "$2"; do
  case "$n" in
    '' | *[!0-9]*)
      echo "input natural number" 1>&2
      exit 1
      ;;
  esac
done
if [ "$1" -lt 1 ] || [ "$2" -lt 1 ]; then
  echo "input natural number" 1>&2
  exit 1
fi
a=$1
b=$2
while [ "$b" -ne 0 ]; do
  r=$(expr "$a" % "$b")
  a=$b
  b=$r
done
echo "$a"
exit 0

