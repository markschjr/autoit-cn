﻿#Include <WinAPIEx.au3>

Opt('MustDeclareVars', 1)

Global Const $STM_SETIMAGE = 0x0172
Global Const $STM_GETIMAGE = 0x0173

Global $hForm, $Pic, $hPic, $tBIHDR, $tBits, $pBits, $hObj, $hBitmap, $hDC, $Width = 200, $Height = 200

; Create GUI
$hForm = GUICreate('MyGUI', $Width, $Height)
$Pic = GUICtrlCreatePic('', 0, 0, $Width, $Height)
$hPic = GUICtrlGetHandle($Pic)

; Create bitmap
$tBIHDR = DllStructCreate($tagBITMAPINFOHEADER)
DllStructSetData($tBIHDR, 'biSize', DllStructGetSize($tBIHDR))
DllStructSetData($tBIHDR, 'biWidth', $Width)
DllStructSetData($tBIHDR, 'biHeight', $Height)
DllStructSetData($tBIHDR, 'biPlanes', 1)
DllStructSetData($tBIHDR, 'biBitCount', 32)
DllStructSetData($tBIHDR, 'biCompression', $BI_RGB)
$hBitmap = _WinAPI_CreateDIBSection(0, $tBIHDR, $DIB_RGB_COLORS, $pBits)

; Fill bitmap with random colors
$tBits = DllStructCreate('dword[' & $Width * $Height & ']', $pBits)
For $y = 0 To $Height - 1
	For $x = 1 To $Width
		DllStructSetData($tBits, 1, Random(0xFFFFFF), $x + ($y * $Width))
	Next
Next

; Set bitmap to control
_SendMessage($hPic, $STM_SETIMAGE, 0, $hBitmap)
$hObj = _SendMessage($hPic, $STM_GETIMAGE)
If $hObj <> $hBitmap Then
	_WinAPI_DeleteObject($hBitmap)
EndIf

GUISetState()

Do
Until GUIGetMsg() = -3
