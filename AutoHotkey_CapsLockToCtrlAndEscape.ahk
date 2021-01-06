#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Make Caps lock have the following behavior:
; - Short press (less than 0.4 seconds): send Escape key.
; - Press and hold: Holds down Control key.
CapsLock::
Send, {Ctrl down}
KeyWait, CapsLock, T0.4
if ErrorLevel { ; Timed-out.
  KeyWait, CapsLock
  Send, {Ctrl up}
}
else { ; Caps lock was released within 0.4 s.
  if (A_PriorKey = "CapsLock") {
    Send, {Ctrl up}
    Send, {Esc}
  }
  else {
    Send, {Ctrl up}
  }
}
return

+CapsLock::
Send, {Shift down}{Ctrl down}
KeyWait, CapsLock
Send, {Shift up}{Ctrl up}

!CapsLock::
Send, {Alt down}{Ctrl down}
KeyWait, CapsLock
Send, {Alt up}{Ctrl up}

#CapsLock::
Send, {Win down}{Ctrl down}
KeyWait, CapsLock
Send, {Win up}{Ctrl up}
