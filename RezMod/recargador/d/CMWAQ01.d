EXTEND_TOP VICTOR 17
	IF ~PartyHasItem("CMWAQ01")~ THEN REPLY ~Here's a Wand of Stone Form!~ GOTO ready
END

APPEND VICTOR
  IF ~~ THEN BEGIN ready
      SAY ~Wand of Stone Form so good! Need 4000 nom noms!~
	  IF ~~ THEN REPLY @39 GOTO 17
	  IF ~PartyGoldGT(3999)~ THEN REPLY @40 DO ~TakePartyGold(4000) 
												 DestroyGold(4000) 	
												 TakePartyItem("CMWAQ01") 
												 SetGlobal("Recar2","GLOBAL",103)~ GOTO 49
	  IF ~~ THEN REPLY @41 EXIT
  END
END
  
EXTEND_BOTTOM VICTOR 50
	IF ~Global("Recar2","GLOBAL",103)~  THEN DO ~GiveItemCreate("CMWAQ01",LastTalkedToBy,100,0,0) 
												 SetGlobal("Recar2","GLOBAL",0)~ REPLY @42 EXIT
END