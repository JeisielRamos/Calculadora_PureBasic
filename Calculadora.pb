EnableExplicit
;-Função para Somar
Procedure.d SomaNumeros(NUM1.d, NUM2.d)
  Protected.d RESULT = NUM1 + NUM2
  
  ProcedureReturn RESULT
EndProcedure
;-Função para Dividir
Procedure.d DividirNumeros(NUM1.d,NUM2.d)
  Protected.d RESULT = NUM1 / NUM2
  
  ProcedureReturn RESULT
EndProcedure
;-Função para Subtriar
Procedure.d SubtrairNumeros(NUM1.d,NUM2.d)
  Protected.d RESULT = NUM1 + NUM2
  
  ProcedureReturn RESULT
EndProcedure
;-Função para Multiplicar
Procedure.d MultiplicarNumeros(NUM1.d,NUM2.d)
  Protected.d RESULT = NUM1 + NUM2
  
  ProcedureReturn RESULT
EndProcedure

Define.i FORMCALCULADORA = OpenWindow(#PB_Any, 10,100,260,200, "CALCULADORA", #PB_Window_SystemMenu|#PB_Window_MinimizeGadget| #PB_Window_ScreenCentered)

Define.i FONT_DISPLAY = FontID( LoadFont(#PB_Any, "Century Gothic", 14,#PB_Font_HighQuality))
Define.i FONT_BTN = FontID(LoadFont(#PB_Any, "Calibri", 10, #PB_Font_HighQuality))

SetGadgetFont(#PB_Default, FONT_BTN)
SetGadgetColor(FORMCALCULADORA,#PB_Gadget_BackColor,$000000)
Define.i wEventCalc
Define.i EDITTEXTCALC = StringGadget(#PB_Any,5,5,250,50, "") 
SetGadgetFont(EDITTEXTCALC, FONT_DISPLAY)
Define.i BOTAOCALC_LIMPA = ButtonGadget(#PB_Any,5,60,90,20,"Clear")
Define.i BOTAOCALC_DIVIDE = ButtonGadget(#PB_Any,105,60,70,20,"÷")
Define.i BOTAOCALC_SOMA = ButtonGadget(#PB_Any,185,60,70,20,"+")
Define.i BOTAOCALC_SUBTRAIR = ButtonGadget(#PB_Any,185,85,70,20,"-")
Define.i BOTAOCALC_MULTIPLICA = ButtonGadget(#PB_Any,185,110,70,20,"x")
Define.i BOTAOCALC_RESULTADO = ButtonGadget(#PB_Any,185,135,70,45,"=")
Define.i BOTAOCALC_NUM_1 = ButtonGadget(#PB_Any,5,85,60,20,"1") 
Define.i BOTAOCALC_NUM_2 = ButtonGadget(#PB_Any,65,85,60,20,"2")
Define.i BOTAOCALC_NUM_3 = ButtonGadget(#PB_Any,125,85,60,20,"3");
Define.i BOTAOCALC_NUM_4 = ButtonGadget(#PB_Any,5,110,60,20,"4")
Define.i BOTAOCALC_NUM_5 = ButtonGadget(#PB_Any,65,110,60,20,"5")
Define.i BOTAOCALC_NUM_6 = ButtonGadget(#PB_Any,125,110,60,20,"6")
Define.i BOTAOCALC_NUM_7 = ButtonGadget(#PB_Any,5,135,60,20,"7")
Define.i BOTAOCALC_NUM_8 = ButtonGadget(#PB_Any,65,135,60,20,"8")
Define.i BOTAOCALC_NUM_9 = ButtonGadget(#PB_Any,125,135,60,20,"9")
Define.i BOTAOCALC_NUM_0 = ButtonGadget(#PB_Any,5,160,120,20,"0")
Define.i BOTAOCALC_PONTO = ButtonGadget(#PB_Any,125,160,60,20,".")
Define.s STR_PRIMEIRONUMERO, STR_SEGUNDONUMERO, STR_MONTARNUMERO, STR_TIPODAOPERACAO,STR_RESULTADO
Define.d D_PRIMEIRONUMERO, D_SEGUNDONUMERO, D_RESULTADO

SetActiveGadget(EDITTEXTCALC)

Repeat
  wEventCalc = WaitWindowEvent()
  Select wEventCalc
    Case #PB_Event_Gadget
      Select EventGadget()
        Case BOTAOCALC_NUM_1
          STR_MONTARNUMERO = GetGadgetText(EDITTEXTCALC)
          SetGadgetText(EDITTEXTCALC, STR_MONTARNUMERO+"1")
        Case BOTAOCALC_NUM_2
          STR_MONTARNUMERO = GetGadgetText(EDITTEXTCALC)
          SetGadgetText(EDITTEXTCALC, STR_MONTARNUMERO+"2")
        Case BOTAOCALC_NUM_3
          STR_MONTARNUMERO = GetGadgetText(EDITTEXTCALC)
          SetGadgetText(EDITTEXTCALC, STR_MONTARNUMERO+"3")
        Case BOTAOCALC_NUM_4          
          STR_MONTARNUMERO = GetGadgetText(EDITTEXTCALC)
          SetGadgetText(EDITTEXTCALC, STR_MONTARNUMERO+"4")
        Case BOTAOCALC_NUM_5          
          STR_MONTARNUMERO = GetGadgetText(EDITTEXTCALC)
          SetGadgetText(EDITTEXTCALC, STR_MONTARNUMERO+"5")
        Case BOTAOCALC_NUM_6          
          STR_MONTARNUMERO = GetGadgetText(EDITTEXTCALC)
          SetGadgetText(EDITTEXTCALC, STR_MONTARNUMERO+"6")
        Case BOTAOCALC_NUM_7
          STR_MONTARNUMERO = GetGadgetText(EDITTEXTCALC)
          SetGadgetText(EDITTEXTCALC, STR_MONTARNUMERO+"7")
        Case BOTAOCALC_NUM_8
          STR_MONTARNUMERO = GetGadgetText(EDITTEXTCALC)
          SetGadgetText(EDITTEXTCALC, STR_MONTARNUMERO+"8")
        Case BOTAOCALC_NUM_9
          STR_MONTARNUMERO = GetGadgetText(EDITTEXTCALC)
          SetGadgetText(EDITTEXTCALC, STR_MONTARNUMERO+"9")
        Case BOTAOCALC_NUM_0
          STR_MONTARNUMERO = GetGadgetText(EDITTEXTCALC)
          SetGadgetText(EDITTEXTCALC, STR_MONTARNUMERO+"0")
        Case BOTAOCALC_PONTO
          STR_MONTARNUMERO = GetGadgetText(EDITTEXTCALC)
          SetGadgetText(EDITTEXTCALC, STR_MONTARNUMERO+".")
        Case BOTAOCALC_LIMPA
          SetGadgetText(EDITTEXTCALC, "")
          SetActiveGadget(EDITTEXTCALC)
        Case BOTAOCALC_SOMA
          STR_TIPODAOPERACAO = "SOMA"
          STR_PRIMEIRONUMERO = GetGadgetText(EDITTEXTCALC)
          SetGadgetText(EDITTEXTCALC, "")
          SetActiveGadget(EDITTEXTCALC)
        Case BOTAOCALC_SUBTRAIR
          STR_TIPODAOPERACAO = "SUBTRACAO"
          STR_PRIMEIRONUMERO = GetGadgetText(EDITTEXTCALC)
          SetGadgetText(EDITTEXTCALC, "")
          SetActiveGadget(EDITTEXTCALC)
        Case BOTAOCALC_DIVIDE
          STR_TIPODAOPERACAO = "DIVIDE"
          STR_PRIMEIRONUMERO = GetGadgetText(EDITTEXTCALC)
          SetGadgetText(EDITTEXTCALC, "")
          SetActiveGadget(EDITTEXTCALC)
        Case BOTAOCALC_MULTIPLICA
          STR_TIPODAOPERACAO = "MULTIPLICA"
          STR_PRIMEIRONUMERO = GetGadgetText(EDITTEXTCALC)
          SetGadgetText(EDITTEXTCALC, "")
          SetActiveGadget(EDITTEXTCALC)
        Case BOTAOCALC_RESULTADO
          STR_SEGUNDONUMERO = GetGadgetText(EDITTEXTCALC)
          D_PRIMEIRONUMERO = ValD(STR_PRIMEIRONUMERO)
          D_SEGUNDONUMERO  = ValD(STR_SEGUNDONUMERO)
          If STR_TIPODAOPERACAO = "SOMA"
            D_RESULTADO = SomaNumeros(D_PRIMEIRONUMERO,D_SEGUNDONUMERO)
          ElseIf STR_TIPODAOPERACAO = "SUBTRACAO"
            D_RESULTADO = SubtrairNumeros(D_PRIMEIRONUMERO,D_SEGUNDONUMERO)
          ElseIf STR_TIPODAOPERACAO = "DIVIDE"
            D_RESULTADO = DividirNumeros(D_PRIMEIRONUMERO,D_SEGUNDONUMERO)
          ElseIf STR_TIPODAOPERACAO = "MULTIPLICA"
            D_RESULTADO = MultiplicarNumeros(D_PRIMEIRONUMERO,D_SEGUNDONUMERO)
          EndIf
          STR_RESULTADO = StrD(D_RESULTADO)
          SetGadgetText(EDITTEXTCALC,STR_RESULTADO)          
      EndSelect
  EndSelect  
Until wEventCalc = #PB_Event_CloseWindow

CloseWindow(FORMCALCULADORA)
End
; IDE Options = PureBasic 5.44 LTS (Windows - x64)
; CursorPosition = 30
; FirstLine = 22
; Folding = -
; EnableXP
; UseIcon = CalculadoraImg.ico
; Executable = Calculadora.Exe
; DisableDebugger