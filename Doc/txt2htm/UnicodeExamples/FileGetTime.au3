﻿Local $t = FileGetTime(@WindowsDir & "\Notepad.exe", 1)

If Not @error Then
	Local $yyyymd = $t[0] & "/" & $t[1] & "/" & $t[2]
	MsgBox(0, "notepad.exe 创建日期:", $yyyymd)
EndIf