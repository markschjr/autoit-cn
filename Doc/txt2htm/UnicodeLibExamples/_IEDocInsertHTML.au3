﻿; *******************************************************
; 示例 1 - 插入 HTML 到 document 的顶部和底部
; *******************************************************

#include <IE.au3>

Local $oIE = _IECreate("http://www.autoitscript.com")
Local $oBody = _IETagNameGetCollection($oIE, "body", 0)
_IEDocInsertHTML($oBody, "<h2>This HTML is inserted After Begin</h2>", "afterbegin")
_IEDocInsertHTML($oBody, "<h2>This HTML is inserted Before End</h2>", "beforeend")

; *******************************************************
; 示例 2 - 打开含基本示例页面的浏览器, 插入 HTML
;		到名称为 "IEAu3Data" 的 DIV 标签的内部和周围并显示 HTML 主体
; *******************************************************

#include <IE.au3>

$oIE = _IE_Example("basic")
Local $oDiv = _IEGetObjByName($oIE, "IEAu3Data")

_IEDocInsertHTML($oDiv, "<b>(HTML beforebegin)</b>", "beforebegin")
_IEDocInsertHTML($oDiv, "<i>(HTML afterbegin)</i>", "afterbegin")
_IEDocInsertHTML($oDiv, "<b>(HTML beforeend)</b>", "beforeend")
_IEDocInsertHTML($oDiv, "<i>(HTML afterend)</i>", "afterend")

ConsoleWrite(_IEBodyReadHTML($oIE) & @CRLF)

; *******************************************************
; 示例 3 - 高级示例
;		Insert a clock and a referrer string at the top of every page, even when you
;		browse to a new location.  使用 _IEDocInsertText, _IEDocInsertHTML 和
;		_IEPropertySet 特别用在 "innerhtml" 和 "referrer" 上
; *******************************************************

#include <IE.au3>

$oIE = _IECreate("http://www.autoitscript.com")

AdlibRegister("UpdateClock", 1000) ; 每秒更新时钟一次

; 只有浏览器窗口还存在则空闲
While WinExists(_IEPropertyGet($oIE, "hwnd"))
	Sleep(10000)
WEnd

Exit

Func UpdateClock()
	Local $curTime = "<b>Current Time is: </b>" & @HOUR & ":" & @MIN & ":" & @SEC
	; 预期中在导航后 _IEGetObjByName 会返回 NoMatch 错误
	;   (插入 DIV 之前), 所以临时关闭通告
	_IEErrorNotify(False)
	Local $oAutoItClock = _IEGetObjByName($oIE, "AutoItClock")
	If Not IsObj($oAutoItClock) Then ; 如果没有找到则插入 DIV 元素
		;
		; 获取到 BODY 的引用, 插入 DIV, 获取到 DIV 的引用, 更新时间
		Local $oBody = _IETagNameGetCollection($oIE, "body", 0)
		_IEDocInsertHTML($oBody, "<div id='AutoItClock'></div>", "afterbegin")
		$oAutoItClock = _IEGetObjByName($oIE, "AutoItClock")
		_IEPropertySet($oAutoItClock, "innerhtml", $curTime)
		;
		; Check referrer string, if not blank insert after clock
		_IELoadWait($oIE)
		Local $sReferrer = _IEPropertyGet($oIE, "referrer")
		If $sReferrer Then _IEDocInsertText($oAutoItClock, _
				"  Referred by: " & $sReferrer, "afterend")
	Else
		_IEPropertySet($oAutoItClock, "innerhtml", $curTime) ; 更新时间
	EndIf
	_IEErrorNotify(True)
EndFunc   ;==>UpdateClock
