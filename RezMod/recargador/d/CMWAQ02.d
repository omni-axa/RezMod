EXTEND_TOP VICTOR 17
	IF ~PartyHasItem("CMWAQ02")~ THEN REPLY ~Here's a Wand of Domination!~ GOTO ready
END

APPEND VICTOR
  IF ~~ THEN BEGIN ready
      SAY ~A Wand of Domination? Some exotic stuff you have here my friend! I'll need 4000 gold to fully recharge this.~
	  IF ~~ THEN REPLY @39 GOTO 17
	  IF ~PartyGoldGT(3999)~ THEN REPLY @40 DO ~TakePartyGold(4000)
												 DestroyGold(4000)
												 TakePartyItem("CMWAQ02")
												 SetGlobal("Recar2","GLOBAL",104)~ GOTO 49
	  IF ~~ THEN REPLY @41 EXIT
  END
END

EXTEND_BOTTOM VICTOR 50
	IF ~Global("Recar2","GLOBAL",104)~  THEN DO ~GiveItemCreate("CMWAQ02",LastTalkedToBy,100,0,0)
												 SetGlobal("Recar2","GLOBAL",0)~ REPLY @42 EXIT
END