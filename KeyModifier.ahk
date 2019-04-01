; Jonas Mikkelsen, Mar2019
; Version 1.0

#SingleInstance force
#NoTrayIcon
#Persistent
#Warn
#NoEnv

SendMode Input
SetWorkingDir %A_ScriptDir% 

;Keyboard arrowkeys
CapsLock & j:: Left
CapsLock & k:: Up
CapsLock & l:: Down
CapsLock & æ:: Right

;terminate window, shut down
CapsLock & q:: !F4
CapsLock & Escape:: ControlSend, , !{F4}, ahk_class Progman ; shutdown dialogue

;Program launches
CapsLock & o:: outlook()
CapsLock & e:: explorer()
CapsLock & s:: slack()
CapsLock & c:: chrome()
CapsLock & f:: foobar()

;media
CapsLock & n:: Volume_Down
CapsLock & m:: Volume_Up

;general fixes
$F6::^l
RWin:: AppsKey

;kill script
CapsLock & F4::ExitApp


foobar()
{
	IfWinNotExist, ahk_exe foobar2000.exe
		run foobar2000.exe
	else
		WinActivate ahk_exe foobar2000.exe
	return
}

chrome() ; !
{
	IfWinNotExist, ahk_exe chrome.exe
		run, chrome.exe
	GroupAdd, Chromes, ahk_class Chrome_WidgetWin_1
	if WinActive("ahk_exe chrome.exe")
		GroupActivate, Chromes, r
	else
		WinActivate ahk_exe chrome.exe
	Return
}

slack()
{
	IfWinNotExist, ahk_exe slack.exe
		run, slack.exe
	else
		WinActivate, ahk_exe slack.exe
	return
}

outlook()
{
	IfWinNotExist, ahk_exe outlook.exe
		run, outlook.exe
	else
		WinActivate, ahk_exe outlook.exe
	return
}

explorer()
{
	IfWinNotExist, ahk_class CabinetWClass
		run, explorer.exe
	GroupAdd, FileExplorers, ahk_class CabinetWClass
	if WinActive("ahk_exe explorer.exe")
		GroupActivate, FileExplorers, r
	else
		WinActivate ahk_class CabinetWClass
	Return
}
