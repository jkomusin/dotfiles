; Note: This implementation assumes an en-US QWERTY layout.


SendMode Input
#NoEnv
#SingleInstance force


options := {delay: 150, timeout: 300, doublePress: -1, swap_backtick_escape: false, mode: "ijkl"}


#Include <dual/dual>
dual := new Dual


#Include <dual/defaults>


#If true ; Override defaults.ahk. There will be "duplicate hotkey" errors otherwise.
*Esc::
*Esc UP::dual.combine("Ctrl", A_ThisHotkey, {delay: options.delay, timeout: options.timeout, doublePress: options.doublePress})
#If
