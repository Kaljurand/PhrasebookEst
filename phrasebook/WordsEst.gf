-- (c) 2010 Aarne Ranta under LGPL
-- Estonian port by Kaarel Kaljurand

concrete WordsEst of Words = SentencesEst **
  open
    SyntaxFin, ParadigmsFin, (L = LexiconEst),
    Prelude, (E = ExtraFin) in {

  flags optimize = noexpand ;

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
    PostOffice = mkPlace (mkN "postkontor") ssa ;
    Bar = mkPlace (mkN "baar") ssa ;
    Toilet = mkPlace (mkN "tualett") ssa ;
    Museum = mkPlace (mkN "muuseum") ssa ;
    Airport = mkPlace (mkN "lennu" (mkN "väli")) lla ;
    Station = mkPlace (mkN "jaam") lla ;
    Hospital = mkPlace (mkN "haigla") ssa ;
    Church = mkPlace (mkN "kirik") ssa ;
    Cinema = mkPlace (mkN "kino") ssa ;
    Theatre = mkPlace (mkN "teater") ssa ;
    Shop = mkPlace (mkN "pood") ssa ;
    Park = mkPlace (mkN "park") ssa ;
    Hotel = mkPlace (mkN "hotell") ssa ;
    University = mkPlace (mkN "ülikool") lla ;
    School = mkPlace (mkN "kool") lla ;

    CitRestaurant cit = {
      name = mkCN cit (mkN "restoran") ; at = casePrep inessive ; to = casePrep illative; from = casePrep elative ; isPl = False
      } ;
    Parking = mkPlace (mkN "parkla") lla ;
    Supermarket = mkPlace (mkN "supermarket") ssa ;
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
    Zloty = mkCN (mkN "zlott" "zlotyja") ; --TODO


-- nationalities

    Belgian = mkA "belgia" ;
    Belgium = mkNP (mkPN "Belgia") ;
    Bulgarian = mkNat (mkPN "bulgaaria") (mkPN "Bulgaaria") (mkA "bulgaarlane") ;
    Catalan = mkNat (mkPN "katalaani") (mkPN "Kataloonia") (mkA "kataloonlane") ;
    Danish = mkNat (mkPN "taani") (mkPN "Taani") (mkA "taanlane") ;
    Dutch = mkNat (mkPN "hollandi") (mkPN "Holland") (mkA "hollandlane") ;
    English = mkNat (mkPN "inglise") (mkPN "Inglismaa") (mkA "inglane") ;
    Finnish = mkNat (mkPN "soome") (mkPN "Soome") (mkA "soomlane") ;
    Flemish = mkNP (mkPN "flaami") ;
    French = mkNat (mkPN "prantsuse") (mkPN "Prantsusmaa") (mkA "prantslane") ;
    German = mkNat (mkPN "saksa") (mkPN "Saksamaa") (mkA "sakslane") ;
    Italian = mkNat (mkPN "itaalia") (mkPN "Itaalia") (mkA "itaallane") ;
    Norwegian = mkNat (mkPN "norra") (mkPN "Norra") (mkA "norralane") ;
    Polish = mkNat (mkPN "poola") (mkPN "Poola") (mkA "poolakas") ;
    Romanian = mkNat (mkPN "rumeenia") (mkPN "Rumeenia") (mkA "rumeenlane") ;
    Russian = mkNat (mkPN "vene") (mkPN "Venemaa") (mkA "venelane") ;
    Spanish = mkNat (mkPN "hispaania") (mkPN "Hispaania") (mkA "hispaanlane") ;
    Swedish = mkNat (mkPN "rootsi") (mkPN "Rootsi") (mkA "rootslane") ;

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

    ByFoot = ParadigmsFin.mkAdv "jalgsi" ;


-- actions

    AHasAge p num = mkCl p.name (mkNP num L.year_N) ;
    AHasChildren p num = mkCl p.name have_V2 (mkNP num L.child_N) ;
    AHasName p name = mkCl (nameOf p) name ;
    AHasRoom p = haveForPerson p.name (mkCN (mkN "tuba")) ;
    AHasTable p = haveForPerson p.name (mkCN (mkN "laud")) ;
    AHungry p = E.AdvExistNP (SyntaxFin.mkAdv on_Prep p.name) (mkNP (mkN "nälg")) ;
    AIll p = mkCl p.name (mkA "haige") ;
    AKnow p = mkCl p.name (mkV "tietää") ;
    ALike p item = mkCl p.name L.like_V2 item ;
    ALive p co = mkCl p.name (mkVP (mkVP (mkV "asua")) (SyntaxFin.mkAdv in_Prep co)) ;
    ALove p q = mkCl p.name (mkV2 (mkV "rakastaa") partitive) q.name ;
    AMarried p = mkCl p.name (ParadigmsFin.mkAdv "abielus") ;
    AReady p = mkCl p.name (ParadigmsFin.mkA "valmis") ;
    AScared p = mkCl p.name (caseV partitive (mkV "pelottaa")) ;
    ASpeak p lang = mkCl p.name  (mkV2 (mkV "puhua") partitive) lang ;
    AThirsty p = E.AdvExistNP (SyntaxFin.mkAdv on_Prep p.name) (mkNP (mkN "janu")) ;
    ATired p = mkCl p.name (caseV partitive (mkV "väsyttää")) ;
    AUnderstand p = mkCl p.name (mkV "ymmärtää") ;
    AWant p obj = mkCl p.name (mkV2 "haluta") obj ;
    AWantGo p place = mkCl p.name want_VV (mkVP (mkVP L.go_V) place.to) ;

-- miscellaneous

-- Kaarel: if I change "maksaa" to "maksma" then I get this error:
-- gf: evalTerm (tk 1 (error ("expected" ++ "infinitive," ++ "found" ++ "maksma") ! 1) + "n")

    QWhatName p = mkQS (mkQCl whatSg_IP (mkVP (nameOf p))) ;
    QWhatAge p = mkQS (mkQCl (E.ICompAP (mkAP L.old_A)) p.name) ;
    HowMuchCost item = mkQS (mkQCl how8much_IAdv (mkCl item (mkV "maksaa"))) ;
    ItCost item price = mkCl item (mkV2 (mkV "maksaa")) price ;

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
    Son = xOf sing L.boy_N ;
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

    Tomorrow = ParadigmsFin.mkAdv "homme" ;

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
      mkQS (mkQCl (mkCl (mkVP (mkVP (mkVP (mkV "päästä")) trans.by) place.to))) ;
      -- pääseekö keskustaan bussilla
      -- mkQS (mkQCl (E.AdvPredNP place.to L.go_V (E.PartCN (trans.name)))) ;
      -- meneekö keskustaan bussia

-- modifiers of places

    TheBest = mkSuperl L.good_A ;
    TheClosest = mkSuperl (mkA (mkN "lähedal") "lähem" "lähim") ;
    TheCheapest = mkSuperl (mkA (mkN "odav") "odavam" "odavaim") ;
    TheMostExpensive = mkSuperl (mkA (mkN "kallis") "kallim" "kalleim") ;
    TheMostPopular = mkSuperl (mkA "populaarne") ;
    TheWorst = mkSuperl (mkA "halb") ;

    SuperlPlace sup p = placeNP sup p ;

  oper
    mkNat : PN -> PN -> A ->
      {lang : NP ; prop : A ; country : NP} = \nat,co,pro ->
        {lang = mkNP nat ;
         prop = pro ;
         country = mkNP co
        } ;

    ---- using overloaded paradigms slows down compilation dramatically
    mkDay : PN -> Str -> {name : NP ; point : Adv ; habitual : Adv} = \d,s ->
      let day = mkNP d in
      {name = day ;
       point = SyntaxFin.mkAdv (casePrep essive) day ;
       habitual = ParadigmsFin.mkAdv s
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

    xOf : GNumber -> N -> NPPerson -> NPPerson = \n,x,p ->
      relativePerson n (mkCN x) (\a,b,c -> mkNP (E.GenNP b) a c) p ;

    nameOf : NPPerson -> NP = \p -> (xOf sing L.name_N p).name ;

  oper
    -- do you have a table for five persons
    haveForPerson : NP -> CN -> Card -> Cl = \p,a,n ->
      mkCl p have_V2
----      (mkNP (E.PartCN a)  ---- partitive works in questions )
        (mkNP (mkNP a_Det a)
           (SyntaxFin.mkAdv for_Prep (mkNP n (mkN "henki" "henkiä")))) ;
----       (SyntaxFin.mkAdv for_Prep (mkNP (mkDet n)))) ; -- 60s faster compile 25/10/2010

    open_Adv = ParadigmsFin.mkAdv "avatud" ;
    closed_Adv = ParadigmsFin.mkAdv "suletud" ;

    mkTransport : N -> {name : CN ; by : Adv} = \n -> {
      name = mkCN n ;
      by = SyntaxFin.mkAdv (casePrep adessive) (mkNP n)
      } ;

    mkSuperl : A -> Det = \a -> mkDet the_Quant (mkOrd a) ;

    far_IAdv = E.IAdvAdv L.far_Adv ;
}
