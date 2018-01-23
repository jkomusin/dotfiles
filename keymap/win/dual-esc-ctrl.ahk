SendMode Input
#NoEnv
#SingleInstance force


options := {delay: 150, timeout: 300, doublePress: -1}


#Include <dual/dual>
dual := new Dual
#Include <dual/defaults>


#If true ; Override defaults.ahk. There will be "duplicate hotkey" errors otherwise.
*Esc::
*Esc UP::dual.combine("Ctrl", A_ThisHotkey, {delay: options.delay, timeout: options.timeout, doublePress: options.doublePress})
#If
