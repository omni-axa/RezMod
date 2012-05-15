EXTEND_TOP VICTOR 17
	IF ~PartyHasItem("wandhl")~ THEN REPLY ~Here's a Wand of Allheal!~ GOTO ready
END

APPEND VICTOR
  IF ~~ THEN BEGIN ready
      SAY ~A Wand of Allheal? Some exotic stuff you have here my friend! I'll need 14000 gold to fully recharge this.~
	  IF ~~ THEN REPLY @39 GOTO 17
	  IF ~PartyGoldGT(13999)~ THEN REPLY @40 DO ~TakePartyGold(14000)
												 DestroyGold(14000)
												 TakePartyItem("wandhl")
												 SetGlobal("Recar2","GLOBAL",101)~ GOTO 49
	  IF ~~ THEN REPLY @41 EXIT
  END
END

EXTEND_BOTTOM VICTOR 50
	IF ~Global("Recar2","GLOBAL",101)~  THEN DO ~GiveItemCreate("wandhl",LastTalkedToBy,250,0,0)
												 SetGlobal("Recar2","GLOBAL",0)~ REPLY @42 EXIT
END