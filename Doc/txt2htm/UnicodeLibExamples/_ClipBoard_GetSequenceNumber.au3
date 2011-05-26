﻿#include <GuiConstantsEx.au3>
#include <ClipBoard.au3>
#include <WinAPI.au3>
#include <WindowsConstants.au3>

Global $iMemo

_Main()

Func _Main()
	Local $hGUI

	; Create GUI
	$hGUI = GUICreate("Clipboard", 600, 400)
	$iMemo = GUICtrlCreateEdit("", 2, 2, 596, 396, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState()

	; Open the clipboard
	If Not _ClipBoard_Open($hGUI) Then _WinAPI_ShowError("_ClipBoard_Open failed")

	ShowData($hGUI)

	; Close the clipboard
	_ClipBoard_Close()

	; Loop until user exits
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

EndFunc   ;==>_Main

; Show clipboard statistics
Func ShowData($hGUI)
	MemoWrite("GUI handle ............: " & $hGUI)
	MemoWrite("Clipboard owner .......: " & _ClipBoard_GetOwner())
	MemoWrite("Clipboard open window .: " & _ClipBoard_GetOpenWindow())
	MemoWrite("Clipboard sequence ....: " & _ClipBoard_GetSequenceNumber())
	MemoWrite()
EndFunc   ;==>ShowData

; Write message to memo
Func MemoWrite($sMessage = "")
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite