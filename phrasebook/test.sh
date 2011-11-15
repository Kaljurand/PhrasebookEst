# Usage:
#
# time ./test.sh
#
# The test run on compiled data (which only needs linking) should
# take about 2 minutes on i3.
#
cat ../tools/test_gt.gfs | gf +RTS -K64M -RTS --run PhrasebookEst.gf > test_out.txt
diff test_gold.txt test_out.txt
