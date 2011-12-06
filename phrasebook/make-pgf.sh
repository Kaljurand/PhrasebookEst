path="present:${GF_EST_SRC}/estonian/:${GF_EST_SRC}/api/"

stack_size="K100M"

build=build
dir_gr=${build}/gr/
dir_pgf=${build}/pgf/
dir_jsgf=${build}/jsgf/

echo "Making output directories"
mkdir -p ${dir_gr}
mkdir -p ${dir_pgf}
mkdir -p ${dir_jsgf}


echo "Building PGF files..."
for grammar in Phrasebook; do
	echo "  $grammar";
	echo "    PGF";
	gf +RTS -${stack_size} -RTS --preproc=mkPresent --make --optimize-pgf --mk-index --path $path --output-dir ${dir_pgf} ${grammar}*.gf
	echo "    gr";
	echo "gr -number=1000 -depth=7 | l -treebank -bind" | gf --run ${grammar}.pgf > ${dir_gr}/${grammar}.txt
	echo "    jsgf";
	gf -make --output-format=jsgf --output-dir ${dir_jsgf} ${grammar}.pgf
done
echo "done."
