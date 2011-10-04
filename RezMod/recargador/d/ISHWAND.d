EXTEND_TOP VICTOR 17
	IF ~PartyHasItem("ishwand")~ THEN REPLY ~Here's a Wand of Escape!~ GOTO ready
END

APPEND VICTOR
  IF ~~ THEN BEGIN ready
      SAY ~Wand of Escape so good! Need 6500 nom noms!~
	  IF ~~ THEN REPLY @39 GOTO 17
	  IF ~PartyGoldGT(6499)~ THEN REPLY @40 DO ~TakePartyGold(6500) 
												 DestroyGold(6500) 	
												 TakePartyItem("ishwand") 
												 SetGlobal("Recar2","GLOBAL",109)~ GOTO 49
	  IF ~~ THEN REPLY @41 EXIT
  END
END
  
EXTEND_BOTTOM VICTOR 50
	IF ~Global("Recar2","GLOBAL",109)~  THEN DO ~GiveItemCreate("ishwand",LastTalkedToBy,20,0,0) 
												 SetGlobal("Recar2","GLOBAL",0)~ REPLY @42 EXIT
END