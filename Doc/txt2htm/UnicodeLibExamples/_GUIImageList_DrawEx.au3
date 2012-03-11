﻿#include <GUIConstantsEx.au3>
#include <WinAPI.au3>
#include <GuiImageList.au3>

_Main()

Func _Main()
	Local $hImage, $hGUI, $hDC

	$hGUI = GUICreate("ImageList DrawEx", 400, 300)
	GUISetState()

	; 加载图像
	$hImage = _GUIImageList_Create(32, 24)
	_GUIImageList_Add($hImage, _WinAPI_CreateSolidBitmap($hGUI, 0xFF0000, 32, 24))
	_GUIImageList_Add($hImage, _WinAPI_CreateSolidBitmap($hGUI, 0x00FF00, 32, 24))
	_GUIImageList_Add($hImage, _WinAPI_CreateSolidBitmap($hGUI, 0x0000FF, 32, 24))

	; 描绘图像
	$hDC = _WinAPI_GetDC($hGUI)
	_GUIImageList_DrawEx($hImage, 0, $hDC, 4, 4)
	_GUIImageList_DrawEx($hImage, 1, $hDC, 40, 4)
	_GUIImageList_DrawEx($hImage, 2, $hDC, 76, 4)

	_WinAPI_ReleaseDC($hGUI, $hDC)

	; 循环直到用户退出
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main
