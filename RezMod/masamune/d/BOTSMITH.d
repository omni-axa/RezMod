EXTEND_BOTTOM BOTSMITH 4
  IF ~OR(2)
    PartyHasItem("XOMASMUN")
    PartyHasItem("XODOREEN")~ THEN GOTO mstrmstr
END
  
APPEND BOTSMITH
  IF ~~ THEN BEGIN mstrmstr SAY @25
    IF ~PartyHasItem("XOMASMUN")
      !PartyHasItem("XODOREEN")~ THEN GOTO nodore
    IF ~PartyHasItem("XOMASMUN")
      PartyHasItem("XODOREEN")~ THEN GOTO mstrdore
  END
  
  IF ~~ THEN BEGIN nodore SAY @26
    IF ~~ THEN GOTO nonono
  END
  
  IF ~~ THEN BEGIN mstrdore SAY @27
    IF ~PartyGoldLT(30000)~ THEN REPLY #66662 GOTO nonono
    IF ~PartyGoldGT(29999)~ THEN REPLY #66664 DO ~SetGlobal("MstrDore","GLOBAL",1)
                                                 SetGlobal("ImpForgeStuff","GLOBAL",1)
												 SetGlobal("MstrMune#Craft","GLOBAL",1)
                                                 TakePartyGold(30000)
                                                 DestroyGold(30000)
                                                 TakePartyItemNum("XOMASMUN",1)
                                                 DestroyItem("XOMASMUN")
                                                 TakePartyItemNum("XODOREEN",1)
                                                 DestroyItem("XODOREEN")~ GOTO 11
    IF ~~ THEN REPLY #66770 GOTO nonono
  END

  IF WEIGHT #-1 ~GlobalGT("MstrMune#Craft","GLOBAL",0)~ THEN BEGIN MSTRMUNE#CRAFT SAY #70888
   IF ~~ THEN DO ~SetGlobal("MstrMune#Craft","GLOBAL",0)~ EXIT
  END

  IF ~~ THEN BEGIN nonono SAY @28
    COPY_TRANS BOTSMITH 4
  END
END