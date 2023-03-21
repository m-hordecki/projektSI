;;; ***************************
;;; * DEFTEMPLATES & DEFFACTS *
;;; ***************************

(deftemplate UI-state
   (slot id (default-dynamic (gensym*)))
   (slot display)
   (slot relation-asserted (default none))
   (slot response (default none))
   (multislot valid-answers)
   (slot state (default middle)))
   
(deftemplate state-list
   (slot current)
   (multislot sequence))

   
(deffacts startup
   (state-list))
   

;;;****************
;;;* STARTUP RULE *
;;;****************

(defrule system-banner ""

  =>
  
  (assert (UI-state (display WelcomeMessage)
                    (relation-asserted start)
                    (state initial)
                    (valid-answers))))

;;;***************
;;;* QUERY RULES *
;;;***************

(defrule determine-FicNonFic ""

   (logical (start))

   =>

   (assert (UI-state (display FicNonFic)
                     (relation-asserted main-genre)
                     (response Fic)
                     (valid-answers Fic NonFic))))
   
(defrule determine-What-Fic ""

   (logical (main-genre Fic))

   =>

   (assert (UI-state (display WhatFic)
                     (relation-asserted med-genre)
                     (response ClassFic)
                     (valid-answers ClassFic ContFic))))
                     
(defrule determine-what-small-genreClassFic ""

   (logical (med-genre ClassFic))

   =>

   (assert (UI-state (display WhatInterests)
                     (relation-asserted small-genre-ClassFic)
                     (response HiSoc)
                     (valid-answers HiSoc SocIss AdvTime Amer Fant ClassicSiFi MagReal ShortStoriesClassic Poetry))))
                                     

(defrule determine-what-small-genreContFic ""

   (logical (med-genre ContFic))

   =>

   (assert (UI-state (display WhatInterests)
                     (relation-asserted small-genre-ContFic)
                     (response HistFic)
                     (valid-answers HistFic SthMyst ViolYouth DarkFic SciFic Symbols ShortStoriesCont SthDifferent KidsProblems))))
                     
(defrule determine-interest-nonfic ""

   (logical (main-genre NonFic))

   =>

   (assert (UI-state (display WhatInterests)
                     (relation-asserted small-genre)
                     (response Tragedy)
                     (valid-answers Tragedy TrueCrime TalesWar Survival Science GoodOldDays SocialTheory Sports Epicurious Biography AutoBiog))))
   
   

(defrule determine-sort-tragedy ""

   (logical (small-genre Tragedy))

   =>

   (assert (UI-state (display WhatSortOf)
                     (relation-asserted final-book)
                     (response A_tall_cold_one)
                     (valid-answers A_tall_cold_one The_Titanic))))
   
(defrule determine-sort-truecrime ""

   (logical (small-genre TrueCrime))

   =>

   (assert (UI-state (display WhatSortOf)
                     (relation-asserted final-book)
                     (response Home_on_the_range)
                     (valid-answers Home_on_the_range Worlds_fair_murders))))

(defrule determine-sort-talesofwar ""

   (logical (small-genre TalesWar))

   =>

   (assert (UI-state (display WhatSortOf)
                     (relation-asserted final-book)
                     (response Wwii_japan)
                     (valid-answers Wwii_japan Post_911_Iraq))))
                     
(defrule determine-sort-Survival ""

   (logical (small-genre Survival))

   =>

   (assert (UI-state (display WhatSortOf)
                     (relation-asserted final-book)
                     (response Plane_crash)
                     (valid-answers Plane_crash Trapped_alone Apartheid Nazi_germany))))
                     
(defrule determine-sort-GoodOldDays ""

   (logical (small-genre GoodOldDays))

   =>

   (assert (UI-state (display WhatSortOf)
                     (relation-asserted final-book)
                     (response American_class_struggle)
                     (valid-answers American_class_struggle Women_and_journalism))))
                     
             
(defrule determine-sort-SocialTheory ""

   (logical (small-genre SocialTheory))

   =>

   (assert (UI-state (display WhatSortOf)
                     (relation-asserted final-book)
                     (response Cause_and_effect)
                     (valid-answers Cause_and_effect An_idea_takes_hold))))
                     
                    
(defrule determine-sort-Science ""

   (logical (small-genre Science))

   =>

   (assert (UI-state (display WhatSortOf)
                     (relation-asserted final-book)
                     (response String_theory)
                     (valid-answers String_theory Human_evolution)))) 
                     
(defrule determine-sort-Epicurious ""

   (logical (small-genre Epicurious))

   =>

   (assert (UI-state (display WhatSortOf)
                     (relation-asserted final-book)
                     (response Junk_food)
                     (valid-answers Junk_food Different_food))))    
                     
(defrule determine-sort-Sports ""

   (logical (small-genre Sports))

   =>

   (assert (UI-state (display WhatSortOf)
                     (relation-asserted final-book)
                     (response Swimming_the_distance)
                     (valid-answers Swimming_the_distance The_great_game))))       
                     
(defrule determine-sort-Biography ""

   (logical (small-genre Biography))

   =>

   (assert (UI-state (display WhatSortOf)
                     (relation-asserted final-book)
                     (response Nice_cells)
                     (valid-answers Nice_cells Number_two)))) 
                     
(defrule determine-sort-AutoBiog ""

   (logical (small-genre AutoBiog))

   =>

   (assert (UI-state (display WhatSortOf)
                     (relation-asserted final-book)
                     (response Hacks)
                     (valid-answers Hacks Use_your_words))))   
                     
                     

(defrule determine-sort-HistFic ""

   (logical (small-genre-ContFic HistFic))

   =>

   (assert (UI-state (display WhatSortOf)
                     (relation-asserted xs-genre)
                     (response FoulPlay)
                     (valid-answers FoulPlay ThePoliticalScene FamilyTies GodBless))))  

(defrule determine-sort-FoulPlay ""

   (logical (xs-genre FoulPlay))

   =>

   (assert (UI-state (display xsWhatSortOf)
                     (relation-asserted final-book)
                     (response This_island_is_not_big_enough)
                     (valid-answers This_island_is_not_big_enough Poetic_serial_killer)))) 
                     
                     
(defrule determine-sort-ThePoliticalScene ""

   (logical (xs-genre ThePoliticalScene))

   =>

   (assert (UI-state (display xsWhatSortOf)
                     (relation-asserted final-book)
                     (response A_dark_what_if)
                     (valid-answers A_dark_what_if Real_estate_and_island_living)))) 

(defrule determine-sort-FamilyTies ""

   (logical (xs-genre FamilyTies))

   =>

   (assert (UI-state (display xsWhatSortOf)
                     (relation-asserted final-book)
                     (response I_want_a_baby_brother)
                     (valid-answers I_want_a_baby_brother Tragedy_strikes))))
                     
(defrule determine-sort-GodBless ""

   (logical (xs-genre GodBless))

   =>

   (assert (UI-state (display xsWhatSortOf)
                     (relation-asserted final-book)
                     (response Catholicism_in_the_wild_west)
                     (valid-answers Catholicism_in_the_wild_west A_missionary_family_in_Africa The_corner_stone))))     
                  

(defrule determine-sort-SthMyst ""

   (logical (small-genre-ContFic SthMyst))

   =>

   (assert (UI-state (display WhatSortOf)
                     (relation-asserted final-book)
                     (response Family)
                     (valid-answers Family Murder))))

(defrule determine-sort-ViolYouth ""

   (logical (small-genre-ContFic ViolYouth))

   =>

   (assert (UI-state (display WhatSortOf)
                     (relation-asserted final-book)
                     (response Military_therapy)
                     (valid-answers Military_therapy Teen_angst School_shooting Afgan_caste_system Child_soldiers))))
  
                     
(defrule determine-sort-DarkFic ""

   (logical (small-genre-ContFic DarkFic))

   =>

   (assert (UI-state (display WhatSortOf)
                     (relation-asserted final-book)
                     (response A_family_in_captivity)
                     (valid-answers A_family_in_captivity Ghost_in_the_room Memory_of_the_troubled_family))))    
                     
(defrule determine-sort-SciFic ""

   (logical (small-genre-ContFic SciFic))

   =>

   (assert (UI-state (display WhatSortOf)
                     (relation-asserted xs-genre)
                     (response DarkFutures)
                     (valid-answers DarkFutures Aliens))))    
                     
                     
(defrule determine-sort-DarkFutures ""

   (logical (xs-genre DarkFutures))

   =>

   (assert (UI-state (display xsWhatSortOf)
                     (relation-asserted final-book)
                     (response Pro_life)
                     (valid-answers Pro_life Future_internet Harvest_the_clones Drug_lords_and_clones Where_do_you_think_youre_going)))) 
     
                     
(defrule determine-sort-Aliens ""

   (logical (xs-genre Aliens))

   =>

   (assert (UI-state (display xsWhatSortOf)
                     (relation-asserted final-book)
                     (response Fighting_an_invasion)
                     (valid-answers Fighting_an_invasion Humorous_space_romp)))) 
                 
                     
(defrule determine-sort-Symbols ""

   (logical (small-genre-ContFic Symbols))

   =>

   (assert (UI-state (display WhatSortOf)
                     (relation-asserted final-book)
                     (response Comming_of_age_as_an_outsider_in_a_new_land)
                     (valid-answers Comming_of_age_as_an_outsider_in_a_new_land Growing_up_under_an_oppressive_regime Survival_and_struggle))))                                                                                                                               
                         
                         
(defrule determine-sort-ShortStoriesCont ""

   (logical (small-genre-ContFic ShortStoriesCont))

   =>

   (assert (UI-state (display WhatSortOf)
                     (relation-asserted final-book)
                     (response Fantastical)
                     (valid-answers Fantastical Family_life Sports_on_and_off_the_field))))                                                                                                                               
                

(defrule determine-sort-SthDifferent ""

   (logical (small-genre-ContFic SthDifferent))

   =>

   (assert (UI-state (display WhatSortOf)
                     (relation-asserted final-book)
                     (response Beauty_and_the_beast_in_New_York)
                     (valid-answers Beauty_and_the_beast_in_New_York Philosophical_dog Sports_and_drugs))))   
                     
                     
(defrule determine-sort-KidsProblems ""

   (logical (small-genre-ContFic KidsProblems))

   =>

   (assert (UI-state (display WhatSortOf)
                     (relation-asserted xs-genre)
                     (response ToughSit)
                     (valid-answers ToughSit Trans))))  
              
                     
(defrule determine-sort-ToughSit ""

   (logical (xs-genre ToughSit))

   =>

   (assert (UI-state (display xsWhatSortOf)
                     (relation-asserted final-book)
                     (response Picking_up_the_pieces)
                     (valid-answers Picking_up_the_pieces Coming_of_age_with_new_options New_dad New_mom)))) 


(defrule determine-sort-Trans ""

   (logical (xs-genre Trans))

   =>

   (assert (UI-state (display xsWhatSortOf)
                     (relation-asserted final-book)
                     (response An_underdog_rises)
                     (valid-answers An_underdog_rises Troubled_youth Relationship_strife))))    
                     
                     

(defrule determine-sort-HiSoc ""

   (logical (small-genre-ClassFic HiSoc))

   =>

   (assert (UI-state (display WhatSortOf)
                     (relation-asserted xs-genre)
                     (response RelIntri)
                     (valid-answers RelIntri RussLit English))))     
                     
(defrule determine-sort-RelIntri ""

   (logical (xs-genre RelIntri))

   =>

   (assert (UI-state (display xsWhatSortOf)
                     (relation-asserted final-book)
                     (response New_money)
                     (valid-answers New_money Old_money)))) 


(defrule determine-sort-RussLit ""

   (logical (xs-genre RussLit))

   =>

   (assert (UI-state (display xsWhatSortOf)
                     (relation-asserted final-book)
                     (response Narcissism)
                     (valid-answers Narcissism Nihilism)))) 


(defrule determine-sort-English ""

   (logical (xs-genre English))

   =>

   (assert (UI-state (display xsWhatSortOf)
                     (relation-asserted final-book)
                     (response Make_it_a_play)
                     (valid-answers Make_it_a_play Growing_up_rich A_fall_from_grace))))   
                     

(defrule determine-sort-SocIss ""

   (logical (small-genre-ClassFic SocIss))

   =>

   (assert (UI-state (display WhatSortOf)
                     (relation-asserted xs-genre)
                     (response DoYouHaveClass)
                     (valid-answers DoYouHaveClass RaceAmerica Political_allegory)))) 
                     
                     
(defrule determine-sort-DoYouHaveClass ""

   (logical (xs-genre DoYouHaveClass))

   =>

   (assert (UI-state (display xsWhatSortOf)
                     (relation-asserted final-book)
                     (response England)
                     (valid-answers England France))))                        


(defrule determine-sort-RaceAmerica ""

   (logical (xs-genre RaceAmerica))

   =>

   (assert (UI-state (display xsWhatSortOf)
                     (relation-asserted final-book)
                     (response Post_slavery)
                     (valid-answers Post_slavery Pre_slavery))))
                     
                     
(defrule determine-sort-AdvTime ""

   (logical (small-genre-ClassFic AdvTime))

   =>

   (assert (UI-state (display WhatSortOf)
                     (relation-asserted xs-genre)
                     (response LetsPlayWar)
                     (valid-answers LetsPlayWar LookForSth))))
                     


(defrule determine-sort-LetsPlayWar ""

   (logical (xs-genre LetsPlayWar))

   =>

   (assert (UI-state (display xsWhatSortOf)
                     (relation-asserted final-book)
                     (response Spanish_civil_war)
                     (valid-answers Spanish_civil_war World_War_II))))   
                     
                     
(defrule determine-sort-LookForSth ""

   (logical (xs-genre LookForSth))

   =>

   (assert (UI-state (display xsWhatSortOf)
                     (relation-asserted final-book)
                     (response Pure_evil)
                     (valid-answers Pure_evil An_epic_hunt Revenge))))
                     
                     
                       
(defrule determine-sort-Amer ""

   (logical (small-genre-ClassFic Amer))

   =>

   (assert (UI-state (display WhatSortOf)
                     (relation-asserted final-book)
                     (response California)
                     (valid-answers California The_south))))
                     
                     
(defrule determine-sort-Fant ""

   (logical (small-genre-ClassFic Fant))

   =>

   (assert (UI-state (display WhatSortOf)
                     (relation-asserted final-book)
                     (response Absurdist_mutation)
                     (valid-answers Absurdist_mutation Massive_epic Dont_bite_me_bro))))
 
 
(defrule determine-sort-ClassicSiFi ""

   (logical (small-genre-ClassFic ClassicSiFi))

   =>

   (assert (UI-state (display WhatSortOf)
                     (relation-asserted xs-genre)
                     (response CantWaitFuture)
                     (valid-answers CantWaitFuture Time_travel End_of_the_world)))) 
                     


(defrule determine-sort-CantWaitFuture ""

   (logical (xs-genre CantWaitFuture))

   =>

   (assert (UI-state (display xsWhatSortOf)
                     (relation-asserted final-book)
                     (response Information_control)
                     (valid-answers Information_control Genetically_engineered_humans Thought_police))))
                     

(defrule determine-sort-MagReal ""

   (logical (small-genre-ClassFic MagReal))

   =>

   (assert (UI-state (display WhatSortOf)
                     (relation-asserted final-book)
                     (response An_individuals_plight)
                     (valid-answers An_individuals_plight Epic)))) 
                     

(defrule determine-sort-Poetry ""

   (logical (small-genre-ClassFic Poetry))

   =>

   (assert (UI-state (display WhatSortOf)
                     (relation-asserted xs-genre)
                     (response ContPoet)
                     (valid-answers ContPoet YoungWords AmerClassic))))   
                     
                     
(defrule determine-sort-ContPoet ""

   (logical (xs-genre ContPoet))

   =>

   (assert (UI-state (display xsWhatSortOf)
                     (relation-asserted final-book)
                     (response Collections)
                     (valid-answers Collections One_men_show))))  
                     
                     
(defrule determine-sort-YoungWords ""

   (logical (xs-genre YoungWords))

   =>

   (assert (UI-state (display xsWhatSortOf)
                     (relation-asserted final-book)
                     (response By_boys)
                     (valid-answers By_boys By_girls))))  
                     
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
;;;****************
;;;* FINAL BOOK RULES *
;;;****************

(defrule final-A_tall_cold_one "" (logical (final-book A_tall_cold_one)) => (assert (UI-state (display ITAJK)(state final))))
(defrule final-The_Titanic "" (logical (final-book The_Titanic)) => (assert (UI-state (display ANTRWL)(state final))))
(defrule final-Political_allegory "" (logical (xs-genre Political_allegory)) => (assert (UI-state (display AFGO)(state final))))
(defrule determine-sort-ShortStoriesClassic "" (logical (small-genre-ClassFic ShortStoriesClassic)) => (assert (UI-state (display STEAP)(state final))))
(defrule determine-sort-AmerClassic "" (logical (xs-genre AmerClassic)) => (assert (UI-state (display TCPLH)(state final))))              
(defrule final-England "" (logical (final-book England)) => (assert (UI-state (display OTCD)(state final))))
(defrule final-France "" (logical (final-book France)) => (assert (UI-state (display LMVH)(state final))))
(defrule final-New_money "" (logical (final-book New_money)) => (assert (UI-state (display TGGFSF)(state final))))
(defrule final-Old_money "" (logical (final-book Old_money)) => (assert (UI-state (display RDDM)(state final))))
(defrule final-Post_slavery "" (logical (final-book Post_slavery)) => (assert (UI-state (display CPAW)(state final))))
(defrule final-Pre_slavery "" (logical (final-book Pre_slavery)) => (assert (UI-state (display UTCHBS)(state final))))
(defrule final-Narcissism "" (logical (final-book Narcissism)) => (assert (UI-state (display AKLT)(state final))))
(defrule final-Nihilism "" (logical (final-book Nihilism)) => (assert (UI-state (display FASIT)(state final))))
(defrule final-Make_it_a_play "" (logical (final-book Make_it_a_play)) => (assert (UI-state (display TTOTSWS)(state final))))
(defrule final-Growing_up_rich "" (logical (final-book Growing_up_rich)) => (assert (UI-state (display JECB)(state final))))
(defrule final-A_fall_from_grace "" (logical (final-book A_fall_from_grace)) => (assert (UI-state (display SASJA)(state final))))
(defrule final-California "" (logical (final-book California)) => (assert (UI-state (display OMAMJS)(state final))))
(defrule final-The_south "" (logical (final-book The_south)) => (assert (UI-state (display AOHFMT)(state final))))
(defrule final-Spanish_civil_war "" (logical (final-book Spanish_civil_war)) => (assert (UI-state (display FWTBTEH)(state final))))
(defrule final-World_War_II "" (logical (final-book World_War_II)) => (assert (UI-state (display C2JH)(state final))))
(defrule final-Absurdist_mutation "" (logical (final-book Absurdist_mutation)) => (assert (UI-state (display TMFK)(state final))))
(defrule final-Pure_evil "" (logical (final-book Pure_evil)) => (assert (UI-state (display HODJC)(state final))))
(defrule final-An_epic_hunt "" (logical (final-book An_epic_hunt)) => (assert (UI-state (display MDHM)(state final))))
(defrule final-Revenge "" (logical (final-book Revenge)) => (assert (UI-state (display TCOMCAD)(state final))))
(defrule final-Massive_epic "" (logical (final-book Massive_epic)) => (assert (UI-state (display LOTRJRRT)(state final))))
(defrule final-Information_control "" (logical (final-book Information_control)) => (assert (UI-state (display F4RB)(state final))))
(defrule final-Genetically_engineered_humans "" (logical (final-book Genetically_engineered_humans)) => (assert (UI-state (display BNWAH)(state final))))
(defrule final-Thought_police "" (logical (final-book Thought_police)) => (assert (UI-state (display 1GO)(state final))))
(defrule final-Dont_bite_me_bro "" (logical (final-book Dont_bite_me_bro)) => (assert (UI-state (display IALRM)(state final))))
(defrule final-Time_travel "" (logical (xs-genre Time_travel)) => (assert (UI-state (display SHFKVJ)(state final))))
(defrule final-End_of_the_world "" (logical (xs-genre End_of_the_world)) => (assert (UI-state (display CCKVJ)(state final))))
(defrule final-An_individuals_plight "" (logical (final-book An_individuals_plight)) => (assert (UI-state (display TPODGOW)(state final))))
(defrule final-Epic "" (logical (final-book Epic)) => (assert (UI-state (display OHYOSGGM)(state final))))
(defrule final-The_one_and_only "" (logical (final-book The_one_and_only)) => (assert (UI-state (display STEAP)(state final))))
(defrule final-Collections "" (logical (final-book Collections)) => (assert (UI-state (display P1BC)(state final))))
(defrule final-One_men_show "" (logical (final-book One_men_show)) => (assert (UI-state (display SAATRBC)(state final))))
(defrule final-By_boys "" (logical (final-book By_boys)) => (assert (UI-state (display YHMBF)(state final))))
(defrule final-By_girls "" (logical (final-book By_girls)) => (assert (UI-state (display TIHTTYBF)(state final))))
(defrule final-American_classi "" (logical (final-book American_classi)) => (assert (UI-state (display TCPLH)(state final))))
(defrule final-Family "" (logical (final-book Family)) => (assert (UI-state (display ELAICJSF)(state final))))
(defrule final-Murder "" (logical (final-book Murder)) => (assert (UI-state (display TCIOTDITNMH)(state final))))
(defrule final-This_island_is_not_big_enough "" (logical (final-book This_island_is_not_big_enough)) => (assert (UI-state (display SFOCDG)(state final))))
(defrule final-Poetic_serial_killer "" (logical (final-book Poetic_serial_killer)) => (assert (UI-state (display DCMP)(state final))))
(defrule final-Military_therapy "" (logical (final-book Military_therapy)) => (assert (UI-state (display BCTS)(state final))))
(defrule final-A_dark_what_if "" (logical (final-book A_dark_what_if)) => (assert (UI-state (display TPAAPR)(state final))))
(defrule final-Real_estate_and_island_living "" (logical (final-book Real_estate_and_island_living)) => (assert (UI-state (display TDDHST)(state final))))
(defrule final-Teen_angst "" (logical (final-book Teen_angst)) => (assert (UI-state (display FSA)(state final))))
(defrule final-School_shooting "" (logical (final-book School_shooting)) => (assert (UI-state (display NMJP)(state final))))
(defrule final-I_want_a_baby_brother "" (logical (final-book I_want_a_baby_brother)) => (assert (UI-state (display HBKO)(state final))))
(defrule final-Tragedy_strikes "" (logical (final-book Tragedy_strikes)) => (assert (UI-state (display AGATBLB)(state final))))
(defrule final-Afgan_caste_system "" (logical (final-book Afgan_caste_system)) => (assert (UI-state (display KRKH)(state final))))
(defrule final-A_missionary_family_in_Africa "" (logical (final-book A_missionary_family_in_Africa)) => (assert (UI-state (display TPBBK)(state final))))
(defrule final-Catholicism_in_the_wild_west "" (logical (final-book Catholicism_in_the_wild_west)) => (assert (UI-state (display DCFTAWC)(state final))))
(defrule final-The_corner_stone "" (logical (final-book The_corner_stone)) => (assert (UI-state (display TPOTEKF)(state final))))
(defrule final-Child_soldiers "" (logical (final-book Child_soldiers)) => (assert (UI-state (display WITWDE)(state final))))
(defrule final-Memory_of_the_troubled_family "" (logical (final-book Memory_of_the_troubled_family)) => (assert (UI-state (display TBAMA)(state final))))
(defrule final-Ghost_in_the_room "" (logical (final-book Ghost_in_the_room)) => (assert (UI-state (display LBAS)(state final))))
(defrule final-A_family_in_captivity "" (logical (final-book A_family_in_captivity)) => (assert (UI-state (display RED)(state final))))
(defrule final-Fighting_an_invasion "" (logical (final-book Fighting_an_invasion)) => (assert (UI-state (display EGOSC)(state final))))
(defrule final-Humorous_space_romp "" (logical (final-book Humorous_space_romp)) => (assert (UI-state (display THGTTGDA)(state final))))
(defrule final-Comming_of_age_as_an_outsider_in_a_new_land "" (logical (final-book Comming_of_age_as_an_outsider_in_a_new_land)) => (assert (UI-state (display ABCLYLP)(state final))))
(defrule final-Growing_up_under_an_oppressive_regime "" (logical (final-book Growing_up_under_an_oppressive_regime)) => (assert (UI-state (display PMS)(state final))))
(defrule final-Survival_and_struggle "" (logical (final-book Survival_and_struggle)) => (assert (UI-state (display MAS)(state final))))
(defrule final-Home_on_the_range "" (logical (final-book Home_on_the_range)) => (assert (UI-state (display ICBTC)(state final))))
(defrule final-Worlds_fair_murders "" (logical (final-book Worlds_fair_murders)) => (assert (UI-state (display DIWCEL)(state final))))
(defrule final-Nazi_germany "" (logical (final-book Nazi_germany)) => (assert (UI-state (display IWPYLALTLH)(state final))))
(defrule final-Apartheid "" (logical (final-book Apartheid)) => (assert (UI-state (display KBMM)(state final))))
(defrule final-Trapped_alone "" (logical (final-book Trapped_alone)) => (assert (UI-state (display BARAAHPAR)(state final))))
(defrule final-Plane_crash "" (logical (final-book Plane_crash)) => (assert (UI-state (display ULH)(state final))))
(defrule final-Wwii_japan "" (logical (final-book Wwii_japan)) => (assert (UI-state (display HJH)(state final))))
(defrule final-Post_911_Iraq "" (logical (final-book Post_911_Iraq)) => (assert (UI-state (display ILIECRC)(state final))))
(defrule final-String_theory "" (logical (final-book String_theory)) => (assert (UI-state (display TEUBG)(state final))))
(defrule final-Human_evolution "" (logical (final-book Human_evolution)) => (assert (UI-state (display TNADM)(state final))))
(defrule final-Cause_and_effect "" (logical (final-book Cause_and_effect)) => (assert (UI-state (display FSDLSJD)(state final))))
(defrule final-An_idea_takes_hold "" (logical (final-book An_idea_takes_hold)) => (assert (UI-state (display TPMG)(state final))))
(defrule final-American_class_struggle "" (logical (final-book American_class_struggle)) => (assert (UI-state (display NOTDKG)(state final))))
(defrule final-Women_and_journalism "" (logical (final-book Women_and_journalism)) => (assert (UI-state (display WWATNCG)(state final))))
(defrule final-Junk_food "" (logical (final-book Junk_food)) => (assert (UI-state (display FFNES)(state final))))
(defrule final-Different_food "" (logical (final-book Different_food)) => (assert (UI-state (display TODMP)(state final))))
(defrule final-Swimming_the_distance "" (logical (final-book Swimming_the_distance)) => (assert (UI-state (display SALC)(state final))))
(defrule final-The_great_game "" (logical (final-book The_great_game)) => (assert (UI-state (display FNLHGB)(state final))))
(defrule final-Use_your_words "" (logical (final-book Use_your_words)) => (assert (UI-state (display IKWTCBSMA)(state final))))
(defrule final-Hacks "" (logical (final-book Hacks)) => (assert (UI-state (display GITWKM)(state final))))
(defrule final-Nice_cells "" (logical (final-book Nice_cells)) => (assert (UI-state (display TILOHLRS)(state final))))
(defrule final-Number_two "" (logical (final-book Number_two)) => (assert (UI-state (display JADM)(state final))))
(defrule final-An_underdog_rises "" (logical (final-book An_underdog_rises)) => (assert (UI-state (display TLHA)(state final))))
(defrule final-Troubled_youth "" (logical (final-book Troubled_youth)) => (assert (UI-state (display TCOAHGMB)(state final))))
(defrule final-Relationship_strife "" (logical (final-book Relationship_strife)) => (assert (UI-state (display JLSD)(state final))))
(defrule final-Picking_up_the_pieces "" (logical (final-book Picking_up_the_pieces)) => (assert (UI-state (display IISGF)(state final))))
(defrule final-Coming_of_age_with_new_options "" (logical (final-book Coming_of_age_with_new_options)) => (assert (UI-state (display TCB)(state final))))
(defrule final-New_dad "" (logical (final-book New_dad)) => (assert (UI-state (display FPLAJ)(state final))))
(defrule final-New_mom "" (logical (final-book New_mom)) => (assert (UI-state (display NBSMD)(state final))))
(defrule final-Beauty_and_the_beast_in_New_York "" (logical (final-book Beauty_and_the_beast_in_New_York)) => (assert (UI-state (display BAF)(state final))))
(defrule final-Philosophical_dog "" (logical (final-book Philosophical_dog)) => (assert (UI-state (display TAORITRGS)(state final))))
(defrule final-Sports_and_drugs "" (logical (final-book Sports_and_drugs)) => (assert (UI-state (display GCCD)(state final))))
(defrule final-Fantastical "" (logical (final-book Fantastical)) => (assert (UI-state (display TLRATFIHSA)(state final))))
(defrule final-Family_life "" (logical (final-book Family_life)) => (assert (UI-state (display UEJL)(state final))))
(defrule final-Sports_on_and_off_the_field "" (logical (final-book Sports_on_and_off_the_field)) => (assert (UI-state (display ASCC)(state final))))
(defrule final-Pro_life "" (logical (final-book Pro_life)) => (assert (UI-state (display UNS)(state final))))
(defrule final-Future_internet "" (logical (final-book Future_internet)) => (assert (UI-state (display FMTA)(state final))))
(defrule final-Harvest_the_clones "" (logical (final-book Harvest_the_clones)) => (assert (UI-state (display NLMGKI)(state final))))
(defrule final-Drug_lords_and_clones "" (logical (final-book Drug_lords_and_clones)) => (assert (UI-state (display THOTSNF)(state final))))
(defrule final-Where_do_you_think_youre_going "" (logical (final-book Where_do_you_think_youre_going)) => (assert (UI-state (display ICF)(state final))))                
                     
;;;*************************
;;;* GUI INTERACTION RULES *
;;;*************************

(defrule ask-question

   (declare (salience 5))
   
   (UI-state (id ?id))
   
   ?f <- (state-list (sequence $?s&:(not (member$ ?id ?s))))
             
   =>
   
   (modify ?f (current ?id)
              (sequence ?id ?s))
   
   (halt))

(defrule handle-next-no-change-none-middle-of-chain

   (declare (salience 10))
   
   ?f1 <- (next ?id)

   ?f2 <- (state-list (current ?id) (sequence $? ?nid ?id $?))
                      
   =>
      
   (retract ?f1)
   
   (modify ?f2 (current ?nid))
   
   (halt))

(defrule handle-next-response-none-end-of-chain

   (declare (salience 10))
   
   ?f <- (next ?id)

   (state-list (sequence ?id $?))
   
   (UI-state (id ?id)
             (relation-asserted ?relation))
                   
   =>
      
   (retract ?f)

   (assert (add-response ?id)))   

(defrule handle-next-no-change-middle-of-chain

   (declare (salience 10))
   
   ?f1 <- (next ?id ?response)

   ?f2 <- (state-list (current ?id) (sequence $? ?nid ?id $?))
     
   (UI-state (id ?id) (response ?response))
   
   =>
      
   (retract ?f1)
   
   (modify ?f2 (current ?nid))
   
   (halt))

(defrule handle-next-change-middle-of-chain

   (declare (salience 10))
   
   (next ?id ?response)

   ?f1 <- (state-list (current ?id) (sequence ?nid $?b ?id $?e))
     
   (UI-state (id ?id) (response ~?response))
   
   ?f2 <- (UI-state (id ?nid))
   
   =>
         
   (modify ?f1 (sequence ?b ?id ?e))
   
   (retract ?f2))
   
(defrule handle-next-response-end-of-chain

   (declare (salience 10))
   
   ?f1 <- (next ?id ?response)
   
   (state-list (sequence ?id $?))
   
   ?f2 <- (UI-state (id ?id)
                    (response ?expected)
                    (relation-asserted ?relation))
                
   =>
      
   (retract ?f1)

   (if (neq ?response ?expected)
      then
      (modify ?f2 (response ?response)))
      
   (assert (add-response ?id ?response)))   

(defrule handle-add-response

   (declare (salience 10))
   
   (logical (UI-state (id ?id)
                      (relation-asserted ?relation)))
   
   ?f1 <- (add-response ?id ?response)
                
   =>
      
   (str-assert (str-cat "(" ?relation " " ?response ")"))
   
   (retract ?f1))   

(defrule handle-add-response-none

   (declare (salience 10))
   
   (logical (UI-state (id ?id)
                      (relation-asserted ?relation)))
   
   ?f1 <- (add-response ?id)
                
   =>
      
   (str-assert (str-cat "(" ?relation ")"))
   
   (retract ?f1))   

(defrule handle-prev

   (declare (salience 10))
      
   ?f1 <- (prev ?id)
   
   ?f2 <- (state-list (sequence $?b ?id ?p $?e))
                
   =>
   
   (retract ?f1)
   
   (modify ?f2 (current ?p))
   
   (halt))
   
