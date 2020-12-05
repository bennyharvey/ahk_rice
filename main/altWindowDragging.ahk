; #SingleInstance, Force
; SendMode Input
; SetWorkingDir, %A_ScriptDir%


!LButton::
    CoordMode, Mouse
    MouseGetPos, EWD_MouseStartX, EWD_MouseStartY, EWD_MouseWin
    WinGetClass, EWD_Win_Class, ahk_id %EWD_MouseWin%
    If EWD_Win_Class = ProgMan
    Return
    WinGet, State, MinMax, ahk_id %EWD_MouseWin%
    If State = 1
    {
        ; TODO: unmaximise instead of showing message
        ; WinRestore, %EWD_Win_Class%
        ; PostMessage, 0x112, 0xF120,,, %EWD_Win_Class%, %EWD_MouseWin% ; 0x112 = WM_SYSCOMMAND, 0xF120 = SC_RESTORE
        
        SplashImage,, W160 H27 B1 FM8 WM400 CT000080,, %EWD_Win_Class%,, Calibri
        SetTimer, Remove_Splash, 600
        Return

        Remove_Splash:
            SetTimer, Remove_Splash, Off
            SplashImage, Off
        Return
    }
    WinGetPos, EWD_OriginalPosX, EWD_OriginalPosY,,, ahk_id %EWD_MouseWin%
    SetTimer, EWD_WatchMouse, 10
Return

EWD_WatchMouse:
    EWD_Work = 1
    GetKeyState, EWD_LButtonState, LButton, P
    If EWD_LButtonState = U
    {
        SetTimer, EWD_WatchMouse, off
        EWD_Work =
        Return
    }
    GetKeyState, EWD_EscapeState, Escape, P
    If EWD_EscapeState = D
    {
        SetTimer, EWD_WatchMouse, off
        EWD_Work =
        WinMove, ahk_id %EWD_MouseWin%,, %EWD_OriginalPosX%, %EWD_OriginalPosY%
        Return
    }
    CoordMode, Mouse
    MouseGetPos, EWD_MouseX, EWD_MouseY
    WinGetPos, EWD_WinX, EWD_WinY,,, ahk_id %EWD_MouseWin%
    SetWinDelay, -1
    WinMove, ahk_id %EWD_MouseWin%,, EWD_WinX + EWD_MouseX - EWD_MouseStartX, EWD_WinY + EWD_MouseY - EWD_MouseStartY
    EWD_MouseStartX := EWD_MouseX
    EWD_MouseStartY := EWD_MouseY
Return
