﻿#include <Sound.au3>

;打开声音文件: 在 Vista 中运行时必须对路径进行修改
Local $sound = _SoundOpen(@WindowsDir & "\media\Windows XP Startup.wav")
If @error = 2 Then
	MsgBox(0, "Error", "The file does not exist")
	Exit
ElseIf @extended <> 0 Then
	Local $extended = @extended ;赋值, 因为 @extended 可能会在 DllCall 后被设置成其它返回值
	Local $stText = DllStructCreate("char[128]")
	Local $errorstring = DllCall("winmm.dll", "short", "mciGetErrorStringA", "str", $extended, "ptr", DllStructGetPtr($stText), "int", 128)
	MsgBox(0, "Error", "The open failed." & @CRLF & "Error Number: " & $extended & @CRLF & "Error Description: " & DllStructGetData($stText, 1) & @CRLF & "Please Note: The sound may still play correctly.")
Else
	MsgBox(0, "Success", "The file opened successfully")
EndIf
MsgBox(0, "Sound Length", "The Sound has a length of:" & @CRLF & "hh:mm:ss - " & _
		_SoundLength($sound, 1) & @CRLF & "Milliseconds - " & _SoundLength($sound, 2))