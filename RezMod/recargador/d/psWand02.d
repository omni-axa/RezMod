EXTEND_TOP VICTOR 17
	IF ~PartyHasItem("psWand02")~ THEN REPLY ~Here's a Rod of Avarda Kedarva!~ GOTO ready
END

APPEND VICTOR
  IF ~~ THEN BEGIN ready
      SAY ~A Rod of Avarda Kedarva? Some exotic stuff you have here my friend! I'll need 21800 gold to fully recharge this.~
	  IF ~~ THEN REPLY @39 GOTO 17
	  IF ~PartyGoldGT(21799)~ THEN REPLY @40 DO ~TakePartyGold(21800)
												 DestroyGold(21800)
												 TakePartyItem("psWand02")
												 SetGlobal("Recar2","GLOBAL",112)~ GOTO 49
	  IF ~~ THEN REPLY @41 EXIT
  END
END

EXTEND_BOTTOM VICTOR 50
	IF ~Global("Recar2","GLOBAL",112)~  THEN DO ~GiveItemCreate("psWand02",LastTalkedToBy,5,0,0)
												 SetGlobal("Recar2","GLOBAL",0)~ REPLY @42 EXIT
END