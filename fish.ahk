#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
^n::
    MouseGetPos, OutputVarX, OutputVarY
    ToolTip , %OutputVarX% %OutputVarY%, 200, 200
    return

^b::
ToolTip , "start", 200, 200
numberOfCatches := 0
while (numberOfCatches>120) {
    PixelSearch, Px, Py, A_ScreenWidth/2-50, A_ScreenHeight/2-50, A_ScreenWidth/2+50, A_ScreenHeight/2+50, 0x000000, 5, Fast
    if ErrorLevel {
        ; That color was not found in the specified region.
        ToolTip , %numberOfCatches% " not found", 200, 200
        MouseClick, right
        sleep 100
        ToolTip , %numberOfCatches%, 200, 200
        numberOfCatches--
        sleep 4000
    }
    else {
        ToolTip , %numberOfCatches% " found", 200, 200
        sleep 100
        ToolTip , %numberOfCatches%, 200, 200
        ; A color within 5 shades of variation was found
    }
}
