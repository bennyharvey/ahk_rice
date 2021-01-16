;#-win !-Alt ^-Ctrl +-Shift &-combo


+#q::Send !{F4}




switchLayout() {
    Send {CtrlDown}
    Send {ShiftDown}
    Sleep, 100
    Send {CtrlUp}
    Send {ShiftUp}
}

+CapsLock:: 
    switchLayout()
Return


!F1::Send ^#{Left}
!F2::Send ^#{Right}

#v::
    IfWinNotExist, ahk_exe KeePass.exe
        Run, C:\Program Files (x86)\KeePass Password Safe 2\KeePass.exe
    GroupAdd, keepass_group, ahk_exe KeePass.exe
    if WinActive("ahk_exe KeePass.exe")
        GroupActivate, keepass_group, r
    else
        WinActivate ahk_exe KeePass.exe
Return 

#g::
    IfWinNotExist, ahk_exe Code.exe
        Run, C:\Users\b590\AppData\Local\Programs\Microsoft VS Code\Code.exe
    GroupAdd, vsc_group, ahk_exe Code.exe
    if WinActive("ahk_exe Code.exe")
        GroupActivate, vsc_group, r
    else
        WinActivate ahk_exe Code.exe
Return 


#d::
IfWinNotExist, ahk_exe chrome.exe
    Run, C:\Program Files (x86)\Google\Chrome\Application\chrome.exe
GroupAdd, chrome_group, ahk_exe chrome.exe
if WinActive("ahk_exe chrome.exe")
    GroupActivate, chrome_group, r
else
    WinActivate ahk_exe chrome.exe
Return 

; #v::
; IfWinNotExist, ahk_class CabinetWClass
;     Run, explorer.exe
; GroupAdd, explorers_group, ahk_class CabinetWClass
; if WinActive("ahk_exe explorer.exe")
;     GroupActivate, explorers_group, r
; else
;     WinActivate ahk_class CabinetWClass
; Return 


;Open selected file with specified program

^#c::
    Clipboard =
    Send, ^c
    ClipWait ;waits for the clipboard to have content
    Run, "C:\Users\UserB590\AppData\Local\Programs\Microsoft VS Code\Code.exe" "%clipboard%
Return


;#]::]
;#[::[
; ]::Send {WheelUp}
; [::Send {WheelDown}


; ]::
; while GetKeyState("]", "P")
; {
; 	Send {WheelUp 2}
; 	Sleep, 20
; }
; return


; [::
; while GetKeyState("[", "P")
; {
; 	Send {WheelDown 2}
; 	Sleep, 20
; }
; return






 

;!q::Send  {Space}class="new"
;WheelDown::Send {Space}


#t:: WinSet, ExStyle, 0x20, ahk_class GomPlayer1.x
#y:: WinSet, ExStyle, OFF, ahk_class GomPlayer1.x


					
		


; #Include %A_ScriptDir%\i3-desktops\window-mover.ahk

