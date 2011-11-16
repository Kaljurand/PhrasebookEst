--# -path=.:present:mathematical:prelude

resource SymbolicEst = Symbolic with 
  (Symbol = SymbolFin),
  (Grammar = GrammarFin) ;
