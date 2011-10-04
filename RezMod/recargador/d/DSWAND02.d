EXTEND_TOP VICTOR 17
	IF ~PartyHasItem("dswand02")~ THEN REPLY ~Here's the Sapphire Wand!~ GOTO ready
END

APPEND VICTOR
  IF ~~ THEN BEGIN ready
      SAY ~Sapphire Wand so good! Need 4400 nom noms!~
	  IF ~~ THEN REPLY @39 GOTO 17
	  IF ~PartyGoldGT(4399)~ THEN REPLY @40 DO ~TakePartyGold(4400) 
												 DestroyGold(4400) 	
												 TakePartyItem("dswand02") 
												 SetGlobal("Recar2","GLOBAL",107)~ GOTO 49
	  IF ~~ THEN REPLY @41 EXIT
  END
END
  
EXTEND_BOTTOM VICTOR 50
	IF ~Global("Recar2","GLOBAL",107)~  THEN DO ~GiveItemCreate("dswand02",LastTalkedToBy,100,0,0) 
												 SetGlobal("Recar2","GLOBAL",0)~ REPLY @42 EXIT
END