﻿#include <GUIConstantsEx.au3>
#include <GuiTreeView.au3>
#include <WindowsConstants.au3>

$Debug_TV = False ; 检查传递给函数的类名, 设置为真并使用另一控件的句柄可以看出它是否有效

_Main()

Func _Main()

	Local $hItem[10], $hItemFound, $htmp_item, $hTreeView
	Local $iStyle = BitOR($TVS_EDITLABELS, $TVS_HASBUTTONS, $TVS_HASLINES, $TVS_LINESATROOT, $TVS_DISABLEDRAGDROP, $TVS_SHOWSELALWAYS, $TVS_CHECKBOXES)

	GUICreate("TreeView Find ItemEx", 400, 300)
	Opt("GUIDataSeparatorChar", "\")

	$hTreeView = GUICtrlCreateTreeView(2, 2, 396, 268, $iStyle, $WS_EX_CLIENTEDGE)
	GUISetState()

	_GUICtrlTreeView_BeginUpdate($hTreeView)
	For $x = 0 To 3
		$hItem[$x] = GUICtrlCreateTreeViewItem(StringFormat("[%02d] New Item", $x), $hTreeView)
		For $y = 0 To 2
			$htmp_item = GUICtrlCreateTreeViewItem(StringFormat("[%02d] New Item", $y), $hItem[$x])
		Next
	Next
	$hItem[4] = GUICtrlCreateTreeViewItem(StringFormat("Looking for me?", $x), $htmp_item)
	For $x = 5 To 9
		$hItem[$x] = GUICtrlCreateTreeViewItem(StringFormat("[%02d] New Item", $x), $hTreeView)
		For $y = 0 To 2
			GUICtrlCreateTreeViewItem(StringFormat("[%02d] New Item", $y), $hItem[$x])
		Next
	Next
	_GUICtrlTreeView_EndUpdate($hTreeView)

	$hItemFound = _GUICtrlTreeView_FindItemEx($hTreeView, "[03] New Item\[02] New Item\Looking for me?")
	If $hItemFound Then
		_GUICtrlTreeView_SelectItem($hTreeView, $hItemFound)
		MsgBox(4160, "Information", "Item Found:" & @LF & "Handle: " & $hItemFound & @LF & "Text: " & _GUICtrlTreeView_GetText($hTreeView, $hItemFound))
	Else
		MsgBox(4160, "Information", "Not Found")
	EndIf

	; 循环直到用户退出
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main
