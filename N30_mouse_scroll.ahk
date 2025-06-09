/*
    To Add this program to your startup apps, compile this with AHK2EXE, 
and place the resulting .exe file into:
    "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup"

    This program maps up on the d-pad to "WheelUp", and down on the d-pad to 
"WheelDown". Additionally, you can hold ALT while pressing d-pad up or d-pad 
down to send "WheelLeft" and "WheelRight", respectively.

    The Scroll switches between 2 modes: slow & fast. For the first few seconds 
of scrolling, it will scroll slowly. This makes it useful for games like 
Minecraft that require precise scroll input. After a few seconds of scrolling 
slowly, it will start to scroll more quickly. This makes it useful for scrolling
through large documents or webpages.        
*/

+Esc::ExitApp ; Press Shift+ESC to exit this program



/*
Occasionally, a press slips through, and ends up sending the Browser Back and 
the Browser Forward commands.
This simply remaps those commands to the appropriate button, as to not mess up 
anything while you scroll through a webpage.

Feel free to disable this by putting a semicolon at the beginning of the line.

*/
Browser_Back:: Send "{XButton1}"
Browser_Forward:: Send "{XButton2}"



/*
    "Iterations" is the variable used to keep track of how many times the 
program has scrolled per button press.

    Once "Iterations" reaches the Threshold, the scroll speed will increase. The
two scroll speeds are controlled by the variables "Delay", and "Delay_Fast", 
both in miliseconds. You can change those values as you wish, but beware that 
changing "Delay" will change how long it takes for the quick scrolling to take  
in effect.

    "ButtonToggles" is the list of button toggles, that controls whether the 
program senses that the appropriate button is being held, and "ButtonsMap" is 
the map of each AHK button to the appropriate scroll action.

The rest of the functions are simply to streamline the code.

*/
global Iterations := 0
global Threshold := 5

global Delay := 90
global Delay_Fast := 30

global ButtonToggles := Map()
ButtonToggles["XButton1"] := 0
ButtonToggles["XButton2"] := 0
ButtonToggles["!XButton1"] := 0
ButtonToggles["!XButton2"] := 0

global ButtonsMap := Map()
ButtonsMap["XButton1"] := "{WheelUp}"
ButtonsMap["XButton2"] := "{WheelDown}"
ButtonsMap["!XButton1"] := "{WheelLeft}"
ButtonsMap["!XButton2"] := "{WheelRight}"

DetectExit(button) {
	global Iterations, ButtonToggles
	if (ButtonToggles[button] == 0) {
		Iterations := 0
		Exit
	}
	if (GetKeyState(button, "P") == 0) {
		Iterations := 0
		Exit
	}
}
DoSleep() {
    global Delay, Delay_Fast, Iterations, Threshold
    if (Iterations >= Threshold) {
        Sleep Delay_Fast
    } else {
        Sleep Delay
    }
    Iterations += 1
}
ButtonReleased(button) {
    global ButtonToggles, Iterations
    ButtonToggles[button] := 0
    Iterations := 0
}
ButtonPressed(button) {
    global ButtonToggles
    ButtonToggles[button] := 1
    loop {
        DetectExit(button)
        Send ButtonsMap[button]
        DoSleep()
    }
}

XButton2 up::ButtonReleased("XButton2")
XButton2::ButtonPressed("XButton2")
XButton1 up::ButtonReleased("XButton1")
XButton1::ButtonPressed("XButton1")

!XButton2 up::ButtonReleased("!XButton2")
!XButton2::ButtonPressed("!XButton2")
!XButton1 up::ButtonReleased("!XButton1")
!XButton1::ButtonPressed("!XButton1")
