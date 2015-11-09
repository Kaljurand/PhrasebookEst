
PB=$(GF_SRC)/examples/phrasebook/

path = "$(GF_EST_SRC)/estonian/:$(GF_EST_SRC)/api/"

grammar = Phrasebook

stack_size = "K100M"


all: help

help:
	@echo Targets:
	@echo
	@echo "          pgf:  make PGF"
	@echo "         test:  test"
	@echo " diff_gf_repo:  compare the GF repository version of the Estonian Phrasebook with this one"
	@echo "                (set GF_SRC to the root of the GF source distribution, it is currently '$(GF_SRC)')"
	@echo "        clean:  remove gfo-files"


pgf:
	gf +RTS -$(stack_size) -RTS --make --optimize-pgf --path $(path) $(grammar)*.gf
	echo "pg -missing" | gf -run $(grammar).pgf > missing.txt
	echo "pg -words" | gf -run $(grammar).pgf > words.txt


run:
	gf +RTS -K512M -RTS --path $(path) $(grammar)Est.gf


test_pgf:
	cat ../tools/test_gt.gfs | gf --run $(grammar).pgf > test_out.txt
	diff test_gold.txt test_out.txt


test:
	cat ../tools/test_gt.gfs | gf +RTS -$(stack_size) -RTS --run --path $(path) $(grammar)Est.gf > test_out.txt
	-diff --brief test_gold.txt test_out.txt

test1:
	echo "rf -lines -tree -file=../tests/trees1.txt | l -lang=PhrasebookEst" | gf --run Phrasebook.pgf > ../tests/lins2.out


clean:
	find -name "*.gfo" | xargs rm -f


diff_gf_repo:
	diff $(PB)Greetings.gf Greetings.gf
	diff $(PB)GreetingsEst.gf GreetingsEst.gf
	diff $(PB)Phrasebook.gf Phrasebook.gf
	diff $(PB)PhrasebookEst.gf PhrasebookEst.gf
	diff $(PB)Sentences.gf Sentences.gf
	diff $(PB)SentencesEst.gf SentencesEst.gf
	diff $(PB)SentencesI.gf SentencesI.gf
	diff $(PB)Words.gf Words.gf
	diff $(PB)WordsEst.gf WordsEst.gf
