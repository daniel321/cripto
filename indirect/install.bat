mkdir "C:\\ProgramData\\recieve\\"
mklink "C:\\ProgramData\\recieve\\Autoit3.lnk" "C:\\Program Files (x86)\\AutoIt3\\AutoIt3.exe"
gradlew :botRecv:build
copy "%~dp0\\deploy\\botRecv.jar" "%HOMEDRIVE%%HOMEPATH%\\Start Menu\\Programs\\Startup\\program.jar"
