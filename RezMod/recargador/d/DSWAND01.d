EXTEND_TOP VICTOR 17
	IF ~PartyHasItem("dswand01")~ THEN REPLY ~Here's Ettin's Wand!~ GOTO ready
END

APPEND VICTOR
  IF ~~ THEN BEGIN ready
      SAY ~Ettin's Wand? Some exotic stuff you have here my friend! I'll need 2500 gold to fully recharge this.~
	  IF ~~ THEN REPLY @39 GOTO 17
	  IF ~PartyGoldGT(2499)~ THEN REPLY @40 DO ~TakePartyGold(2500)
												 DestroyGold(2500)
												 TakePartyItem("dswand01")
												 SetGlobal("Recar2","GLOBAL",106)~ GOTO 49
	  IF ~~ THEN REPLY @41 EXIT
  END
END

EXTEND_BOTTOM VICTOR 50
	IF ~Global("Recar2","GLOBAL",106)~  THEN DO ~GiveItemCreate("dswand01",LastTalkedToBy,100,0,0)
												 SetGlobal("Recar2","GLOBAL",0)~ REPLY @42 EXIT
END