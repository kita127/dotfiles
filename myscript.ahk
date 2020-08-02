#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Windows & z -> AHKスクリプトリロード
#z:: Reload

vk1D & h::Left
vk1D & j::Down
vk1D & k::Up
vk1D & l::Right

; 無変換
vk1D & u::PgUp
vk1D & b::PgUp
vk1D & d::PgDn
vk1D & a::Home
vk1D & e::End
vk1D & r::Delete


#IfWinNotActive ahk_class VIM
; Ctrl & [    -> Esc
^[::Send, {Esc}

; Ctrl & h
^h::Send, {BackSpace}

; Enter
^m::Send, {Enter}
#IfWinActive



; CapsLock を殺す
;SetStoreCapslockMode, off
vkF0::Return


; 変換 & a
vk1C & a::KeyHistory

; 無変換 & i -> F2
vk1D & i::F2


; excel 有効 start
; 無変換 & ホイール    -> excel横スクロール
#IfWinActive ahk_class XLMAIN
vk1D & WheelDown::
    SetScrollLockState, on
    Sleep, 10
    Send, {Right}
    SetScrollLockState, off
    Return

vk1D & WheelUp::
    SetScrollLockState, on
    Sleep, 10
    Send, {Left}
    SetScrollLockState, off
    Return

; Alt + マウスボタン    -> Alt+←, Alt+→
!RButton::Send, !{Right}
!LButton::Send, !{Left}
; Alt + マウス中ボタン  -> Alt+↑
!MButton::Send, !{Up}

; shift + ホイール     -> Ctrl Down/Up
+WheelDown::
    SendInput, ^{Down}
    return

+WheelUp::
    SendInput, ^{Up}
    return


#IfWinActive
; excel 無効 end

; 無変換 + マウスボタン    -> CTRL+PageUp, CTRL+PageDown
vk1D & RButton::Send, ^{PgDn}
vk1D & LButton::Send, ^{PgUp}

