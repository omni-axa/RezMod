EXTEND_TOP VICTOR 17
	IF ~PartyHasItem("bhwand1")~ THEN REPLY ~Here's a Wand of Cause Serious Wounds!~ GOTO ready
END

APPEND VICTOR
  IF ~~ THEN BEGIN ready
      SAY ~Wand of Cause Serious Wounds so good! Need 8000 nom noms!~
	  IF ~~ THEN REPLY @39 GOTO 17
	  IF ~PartyGoldGT(7999)~ THEN REPLY @40 DO ~TakePartyGold(8000) 
												 DestroyGold(8000) 	
												 TakePartyItem("bhwand1") 
												 SetGlobal("Recar2","GLOBAL",102)~ GOTO 49
	  IF ~~ THEN REPLY @41 EXIT
  END
END
  
EXTEND_BOTTOM VICTOR 50
	IF ~Global("Recar2","GLOBAL",102)~  THEN DO ~GiveItemCreate("bhwand1",LastTalkedToBy,100,0,0) 
												 SetGlobal("Recar2","GLOBAL",0)~ REPLY @42 EXIT
END