﻿#Include <Array.au3>
#Include <WinAPIEx.au3>

Opt('MustDeclareVars', 1)

Global $Data = _WinAPI_GetKeyboardLayoutList()

_ArrayDisplay($Data, '_WinAPI_GetKeyboardLayoutList')
