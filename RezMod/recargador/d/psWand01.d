EXTEND_TOP VICTOR 17
	IF ~PartyHasItem("psWand01")~ THEN REPLY ~Here's a Stave of Jagged Lightning!~ GOTO ready
END

APPEND VICTOR
  IF ~~ THEN BEGIN ready
      SAY ~A Stave of Jagged Lightning? Some exotic stuff you have here my friend! I'll need 15000 gold to fully recharge this.~
	  IF ~~ THEN REPLY @39 GOTO 17
	  IF ~PartyGoldGT(14999)~ THEN REPLY @40 DO ~TakePartyGold(15000)
												 DestroyGold(15000)
												 TakePartyItem("psWand01")
												 SetGlobal("Recar2","GLOBAL",111)~ GOTO 49
	  IF ~~ THEN REPLY @41 EXIT
  END
END

EXTEND_BOTTOM VICTOR 50
	IF ~Global("Recar2","GLOBAL",111)~  THEN DO ~GiveItemCreate("psWand01",LastTalkedToBy,15,0,0)
												 SetGlobal("Recar2","GLOBAL",0)~ REPLY @42 EXIT
END