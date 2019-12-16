#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


vk1D & h::Left
vk1D & j::Down
vk1D & k::Up
vk1D & l::Right

; Ctrl & h
^h::BackSpace

; CapsLock を殺す
;SetStoreCapslockMode, off
vkF0::Return


; 無変換 & a
vk1C & a::KeyHistory
