#AutoIt3Wrapper_au3check_parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6
#include <GuiConstantsEx.au3>
#include <GuiTab.au3>

Opt('MustDeclareVars', 1)

$Debug_TAB = False ; Check ClassName being passed to functions, set to True and use a handle to another control to see it work

_Main()

Func _Main()
	Local $hTab

	; Create GUI
	GUICreate("Tab Control Set Item State", 400, 300)
	$hTab = GUICtrlCreateTab(2, 2, 396, 296, $TCS_BUTTONS)
	GUISetState()

	; Add tabs
	_GUICtrlTab_InsertItem($hTab, 0, "Tab 1")
	_GUICtrlTab_InsertItem($hTab, 1, "Tab 2")
	_GUICtrlTab_InsertItem($hTab, 2, "Tab 3")
	
	; Get/Set tab 2 state
	_GUICtrlTab_SetItemState($hTab, 1, $TCIS_BUTTONPRESSED)
	MsgBox(4160, "Information", "Tab 2 state: " & _ExplainItemState(_GUICtrlTab_GetItemState($hTab, 1)))

	; Loop until user exits
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main

Func _ExplainItemState($iState)
	Local $sText = ""
	If $iState = 0 Then $sText &= "No state set on this item" & @LF
	If BitAND($iState, 1) Then $sText &= "Button Pressed" & @LF
	If BitAND($iState, 2) Then $sText &= "Button Highlighted"
	Return $sText
EndFunc   ;==>_ExplainItemState