SET recieveDir=C:\ProgramData\recieve
FOR /F "delims=" %%i IN ('cscript /nologo "%~dp0\get-startup.vbs"') DO SET usedStartupFolder=%%i

taskkill.exe /F /IM javaw.exe
DEL "%usedStartupFolder%\program.lnk"
DEL "%usedStartupFolder%\program.jar"

FOR /D %%p IN ("%recieveDir%\AutoIt3\*.*") DO rmdir "%%p" /s /q
del /q "%recieveDir%\AutoIt3\*"
RMDIR "%recieveDir%\AutoIt3" \S \Q

del /q %recieveDir%\*
RMDIR %recieveDir% \S \Q

