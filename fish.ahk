#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
^n::
    MouseGetPos, OutputVarX, OutputVarY
    ToolTip , %OutputVarX% %OutputVarY%, 200, 200
    return
^b::
; screen center
; A_ScreenWidth/2
; A_ScreenHeight/2
Loop {
    PixelSearch, Px, Py, A_ScreenWidth/2-50, A_ScreenHeight/2-50, A_ScreenWidth/2+50, A_ScreenHeight/2+50, 0x000000, 5, Fast
    if ErrorLevel {
        ; MsgBox, That color was not found in the specified region.
        ToolTip , "not found", 200, 200
        MouseClick, right
        sleep 100
        ToolTip , "", 200, 200
        sleep 4000
    }
    else {
        ToolTip , "found", 200, 200
        sleep 100
        ToolTip , "", 200, 200
        ; MsgBox, A color within 3 shades of variation was found at X%Px% Y%Py%.
    }
}
