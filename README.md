PhrasebookEst
=============

Introduction
------------

Estonian concrete syntax for the MOLTO Phrasebook, see:

  - http://www.molto-project.eu/demo/phrasebook
  - http://tournesol.cs.chalmers.se/~aarne/phrasebook/phrasebook.html

Depends on the (emerging) Estonian resource grammar which
is developed separately at
https://github.com/GF-Estonian/GF-Estonian

The `*Est.gf` files in the phrasebook-directory are also part of the
GF repository (starting with commit
<https://github.com/GrammaticalFramework/GF/commit/7426d0af249dea8e5f74d6bfc9848f853157d54e>).


Usage
-----

For usage examples see the Makefile.

If the script crashes with a stack overflow error then try deleting
all the gfo-files (these will be regenerated next time when the script
runs).


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

The Estonian resource grammar must be downloaded from
https://github.com/GF-Estonian/GF-Estonian
and set up in a directory that is pointed to by the environment variable `GF_EST_SRC`.

Some other required modules are not included in this repository.
They are expected to be found in:

    ~/.cabal/share/x86_64-linux-ghc-7.6.3/gf-3.7/lib/prelude/
    ~/.cabal/share/x86_64-linux-ghc-7.6.3/gf-3.7/lib/present/

or something similar.

Testing
-------

One testrun can take up to 1 minute on an Intel i7 if gfo-files need to be compiled.

    cd phrasebook
    make clean
    make test
