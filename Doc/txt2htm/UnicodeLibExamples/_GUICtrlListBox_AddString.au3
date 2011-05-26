﻿#include <GUIListBox.au3>
#include <GuiConstantsEx.au3>
#include <WindowsConstants.au3>

$Debug_LB = False ; Check ClassName being passed to ListBox functions, set to True and use a handle to another control to see it work

_Main()

Func _Main()
	Local $hListBox

	; Create GUI
	GUICreate("List Box Add String", 400, 296)
	$hListBox = GUICtrlCreateList("", 2, 2, 396, 296, BitOR($WS_BORDER, $WS_VSCROLL, $LBS_NOTIFY, $LBS_DISABLENOSCROLL, $WS_HSCROLL))

	GUISetState()

	; Add strings
	_GUICtrlListBox_BeginUpdate($hListBox)
	For $iI = 1 To 9
		_GUICtrlListBox_AddString($hListBox, StringFormat("%03d : Random string", Random(1, 100, 1)))
	Next
	_GUICtrlListBox_InsertString($hListBox, "Exact teXt", 3)
	_GUICtrlListBox_InsertString($hListBox, "This is the string that we're looking for", 6)
	_GUICtrlListBox_InsertString($hListBox, _
			"Let's add one really long line of text so that we can set the horizontal scroll bar and " & _
			"show that, unless we dynamically update the scroll bar, it won't show the full line.", 9)
	_GUICtrlListBox_UpdateHScroll($hListBox)
	_GUICtrlListBox_EndUpdate($hListBox)

	; Loop until user exits
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main
