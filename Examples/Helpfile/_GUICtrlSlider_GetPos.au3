﻿#AutoIt3Wrapper_au3check_parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6
#include <GuiConstantsEx.au3>
#include <GuiSlider.au3>

Opt('MustDeclareVars', 1)

$Debug_S = False ; Check ClassName being passed to functions, set to True and use a handle to another control to see it work

_Main()

Func _Main()
	Local $hSlider

	; Create GUI
	GUICreate("Slider Get Pos", 400, 296)
	$hSlider = GUICtrlCreateSlider(2, 2, 396, 20, BitOR($TBS_TOOLTIPS, $TBS_AUTOTICKS, $TBS_ENABLESELRANGE))
	GUISetState()

	; Set Pos
	_GUICtrlSlider_SetPos($hSlider, Random(0, 100, 1))

	; Get Pos
	MsgBox(4160, "Information", "Pos: " & _GUICtrlSlider_GetPos($hSlider))

	; Loop until user exits
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main