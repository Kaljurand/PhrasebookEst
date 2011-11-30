# Usage:
#
# time ./test.sh
#
# The test run on i3 takes:
#   * 2 min with compiled data (which only needs linking)
#   * 3 min if compiling is needed
#
path="present:${GF_EST_SRC}/estonian/:${GF_EST_SRC}/api/"

cat ../tools/test_gt.gfs |\
gf +RTS -K512M -RTS --preproc=mkPresent --run --path $path PhrasebookEst.gf > test_out.txt
diff test_gold.txt test_out.txt
