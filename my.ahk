#SingleInstance force
#InstallKeybdHook

SetStoreCapslockMode, Off

#Include lib
#Include hotstring.ahk
#Include switch_desktops.ahk


; Disable original Caps function
CapsLock::return

#If GetKeyState("CapsLock", "P") && !GetKeyState("Tab", "P")
    ; Caps + e/d/s/f => ↑/↓/←/→
    e::SendInput {Up}
    d::SendInput {Down}
    s::SendInput {Left}
    f::SendInput {Right}
    ; Caps + a/g => move word left/right
    a::SendInput ^{Left}
    g::SendInput ^{Right}
    ; Caps + w/r => backspace/delete
    w::SendInput {BackSpace}
    r::SendInput {Delete}
    ; Caps + space/enter => enter/end enter
    space:: SendInput {Enter}
    enter:: SendInput {End}{Enter}
    ; Caps + esc => `
    esc::SendInput ``
    ; Caps + 1234567890-= => F1-12
    1::SendInput {F1}
    2::SendInput {F2}
    3::SendInput {F3}
    4::SendInput {F4}
    5::SendInput {F5}
    6::SendInput {F6}
    7::SendInput {F7}
    8::SendInput {F8}
    9::SendInput {F9}
    0::SendInput {F10}
    -::SendInput {F11}
    =::SendInput {F12}
    ; Caps + Shift + 1234567890-= => Shift + F1-12
    +1::SendInput +{F1}
    +2::SendInput +{F2}
    +3::SendInput +{F3}
    +4::SendInput +{F4}
    +5::SendInput +{F5}
    +6::SendInput +{F6}
    +7::SendInput +{F7}
    +8::SendInput +{F8}
    +9::SendInput +{F9}
    +0::SendInput +{F10}
    +-::SendInput +{F11}
    +=::SendInput +{F12}
    ; Caps + q => uTools
    q:: SendInput !{Space}
#If

#If GetKeyState("CapsLock", "P")
    tab::CapsTab()
#If
