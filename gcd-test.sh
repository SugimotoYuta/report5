#!/bin/bash

tmp=/tmp/$$
echo "引数を2つ指定してください" > $tmp-test1
echo "引数には自然数を入力してください" > $tmp-test2
echo "最大公約数は2です" > $tmp-test3
echo "最大公約数はで8592です" > $tmp-test4

ERROR_EXIT () {
  echo "$1" >&2
  rm -f $tmp-*
  exit 1
}

#テスト開始
#test1:引数の数が足りない
./gcd.sh 2 > $tmp-ans && ERROR_EXIT "Error in test1-1" 
diff $tmp-ans $tmp-test1 || ERROR_EXIT "Error in test1-2"

#test2:引数が自然数でない
./gcd.sh 3 d > $tmp-ans && ERROR_EXIT "Error in test2-1"
diff $tmp-ans $tmp-test2 || ERROR_EXIT "Error in test2-2"

./gcd.sh -2 2 > $tmp-ans && ERROR_EXIT "Error in test2-3"
diff $tmp-ans $tmp-test2 || ERROR_EXIT "Error in test 2-4"

#test3:引数に2と4を入力し、出力結果が2であることを確認
./gcd.sh 2 4 > $tmp-ans || ERROR_EXIT "Error in test3-1"
diff $tmp-ans $tmp-test3 || ERROR_EXIT "Error in test 3-2"

#test4:引数に575664と1115481745197120を入力し出力結果が179であることを確認
#大きい数字を引数に渡してもエラーが起きないことを確認
./gcd.sh 575664 1115481745197120 > $tmp-ans || ERROR_EXIT "Error in test4-1"
diff $tmp-ans $tmp-test4 || ERROR_EXIT "Error in test 4-2"

exit 0
