﻿;在屏幕的左上角显示一个包含文字的输入框
$answer = InputBox("问题", "你在哪里出生?", "地球", "", _
	-1, -1, 0, 0)

;要求用户输入密码, 并验证密码的有效性!
$passwd = InputBox("安全检查", "输入您的密码.", "", "*")

;密码字符
;第一个字符为 空格 则表示输入可见. 
;第二个字符是 M 则表示用户必须输入至少一个字符.
;第三个字符是 2 则表示输入字符长度, 最多2个字符.
$value = InputBox("测试", "输入 1 或 2 个字符码.", "", " M2")