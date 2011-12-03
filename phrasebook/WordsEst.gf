-- (c) 2010 Aarne Ranta under LGPL
-- Estonian port by Kaarel Kaljurand

concrete WordsEst of Words = SentencesEst **
  open
    SyntaxEst, ParadigmsEst, (L = LexiconEst),
    Prelude, (E = ExtraEst) in {

  flags optimize = noexpand ; coding=utf8 ;

  lin

-- kinds

    Apple = mkCN L.apple_N ;
    Beer = mkCN L.beer_N ;
    Bread = mkCN L.bread_N ;
    Cheese = mkCN (mkN "juust") ;
    Chicken = mkCN (mkN "kana") ;
    Coffee = mkCN (mkN "kohv") ;
    Fish = mkCN L.fish_N ;
    Meat = mkCN (mkN "liha") ;
    Milk = mkCN L.milk_N ;
    Pizza = mkCN (mkN "pizza") ;
    Salt = mkCN L.salt_N ;
    Tea = mkCN (mkN "tee") ;
    Water = mkCN L.water_N ;
    Wine = mkCN L.wine_N ;

-- qualities

    Bad = L.bad_A ;
    Boring = mkA "igav" ;
    Cheap = mkA "odav" ;
    Cold = L.cold_A ;
    Delicious = mkA "maitsev" ;
    Expensive = mkA "kallis" ;
    Fresh = mkA "toores" ;
    Good = L.good_A ;
    Suspect = mkA "kahtlane" ;
    Warm = L.warm_A ;

-- places

    Restaurant = mkPlace (mkN "restoran") ssa ;
    Bank = mkPlace (mkN "pank") ssa ;
    PostOffice = mkPlace (mkN "post" (mkN "kontor")) ssa ;
    Bar = mkPlace (mkN "baar") ssa ;
    Toilet = mkPlace (mkN "tualett") ssa ;
    Museum = mkPlace (mkN "muuseum") ssa ;
    Airport = mkPlace (mkN "lennu" (mkN "jaam")) ssa ; -- different in Fin
    Station = mkPlace (mkN "jaam") ssa ; -- different in Fin
    Hospital = mkPlace (mkN "haigla") ssa ;
    Church = mkPlace (mkN "kirik") ssa ;
    Cinema = mkPlace (mkN "kino") ssa ;
    Theatre = mkPlace (mkN "teater") ssa ;
    Shop = mkPlace (mkN "pood") ssa ;
    Park = mkPlace (mkN "park") ssa ;
    Hotel = mkPlace (mkN "hotell") ssa ;
    University = mkPlace (mkN "üli" (mkN "kool")) ssa ; -- different in Fin
    School = mkPlace (mkN "kool") ssa ; -- different in Fin

    CitRestaurant cit = {
      name = mkCN cit (mkN "restoran") ;
      at = casePrep inessive ;
      to = casePrep illative;
      from = casePrep elative ;
      isPl = False
      } ;

    Parking = mkPlace (mkN "parkla") ssa ; -- different in Fin
    Supermarket = mkPlace (mkN "super" (mkN "market")) ssa ;
    Pharmacy = mkPlace (mkN "apteek") ssa ;
    Center = mkPlace (mkN "keskus") ssa ;
    Cafeteria = mkPlace (mkN "kohvik") ssa ;
    Disco = mkPlace (mkN "disko") ssa ;
    Pub = mkPlace (mkN "kõrts") ssa ;
    AmusementPark = mkPlace (mkN "lõbustus" (mkN "park")) ssa ;
    Zoo = mkPlace (mkN "looma" (mkN "aed")) ssa ;

-- currencies

    DanishCrown = mkCN (mkN "Taani kroon") | mkCN (mkN "kroon") ;
    Dollar = mkCN (mkN "dollar") ;
    Euro = mkCN (mkN "euro") ;
    Lei = mkCN (mkN "leu") ;
    Leva = mkCN (mkN "leev") ;
    NorwegianCrown = mkCN (mkN "Norra kroon") | mkCN (mkN "kroon") ;
    Pound = mkCN (mkN "nael") ;
    Rouble = mkCN (mkN "rubla") ;
    SwedishCrown = mkCN (mkN "Rootsi kroon") | mkCN (mkN "kroon") ;
    Zloty = mkCN (mkN "zlott") ;

-- Citizenship
    Belgian = mkA "belgia" ;

-- Country
    Belgium = mkNP (mkPN "Belgia") ;

-- Nationality
    Bulgarian = mkNat ("bulgaaria") (mkPN "Bulgaaria") ;
    Catalan = mkNat ("katalaani") (mkPN "Kataloonia") ;
    Danish = mkNat ("taani") (mkPN "Taani") ;
    Dutch = mkNat ("hollandi") (mkPN "Holland") ;
    English = mkNat ("inglise") (mkPN "Inglismaa") ;
    Finnish = mkNat ("soome") (mkPN "Soome") ;
    Flemish = mkNP (mkPN "flaami keel") ; -- Language
    French = mkNat ("prantsuse") (mkPN "Prantsusmaa") ;
    German = mkNat ("saksa") (mkPN "Saksamaa") ;
    Italian = mkNat ("itaalia") (mkPN "Itaalia") ;
    Norwegian = mkNat ("norra") (mkPN "Norra") ;
    Polish = mkNat ("poola") (mkPN "Poola") ;
    Romanian = mkNat ("rumeenia") (mkPN "Rumeenia") ;
    Russian = mkNat ("vene") (mkPN "Venemaa") ;
    Spanish = mkNat ("hispaania") (mkPN "Hispaania") ;
    Swedish = mkNat ("rootsi") (mkPN "Rootsi") ;

    ---- it would be nice to have a capitalization Predef function

-- means of transportation

    Bike = mkTransport L.bike_N ;
    Bus = mkTransport (mkN "buss") ;
    Car = mkTransport L.car_N ;
    Ferry = mkTransport (mkN "praam") ;
    Plane = mkTransport L.airplane_N ;
    Subway = mkTransport (mkN "metroo") ;
    Taxi = mkTransport (mkN "takso") ;
    Train = mkTransport L.train_N ;
    Tram = mkTransport (mkN "tramm") ;

    ByFoot = ParadigmsEst.mkAdv "jalgsi" ;


-- actions

    AHasAge p num = mkCl p.name (mkNP num L.year_N) ;
    AHasChildren p num = mkCl p.name have_V2 (mkNP num L.child_N) ;
    AHasName p name = mkCl (nameOf p) name ;
    AHasRoom p = haveForPerson p.name (mkCN (mkN "tuba")) ;
    AHasTable p = haveForPerson p.name (mkCN (mkN "laud")) ;
    AHungry p = E.AdvExistNP (SyntaxEst.mkAdv on_Prep p.name) (mkNP (mkN "nälg")) ;
    AIll p = mkCl p.name (mkA "haige") ;
    AKnow p = mkCl p.name (mkV "teada") ;
    ALike p item = mkCl p.name L.like_V2 item ;
    ALive p co = mkCl p.name (mkVP (mkVP (mkV "elada")) (SyntaxEst.mkAdv in_Prep co)) ;
    ALove p q = mkCl p.name (mkV2 (mkV "armastada") partitive) q.name ;
    AMarried p = mkCl p.name (ParadigmsEst.mkAdv "abielus") ;
    AReady p = mkCl p.name (ParadigmsEst.mkA "valmis") ;
    -- Eng: I am scared
    -- Fin: Minua pelottaa (partitive)
    -- Est: Mina kardan (nominative)
    -- Est: Mul on hirm (nominative)
    -- AScared p = mkCl p.name (caseV nominative (mkV "karta")) ;
    AScared p = E.AdvExistNP (SyntaxEst.mkAdv on_Prep p.name) (mkNP (mkN "hirm")) ;
    -- Fin: puhua: Puhun hollantia (partitive)
    -- Est: Mina räägin hollandi keelt (partitive)
    ASpeak p lang = mkCl p.name (mkV2 (mkV "rääkida") partitive) lang ;
    AThirsty p = E.AdvExistNP (SyntaxEst.mkAdv on_Prep p.name) (mkNP (mkN "janu")) ;
    -- Eng: I am tired
    -- Fin: Minua väsyttää. (partitive)
    -- Ger: Ich bin müde.
    -- Est: Mina olen väsinud.
    -- ATired p = mkCl p.name (caseV partitive (mkV "väsitada")) ;
    ATired p = mkCl p.name (ParadigmsEst.mkA "väsinud") ;
    -- TODO: better: aru saama / saan aru
    AUnderstand p = mkCl p.name (mkV "mõista") ;
    AWant p obj = mkCl p.name (mkV2 "tahta") obj ;
    AWantGo p place = mkCl p.name want_VV (mkVP (mkVP L.go_V) place.to) ;

-- miscellaneous

    QWhatName p = mkQS (mkQCl whatSg_IP (mkVP (nameOf p))) ;
    QWhatAge p = mkQS (mkQCl (E.ICompAP (mkAP L.old_A)) p.name) ;
    HowMuchCost item = mkQS (mkQCl how8much_IAdv (mkCl item (mkV "maksta"))) ;
    ItCost item price = mkCl item (mkV2 (mkV "maksta")) price ;

    PropOpen p = mkCl p.name open_Adv ;
    PropClosed p = mkCl p.name closed_Adv ;
    PropOpenDate p d = mkCl p.name (mkVP (mkVP open_Adv) d) ;
    PropClosedDate p d = mkCl p.name (mkVP (mkVP closed_Adv) d) ;
    PropOpenDay p d = mkCl p.name (mkVP (mkVP open_Adv) d.habitual) ;
    PropClosedDay p d = mkCl p.name (mkVP (mkVP closed_Adv) d.habitual) ;


-- Building phrases from strings is complicated: the solution is to use
-- mkText : Text -> Text -> Text ;

    PSeeYouDate d = mkText (lin Text (ss ("kohtumiseni"))) (mkPhrase (mkUtt d)) ;
    PSeeYouPlace p = mkText (lin Text (ss ("kohtumiseni"))) (mkPhrase (mkUtt p.at)) ;
    PSeeYouPlaceDate p d =
      mkText (lin Text (ss ("kohtumiseni")))
        (mkText (mkPhrase (mkUtt p.at)) (mkPhrase (mkUtt d))) ;

-- Relations are expressed as "my wife" or "my son's wife", as defined by $xOf$
-- below. Languages without productive genitives must use an equivalent of
-- "the wife of my son" for non-pronouns.

    Wife = xOf sing (mkN "naine") ;
    Husband = xOf sing L.man_N ;
    Son = xOf sing (mkN "poeg") ;
    Daughter = xOf sing (mkN "tütar") ;
    Children = xOf plur L.child_N ;

-- week days

    Monday = let d = "esmaspäev" in mkDay (mkPN d) (d + "iti") ;
    Tuesday = let d = "teisipäev" in mkDay (mkPN d) (d + "iti") ;
    Wednesday = let d = "kolmapäev" in mkDay (mkPN d) (d + "iti") ;
    Thursday = let d = "neljapäev" in mkDay (mkPN d) (d + "iti") ;
    Friday = let d = "reede" in mkDay (mkPN d) (d + "ti") ;
    Saturday = let d = "laupäev" in mkDay (mkPN d) (d + "iti") ;
    Sunday = let d = "pühapäev" in mkDay (mkPN d) (d + "iti") ;

    Tomorrow = ParadigmsEst.mkAdv "homme" ;

-- transports

    HowFar place = mkQS (mkQCl far_IAdv place.name) ;
    HowFarFrom x y =
      mkQS (mkQCl far_IAdv (mkCl y.name x.from)) ;
    HowFarFromBy x y t =
      mkQS (mkQCl far_IAdv (mkCl y.name
        (mkVP (mkVP x.from) t))) ;
    HowFarBy place t =
      mkQS (mkQCl far_IAdv (mkCl place.name t)) ;
      -- mkQS (mkQCl (mkIAdv far_IAdv t) y.name) ;

    WhichTranspPlace trans place =
      mkQS (mkQCl (mkIP which_IDet trans.name) (mkVP (mkVP L.go_V) place.to)) ;

    IsTranspPlace trans place =
      mkQS (mkQCl (mkCl (mkVP (mkVP (mkVP (mkV "saada")) trans.by) place.to))) ;
      -- pääseekö keskustaan bussilla
      -- mkQS (mkQCl (E.AdvPredNP place.to L.go_V (E.PartCN (trans.name)))) ;
      -- meneekö keskustaan bussia

-- modifiers of places

    TheBest = mkSuperl L.good_A ;
    TheClosest = mkSuperl (mkA (mkN "lähedal asuv") "lähem" "lähim") ;
    TheCheapest = mkSuperl (mkA (mkN "odav") "odavam" "odavaim") ;
    TheMostExpensive = mkSuperl (mkA (mkN "kallis") "kallim" "kalleim") ;
    TheMostPopular = mkSuperl (mkA (mkN "populaarne") "populaarsem" "populaarseim") ;
    TheWorst = mkSuperl (L.bad_A) ;

    SuperlPlace sup p = placeNP sup p ;

  oper
    mkNat : Str -> PN ->
      {lang : NP ; prop : A ; country : NP} = \pro,co ->
        {lang = mkNP (mkCN (mkA pro) (mkN "keel"));
         prop = mkA pro ;
         country = mkNP co
        } ;

    ---- using overloaded paradigms slows down compilation dramatically
    -- Eng: See you on Monday!
    -- Est: Kohtumiseni esmaspäeval! (adessive)
    -- Fin: Nähdään maanantaina! (essive)
    -- TODO: use StructuralEst.gf: on_Prep = casePrep adessive
    mkDay : PN -> Str -> {name : NP ; point : Adv ; habitual : Adv} = \d,s ->
      let day = mkNP d in
      {name = day ;
       point = SyntaxEst.mkAdv (casePrep adessive) day ;
       habitual = ParadigmsEst.mkAdv s
      } ;

    mkPlace : N -> Bool -> {name : CN ; at : Prep ; to : Prep; from : Prep ; isPl : Bool} = \p,e -> {
      name = mkCN p ;
      at = casePrep (if_then_else Case e adessive inessive) ;  -- True: external
      to = casePrep (if_then_else Case e allative illative) ;
      from = casePrep (if_then_else Case e ablative elative) ;
      isPl = False
   } ;

    ssa = False ;
    lla = True ;

    -- Ger-grammar uses this xOf (mis on nimi minu naise)
    -- xOf : GNumber -> N -> NPPerson -> NPPerson = \n,x,p -> mkRelative n (mkCN x) p ;

    -- (mis on minu naise nimi)
    xOf : GNumber -> N -> NPPerson -> NPPerson = \n,x,p ->
      relativePerson n (mkCN x) (\a,b,c -> mkNP (E.GenNP b) a c) p ;

    nameOf : NPPerson -> NP = \p -> (xOf sing L.name_N p).name ;

  oper
    -- do you have a table for five persons
    haveForPerson : NP -> CN -> Card -> Cl = \p,a,n ->
      mkCl p have_V2
----      (mkNP (E.PartCN a)  ---- partitive works in questions )
        (mkNP (mkNP a_Det a)
           (SyntaxEst.mkAdv for_Prep (mkNP n L.person_N))) ;
----       (SyntaxEst.mkAdv for_Prep (mkNP (mkDet n)))) ; -- 60s faster compile 25/10/2010

    open_Adv = ParadigmsEst.mkAdv "avatud" ;
    closed_Adv = ParadigmsEst.mkAdv "suletud" ;

    -- Fin: casePrep adessive
    -- Est: casePrep comitative
    mkTransport : N -> {name : CN ; by : Adv} = \n -> {
      name = mkCN n ;
      by = SyntaxEst.mkAdv (casePrep comitative) (mkNP n)
      } ;

    mkSuperl : A -> Det = \a -> mkDet the_Quant (mkOrd a) ;

    far_IAdv = E.IAdvAdv L.far_Adv ;
}
