#Persistent

global is_caps_down, caps_flag

#Include hotstring.ahk
#Include switch_desktops.ahk

CapsLock::
    is_caps_down := caps_flag := 1

    KeyWait, CapsLock  ; Waits for Caps key to be released
    is_caps_down := ""

    if(caps_flag){  ; Caps is not used
        ; Toggle the state of the Caps key
        SetCapsLockState, % GetKeyState("CapsLock", "T") ? "Off" : "On"
    }
    return

#If is_caps_down
    a::
    b::
    c::
    d::
    e::
    f::
    g::
    h::
    i::
    j::
    k::
    l::
    n::
    m::
    o::
    p::
    q::
    r::
    s::
    t::
    u::
    v::
    w::
    x::
    y::
    z::
    1::
    2::
    3::
    4::
    5::
    6::
    7::
    8::
    9::
    0::
    esc::
    tab::
    space::
    backspace::
    enter::
        try
            func_name := "caps_" . A_ThisHotkey
            %func_name%()
        caps_flag := ""
        return
    -::
        caps_flag := ""
        return
    =::
        caps_flag := ""
        return
    [::
        caps_flag := ""
        return
    ]::
        caps_flag := ""
        return
    \::
        caps_flag := ""
        return
    `;::
        caps_flag := ""
        return
    '::
        caps_flag := ""
        return
    ,::
        caps_flag := ""
        return
    .::
        caps_flag := ""
        return
    /::
        caps_flag := ""
        return
#If


caps_test(){
    MsgBox, , , testing, 1
    return
}

; Caps + e/d/s/f => ↑/↓/←/→
caps_e(){
    SendInput, {Up}
    return
}

caps_d(){
    SendInput, {Down}
    return
}

caps_s(){
    SendInput, {Left}
    return
}

caps_f(){
    SendInput, {Right}
    return
}

; Caps + a/g => move word left/right
caps_a(){
    SendInput, ^{Left}
    return
}

caps_g(){
    SendInput, ^{Right}
    return
}

; Caps + w/r => backspace/delete
caps_w(){
    SendInput, {BackSpace}
    return
}

caps_r(){
    SendInput, {Delete}
    return
}

; Caps + space/enter => enter/end enter
caps_space(){
    SendInput, {Enter}
    return
}

caps_enter(){
    SendInput, {End}{Enter}
    return
}

; Caps + q => uTools
caps_q(){
    SendInput, !{Space}
    return
}
