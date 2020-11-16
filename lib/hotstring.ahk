; https://www.autohotkey.com/docs/Hotstrings.htm

global HotstringFile := "setting_hotstring.ahk"
global CapsTabFlag := 0  ; Set 1 to enable hotstring trigger

if !FileExist(HotstringFile){
FileAppend, 
(
#If CapsTabFlag
#If
), %HotstringFile%
Reload
}

#Include *i ..\setting_hotstring.ahk


CapsTab(){
    selText := GetSelText()
    if (selText){
        SaveHotstring(selText)
    }else{
        ; Select left word
        ClipboardOld:=ClipboardAll
        Clipboard:=""
        SendInput, +^{Left}
        sleep, 10 ; Make sure text is selecting
        SendInput, ^{c}
        ClipWait, 0.1
        if(!ErrorLevel){
            temp := Clipboard
            CapsTabFlag := 1  ; Enable hotstring
            SendLevel 1
            Send % temp
            CapsTabFlag := ""  ; Disable hotstring
        }
        Clipboard:=ClipboardOld
    }
}

GetSelText(){
    AutoTrim Off  ; Retain any leading and trailing whitespace on the clipboard.
    ClipboardOld := ClipboardAll
    Clipboard := ""  ; Must start off blank for detection to work.
    Send ^c
    ClipWait 1
    if(!ErrorLevel){
        selText:=Clipboard
        Clipboard:=ClipboardOld
        StringRight, lastChar, selText, 1
        if(Asc(lastChar)!=10){  ; 如果最后一个字符是换行符，就认为是在IDE那复制了整行，不要这个结果
            return selText
        }
    } 
    Clipboard := ClipboardOld  ; Restore previous contents of clipboard.
    return
}

SaveHotstring(text){
    ; Replace CRLF and/or LF with `n for use in a "send-raw" hotstring:
    ; The same is done for any other characters that might otherwise
    ; be a problem in raw mode:
    StringReplace, Hotstring, text, ``, ````, All  ; Do this replacement first to avoid interfering with the others below.
    StringReplace, Hotstring, Hotstring, `r`n, ``r, All  ; Using `r works better than `n in MS Word, etc.
    StringReplace, Hotstring, Hotstring, `n, ``r, All
    ; StringReplace, Hotstring, Hotstring, %A_Tab%, ``t, All
    StringReplace, Hotstring, Hotstring, `;, ```;, All
    ; This will move the InputBox's caret to a more friendly position:
    SetTimer, MoveCaret, 10
    ; Show the InputBox, providing the default hotstring:
    InputBox, Hotstring, New Hotstring, Type your abbreviation at the indicated insertion point. You can also edit the replacement text if you wish.`n`nExample entry: :*?:btw`::by the way,,,,,,,, :*?:`::%Hotstring%
    if ErrorLevel  ; The user pressed Cancel.
        return
    if InStr(Hotstring, ":*?:::"){
        MsgBox You didn't provide an abbreviation. The hotstring has not been added.
        return
    }
    ; Otherwise, add the hotstring and reload the script:
    FileRead, text, %HotstringFile%
    FileDelete, %HotstringFile%
    FileAppend, % SubStr(text, 1, RegExMatch(text, "\R.*\R?$")-1), %HotstringFile%
    FileAppend, `n%Hotstring%, %HotstringFile%  ; Put a `n at the beginning in case file lacks a blank line at its end.
    FileAppend, `n#If, %HotstringFile%
    Reload
    Sleep 200 ; If successful, the reload will close this instance during the Sleep, so the line below will never be reached.
    MsgBox, 4,, The hotstring just added appears to be improperly formatted.  Would you like to open the script for editing? Note that the bad hotstring is at the bottom of the script.
    IfMsgBox, Yes, Edit
    return
}

MoveCaret:
    IfWinNotActive, New Hotstring
        return
    ; Otherwise, move the InputBox's insertion point to where the user will type the abbreviation.
    Send {Home}{Right 4}
    SetTimer, MoveCaret, Off
    return
