# Usage:
#
# time ./test.sh
#
# The test run on i3 takes:
#   * 2 min with compiled data (which only needs linking)
#   * 3 min if compiling is needed
#
cat ../tools/test_gt.gfs | gf +RTS -K64M -RTS --run PhrasebookEst.gf > test_out.txt
diff test_gold.txt test_out.txt
