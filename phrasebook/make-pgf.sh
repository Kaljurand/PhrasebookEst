path="present:/home/kaarel/mywork/gf-estonian/estonian/:../lib/src/api/"

build=build
dir_gr=${build}/gr/
dir_pgf=${build}/pgf/

echo "Making output directories"
mkdir -p ${dir_gr}
mkdir -p ${dir_pgf}


echo "Building PGF files..."
for grammar in Phrasebook; do
	echo "  $grammar";
	echo "    PGF";
	gf +RTS -K512M -RTS --preproc=mkPresent --make --optimize-pgf --mk-index --path $path --output-dir ${dir_pgf} ${grammar}*.gf
	echo "    gr";
	echo "gr -number=100 -depth=5 | l -treebank -bind" | gf --run ${grammar}.pgf > ${dir_gr}/${grammar}.txt
done
echo "done."
