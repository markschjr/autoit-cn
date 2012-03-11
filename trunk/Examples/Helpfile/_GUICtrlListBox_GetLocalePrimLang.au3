#include <GuiListBox.au3>
#include <GUIConstantsEx.au3>

$Debug_LB = False ; Check ClassName being passed to ListBox functions, set to True and use a handle to another control to see it work

_Main()

Func _Main()
	Local $hListBox

	; 创建 GUI
	GUICreate("List Box Get Locale Primary Language id", 400, 296)
	$hListBox = GUICtrlCreateList("", 2, 2, 396, 296)
	GUISetState()

	; Show locale, country code, language identifier, primary language id, sub-language id
	MsgBox(4160, "信息", _
			"Locale .................: " & _GUICtrlListBox_GetLocale($hListBox) & @LF & _
			"Country code ........: " & _GUICtrlListBox_GetLocaleCountry($hListBox) & @LF & _
			"Language identifier..: " & _GUICtrlListBox_GetLocaleLang($hListBox) & @LF & _
			"Primary Language id : " & _GUICtrlListBox_GetLocalePrimLang($hListBox) & @LF & _
			"Sub-Language id ....: " & _GUICtrlListBox_GetLocaleSubLang($hListBox))

	; 循环直到用户退出
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main
