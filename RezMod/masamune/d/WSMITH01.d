EXTEND_BOTTOM WSMITH01 13
  IF ~OR(2)
    PartyHasItem("XOMASA")
    PartyHasItem("XOMUNE")~ THEN GOTO masamasa
END
  
APPEND WSMITH01
  IF ~~ THEN BEGIN masamasa SAY @20
    IF ~PartyHasItem("XOMASA")
      !PartyHasItem("XOMUNE")~ THEN GOTO nomune
    IF ~!PartyHasItem("XOMASA")
      PartyHasItem("XOMUNE")~ THEN GOTO nomasa
    IF ~PartyHasItem("XOMASA")
      PartyHasItem("XOMUNE")~ THEN GOTO masamune
  END
  
  IF ~~ THEN BEGIN nomune SAY @21
    IF ~~ THEN GOTO nonono
  END
  
  IF ~~ THEN BEGIN nomasa SAY @22
    IF ~~ THEN GOTO nonono
  END
  
  IF ~~ THEN BEGIN masamune SAY @23
    IF ~PartyGoldLT(20000)~ THEN REPLY #66662 GOTO nonono
    IF ~PartyGoldGT(19999)~ THEN REPLY #66664 DO ~SetGlobal("MasaMune","ar0334",1)
                                                  SetGlobal("ForgeStuff","GLOBAL",1)
                                                  TakePartyGold(20000)
                                                  TakePartyItemNum("XOMASA",1)
                                                  DestroyItem("XOMASA")
                                                  TakePartyItemNum("XOMUNE",1)
                                                  DestroyItem("XOMUNE")
                                                  DestroyGold(20000)~ GOTO 56
    IF ~~ THEN REPLY #66770 GOTO nonono
  END
  
  IF WEIGHT #-1 ~GlobalGT("MasaMune#Craft","ar0334",0)~ THEN BEGIN MasaMune#CRAFT SAY #59797
    IF ~~ THEN DO ~SetGlobal("MasaMune#Craft","ar0334",0)~ EXIT
  END

  IF ~~ THEN BEGIN nonono SAY @24
    COPY_TRANS WSMITH01 13
  END
END