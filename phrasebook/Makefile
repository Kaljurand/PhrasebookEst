
path = "present:$(GF_EST_SRC)/estonian/:$(GF_EST_SRC)/api/"

grammar = Phrasebook

stack_size = "K100M"


all: help

help:
	@echo Targets:
	@echo
	@echo "    pgf:  make PGF"
	@echo "  clean:  remove gfo-files"


pgf:
	gf +RTS -$(stack_size) -RTS --preproc=mkPresent --make --optimize-pgf --mk-index --path $(path) $(grammar)*.gf


run:
	gf +RTS -K512M -RTS --preproc=mkPresent --path $(path) $(grammar)Est.gf


test_pgf:
	cat ../tools/test_gt.gfs | gf --run $(grammar).pgf > test_out.txt
	diff test_gold.txt test_out.txt


# The test run on i3 takes:
#   - 2 min with compiled data (which only needs linking)
#   - 3 min if compiling is needed
test:
	cat ../tools/test_gt.gfs | gf +RTS -$(stack_size) -RTS --preproc=mkPresent --run --path $(path) $(grammar)Est.gf > test_out.txt
	#diff test_gold.txt test_out.txt


clean:
	find -name "*.gfo" | xargs rm -f
