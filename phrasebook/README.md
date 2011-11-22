PhrasebookEst
=============

Introduction
------------

Estonian concrete syntax for the MOLTO Phrasebook.

Depends on the (emerging) Estonian resource grammar (http://code.google.com/p/gf-estonian/).


Usage
-----

For usage examples see the scripts:

  * `run.sh`
  * `test.sh`
  * `make-pgf.sh`

Testing
-------

One test run can take up to 8 minutes on an Intel i3. The runtime does not
depend on the number of tests but rather on which files need to be recompiled.

	time ./test.sh

Files
-----

Abstract syntax files which were copied over from `GF/examples/phrasebook/` and which
are __not__ going to be changed in this project:

  * Phrasebook.gf
  * Greetings.gf
  * Words.gf
  * Sentences.gf
  * SentencesI.gf

Estonian concrete syntax files which were initially cloned from Finnish (`*Fin.gf`)
and which are going to be ported to Estonian in this project:

  * PhrasebookEst.gf
  * GreetingsEst.gf
  * WordsEst.gf
  * SentencesEst.gf

The Estonian resource grammar must be downloaded from http://code.google.com/p/gf-estonian/
and set up in a directory that is on the GF path (see e.g. `test.sh`).

Some other required modules are not included in this repository.
They are expected to be found in:

  * ~/.cabal/share/gf-3.3/lib/present/
  * ~/.cabal/share/gf-3.3/lib/prelude/
