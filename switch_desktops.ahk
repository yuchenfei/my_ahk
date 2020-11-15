; Switch Windows 10's virtual desktops

$ctrl::
    if ctrl_counter > 0
    {
        ctrl_counter += 1
        return
    }
    ctrl_counter = 1
    SetTimer, Keyctrl, 500
    return

Keyctrl:
    SetTimer, Keyctrl, off
    if ctrl_counter = 1
    {
        send {ctrl}
    }
    else if ctrl_counter = 2
    {
        send #^{left}
    }
    else if ctrl_counter = 3
    {
        send #^{right}
    }
    ctrl_counter = 0
    return
