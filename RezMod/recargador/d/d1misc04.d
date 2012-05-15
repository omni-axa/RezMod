EXTEND_TOP VICTOR 17
	IF ~PartyHasItem("d1misc04")~ THEN REPLY ~Here's a Wand of Protection!~ GOTO ready
END

APPEND VICTOR
  IF ~~ THEN BEGIN ready
      SAY ~A Wand of Protection? Some exotic stuff you have here my friend! I'll need 24000 gold to fully recharge this.~
	  IF ~~ THEN REPLY @39 GOTO 17
	  IF ~PartyGoldGT(23999)~ THEN REPLY @40 DO ~TakePartyGold(24000)
												 DestroyGold(24000)
												 TakePartyItem("d1misc04")
												 SetGlobal("Recar2","GLOBAL",110)~ GOTO 49
	  IF ~~ THEN REPLY @41 EXIT
  END
END

EXTEND_BOTTOM VICTOR 50
	IF ~Global("Recar2","GLOBAL",110)~  THEN DO ~GiveItemCreate("d1misc04",LastTalkedToBy,30,0,0)
												 SetGlobal("Recar2","GLOBAL",0)~ REPLY @42 EXIT
END