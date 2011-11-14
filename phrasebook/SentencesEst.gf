concrete SentencesEst of Sentences = NumeralFin ** SentencesI - 
  [Is, IsMass, NameNN, ObjMass,
   IFemale, YouFamFemale, YouPolFemale, IMale, YouFamMale, YouPolMale,
   NPPlace, CNPlace, placeNP, mkCNPlace, mkCNPlacePl,
   GObjectPlease
  ] with 
  (Syntax = SyntaxFin),
  (Symbolic = SymbolicFin),
  (Lexicon = LexiconFin) ** 
    open SyntaxFin, ExtraFin, (P = ParadigmsFin), (V = VerbFin), Prelude in {

  flags optimize = noexpand ;

  oper
    NPPlace = {name : NP ; at : Adv ; to : Adv ; from : Adv} ;
    CNPlace = {name : CN ; at : Prep ; to : Prep ; from : Prep ; isPl : Bool} ;

  placeNP : Det -> CNPlace -> NPPlace = \det,kind ->
    let name : NP = mkNP det kind.name in {
      name = name ;
      at = mkAdv kind.at name ;
      to = mkAdv kind.to name ;
      from = mkAdv kind.from name
    } ;

  lin 
    Is item prop = mkCl item (V.UseComp (CompPartAP prop)) ; -- t�m� pizza on herkullista
    IsMass mass prop = mkCl (mkNP a_Det mass) (V.UseComp (CompPartAP prop)) ; -- pizza on herkullista
    NameNN = mkNP (P.mkPN (P.mkN "NN" "NN:i�")) ;

    IMale, IFemale = 
        {name = mkNP (ProDrop i_Pron) ; isPron = True ; poss = ProDropPoss i_Pron} ; 
    YouFamMale, YouFamFemale = 
        {name = mkNP (ProDrop youSg_Pron) ; isPron = True ; poss = ProDropPoss youSg_Pron} ; 
    YouPolMale, YouPolFemale = 
        {name = mkNP (ProDrop youPol_Pron) ; isPron = True ; poss = ProDropPoss youPol_Pron} ;

    ObjMass = PartCN ;

    GObjectPlease o = lin Text (mkPhr noPConj (mkUtt o) (lin Voc (ss "kiitos"))) ;


  }
