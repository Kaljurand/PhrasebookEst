PhrasebookEst
=============

Introduction
------------

Estonian concrete syntax for the MOLTO Phrasebook.


Usage
-----

	gf +RTS -K64M -RTS PhrasebookEst.gf


Testing
-------

	time ./test.sh

Files
-----

Abstract syntax files which were copied over from `GF/examples/phrasebook/` and which
are __not__ going to be changed in this project.

  * Phrasebook.gf
  * Greetings.gf
  * Words.gf
  * Sentences.gf
  * SentencesI.gf

Estonian concrete syntax files which were initially cloned from Finnish (`*Fin.gf`)
and which are going to be ported to Estonian in this project.

  * PhrasebookEst.gf
  * GreetingsEst.gf
  * WordsEst.gf
  * SentencesEst.gf

Some other required modules are not included in this repository.
They are expected to be found in:

  * ~/.cabal/share/gf-3.3/lib/present/
  * ~/.cabal/share/gf-3.3/lib/prelude/
