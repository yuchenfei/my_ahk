#SingleInstance force
#InstallKeybdHook

SetStoreCapslockMode, Off

#Include lib
#Include hotstring.ahk
#Include switch_desktops.ahk


; Disable original Caps function
CapsLock::return

#If GetKeyState("CapsLock", "P") && !GetKeyState("Tab", "P")
    ; Caps + E/D/S/F => ↑/↓/←/→
    E::SendInput {Up}
    D::SendInput {Down}
    S::SendInput {Left}
    F::SendInput {Right}
    ; Caps + A/G => move word left/right
    A::SendInput ^{Left}
    G::SendInput ^{Right}
    ; Caps + W/R => Backspace/Delete
    W::SendInput {BackSpace}
    R::SendInput {Delete}
    ; Caps + X/C/V => Ctrl + X/C/V
    X::SendInput ^{x}
    C::SendInput ^{c}
    V::SendInput ^{v}
    ; Caps + T/B => move up/down 10 lines
    T::SendInput {Up 10}
    B::SendInput {Down 10}
    ; Caps + Space/Enter => Enter/End Enter
    Space:: SendInput {Enter}
    Enter:: SendInput {End}{Enter}
    ; Caps + esc => `
    Esc::SendInput ``
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
    Q:: SendInput !{Space}
#If

#If GetKeyState("CapsLock", "P")
    Tab::CapsTab()
#If
