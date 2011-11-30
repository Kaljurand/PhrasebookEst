path="present:${GF_EST_SRC}/estonian/:${GF_EST_SRC}/api/"
#
# --preproc=mkPresent is needed to make the files compile.
# It filters the files through a simple grep (grep -v "\-\-\# notpresent" $1)
# See also: GF/lib/src/mkPresent
# See also: GF mailinglist, Aarne Ranta's mail 2011-06-13
#
gf +RTS -K512M -RTS --preproc=mkPresent --path $path PhrasebookEst.gf
