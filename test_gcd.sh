#!/bin/sh
# test_gcd.sh : gcd.sh の動作を確認するテスト用シェルスクリプト
tmp=/tmp/$$
ERROR_EXIT () {
  echo "$1" >&2
  rm -f $tmp-*
  exit 1
}
[ "$(./gcd.sh 2 4)" = "2" ]        || ERROR_EXIT "error in test1: gcd 2 4 should be 2"
[ "$(./gcd.sh 12 18)" = "6" ]      || ERROR_EXIT "error in test2: gcd 12 18 should be 6"
[ "$(./gcd.sh 7 13)" = "1" ]       || ERROR_EXIT "error in test3: gcd 7 13 should be 1"
[ "$(./gcd.sh 5 5)" = "5" ]        || ERROR_EXIT "error in test4: gcd 5 5 should be 5"
[ "$(./gcd.sh 1071 1029)" = "21" ] || ERROR_EXIT "error in test5: gcd 1071 1029 should be 21"
[ "$(./gcd.sh 18 12)" = "6" ]      || ERROR_EXIT "error in test6: gcd 18 12 should be 6"
./gcd.sh 3        > /dev/null 2>&1 && ERROR_EXIT "error in test7: too few args should fail"
./gcd.sh 1 2 3    > /dev/null 2>&1 && ERROR_EXIT "error in test8: too many args should fail"
./gcd.sh          > /dev/null 2>&1 && ERROR_EXIT "error in test9: no args should fail"
./gcd.sh abc 4    > /dev/null 2>&1 && ERROR_EXIT "error in test10: non-number should fail"
./gcd.sh -6 4     > /dev/null 2>&1 && ERROR_EXIT "error in test11: negative should fail"
./gcd.sh 6.5 4    > /dev/null 2>&1 && ERROR_EXIT "error in test12: decimal should fail"
./gcd.sh 0 4      > /dev/null 2>&1 && ERROR_EXIT "error in test13: zero should fail"
[ -n "$(./gcd.sh abc 4 2>&1 1>/dev/null)" ] || ERROR_EXIT "error in test14: no error message on bad input"
rm -f $tmp-*
echo "All tests passed"
exit 0

