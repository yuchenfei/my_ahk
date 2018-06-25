; Run script as admin
if not A_IsAdmin
{
    Run *RunAs "%A_ScriptFullPath%"
    ExitApp
}

; Set startup link, requires admin
startup_link := A_StartupCommon . "\my_ahk.lnk"
IfExist, %startup_link%
{
    FileGetShortcut, %startup_link%, target_file  ; Get target file path
    if(A_ScriptFullPath != target_file){  ; If not equal, rebuild the link
        FileCreateShortcut, %A_ScriptFullPath%, %startup_link%, %A_WorkingDir%
    }
}else{  ; Create startup link
    FileCreateShortcut, %A_ScriptFullPath%, %startup_link%, %A_WorkingDir%
}

main:
    global is_caps_down, caps_flag

    CapsLock::  ; Caps key down
        is_caps_down := caps_flag := 1
        KeyWait, CapsLock  ; Waits for Caps key to be released
        is_caps_down := 0
        If(caps_flag){  ; caps_flag equal to 1 means Caps is not used
            SetCapsLockState, % GetKeyState("CapsLock","T") ? "Off" : "On"  ; Toggle the state of the Caps key
        }
        Return

    #If, is_caps_down  ; if Caps key down and hold
    ; Caps + e/d/s/f => ↑/↓/←/→
    e::
        SendInput, {Up}
        caps_flag := 0
        Return
    d::
        SendInput, {Down}
        caps_flag := 0
        Return
    s::
        SendInput, {Left}
        caps_flag := 0
        Return
    f::
        SendInput, {Right}
        caps_flag := 0
        Return
    ; Caps + l => Listary
    q::
        Send, !l  ; My Listary shortcut is Alt + L
        caps_flag:=0
        Return

    Return
