#NoTrayIcon

Opt("TrayMenuMode",1)	; Default tray menu items (Script Paused/Exit) will not be shown.

$delitem		= TrayCreateItem("Delete")
TrayCreateItem("")
$aboutitem		= TrayCreateItem("About")
TrayCreateItem("")
$exititem		= TrayCreateItem("Exit")

TraySetState()

While 1
	$msg = TrayGetMsg()
	Select
		Case $msg = 0
			ContinueLoop
		Case $msg = $aboutitem
			Msgbox(64,"About:","AutoIt3-Tray-sample")
		Case $msg = $delitem
			TrayItemDelete($delitem)
		Case $msg = $exititem
			ExitLoop
	EndSelect
WEnd

Exit
