; Jonas Mikkelsen, Mar2019
; Version 1.0

#SingleInstance force
#NoTrayIcon
#Persistent

; set capslock state off permanently
;SetCapsLockState, AlwaysOff

RWin::
	send, {AppsKey}
return

;Keyboard arrowkeys
CapsLock & j:: Left
CapsLock & k:: Up
CapsLock & l:: Down
CapsLock & æ:: Right

;terminate window
CapsLock & q:: !F4

;Open Browser
CapsLock & c:: run chrome.exe

;Open and cycle through explorer
#e::
IfWinNotExist, ahk_class CabinetWClass
    Run, explorer.exe
GroupAdd, FileExplorers, ahk_class CabinetWClass
if WinActive("ahk_exe explorer.exe")
    GroupActivate, FileExplorers, r
else
    WinActivate ahk_class CabinetWClass
Return

