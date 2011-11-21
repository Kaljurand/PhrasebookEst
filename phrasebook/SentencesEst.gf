concrete SentencesEst of Sentences = NumeralEst ** SentencesI -
  [Is, IsMass, NameNN, ObjMass,
   NPPlace, CNPlace, placeNP, mkCNPlace, mkCNPlacePl,
   GObjectPlease
  ] with 
  (Syntax = SyntaxEst),
  (Symbolic = SymbolicEst),
  (Lexicon = LexiconEst) **
    open SyntaxEst, ExtraEst, (P = ParadigmsEst), (V = VerbEst), Prelude in {

  flags optimize = noexpand ; coding=utf8;

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
    Is item prop = mkCl item (V.UseComp (CompPartAP prop)) ; -- tämä pizza on herkullista
    IsMass mass prop = mkCl (mkNP a_Det mass) (V.UseComp (CompPartAP prop)) ; -- pizza on herkullista
    NameNN = mkNP (P.mkPN (P.mkN "NN" "NN:iä")) ;

  -- Estonian does not have possessive endings and does not make use of ProDrop
  -- that much, so we do not override SentencesI, like Finnish does.
{--
    IMale, IFemale = 
        {name = mkNP (ProDrop i_Pron) ; isPron = True ; poss = ProDropPoss i_Pron} ; 
    YouFamMale, YouFamFemale = 
        {name = mkNP (ProDrop youSg_Pron) ; isPron = True ; poss = ProDropPoss youSg_Pron} ; 
    YouPolMale, YouPolFemale = 
        {name = mkNP (ProDrop youPol_Pron) ; isPron = True ; poss = ProDropPoss youPol_Pron} ;
--}

    ObjMass = PartCN ;

    GObjectPlease o = lin Text (mkPhr noPConj (mkUtt o) (lin Voc (ss "palun"))) ;

  }
