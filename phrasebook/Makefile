
path = "$(GF_EST_SRC)/estonian/:$(GF_EST_SRC)/api/"

grammar = Phrasebook

stack_size = "K100M"


all: help

help:
	@echo Targets:
	@echo
	@echo "    pgf:  make PGF"
	@echo "  clean:  remove gfo-files"


pgf:
	gf +RTS -$(stack_size) -RTS --make --optimize-pgf --path $(path) $(grammar)*.gf
	echo "pg -missing" | gf -run $(grammar).pgf > missing.txt
	echo "pg -words" | gf -run $(grammar).pgf > words.txt


run:
	gf +RTS -K512M -RTS --path $(path) $(grammar)Est.gf


test_pgf:
	cat ../tools/test_gt.gfs | gf --run $(grammar).pgf > test_out.txt
	diff test_gold.txt test_out.txt


# The test run on i3 takes:
#   - 2 min with compiled data (which only needs linking)
#   - 3 min if compiling is needed
test:
	cat ../tools/test_gt.gfs | gf +RTS -$(stack_size) -RTS --run --path $(path) $(grammar)Est.gf > test_out.txt
	#diff test_gold.txt test_out.txt

test1:
	echo "rf -lines -tree -file=../tests/trees1.txt | l -lang=PhrasebookEst" | gf --run Phrasebook.pgf > ../tests/lins2.out


clean:
	find -name "*.gfo" | xargs rm -f
