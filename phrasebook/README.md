PhrasebookEst
=============

Introduction
------------

Estonian concrete syntax for the MOLTO Phrasebook
(http://www.molto-project.eu/demo/phrasebook).

Depends on the (emerging) Estonian resource grammar which
is developed separately at http://gf-estonian.googlecode.com.


Status
------

  * Most of the supported sentences are syntactically correct.
  * Most of them are morphologically flawed (nouns and verbs have wrong endings).
  * Almost all the remaining problems can be fixed by updating the Estonian resource grammar.


Usage
-----

For usage examples see the scripts:

  * `run.sh`
  * `test.sh`
  * `make-pgf.sh`

Testing
-------

One testrun can take up to 8 minutes on an Intel i3. The runtime does not
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

The Estonian resource grammar must be downloaded from http://gf-estonian.googlecode.com
and set up in a directory that is pointed to by the environment variable `GF_EST_SRC`.

Some other required modules are not included in this repository.
They are expected to be found in:

  * ~/.cabal/share/gf-3.3/lib/present/
  * ~/.cabal/share/gf-3.3/lib/prelude/
