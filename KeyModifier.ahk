; Jonas Mikkelsen, Mar2019
; Version 1.0
;
; Uses capslock as a fifth modifier to provide extra functionality within windows
;
; New functions for Winkey and
;	e - Cycle explorer windows 


#SingleInstance force
#MaxHotkeysPerInterval 200
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
CapsLock & w:: word()
CapsLock & x:: excel()
CapsLock & p:: powerpoint()
CapsLock & a:: adobePremiere()

;media
CapsLock & n:: Volume_Down
CapsLock & m:: Volume_Up

;general fixes
$F6::^l
RWin:: AppsKey

;kill script
CapsLock & F4::ExitApp

powerpoint()
{
	IfWinNotExist, ahk_class PPTFrameClass
		run POWERPNT.exe
	GroupAdd, Powerpoints, ahk_class PPTFrameClass
	if WinActive("ahk_class PPTFrameClass")
		GroupActivate, Powerpoints, r
	else
		WinActivate ahk_class PPTFrameClass
	Return
}

excel()
{
	IfWinNotExist, ahk_class xlmain
		run excel.exe
	else
		WinActivate ahk_class xlmain
	return
}

word()
{
	IfWinNotExist, ahk_class OpusApp
		run winword.exe
	GroupAdd, Words, ahk_class OpusApp
	if WinActive("ahk_class OpusApp")
		GroupActivate, Words, r
	else
		WinActivate ahk_class OpusApp
	Return
}

foobar()
{
	IfWinNotExist, ahk_exe foobar2000.exe
		run foobar2000.exe
	else
		WinActivate ahk_exe foobar2000.exe
	return
}

chrome()
{
	IfWinNotExist, ahk_exe chrome.exe
		run, chrome.exe
	GroupAdd, Chromes, ahk_exe chrome.exe
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

adobePremiere()
{
	IfWinNotExist, ahk_class, EmbeddedWB
		run, Adobe Premiere Pro.exe
	GroupAdd, Premieres, ahk_class EmbeddedWB
	If (winActive("ahk_class EmbeddedWB"))
		GroupActivate, Premieres, r
	else
		WinActivate, ahk_class EmbeddedWB
	return
}
