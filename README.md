# N30-Mouse-Scroll
Remaps the D-Pad on the 8BitDO N30 Mouse to the scroll wheel.

> [!NOTE]
> This program can only be run on Windows. Running on MacOS or Linux may be possible using [Wine](https://www.winehq.org/) (untested). 

## Functionality

This program maps up on the d-pad to Scrolling Up, and down on the d-pad to Scrolling Down. Additionally, you can hold ALT while pressing d-pad up or d-pad  down to Scroll Left and Scroll Right, respectively.

The Scroll has between 2 modes: slow & fast.  
For the first few seconds of scrolling, it will scroll slowly. This makes it useful for games like Minecraft that require precise scroll input.  
After a few seconds of scrolling slowly, it will start to scroll more quickly. This makes it useful for scrolling through large documents or webpages.    

To terminate the program, press `Shift+ESC`.  

## Installation
> [!TIP]
> To add this to the list of Startup Programs, move the .exe file into `%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup`
### Running the .exe file (recommended)
Requirements:
- none

Download the latest `N30_mouse_scroll.exe` from the [Releases](https://github.com/Priff13/N30-Mouse-Scroll/releases/latest) page.  
Double-click on the file with a file explorer to run it.  
### Running with AutoHotKey v2.0
Requirements:
- AutoHotKey v2.0
    <a name="download-tutorial"></a>
  - You can download it from [the AutoHotKey website](https://www.autohotkey.com/). Make sure to download version 2.0.

To run the program, you can simply double-click on the file in a file explorer, and if prompted, open it with AutoHotKey v 2.0
### Compiling from Source with Ahk2Exe (not recommended)
Requirements:
- AutoHotkey v2.0 (See (above)[#download-tutorial])


> [!NOTE]
> Ahk2Exe should come automatically installed with a fresh installation of AutoHotKey v2.0


Instructions:
1. Open Ahk2Exe
2. Select `N30_mouse_scroll.ahk` as the source file
3. Create `N30_mouse_scroll.exe` for the destination file
4. (optional) Select `n30.ico` as the .ico file, to add the icon to the resulting .exe file. 
5. Select v2.0.x for the Base File
6. Click "Compile"

The resulting .exe can be run by double-clicking on the file with a file explorer.  
