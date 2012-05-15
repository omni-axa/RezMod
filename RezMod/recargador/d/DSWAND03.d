EXTEND_TOP VICTOR 17
	IF ~PartyHasItem("dswand03")~ THEN REPLY ~Here's a Wand of Chain Lightning!~ GOTO ready
END

APPEND VICTOR
  IF ~~ THEN BEGIN ready
      SAY ~A Wand of Chain Lightning? Some exotic stuff you have here my friend! I'll need 4500 gold to fully recharge this.~
	  IF ~~ THEN REPLY @39 GOTO 17
	  IF ~PartyGoldGT(4499)~ THEN REPLY @40 DO ~TakePartyGold(4500)
												 DestroyGold(4500)
												 TakePartyItem("dswand03")
												 SetGlobal("Recar2","GLOBAL",108)~ GOTO 49
	  IF ~~ THEN REPLY @41 EXIT
  END
END

EXTEND_BOTTOM VICTOR 50
	IF ~Global("Recar2","GLOBAL",108)~  THEN DO ~GiveItemCreate("dswand03",LastTalkedToBy,100,0,0)
												 SetGlobal("Recar2","GLOBAL",0)~ REPLY @42 EXIT
END