#include <file.au3>
#include <array.au3>

Local $szDrive, $szDir, $szFName, $szExt
Local $TestPath = _PathSplit(@ScriptFullPath, $szDrive, $szDir, $szFName, $szExt)
_ArrayDisplay($TestPath, "Demo _PathSplit()")
