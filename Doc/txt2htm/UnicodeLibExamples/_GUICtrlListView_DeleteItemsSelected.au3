﻿#include <GuiConstantsEx.au3>
#include <GuiListView.au3>

$Debug_LV = False ; Check ClassName being passed to ListView functions, set to True and use a handle to another control to see it work

Example1()
Example2()
Example_UDF_Created()

Func Example1()
	Local $aItems[10][3], $hListView

	GUICreate("ListView Delete Items Selected", 400, 300)
	$hListView = GUICtrlCreateListView("col1|col2|col3", 2, 2, 394, 268, BitOR($LVS_SHOWSELALWAYS, $LVS_NOSORTHEADER, $LVS_REPORT))
	_GUICtrlListView_SetExtendedListViewStyle($hListView, BitOR($LVS_EX_GRIDLINES, $LVS_EX_FULLROWSELECT))
	GUISetState()

	; 3 column load
	For $iI = 0 To 9
		GUICtrlCreateListViewItem("Item " & $iI & "|Item " & $iI & "-1|Item " & $iI & "-2", $hListView)
	Next

	_GUICtrlListView_SetItemSelected($hListView, Random(0, UBound($aItems) - 1, 1))

	MsgBox(4160, "Information", "Delete Item Selected")
	; Items created using UDF function(s), pass the handle to the control
	MsgBox(4160, "Deleted?", _GUICtrlListView_DeleteItemsSelected($hListView))

	; Loop until user exits
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example1

Func Example2()
	Local $aItems[10][3], $hListView

	GUICreate("ListView Delete Items Selected", 400, 300)
	$hListView = GUICtrlCreateListView("col1|col2|col3", 2, 2, 394, 268, BitOR($LVS_SHOWSELALWAYS, $LVS_NOSORTHEADER, $LVS_REPORT))
	_GUICtrlListView_SetExtendedListViewStyle($hListView, BitOR($LVS_EX_GRIDLINES, $LVS_EX_FULLROWSELECT))
	GUISetState()

	; 3 column load
	For $iI = 0 To UBound($aItems) - 1
		$aItems[$iI][0] = "Item " & $iI
		$aItems[$iI][1] = "Item " & $iI & "-1"
		$aItems[$iI][2] = "Item " & $iI & "-2"
	Next

	_GUICtrlListView_AddArray($hListView, $aItems)

	_GUICtrlListView_SetItemSelected($hListView, Random(0, UBound($aItems) - 1, 1))

	MsgBox(4160, "Information", "Delete Item Selected")
	; Items created using UDF function(s), pass the handle to the control
	MsgBox(4160, "Deleted?", _GUICtrlListView_DeleteItemsSelected(GUICtrlGetHandle($hListView)))

	; Loop until user exits
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example2

Func Example_UDF_Created()
	Local $GUI, $aItems[10][3], $hListView

	$GUI = GUICreate("(UDF Created) ListView Delete Items Selected", 400, 300)
	$hListView = _GUICtrlListView_Create($GUI, "col1|col2|col3", 2, 2, 394, 268, BitOR($LVS_SHOWSELALWAYS, $LVS_NOSORTHEADER, $LVS_REPORT))
	_GUICtrlListView_SetExtendedListViewStyle($hListView, BitOR($LVS_EX_GRIDLINES, $LVS_EX_FULLROWSELECT))
	GUISetState()

	; 3 column load
	For $iI = 0 To UBound($aItems) - 1
		$aItems[$iI][0] = "Item " & $iI
		$aItems[$iI][1] = "Item " & $iI & "-1"
		$aItems[$iI][2] = "Item " & $iI & "-2"
	Next

	_GUICtrlListView_AddArray($hListView, $aItems)

	_GUICtrlListView_SetItemSelected($hListView, Random(0, UBound($aItems) - 1, 1))

	MsgBox(4160, "Information", "Delete Item Selected")
	; This is already a handle
	MsgBox(4160, "Deleted?", _GUICtrlListView_DeleteItemsSelected($hListView))

	; Loop until user exits
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example_UDF_Created
