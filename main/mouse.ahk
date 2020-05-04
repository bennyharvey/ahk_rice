
XButton1::Send {XButton1}
XButton2::Send {XButton2}
XButton1 & WheelUp::Send {Volume_Up}
XButton1 & WheelDown::Send {Volume_Down}




#ifWinActive ahk_exe chrome.exe
{									
    RButton::Send {RButton}
    RButton & LButton::Send ^w								
    RButton & WheelUp::Send +^{Tab}
    RButton & WheelDown::Send ^{Tab}
    XButton1 & LButton::Send ^t
    Return
}